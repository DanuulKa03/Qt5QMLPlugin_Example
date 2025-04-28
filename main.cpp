#include <QQmlApplicationEngine>
#include <QtQml/qqmlextensionplugin.h>
#include <QGuiApplication>

// Add below code before your main() function
#ifdef FORMS_BUILD_STATIC_LIB
#if (QT_VERSION < QT_VERSION_CHECK(6, 0, 0)) // Add this check if you want to support both Qt 5 and Qt 6
#define Q_IMPORT_QML_PLUGIN(PLUGIN) \
Q_IMPORT_PLUGIN(PLUGIN)
extern void qml_static_register_types_Forms();
extern void qml_static_register_types_Components();
extern void qml_static_register_types_Common();
extern void qml_static_register_types_Pages();
#endif
Q_IMPORT_QML_PLUGIN(FormsPlugin)
Q_IMPORT_QML_PLUGIN(ComponentsPlugin)
Q_IMPORT_QML_PLUGIN(CommonPlugin)
Q_IMPORT_QML_PLUGIN(PagesPlugin)
#endif

auto main(int argc, char* argv[]) -> int
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImportPath("qrc:/qml");
    engine.addImportPath("qrc:/qml/UILibrary");

    const QUrl url("qrc:/StackView-Template/main.qml");
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app, [url](QObject* obj, const QUrl& objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);
// Add below code before engine.load()
#ifdef FORMS_BUILD_STATIC_LIB
#if (QT_VERSION < QT_VERSION_CHECK(6, 0, 0)) // Add this check if you want to support both Qt 5 and Qt 6
    qml_static_register_types_Forms();
    qml_static_register_types_Components();
    qml_static_register_types_Common();
    qml_static_register_types_Pages();
#endif
#endif
    return app.exec();
}
