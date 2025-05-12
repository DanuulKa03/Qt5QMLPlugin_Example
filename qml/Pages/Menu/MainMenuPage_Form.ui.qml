import QtQuick 2.6
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import Common 1.0 as Common
import Forms 1.0 as Forms
import org.example.core 1.0 as Core

Forms.BaseForm {
    id: formMainMenuPage
    pageName: qsTr("Главное меню")

    signal exitButtonClicked()
    signal settingButtonClicked()

    QtObject {
        id: internal

        readonly property int buttonHeight: 150 * Common.Consts.yCoord
        readonly property int buttonWidth:  1000 * Common.Consts.xCoord
    } // QtObject

    content: ColumnLayout {
        id: body

        anchors.centerIn: parent

        spacing: 10 * Common.Consts.yCoord

        Core.TestComponent {
            id: test

            text: qsTr("Hello World")
        }

        Label {
            id: labelHelloWorld

            Layout.alignment: Qt.AlignHCenter

            text: test.text
        }

        Button {
            id: settingButton

            Layout.preferredHeight: internal.buttonHeight
            Layout.preferredWidth: internal.buttonWidth

            text: qsTr("Настройки")

            Connections {
                target: settingButton

                function onClicked() {
                    formMainMenuPage.settingButtonClicked();
                }
            } // Connections
        } // RoundButton

        Button {
            id: exitButton

            Layout.preferredHeight: internal.buttonHeight
            Layout.preferredWidth: internal.buttonWidth

            text: qsTr("Выход")

            Connections {
                target: exitButton

                function onClicked() {
                    formMainMenuPage.exitButtonClicked();
                }
            } // Connections
        } // RoundButton
    } // ColumnLayout
} // Forms.BaseForm
