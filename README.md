# ooc-check

[![Software License](https://img.shields.io/badge/license-BSD-blue.svg)](LICENSE)
[![build status](https://secure.travis-ci.org/PuerkitoBio/ooc-check.png?branch=master)](http://travis-ci.org/PuerkitoBio/ooc-check)

ooc-check is a small unit testing utility library for [ooc][]. It plays nicely with [sam][] and only adds small helpers do assertions that print failures with an optional backtrace.

It is highly recommended to [install rock's fancy backtrace extension][bt] to use this library.

## Installation

It should be available via `sam`. Assuming you've added `check` to your `Requires` field in your [usefile][use], `sam get <yourapp>.use` should get it. See [sam's documentation][samdoc] for more details.

## Usage

Add `Requires: check` to your usefile and run `sam get` or `sam update` to install or update your local copy of the library. This library is typically used only in tests.

ooc-check exposes a single class, `Check`, that offers the following methods and properties:

* `new(name: String)`: create an instance with the specified name.
* `failed?`: gets or sets the failed flag.
* `backtrace?`: gets or sets whether a backtrace should be printed on failure.
* `run(Func())`: runs the provided function, handling the call to `exit(1)` automatically if any of the assertions fail, or if an uncaught exception is raised.
* `isTrue?(b: Bool[, msg: String, args: ...]) -> Bool`: asserts that the condition is true, and fails with the provided (optional) message. The test suite continues.
* `isFalse?(b: Bool[, msg: String, args: ...]) -> Bool`: asserts that the condition is false, and fails with the provided (optional) message. The test suite continues.
* `isTrue!(b: Bool[, msg: String, args: ...])`: same as `isTrue?` except that the test suite stops immediately if the assertion fails.
* `isFalse?(b: Bool[, msg: String, args: ...]) -> Bool`: same as `isFalse?` except that the test suite stops immediately if the assertion fails.

Corresponding helper functions are provided as top-level module functions (i.e. no instance of Check needed, the functions are proxies to an automatically created default Check instance).

Run tests using `sam test`. The special comments `//! shouldfail` and `//! shouldcrash` that sam recognizes still work as usual.

## Example

```
import check

chk := Check new("math")

chk run(||
    chk isTrue?(1 + 1 == 2)
    chk isTrue?(3 > 2)
    chk isFalse!(1 == 1)
)
```

## License

The [BSD 3-Clause License][bsd]. See the LICENSE file.

[ooc]: http://ooc-lang.org/
[sam]: https://github.com/fasterthanlime/sam
[bt]: http://ooc-lang.org/docs/tools/rock/debug/#fancy-backtraces
[samdoc]: http://ooc-lang.org/docs/tools/sam/
[use]: http://ooc-lang.org/docs/tools/rock/usefiles/
[bsd]: http://opensource.org/licenses/BSD-3-Clause
