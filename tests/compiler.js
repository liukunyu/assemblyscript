const fs  = require("fs");
const path = require("path");
const os = require("os");
const glob = require("glob");
const colorsUtil = require("../cli/util/colors");
const optionsUtil = require("../cli/util/options");
const diff = require("./util/diff");
const asc = require("../cli/asc.js");

const config = {
  "create": {
    "description": [
      "Recreates the fixture for the specified test(s)",
      "or all the fixtures if no specific test is given."
    ],
    "type": "b"
  },
  "help": {
    "description": "Prints this message and exits.",
    "type": "b",
    "alias": "h"
  }
};
const opts = optionsUtil.parse(process.argv.slice(2),config);
const args = opts.options;
const argv = opts.arguments;

if (args.help) {
  console.log([
    colorsUtil.white("SYNTAX"),
    "  " + colorsUtil.cyan("npm run test:compiler --") + " [test1, test2 ...] [options]",
    "",
    colorsUtil.white("OPTIONS"),
    optionsUtil.help(config)
  ].join(os.EOL) + os.EOL);
  process.exit(0);
}

var successes = 0;
var failedTests = [];

const basedir = path.join(__dirname, "compiler");

// Get a list of all tests
var tests = glob.sync("**/!(_*).ts", { cwd: basedir });

// Run specific tests only if arguments are provided
if (argv.length) {
  tests = tests.filter(filename => argv.indexOf(filename.replace(/\.ts$/, "")) >= 0);
  if (!tests.length) {
    console.error("No matching tests: " + argv.join(" "));
    process.exit(1);
  }
}

const EXPECT_ERROR_PREFIX = '// Expect error:';

// Returns an array of error strings to expect, or null if compilation should succeed.
function getExpectedErrors(filePath) {
  const lines = fs.readFileSync(filePath).toString().split('\n');
  const expectErrorLines = lines.filter(line => line.startsWith(EXPECT_ERROR_PREFIX));
  if (expectErrorLines.length === 0) {
    return null;
  }
  return expectErrorLines.map(line => line.slice(EXPECT_ERROR_PREFIX.length).trim());
}

