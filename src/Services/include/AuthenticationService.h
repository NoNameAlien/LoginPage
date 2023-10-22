#ifndef AUTHENTICATIONSERVICE_H
#define AUTHENTICATIONSERVICE_H

#include <QObject>
#include <QString>

class LoginController : public QObject
{
    Q_OBJECT

public:
    explicit LoginController(QObject *parent = nullptr);

public slots:
    void login(QString username, QString password);

signals:
    void loginResult(bool success);
};

#endif // AUTHENTICATIONSERVICE_H
