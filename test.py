import argparse
import os
import subprocess
import json
from pathlib import Path

from enum import Enum
from collections import deque

import logging
from rich.logging import RichHandler

from typing import Deque, Set

parser = argparse.ArgumentParser()

# GENERAL
parser.add_argument(
    "-x",
    "--exitfirst",
    action="store_true",
    help="Exit instantly on first error or failed test.",
)
parser.add_argument(
    "--cache-path",
    type=str,
    help="Path to cache file.",
    default=".sml_test_cache.json",
)
parser.add_argument("--cache-show", nargs="?", const="*", help="Show cache contents.")
parser.add_argument(
    "--cache-clear",
    action="store_true",
    help="Remove all cache contents at the start of the test run.",
)
parser.add_argument(
    "-k",
    "--expression",
    type=str,
    help="Only run tests which match the given substring expression.",
    default="test_*.sml",
)
parser.add_argument(
    "--lf",
    "--last-failed",
    action="store_true",
    help="Rerun only the tests that failed at the last run.",
)
parser.add_argument(
    "--ff",
    "--failed-first",
    action="store_true",
    help="Run all tests but run the last failures first.",
)
parser.add_argument(
    "--nf", "--new-first", action="store_true", help="Run tests from new files first."
)
parser.add_argument(
    "--sw-skip",
    "--stepwise-skip",
    action="store_true",
    help="Ignore the first failing test but stop on the next one.",
)
parser.add_argument("--maxfail", type=int, help="Exit after the first num failures.")

# COLLECTION
parser.add_argument(
    "--collect-only",
    "--co",
    action="store_true",
    help="Only collect tests, don’t execute them.",
)
parser.add_argument(
    "--ignore", action="append", help="Ignore path during collection (multi-allowed)."
)
parser.add_argument(
    "--ignore-glob",
    action="append",
    help="Ignore path pattern during collection (multi-allowed).",
)
parser.add_argument(
    "--rootdir", type=str, help="Define root directory for tests.", default=os.getcwd()
)

# LOGGING
parser.add_argument(
    "--log-file", type=str, help="Path to a log file.", default="test.log"
)
parser.add_argument(
    "--log-file-level",
    type=str,
    help="Level of messages to catch/display (default depends on the root log handler).",
    choices=["NOTSET", "DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"],
    default="WARNING",
)
parser.add_argument(
    "--log-file-format",
    type=str,
    help="Log format used by the logging module.",
    default="%(asctime)s [%(levelname)8s] %(message)s",
)
parser.add_argument(
    "--log-file-date-format",
    type=str,
    help="Log date format used by the logging module.",
    default="%Y-%m-%d %H:%M:%S",
)
parser.add_argument(
    "--log-cli-level",
    type=str,
    help="CLI logging level.",
    choices=["NOTSET", "DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"],
    default="INFO",
)
parser.add_argument(
    "--log-cli-format", type=str, help="CLI log format.", default="%(message)s"
)
parser.add_argument(
    "--log-cli-date-format", type=str, help="CLI log date format.", default="%H:%M:%S"
)
parser.add_argument(
    "--log-disable-file", type=bool, help="Disable log file output.", default=False
)


args = parser.parse_args()


class LogLevel(Enum):
    NOTSET = logging.NOTSET
    DEBUG = logging.DEBUG
    INFO = logging.INFO
    WARNING = logging.WARNING
    ERROR = logging.ERROR
    CRITICAL = logging.CRITICAL


logger_base = logging.getLogger()
logger_base.setLevel(logging.DEBUG)

# RichHandler for stdout
rich_handler = RichHandler(
    rich_tracebacks=True,
    tracebacks_show_locals=True,
    tracebacks_theme="solarized",
    markup=True,
)
formatter_stdout = logging.Formatter(
    args.log_cli_format, datefmt=args.log_cli_date_format
)
rich_handler.setFormatter(formatter_stdout)
print(f"Setting log level of CLI to {LogLevel[args.log_cli_level].value}")
rich_handler.setLevel(LogLevel[args.log_cli_level].value)
logger_base.addHandler(rich_handler)

if not args.log_disable_file:
    file_handler = logging.FileHandler(args.log_file)
    formatter_file = logging.Formatter(
        args.log_file_format, datefmt=args.log_file_date_format
    )
    file_handler.setFormatter(formatter_file)
    print(f"Setting log level of file to {LogLevel[args.log_file_level].value}")
    file_handler.setLevel(LogLevel[args.log_file_level].value)
    logger_base.addHandler(file_handler)


def clear_cache():
    with open(args.cache_path, "w") as cache_file:
        cache_file.write("{}")


if args.cache_clear:
    clear_cache()
if args.cache_show:
    with open(args.cache_path, "r") as cache_file:
        cache = json.load(cache_file)
    logging.info(cache)

tests: Deque[Path] = deque()

# Collect tests
tests_path = Path(args.rootdir)
dir_err_msg = (
    f"Path for test ({tests_path}) is not a directory. Set with argument --rootdir."
)
if not tests_path.exists():
    raise FileNotFoundError(dir_err_msg)
if not tests_path.is_dir():
    raise NotADirectoryError(dir_err_msg)

logging.debug(f"Collecting tests from {tests_path}")

try:
    with open(args.cache_path, "r") as cache_file:
        all_seen_tests = set(
            Path(test) for test in json.load(cache_file).get("all_seen_tests", [])
        )
        last_failed_tests = set(
            Path(test) for test in json.load(cache_file).get("failed_tests", [])
        )
