BASE_DIR   = path.getabsolute(".")
BUILD_PATH = path.join(BASE_DIR, "build")

solution "mixedtargets"
	location(path.join(BUILD_PATH, "projects", _ACTION))
	targetdir(path.join(BUILD_PATH, "bin"))

	configurations {
		"Release",
		"Debug"
	}
	
	platforms {
		"Native", -- for targets where bitness is not specified
	}

configuration "Debug"
	flags       { "Symbols" }
	defines     { "DEBUG=1" }
	
configuration "Release"
	flags       { "OptimizeSize" }

project "swiftlib"
	language "Swift"
	kind     "StaticLib"
	
	files {
		"swiftlib/**.swift"
	}

project "clib"
	language "C"
	kind     "StaticLib"
	
	files {
		"clib/**.c",
	}
	
	includedirs {
		"clib/include",
	}

project "swiftexe"
	language "Swift"
	kind     "ConsoleApp"
	swiftmodulemaps {
    -- todo: update GENie to move this directive to clib, where it belongs
		"clib/module.modulemap",
	}
	
	flags {
		-- "StaticRuntime"
	}
	
	linkoptions_swift {
	}
	
	files {
		"swiftexe/**.swift",
	}
	
	links {
		"clib",
    "swiftlib",
	}