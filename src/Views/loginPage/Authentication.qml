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
    property bool authenticated: false

    function authenticate() {
        loginController.login(username, password)
        authenticated = loginController.loginResult
        if (authenticated) {
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
                    id: loginButton
                    text: authPopup.authenticated ? "Logout" : "Return"
                    onClicked: {
                        authPopup.visible = false
                    }
                    anchors.horizontalCenter: parent.horizontalCenter

                    // Add behavior for scale to animate it
                    Behavior on scale {
                        NumberAnimation {
                            duration: 100;
                            easing.type: Easing.InOutQuad
                        }
                    }

                    // Add behavior for mouse hover to scale it
                    hoverEnabled: true
                    onHoveredChanged: {
                        loginButton.scale = hovered ? 1.2 : 1.0;
                    }
                }

    }
}