// TODO: asc's callback is synchronous here. This might change.
tests.forEach(filename => {
  console.log(colorsUtil.white("Testing compiler/" + filename) + "\n");

  const expectedErrors = getExpectedErrors(path.join(basedir, filename));
  const basename = filename.replace(/\.ts$/, "");

  const stdout = asc.createMemoryStream();
  const stderr = asc.createMemoryStream(chunk => process.stderr.write(chunk.toString().replace(/^(?!$)/mg, "  ")));
  stderr.isTTY = true;

  var failed = false;

  // TODO: also save stdout/stderr and diff it (-> expected failures)

  // Build unoptimized
  asc.main([
    filename,
    "--baseDir", basedir,
    "--validate",
    "--measure",
    "--textFile" // -> stdout
  ], {
    stdout: stdout,
    stderr: stderr
  }, err => {
    console.log();

    if (expectedErrors) {
      const stderrString = stderr.toString();
      for (const expectedError of expectedErrors) {
        if (!stderrString.includes(expectedError)) {
          console.log(`Expected error "${expectedError}" was not in the error output.`);
          console.log("- " + colorsUtil.red("error check ERROR"));
          failedTests.push(basename);
          console.log();
          return;
        }
      }
      console.log("- " + colorsUtil.green("error check OK"));
      ++successes;
      console.log();
      return;
    }

    if (err)
      stderr.write(err + os.EOL);
    var actual = stdout.toString().replace(/\r\n/g, "\n");
    if (args.create) {
      fs.writeFileSync(path.join(basedir, basename + ".untouched.wat"), actual, { encoding: "utf8" });
      console.log("- " + colorsUtil.yellow("Created fixture"));
    } else {
      let expected = fs.readFileSync(path.join(basedir, basename + ".untouched.wat"), { encoding: "utf8" }).replace(/\r\n/g, "\n");
      let diffs = diff(basename + ".untouched.wat", expected, actual);
      if (diffs !== null) {
        console.log(diffs);
        console.log("- " + colorsUtil.red("diff ERROR"));
        failed = true;
      } else
        console.log("- " + colorsUtil.green("diff OK"));
    }
    console.log();

    stdout.length = 0;
    stderr.length = 0;

    // Build optimized
    var cmd = [
      filename,
      "--baseDir", basedir,
      "--validate",
      "-O3",
      "--measure",
      "--binaryFile" // -> stdout
    ];
    if (args.create) cmd.push(
      "--textFile", basename + ".optimized.wat"
    );
    asc.main(cmd, {
      stdout: stdout,
      stderr: stderr
    }, err => {
      console.log();
      if (err)
        stderr.write(err.stack + os.EOL);

      // Instantiate
      try {
        let memory = new WebAssembly.Memory({ initial: 10 });
        let exports = {};

        function getString(ptr) {
          if (!ptr) return "null";
          var U32 = new Uint32Array(exports.memory ? exports.memory.buffer : memory.buffer);
          var U16 = new Uint16Array(exports.memory ? exports.memory.buffer : memory.buffer);
          var dataLength = U32[ptr >>> 2];
          var dataOffset = (ptr + 4) >>> 1;
          var dataRemain = dataLength;
          var parts = [];
          const chunkSize = 1024;
          while (dataRemain > chunkSize) {
            let last = U16[dataOffset + chunkSize - 1];
            let size = last >= 0xD800 && last < 0xDC00 ? chunkSize - 1 : chunkSize;
            let part = U16.subarray(dataOffset, dataOffset += size);
            parts.push(String.fromCharCode.apply(String, part));
            dataRemain -= size;
          }
          return parts.join("") + String.fromCharCode.apply(String, U16.subarray(dataOffset, dataOffset + dataRemain));
        }

        let runTime = asc.measure(() => {
          exports = new WebAssembly.Instance(new WebAssembly.Module(stdout.toBuffer()), {
            env: {
              memory,
              abort: function(msg, file, line, column) {
                console.log(colorsUtil.red("  abort: " + getString(msg) + " at " + getString(file) + ":" + line + ":" + column));
              },
              trace: function(msg, n) {
                console.log("  " + getString(msg) + (n ? " " : "") + Array.prototype.slice.call(arguments, 2, 2 + n).join(", "));
              },
              externalFunction: function() { },
              externalConstant: 1
            },
            math: {
              mod: function(a, b) { return a % b; }
            },
            Math: Math,

            // tests/declare
            declare: {
              externalFunction: function() { },
              externalConstant: 1,
              "my.externalFunction": function() { },
              "my.externalConstant": 2
            },

            // tests/external
            external: {
              foo: function() {},
              "foo.bar": function() {},
              bar: function() {}
            },
            foo: {
              baz: function() {},
              "var": 3
            }
          }).exports;
          if (exports.main) {
            console.log(colorsUtil.white("  [main]"));
            var code = exports.main();
            console.log(colorsUtil.white("  [exit " + code + "]\n"));
          }
        });
        console.log("- " + colorsUtil.green("instantiate OK") + " (" + asc.formatTime(runTime) + ")");
        console.log("\n  " + Object.keys(exports).map(key => "[" + (typeof exports[key]).substring(0, 3) + "] " + key).join("\n  "));
      } catch (e) {
        console.log("- " + colorsUtil.red("instantiate ERROR: ") + e.stack);
        failed = true;
      }

      if (failed) failedTests.push(basename);
      else ++successes;
      console.log();
    });
  });
});

if (failedTests.length) {
  process.exitCode = 1;
  console.log(colorsUtil.red("ERROR: ") + failedTests.length + " compiler tests failed: " + failedTests.join(", "));
} else
  console.log("[ " + colorsUtil.white("SUCCESS") + " ]");
