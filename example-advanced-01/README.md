example-advanced-01: mixed targets
==================================

This example shows you how to build multiple targets, multiple languages and generate a single, Swift executable.

Demonstration debugging across all languages from the Swift executable

[![asciicast](https://asciinema.org/a/4ebp4a3gfr9z06y3nv9ljlx0i.png)](https://asciinema.org/a/4ebp4a3gfr9z06y3nv9ljlx0i)

project: c
----------

A C library with a module map, enabling Swift support


project: cxx
----------

A C++ library with a module map, enabling Swift support


project: Foobar
--------------

Generates a static Swift library


project: swiftexe
-----------------

Generates a Swift executable, linking the `c`, `cxx` and `Foobar` static libraries and calling code from each.