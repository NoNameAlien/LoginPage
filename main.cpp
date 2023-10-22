//#include <QGuiApplication>
//#include <QQmlApplicationEngine>


//int main(int argc, char *argv[])
//{
//    QGuiApplication app(argc, argv);

//    QQmlApplicationEngine engine;
//    const QUrl url(u"qrc:/123/main.qml"_qs);
//    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
//                     &app, [url](QObject *obj, const QUrl &objUrl) {
//        if (!obj && url == objUrl)
//            QCoreApplication::exit(-1);
//    }, Qt::QueuedConnection);
//    engine.load(url);

//    return app.exec();
//}

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>

#include "main.h"

LoginController::LoginController(QObject *parent) : QObject(parent) {
    // Здесь можно добавить операции инициализации, если они необходимы.
}

void LoginController::login(QString username, QString password) {
    if (username == "admin" && password == "admin") {
        emit loginResult(true); // Успешный вход
    } else {
        emit loginResult(false); // Неудачная попытка входа
    }
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterType<LoginController>("CppInclude", 1, 0, "LoginController"); // Регистрация LoginController в QML

    const QUrl url(u"qrc:/123/main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
