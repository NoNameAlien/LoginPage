import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import CppInclude

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 760
    height: 500
    title: qsTr("Okibi")

    property int defaultWidth: 760
    property int defaultHeight: 500

    property Component defaultPage

    function successColor() { return "green"; }
    function failureColor() { return "red"; }

    LoginController { id: loginController }

    ColumnLayout {
        id: layout
        anchors.centerIn: parent
        width: 300

        Label {
            id: usernameLabel
            text: "Name"
            Layout.alignment: Qt.AlignCenter
        }
        TextField {
            id: usernameField
            Layout.alignment: Qt.AlignCenter
            placeholderText: "Username"
        }

        Label {
            id: passwordLabel
            text: "Password"
            Layout.alignment: Qt.AlignCenter
        }
        TextField {
            id: passwordField
            Layout.alignment: Qt.AlignCenter
            placeholderText: "Password"
            echoMode: TextInput.Password
            onAccepted: loginButton.clicked()
        }

        Button {
            id: loginButton
            Layout.alignment: Qt.AlignCenter
            text: "Login"
            onClicked: {
                var username = usernameField.text
                var password = passwordField.text
                loginController.login(username, password)
            }
        }

        Label {
            id: statusLabel
            Layout.alignment: Qt.AlignCenter
            font.pixelSize: 18
            color: "red"
            visible: false
        }
    }

    Connections {
        target: loginController
        onLoginResult: {
            statusLabel.visible = true
            if (success) {
                statusLabel.text = "Successful"
                statusLabel.color = mainWindow.successColor()
                loginButton.color = mainWindow.successColor()
            } else {
                statusLabel.text = "Failed"
                statusLabel.color = mainWindow.failureColor()
                loginButton.color = mainWindow.failureColor()
            }
        }
    }
}
