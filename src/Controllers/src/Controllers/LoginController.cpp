#include "LoginController.h"

LoginController::LoginController(QObject* parent) : QObject(parent) {
    // Соединяем сигнал из AuthenticationService с loginResult сигналом LoginController
    connect(&authenticationService, &AuthenticationService::authenticationResult, this, &LoginController::loginResult);
}

void LoginController::login(const QString& username, const QString& password) {
    // Передаем данные аутентификации в AuthenticationService
    authenticationService.authenticate(username, password);
}
