example-advanced-01: mixed targets
==================================

This example shows you how to build multiple targets, multiple languages and generate a single, Swift executable.

clib
----

A C library with a module map, enabling Swift support


swiftlib
--------

Generates a static Swift library


swiftexe
--------

Generates a Swift executable, linking both the `clib` and `swiftlib` static libraries and calling code from each.