except:
    pass

for test in tests_path.rglob(args.expression):
    if not test.is_file():
        continue
    # Ignore glob
    if args.ignore_glob:
        for ignore_glob in args.ignore_glob:
            if test.match(ignore_glob):
                logging.info(
                    f"Ignoring test {test} because of ignore glob {ignore_glob}"
                )
                continue
    if args.ignore:
        for ignore in args.ignore:
            if test == Path(ignore):
                logging.info(f"Ignoring test {test} because of ignore {ignore}")
                continue
    # If --last-failed is set, only include the tests that are in the 'failed_tests' cache
    if args.lf and test not in last_failed_tests:
        continue
    # If --failed-first is set and test was failed previously, prepend it to the test list so it is run first
    if args.ff and test in last_failed_tests:
        tests.appendleft(test)
        continue
    # If --new-first is set and test is new, prepend it to the test list so it is run first
    if args.nf and test not in all_seen_tests:
        tests.appendleft(test)
        continue
    logging.info(f"Found test {test}")
    tests.append(Path(test))

logging.info(f"Found {len(tests)} tests")


def format_test_list(tests: Set[Path]) -> str:
    return "\n\t".join([test.name for test in tests])


if args.collect_only:
    logging.info(f"Collected tests: {format_test_list(tests)}")
    logging.warning("Exiting because --collect-only was set")
    exit(0)

# Set environemnt vars that the sml test runner uses
if not args.maxfail:
    os.environ["SML_TEST_EXITFIRST"] = "true"
else:
    os.environ["SML_TEST_EXITFIRST"] = str(args.exitfirst)
maxfail = args.maxfail or len(tests) + 8
if args.sw_skip:
    maxfail = 1  # Only skip the first failing test if --sw-skip is set
os.environ["SML_TEST_MAXFAIL"] = str(maxfail)

def check_for_runtime_error(output: str) -> bool:
    if "uncaught exception" in output:
        return True


def check_for_compile_error(output: str) -> bool:
    compile_errors = {
        "syntax error",
        "unbound variable",
        "type error",
        "operator and operand",
        "nonexhaustive match failure",
        "variable is bound multiple times",
        "unbound structure",
    }

    if any(error in output for error in compile_errors):
        return True


failed_tests = set()
runtime_error_tests = set()
compile_error_tests = set()
passed_tests = set()


def run_test(test_path: Path):
    global failed_tests
    if not isinstance(test_path, Path):
        raise ValueError(
            f"Expected test_path to be of type Path, but got {type(test_path)}"
        )

    logging.info(f"Running test {test_path.name}")
    logging.debug(f"Command used to run test: 'sml < {test_path}'")
    test_file_obj = open(test_path, "r")
    process = subprocess.Popen(
        ["sml"],
        stdin=test_file_obj,
        stderr=subprocess.PIPE,
        stdout=subprocess.PIPE,
        text=True,
    )
    output, error = process.communicate()
    if output:
        formatted_output = output.replace("\n", "\n\t\t")
        if LogLevel[args.log_cli_level].value <= LogLevel.INFO.value:
            print(f"Output: {formatted_output}")
        if check_for_compile_error(output):
            compile_error_tests.add(test_path)
            logging.critical(f"Compile error in test {test_path}")
        if check_for_runtime_error(output):
            runtime_error_tests.add(test_path)
            logging.error(f"Runtime error in test {test_path}")
        elif "Test failed" in output:
            failed_tests.add(test_path)
        else:
            passed_tests.add(test_path)
    if error:
        logging.critical("Error with test runner script")
        print(f"Error: {error}")

logging.info("Running tests")
logging.debug(f"All Tests: {tests}")
for test in tests:
    run_test(test)
if passed_tests:
    logging.info(f"Passed all tests in files:\n\t[green]{format_test_list(passed_tests)}[/green]")
if compile_error_tests:
    logging.critical(
        f"Compilation error in test files:[bold red]\n\t{format_test_list(compile_error_tests)}[/bold red]"
    )
if runtime_error_tests:
    logging.error(
        f"Runtimes errors in test files:\n\t[red]{format_test_list(runtime_error_tests)}[/red]"
    )
if failed_tests:
    logging.warning(f"Failed tests in files:\n\t[dim red]{format_test_list(failed_tests)}[/dim red]")
passed_all = len(passed_tests) == len(tests)
if passed_all:
    logging.info("All tests passed!")
else:
    logging.info(f"View the log file for more information on the failed tests.")
    logging.info(f"Log file location: {str(Path(args.log_file))}")


def write_to_cache():
    try:
        with open(args.cache_path, "r") as cache_file:
            cache = json.load(cache_file)
    except (json.JSONDecodeError, FileNotFoundError):
        # Previous error wrote corrupted cache file or first run
        clear_cache()
        cache = {}

    def write_(test_set: Set[Path], cache_key: str):
        cache[cache_key] = str(test_set.pop().resolve()) if test_set else ""

    write_(runtime_error_tests, "runtime_error_tests")
    write_(failed_tests, "failed_tests")
    write_(passed_tests, "passed_tests")
    write_(
        runtime_error_tests.union(failed_tests).union(passed_tests), "all_seen_tests"
    )
    with open(args.cache_path, "w") as cache_file:
        json.dump(cache, cache_file)


write_to_cache()
