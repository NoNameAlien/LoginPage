import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
    id: authPopup
    modal: true
    width: 300
    height: 200

    property string username: ""
    property string password: ""
    property var resultText: null

    function authenticate() {
        loginController.login(username, password)
        if (loginController.loginResult) {
            resultText.text = "Authentication successful"
            resultText.color = "green"
        } else {
            resultText.text = "Authentication failed"
            resultText.color = "red"
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 10

        Text {
            id: resultText
            text: ""
            color: "red"
            horizontalAlignment: Text.AlignHCenter
        }

        Button {
            text: "OK"
            onClicked: {
                authPopup.visible = false
            }
            anchors.horizontalCenter: parent.horizontalCenter

        }
    }
}
