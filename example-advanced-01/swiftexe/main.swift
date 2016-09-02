import clib
import Foundation
import swiftlib

let res = clib.c_foo("world")
print("hello from clib: \(res)")

let foo = Foo()
foo.bar()
let bar = Bar()
bar.foo()

NSLog("hello from NSLog")
