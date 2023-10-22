import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import CppInclude

Page {
    id: root

    width: baseRoot.defaultWidth
    height: baseRoot.defaultHeight

    // This line is not required as we already have loginController instance in context
     property var loginController: LoginController

    // This line is not necessary as loginResult is a property of loginController
     property bool loginResult: true

    Text {
        id: resultText
        visible: loginController.loginResult // directly refer loginResult from loginController
        text: loginController.loginResult ? "Authentication successful" : "Authentication failed"
        color: loginController.loginResult ? "green" : "red"
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
                loginController.login(usernameField.text, passwordField.text)
            }
        }
    }
}
