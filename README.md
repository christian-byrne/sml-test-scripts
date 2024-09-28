

> [!NOTE]
> 
> By default, tests are discovered by looking for sml files that start with `test_` in the `tests` directory.

## Setup

```sh
chmod +x ./install
./install
```

## Run tests

```
chmod +x ./test
./test
```

## Options

```sh
usage: ./test  [-h] [-x] [--cache-path CACHE_PATH] [--cache-show [CACHE_SHOW]] [--cache-clear] [-k EXPRESSION]
               [--lf] [--ff] [--nf] [--sw-skip] [--maxfail MAXFAIL] [--collect-only] [--ignore IGNORE]
               [--ignore-glob IGNORE_GLOB] [--rootdir ROOTDIR] [--log-file LOG_FILE]
               [--log-file-level {NOTSET,DEBUG,INFO,WARNING,ERROR,CRITICAL}]
               [--log-file-format LOG_FILE_FORMAT] [--log-file-date-format LOG_FILE_DATE_FORMAT]
               [--log-cli-level {NOTSET,DEBUG,INFO,WARNING,ERROR,CRITICAL}] [--log-cli-format LOG_CLI_FORMAT]
               [--log-cli-date-format LOG_CLI_DATE_FORMAT] [--log-disable-file LOG_DISABLE_FILE]

options:
  -h, --help            show this help message and exit
  -x, --exitfirst       Exit instantly on first error or failed test.
  --cache-path CACHE_PATH
                        Path to cache file.
  --cache-show [CACHE_SHOW]
                        Show cache contents.
  --cache-clear         Remove all cache contents at the start of the test run.
  -k EXPRESSION, --expression EXPRESSION
                        Only run tests which match the given substring expression.
  --lf, --last-failed   Rerun only the tests that failed at the last run.
  --ff, --failed-first  Run all tests but run the last failures first.
  --nf, --new-first     Run tests from new files first.
  --sw-skip, --stepwise-skip
                        Ignore the first failing test but stop on the next one.
  --maxfail MAXFAIL     Exit after the first num failures.
  --collect-only, --co  Only collect tests, don’t execute them.
  --ignore IGNORE       Ignore path during collection (multi-allowed).
  --ignore-glob IGNORE_GLOB
                        Ignore path pattern during collection (multi-allowed).
  --rootdir ROOTDIR     Define root directory for tests.
  --log-file LOG_FILE   Path to a log file.
  --log-file-level {NOTSET,DEBUG,INFO,WARNING,ERROR,CRITICAL}
                        Level of messages to catch/display (default depends on the root log handler).
  --log-file-format LOG_FILE_FORMAT
                        Log format used by the logging module.
  --log-file-date-format LOG_FILE_DATE_FORMAT
                        Log date format used by the logging module.
  --log-cli-level {NOTSET,DEBUG,INFO,WARNING,ERROR,CRITICAL}
                        CLI logging level.
  --log-cli-format LOG_CLI_FORMAT
                        CLI log format.
  --log-cli-date-format LOG_CLI_DATE_FORMAT
                        CLI log date format.
  --log-disable-file LOG_DISABLE_FILE
                        Disable log file output.

```


## Writing Tests


##### Example Source file:

```sml
(* src/program.sml *)

fun factorial(0) = 1
  | factorial(n) = n * factorial(n - 1);
```

##### Example Test file:

```sml
(* tests/test_program_factorial.sml *)

use "src/program.sml";
use "tests/utils.sml";

val testCasesFactorial = [
  (factorial, 0, 1), (* 0! = 1 *)
  (factorial, 1, 1), (* 1! = 1 *)
  (factorial, 2, 2), (* 2! = 2 *)
  (factorial, 3, 6), (* 3! = 6 *)
  (factorial, 4, 24), (* 4! = 24 *)
];

runTestCasesIntInt(testCasesFactorial);
```

## SML Wiki/Reference

Builds local SML wiki site and opens it in the browser.

```sh
./start-wiki
```

Changes can be made to the wiki by changing files in [wiki/docs](./wiki/docs)


## Lectura Scripts

Set credentials in `.env` file ([`.env.example`](./.env.example))

##### Connect Lectura

```sh
./connect-lectura
```

Press `Ctrl+V`

##### Submit Lectura

```sh
./submit-lectura <path-to-file>
```

Press `Ctrl+V`