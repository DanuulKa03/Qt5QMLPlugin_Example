qt5_add_library(Pages STATIC)

set(SINGLETON_QML ${CMAKE_CURRENT_SOURCE_DIR}/PageFactory.qml)

foreach(singleton_qml ${SINGLETON_QML})
    set_source_files_properties(${singleton_qml} PROPERTIES QT_QML_SINGLETON_TYPE TRUE)
endforeach()


target_link_libraries(Pages PRIVATE
        Qt${QT_VERSION_MAJOR}::Quick
        Qt${QT_VERSION_MAJOR}::QuickControls2
)

qt5_add_qml_module(Pages
        URI Pages
        VERSION 1.0
        RESOURCE_PREFIX "/qml"
        QML_FILES
        ${SINGLETON_QML}
        ${CMAKE_CURRENT_SOURCE_DIR}/Login/AuthenticationPage.qml
        ${CMAKE_CURRENT_SOURCE_DIR}/Menu/MainMenuPage.qml
	${CMAKE_CURRENT_SOURCE_DIR}/Splash/SplashPage.qml
        RESOURCES
        ${CMAKE_CURRENT_SOURCE_DIR}/Login/AuthenticationPage_Form.ui.qml
        ${CMAKE_CURRENT_SOURCE_DIR}/Menu/MainMenuPage_Form.ui.qml
        ${CMAKE_CURRENT_SOURCE_DIR}/Splash/SplashPage_Form.ui.qml
)
