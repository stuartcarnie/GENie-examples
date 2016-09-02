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

project "Foobar"
	language "Swift"
	kind     "StaticLib"
	
	files {
		"foobar/**.swift"
	}

project "c"
	language "C"
	kind     "StaticLib"
	
	files {
		"c/**.c",
	}
	
	includedirs {
		"c/include",
	}

project "cxx"
  	language "C++"
  	kind     "StaticLib"
	
  	files {
  		"cxx/**.cpp",
  	}
	
  	includedirs {
  		"cxx/include",
  	}

project "swiftexe"
	language "Swift"
	kind     "ConsoleApp"
	swiftmodulemaps {
    -- todo: update GENie to move this directive to clib, where it belongs
		"c/module.modulemap",
    "cxx/module.modulemap",
	}
	
	flags {
		-- "StaticRuntime"
	}
	
	linkoptions_swift {
    "-lc++"
	}
	
	files {
		"swiftexe/**.swift",
	}
	
	links {
		"c",
    "cxx",
    "Foobar",
	}