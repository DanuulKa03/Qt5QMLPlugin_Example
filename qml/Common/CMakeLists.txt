qt5_add_library(Common STATIC)

set(SINGLETON_QML 
	${CMAKE_CURRENT_SOURCE_DIR}/Enums.qml
        ${CMAKE_CURRENT_SOURCE_DIR}/Consts.qml
	${CMAKE_CURRENT_SOURCE_DIR}/Colors.qml)

foreach(singleton_qml ${SINGLETON_QML})
    set_source_files_properties(${singleton_qml} PROPERTIES QT_QML_SINGLETON_TYPE TRUE)
endforeach()

target_link_libraries(Common PRIVATE
        Qt${QT_VERSION_MAJOR}::Quick
        Qt${QT_VERSION_MAJOR}::QuickControls2
)

qt5_add_qml_module(Common
        URI Common
        VERSION 1.0
        RESOURCE_PREFIX "/qml"
        QML_FILES ${SINGLETON_QML}
        
)
