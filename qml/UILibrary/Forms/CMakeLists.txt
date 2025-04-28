qt5_add_library(FormsLib STATIC)

target_link_libraries(FormsLib PRIVATE
        Qt${QT_VERSION_MAJOR}::Quick
        Qt${QT_VERSION_MAJOR}::QuickControls2
)

qt5_add_qml_module(FormsLib
        URI Forms
        VERSION 1.0
        RESOURCE_PREFIX "/qml/UILibrary"
        QML_FILES
        ${CMAKE_CURRENT_SOURCE_DIR}/BaseForm.qml
        ${CMAKE_CURRENT_SOURCE_DIR}/OneButtonForm.qml
        ${CMAKE_CURRENT_SOURCE_DIR}/TwoButtonsForm.qml
)
