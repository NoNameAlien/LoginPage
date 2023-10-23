import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import CppInclude

Page {
    id: root

    width: baseRoot.defaultWidth
    height: baseRoot.defaultHeight

    Authentication {
        id: auth
        username: usernameField.text
        password: passwordField.text
        resultText: resultTextField
        anchors.centerIn: parent
        width: root.width
        height: root.height
    }

    ColumnLayout {
        spacing: 10
        anchors.centerIn: parent
        width: parent.width

        TextField {
            id: usernameField
            placeholderText: "Username"
            Layout.alignment: Qt.AlignHCenter
        }

        TextField {
            id: passwordField
            placeholderText: "Password"
            echoMode: TextInput.Password
            Layout.alignment: Qt.AlignHCenter
        }

        Button {
            text: "Login"
            onClicked: {
                auth.authenticate()
                auth.visible = true
            }
            Layout.alignment: Qt.AlignHCenter
        }
    }
}
