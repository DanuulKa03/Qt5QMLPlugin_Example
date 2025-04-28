cmake_minimum_required(VERSION 3.22)

project(StackView-Template
    VERSION 0.1
    LANGUAGES CXX
)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt5 COMPONENTS Core Quick REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core Quick QuickControls2 REQUIRED)

include(${CMAKE_SOURCE_DIR}/thirdparty/Qt5QMLPlugin/Qt5QMLPlugin.cmake)

set(PROJECT_SOURCES
    main.cpp
)

add_subdirectory(${CMAKE_SOURCE_DIR}/qml/UILibrary/Forms)
add_subdirectory(${CMAKE_SOURCE_DIR}/qml/UILibrary/Components)
add_subdirectory(${CMAKE_SOURCE_DIR}/qml/Common)
add_subdirectory(${CMAKE_SOURCE_DIR}/qml/Pages)

qt5_add_executable(${PROJECT_NAME}
   ${PROJECT_SOURCES}
)

qt5_add_qml_module(${PROJECT_NAME}
        URI ${PROJECT_NAME}
        VERSION 1.0
        RESOURCE_PREFIX "/"
        QML_FILES ${CMAKE_SOURCE_DIR}/main.qml
)

list(APPEND QML_DIRS "${CMAKE_SOURCE_DIR}/qml")
list(APPEND QML_DIRS "${CMAKE_SOURCE_DIR}/qml/UILibrary")
list(REMOVE_DUPLICATES QML_DIRS)
set(QML_IMPORT_PATH "${QML_DIRS}" CACHE STRING "QML import paths")

target_compile_definitions(${PROJECT_NAME} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(${PROJECT_NAME} PRIVATE
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Quick
    FormsLib
    ComponentsLib
    Common
    Pages
)

#set_target_properties(${PROJECT_NAME}
#    PROPERTIES
#    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin"
#)
