example-01: hello world
=======================

This example shows you how to construct a simple GENie solution in order to build a Swift executable

----

genie.lua
---------

Your GENie scripts a required to define a `solution`. A solution is the primary container for all your projects or build targets.

~~~lua
solution "example-01"
~~~

Next you must define at least one `configuration`. Configurations allow you to specify flags, files and other options specific to that build type. In this example, we're only defining a single configuration named `Debug`. You would typically define a debug and release configuration.

~~~lua
	configurations {
		"Debug"
	}
~~~

Next we define some flags for the `Debug` configuration. GENie provides a number of standard options which are automatically translated to the target's toolchain. For example, `Symbols` would become `-g` for the clang or the Swift compilers or `/debug` for the C# compiler. 

**NOTE:** Any options defined in `configuration "Debug"` will be applied to all projects when built with this configuration.

~~~lua
configuration "Debug"
	flags       { "Symbols" }
~~~

The following defines our first project. A project is simply a built target, which could be an executable or a static / dynamic library. In this example, we've named it `helloworld`, which will determine the name of the final target. We've also specified its language and kind is a console or terminal application.

~~~lua
project "helloworld"
	language "Swift"
	kind     "ConsoleApp"
~~~

Finally we must provide a list of files to include in the build, which is accomplished with the `files` directive as follows

~~~lua
	files {
		"src/main.swift"
	}
~~~

----

Using GENie
-----------

GENie can generate build scripts or project files for a number of build systems. In this example we will use the [ninja][] build system on macOS. In order to generate the scripts, run the following

~~~sh
$ ../tools/bin/darwin/genie ninja
~~~

`genie` will look for a file named `genie.lua` in the current directory or `scripts/`. This minimal version of `genie.lua` will generate a single build configuration named **Debug** with a `Makefile` script in the current directory.

To build your executable, simply run the following, which will generate the target output in the current directory¹

~~~sh
$ make
~~~

and run it

~~~sh
$ ./helloworld
hello world
~~~

**¹** Don't worry, you have control of where all the artifacts of a build are generated, including build scripts, intermediate compilation files and final build target

  [ninja]: http://ninja-build.com