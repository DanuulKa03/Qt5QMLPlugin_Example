qt_add_library(CoreLib STATIC)

set_target_properties(CoreLib PROPERTIES AUTOMOC ON)
target_link_libraries(CoreLib PRIVATE Qt${QT_VERSION_MAJOR}::Quick)

qt_add_qml_module(CoreLib
        URI org.qt5qmlplugin.core
        VERSION 1.0
        SOURCE
        TestComponent.cpp
        TestComponent.h
)
