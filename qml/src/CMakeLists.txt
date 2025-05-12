project(CoreLib VERSION 1.0 LANGUAGES CXX)

set(URI_NAME "org.example.core")
string(REPLACE "." "_" URI_NAME_REPLACE ${URI_NAME})

if(SUBMODULE_BUILD_STATIC)
  qt5_add_library(${PROJECT_NAME} STATIC)
else()
  qt5_add_library(${PROJECT_NAME} SHARED)
endif()

target_link_libraries(${PROJECT_NAME} PRIVATE
        Qt${QT_VERSION_MAJOR}::Quick
        Qt${QT_VERSION_MAJOR}::QuickControls2
)

cmake_path(SET RELATIVE_DIR NORMALIZE ${CMAKE_CURRENT_SOURCE_DIR}/..)
string(REGEX REPLACE "[/]+$" "" RELATIVE_DIR "${RELATIVE_DIR}")
string(REPLACE "${CMAKE_SOURCE_DIR}/" "" RELATIVE_DIR ${RELATIVE_DIR})

if(SUBMODULE_BUILD_STATIC)
    set(OUTPUT_DIR "")
    set(INCLUDE_TARGET ${PROJECT_NAME})
else()
    string(REPLACE "." "/" URI_NAME_PATH ${URI_NAME})
    set(OUTPUT_DIR ${SUBMODULE_OUTPUT_PATH}/${RELATIVE_DIR}/${URI_NAME_PATH})
    set(INCLUDE_TARGET ${URI_NAME_REPLACE}plugin)
endif()

qt5_add_qml_module(${PROJECT_NAME}
        URI ${URI_NAME}
        VERSION ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
        RESOURCE_PREFIX "/${RELATIVE_DIR}"
        OUTPUT_DIRECTORY ${OUTPUT_DIR}
        SOURCES
        ${CMAKE_CURRENT_SOURCE_DIR}/TestComponent.cpp
        ${CMAKE_CURRENT_SOURCE_DIR}/TestComponent.hpp
)

target_include_directories(${INCLUDE_TARGET} PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
)
