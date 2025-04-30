project(ComponentsLib VERSION 1.0 LANGUAGES CXX)

set(URI_NAME "Components")
set(DEPENDENCIES "Common")

if(SUBMODULE_BUILD_STATIC)
    qt5_add_library(${PROJECT_NAME} STATIC)
else()
    qt5_add_library(${PROJECT_NAME} SHARED)
    set(__qml_plugin_depend_module ${DEPENDENCIES})
endif()

add_dependencies(${PROJECT_NAME} ${DEPENDENCIES})

target_link_libraries(${PROJECT_NAME} PRIVATE
        Qt${QT_VERSION_MAJOR}::Quick
        Qt${QT_VERSION_MAJOR}::QuickControls2
)

cmake_path(SET RELATIVE_DIR NORMALIZE ${CMAKE_CURRENT_SOURCE_DIR}/..)
string(REGEX REPLACE "[/]+$" "" RELATIVE_DIR "${RELATIVE_DIR}")
string(REPLACE "${CMAKE_SOURCE_DIR}/" "" RELATIVE_DIR ${RELATIVE_DIR})

if(SUBMODULE_BUILD_STATIC)
    set(OUTPUT_DIR "")
else()
    set(OUTPUT_DIR ${SUBMODULE_OUTPUT_PATH}/${RELATIVE_DIR}/${URI_NAME})
endif()

qt5_add_qml_module(${PROJECT_NAME}
        URI ${URI_NAME}
        VERSION ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
        RESOURCE_PREFIX "/${RELATIVE_DIR}"
        OUTPUT_DIRECTORY ${OUTPUT_DIR}
        QML_FILES
        ${CMAKE_CURRENT_SOURCE_DIR}/TopPanel.qml
        RESOURCES
        ${CMAKE_CURRENT_SOURCE_DIR}/TopPanel_Form.ui.qml
)
