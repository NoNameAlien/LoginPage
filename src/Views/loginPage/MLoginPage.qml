import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import CppInclude

Page {
    id: root

    width: baseRoot.defaultWidth
    height: baseRoot.defaultHeight

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
                loginController.login(usernameField.text, passwordField.text)
            }
        }

        Text {
            id: resultText
            text: loginController.loginResult ? "Authentication successful" : "Authentication failed"
            color: loginController.loginResult ? "green" : "red"
        }
    }
}
