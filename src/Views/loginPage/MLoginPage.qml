import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import CppInclude

Page {
    id: root

    width: baseRoot.defaultWidth
    height: baseRoot.defaultHeight

    Window {
        id: resultWindow
        visible: false

        width: 300
        height: 200

        Column {
            anchors.centerIn: parent
            spacing: 10

            Text {
                id: resultText
                text: ""
                color: "red"
                horizontalAlignment: Text.AlignHCenter  // Выравнивание текста по горизонтали
            }

            Button {
                text: "OK"
                onClicked: {
                    resultWindow.visible = false
                }
                Layout.alignment: Qt.AlignHCenter  // Выравнивание кнопки по горизонтали
            }
        }
    }

    ColumnLayout {
        spacing: 10
        anchors.centerIn: parent
        width: parent.width

        TextField {
            id: usernameField
            placeholderText: "Username"
            Layout.alignment: Qt.AlignHCenter  // Выравнивание текстового поля по горизонтали
        }

        TextField {
            id: passwordField
            placeholderText: "Password"
            echoMode: TextInput.Password
            Layout.alignment: Qt.AlignHCenter  // Выравнивание поля для ввода пароля по горизонтали
        }

        Button {
            text: "Login"
            onClicked: {
                loginController.login(usernameField.text, passwordField.text)
                resultWindow.visible = true
                if (loginController.loginResult) {
                    resultText.text = "Authentication successful"
                    resultText.color = "green"

                } else {
                    resultText.text = "Authentication failed"
                    resultText.color = "red"
                }

            }
            Layout.alignment: Qt.AlignHCenter  // Выравнивание кнопки по горизонтали
        }
    }
}
