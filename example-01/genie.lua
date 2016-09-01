solution "genie"
	configurations {
		"Debug"
	}
  
configuration "Debug"
	flags       { "Symbols" }

project "helloworld"
	language "Swift"
	kind     "ConsoleApp"
	
	files {
		"src/main.swift"
	}
