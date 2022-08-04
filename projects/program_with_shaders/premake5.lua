project "program_with_shaders"
    kind          "ConsoleApp"
    language      "C++"
    cppdialect    "C++17"
    staticruntime "on"
    systemversion "latest"
    warnings      "extra"
    targetdir     (BIN_DIR)
    objdir        (OBJ_DIR)
    files {
        "include/**.h",
        "include/**.hpp",
        "src/**.cpp",
        "shaders/**.glsl"
    }
    includedirs {
        "include",
        ROOT_PATH "projects/lib/include",
    }
    links {
        "lib"
    }
    defines {

    }

    filter { "files:shaders/*.glsl", "configurations:debug" }
        buildmessage  ( "Compiling %{file.relpath}" )
        buildcommands (
            "%VULKAN_SDK%/bin/glslangValidator -V -g -Od -Ishaders/include -o " .. BIN_DIR .. "/shaders/%{file.basename}.spirv " .. "%{file.relpath}"
        )
        buildoutputs  ( BIN_DIR .. "/shaders/%{file.basename}.spirv " )
    filter { "files:shaders/*.glsl", "configurations:profile" }
        buildmessage  ( "Compiling %{file.relpath}" )
        buildcommands (
            "%VULKAN_SDK%/bin/glslangValidator -V -Ishaders/include -g -o " .. BIN_DIR .. "/shaders/%{file.basename}.spirv " .. "%{file.relpath}"
        )
        buildoutputs  ( BIN_DIR .. "/shaders/%{file.basename}.spirv " )
    filter { "files:shaders/*.glsl", "configurations:release" }
        buildmessage  ( "Compiling %{file.relpath}" )
        buildcommands (
            "%VULKAN_SDK%/bin/glslangValidator -V -Ishaders/include -o " .. BIN_DIR .. "/shaders/%{file.basename}.spirv " .. "%{file.relpath}"
        )
        buildoutputs  ( BIN_DIR .. "/shaders/%{file.basename}.spirv " )
    filter {}
