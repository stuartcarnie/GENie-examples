import c
import cxx
import Foundation
import Foobar

let from_c = c.c_foo("world")
print("hello from c: \(from_c)")

let from_cxx = cxx.cpp_foo("world")
print("hello from cxx: \(from_cxx)")

let foo = Foo()
foo.bar()
let bar = Bar()
bar.foo()

NSLog("hello from NSLog")
