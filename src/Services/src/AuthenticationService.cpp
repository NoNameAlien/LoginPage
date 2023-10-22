//#include <QGuiApplication>
//#include <QQmlApplicationEngine>

#include "AuthenticationService.h"

LoginController::LoginController(QObject *parent) : QObject(parent) {}

void LoginController::login(QString username, QString password) {
    if (username == "admin" && password == "admin") {
        emit loginResult(true);
    } else {
        emit loginResult(false);
    }
}

