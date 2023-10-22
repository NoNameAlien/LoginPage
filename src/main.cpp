#include <QtGui>
#include <QtQml>
#include <QQuickView>
#include <QQuickStyle>

#include "Controllers/include/Controllers/LoginController.h"

int main(int argc, char *argv[]) {
    QCoreApplication::setAttribute(Qt::AA_ShareOpenGLContexts);
    QQuickStyle::setStyle("Basic");
    qputenv("QML_XHR_ALLOW_FILE_READ", QByteArray("1"));

    // App
    QGuiApplication app(argc, argv);

    // Startup
    QQmlApplicationEngine engine;

    qmlRegisterType<LoginController>("CppInclude", 1, 0, "LoginController");
    LoginController loginController;
    engine.rootContext()->setContextProperty("loginController", &loginController); // Note the lower case "l" in "loginController"

    engine.addImportPath("qrc:/");

    const QUrl url("qrc:/main.qml");
    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated, &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (obj == nullptr && url == objUrl) {
                QCoreApplication::exit(-1);
            }
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
