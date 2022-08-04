project "lib"
    kind          "StaticLib"
    language      "C++"
    cppdialect    "C++17"
    staticruntime "on"
    systemversion "latest"
    warnings      "extra"
    pchheader     "common.hpp"
    pchsource     "sources/src/common.cpp"
    targetdir     (BIN_DIR)
    objdir        (OBJ_DIR)
    files {
        "sources/src/**.cpp",

        "sources/include/**.h",
        "sources/include/**.h",
        
        "include/lib/**.hpp",
        "include/lib/**.h",
    }
    includedirs {
        "include/lib",
        "sources/include"
    }
    links {
        
    }
    defines {

    }
