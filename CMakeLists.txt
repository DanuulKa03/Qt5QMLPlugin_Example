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
add_subdirectory(${CMAKE_SOURCE_DIR}/qml/Pages)

qt5_add_resources_plus(QRC_FILES "qmls"
    PREFIX "/${PROJECT_NAME}"
    FILES ${CMAKE_SOURCE_DIR}/main.qml
)

qt5_add_executable(${PROJECT_NAME}
   ${PROJECT_SOURCES}
   ${QRC_FILES}
)

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
)

message("---------------------- Qt5QMLPlugin_Example ----------------------")
message("Build submodule as static lib: ${SUBMODULE_BUILD_STATIC}")
message("------------------------------------------------------------------")
