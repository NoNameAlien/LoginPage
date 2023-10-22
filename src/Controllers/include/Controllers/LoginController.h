#ifndef LOGINCONTROLLER_H
#define LOGINCONTROLLER_H

#include <QObject>
#include "../../../Services/include/AuthenticationService.h"
#include "AuthenticationData.h"

class LoginController : public QObject {
    Q_OBJECT
    Q_PROPERTY(bool loginResult READ loginResult NOTIFY loginResultChanged)

public:
    LoginController(QObject* parent=nullptr);

public slots:
    void login(QString username, QString password);

signals:
    void loginResultChanged();

private:
    bool loginResult() const;

    bool lastLoginResult;
    AuthenticationService authService;
};

#endif // LOGINCONTROLLER_H
