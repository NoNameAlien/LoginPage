import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
//import com.yourdomain

Page {
    id: root

    QtObject {
        id: internal

        // Some internal logic
    }

    Item {
            width: baseRoot.defaultWidth
            height: baseRoot.defaultHeight

            // Создаем свойство loginResult, на которое будет среагировать UI
            property bool loginResult: false
            property var loginController: LoginController
            property var login

            onLoginResultChanged: {
                // Обновляем видимость и текст соответствующего элемента
                resultText.visible = true
                resultText.text = loginResult ? "Authentication successful" : "Authentication failed"
                resultText.color = loginResult ? "green" : "red"
            }

            Column {
                spacing: 10
                anchors.centerIn: parent

                TextField {
                    id: usernameField
                    placeholderText: "Username"
                }

                TextField {
                    id: passwordField
                    placeholderText: "Password"
                    echoMode: TextInput.Password
                }

                Button {
                    text: "Login"
                    onClicked: {
                        resultText.visible = true
                        loginController.login(usernameField.text, passwordField.text)
                    }
                }

                Text {
                    id: resultText
                    visible: false
                }
            }

            Connections {
                    target: LoginController
                    onLoginResult: {
                        loginResult = success;
                    }
                }
        }
}
