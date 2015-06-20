# ooc-check

[![Software License](https://img.shields.io/badge/license-BSD-blue.svg)](LICENSE)
[![build status](https://secure.travis-ci.org/PuerkitoBio/ooc-check.png?branch=master)](http://travis-ci.org/PuerkitoBio/ooc-check)

ooc-check is a small unit testing utility library for [ooc][]. It plays nicely with [sam][] and only adds small helpers do assertions that print failures with an optional backtrace.

It is highly recommended to [install rock's fancy backtrace extension][bt] to use this library.

## Installation

It should be available via `sam`. Assuming you've added `check` to your `Requires` field in your [usefile][use], `sam get <yourapp>.use` should get it. See [sam's documentation][samdoc] for more details.

## Usage

## License

The [BSD 3-Clause License][bsd]. See the LICENSE file.

[ooc]: http://ooc-lang.org/
[sam]: https://github.com/fasterthanlime/sam
[bt]: http://ooc-lang.org/docs/tools/rock/debug/#fancy-backtraces
[samdoc]: http://ooc-lang.org/docs/tools/sam/
[use]: http://ooc-lang.org/docs/tools/rock/usefiles/
[bsd]: http://opensource.org/licenses/BSD-3-Clause
