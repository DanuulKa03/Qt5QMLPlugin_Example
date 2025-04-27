import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import Common 1.0 as Common
import Forms 1.0 as Forms

Forms.BaseForm {
    id: formSplashPage
    pageName: qsTr("Старницы приветствия")

    signal splashPageClicked()

    content: Label {
        id: greetingLabel

        anchors.fill: parent

        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter

        text: qsTr("Приветствие...")

        font.pixelSize: 40 * Common.Consts.fontSize

        MouseArea {
            id: mouseArea

            anchors.fill: parent

            Connections {
                target: mouseArea

                function onClicked() {
                    formSplashPage.splashPageClicked();
                }
            } // Connections
        } // MouseArea
    } // Label
} // Forms.BaseForm
