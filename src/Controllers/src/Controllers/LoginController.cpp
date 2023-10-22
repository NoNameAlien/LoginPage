#include "LoginController.h"

LoginController::LoginController(QObject* parent)
    : QObject(parent), lastLoginResult(false)
{
}

void LoginController::login(QString username, QString password) {
    AuthenticationData data(username.toStdString(), password.toStdString());
    lastLoginResult = authService.authenticate(data);
    emit loginResultChanged();
}

bool LoginController::loginResult() const {
    return lastLoginResult;
}

