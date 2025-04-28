qt5_add_library(ComponentsLib STATIC)

target_link_libraries(ComponentsLib PRIVATE
        Qt${QT_VERSION_MAJOR}::Quick
        Qt${QT_VERSION_MAJOR}::QuickControls2
)

qt5_add_qml_module(ComponentsLib
        URI Components
        VERSION 1.0
        RESOURCE_PREFIX "/qml/UILibrary"
        QML_FILES
        ${CMAKE_CURRENT_SOURCE_DIR}/TopPanel.qml
        RESOURCES
        ${CMAKE_CURRENT_SOURCE_DIR}/TopPanel_Form.ui.qml
)
