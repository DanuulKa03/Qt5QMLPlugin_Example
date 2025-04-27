import QtQuick 2.15
import QtQuick.Controls 2.15

import Common 1.0 as Common

Rectangle {
    id: topPanel

    color: "lightblue"

    signal settingButtonClicked()

    property alias title: title.text

    Label {
        id: title

        anchors.centerIn: parent

        font.pixelSize: 40 * Common.Consts.fontSize
    } // Label

    Button {
        id: settingButton

        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
        }

        height: 50
        width: 120

        text: qsTr("Настройки")

        Connections {
            target: settingButton

            function onClicked() {
                topPanel.settingButtonClicked();
            }
        } // Connections
    } // RoundButton
} // Rectangle
