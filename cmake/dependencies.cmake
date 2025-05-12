include(FetchContent)

FetchContent_Declare(
        qt5_qml_plugin
        GIT_TAG main
        GIT_REPOSITORY https://github.com/mentalfl0w/Qt5QMLPlugin
        GIT_SHALLOW true
)

FetchContent_MakeAvailable(qt5_qml_plugin)
include(${qt5_qml_plugin_SOURCE_DIR}/Qt5QMLPlugin.cmake)