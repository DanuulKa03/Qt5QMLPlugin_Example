cmake_minimum_required(VERSION 3.22)

project(StackView-Template
    VERSION 1.0
    LANGUAGES CXX
)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt5 COMPONENTS Core Quick REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core Quick QuickControls2 REQUIRED)

option(SUBMODULE_BUILD_STATIC "Build submodule as static lib." OFF)
set(SUBMODULE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/output)
set(SUBMODULE_IMPORT_PATH ${SUBMODULE_OUTPUT_PATH}/qml)

include(${CMAKE_SOURCE_DIR}/cmake/dependencies.cmake)

set(PROJECT_SOURCES
    main.cpp
)

add_subdirectory(${CMAKE_SOURCE_DIR}/qml/Common)
add_subdirectory(${CMAKE_SOURCE_DIR}/qml/UILibrary/Forms)
add_subdirectory(${CMAKE_SOURCE_DIR}/qml/UILibrary/Components)
add_subdirectory(${CMAKE_SOURCE_DIR}/qml/src)
add_subdirectory(${CMAKE_SOURCE_DIR}/qml/Pages)

qt5_add_resources_plus(QRC_FILES "qmls"
    PREFIX "/${PROJECT_NAME}"
    FILES ${CMAKE_SOURCE_DIR}/main.qml
)

file(GLOB_RECURSE IMAGES_PROJECT_SOURCES "${CMAKE_SOURCE_DIR}/res/images/*")

qt5_add_resources_plus(QRC_FILES_IMAGES "images"
    PREFIX "/images"
    FILES
        ${IMAGES_PROJECT_SOURCES}
)

qt5_add_executable(${PROJECT_NAME}
   ${PROJECT_SOURCES}
   ${QRC_FILES}
   ${QRC_FILES_IMAGES}
)

# Register QML import paths for code completion
list(APPEND QML_DIRS "${CMAKE_SOURCE_DIR}/qml")
list(APPEND QML_DIRS "${CMAKE_SOURCE_DIR}/qml/UILibrary")
list(REMOVE_DUPLICATES QML_DIRS)
set(QML_IMPORT_PATH "${QML_DIRS}" CACHE STRING "QML import paths")

target_compile_definitions(${PROJECT_NAME} PRIVATE
    $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>
    SUBMODULE_IMPORT_PATH="${SUBMODULE_IMPORT_PATH}"
)

if (SUBMODULE_BUILD_STATIC)
    target_compile_definitions(${PROJECT_NAME} PRIVATE
        SUBMODULE_BUILD_STATIC=1
    )
else()
    target_compile_definitions(${PROJECT_NAME} PRIVATE
        SUBMODULE_BUILD_STATIC=0
    )
endif()

target_link_libraries(${PROJECT_NAME} PRIVATE
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Quick
    FormsLib
    ComponentsLib
    Common
    Pages
    CoreLib
)

message("---------------------- Qt5QMLPlugin_Example ----------------------")
message("Build submodule as static lib: ${SUBMODULE_BUILD_STATIC}")
message("------------------------------------------------------------------")
