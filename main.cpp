#include <QQmlApplicationEngine>
#include <QtQml/qqmlextensionplugin.h>
#include <QGuiApplication>

// Add below code before your main() function
#if SUBMODULE_BUILD_STATIC
#if (QT_VERSION < QT_VERSION_CHECK(6, 0, 0)) // Add this check if you want to support both Qt 5 and Qt 6
#define Q_IMPORT_QML_PLUGIN(PLUGIN) \
Q_IMPORT_PLUGIN(PLUGIN)
extern void qml_static_register_types_Forms();
extern void qml_static_register_types_Components();
extern void qml_static_register_types_Common();
extern void qml_static_register_types_Pages();
extern void qml_static_register_types_org_example_core();
#endif
Q_IMPORT_QML_PLUGIN(FormsPlugin)
Q_IMPORT_QML_PLUGIN(ComponentsPlugin)
Q_IMPORT_QML_PLUGIN(CommonPlugin)
Q_IMPORT_QML_PLUGIN(PagesPlugin)
Q_IMPORT_QML_PLUGIN(org_example_corePlugin)
#endif

auto main(int argc, char* argv[]) -> int
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
#if SUBMODULE_BUILD_STATIC
    engine.addImportPath("qrc:/qml"); // There are two way for import static module(PURE QML MODULE)
                                      // addImportPath or qml_static_register_types, only one should be enough
                                      // If you see "Cyclic dependency detected between XXX and XXX" with qml_static_register_types
                                      // It's a bug of qmlRegisterSingletonType, just ignore it.
    engine.addImportPath("qrc:/qml/UILibrary");
    qml_static_register_types_org_example_core(); // If you write a C++ or C++/QML hybrid module, you must use this function to register it.
#if (QT_VERSION < QT_VERSION_CHECK(6, 0, 0)) && 0 // Add this check if you want to support both Qt 5 and Qt 6
    qml_static_register_types_Forms();
    qml_static_register_types_Components();
    qml_static_register_types_Common();
    qml_static_register_types_Pages();
#endif
#else
    engine.addImportPath(SUBMODULE_IMPORT_PATH);
    engine.addImportPath(QString(SUBMODULE_IMPORT_PATH) + "/UILibrary");
#endif

    const QUrl url("qrc:/StackView-Template/main.qml");
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app, [url](QObject* obj, const QUrl& objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);
    return app.exec();
}
