#include <QObject>

// Объект с данными аутентификации
struct AuthenticationData {
    QString username;
    QString password;
};

class AuthenticationService : public QObject {
    Q_OBJECT
public:
    explicit AuthenticationService(QObject* parent = nullptr);

public slots:
    // Метод для аутентификации
    void authenticate(const QString& username, const QString& password);

signals:
    // Сигнал, отправляемый после завершения аутентификации
    void authenticationResult(bool success);
};
