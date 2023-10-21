import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window

import loginPage


ApplicationWindow {
    id: baseRoot

    property int defaultWidth: 760
    property int defaultHeight: 500

    property Component defaultPage

    visible: true
    title: qsTr("Okibi")

    minimumWidth: defaultWidth
    minimumHeight: defaultHeight

    // The StackView is managing switching pages
    StackView {
        id: pageManager

        Layout.fillWidth: true
        Layout.fillHeight: true

        initialItem: loginPage
    }

    // Pages
    Component { id: loginPage; MLoginPage {} }

    function loadPage(page) {
        if (page !== loginPage) {
            baseRoot.defaultWidth = 1300
            baseRoot.defaultHeihg = 600
            visibility = Window.Maximized
        } else {
            visibility = Window.Minimized
        }

        pageManager.replace(page, StackView.Immediate);
    }

}
