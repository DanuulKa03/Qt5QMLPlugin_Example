import QtQuick 2.6
import QtQuick.Controls 2.15
import QtQuick.Window 2.2

import Common 1.0 as Common
import Components 1.0 as Components

ApplicationWindow {
    id: applicationWindow

    visible: true

    width: Common.Consts.screenWidth
    height: Common.Consts.screenHeight

    title: "Architectural-Template-Qt-QML"

    property bool headerVisible: true

    Component.onCompleted: {
        Common.Consts.target = topPanel.container;
    }

    Components.TopPanel {
        id: topPanel

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }

        onBack: {
            contentFrame.pop();
        }

        onNext: (page) => {
            contentFrame.push(page);
        }

        height: applicationWindow.headerVisible ? 150 * Common.Consts.yCoord : 0
        visible: applicationWindow.headerVisible

        title: contentFrame.currentItem.pageName ? contentFrame.currentItem.pageName : ""
    } // Components.TopPanel

    StackView {
        id: contentFrame

        anchors {
            top: topPanel.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        Component.onCompleted: {
            contentFrame.push("qrc:/qml/Pages/Splash/SplashPage.qml");
        }

        onCurrentItemChanged: {
            contentFrame.currentItem.forceActiveFocus(Qt.MouseFocusReason);
        }

        Connections {
            target: contentFrame.currentItem

            function onBack() {
                contentFrame.pop();
            }

            function onNext(page) {
                contentFrame.push(page);
            }

            // дополнительные функции перехода между страницами
        } // Connections
    } // StackView
} // ApplicationWindow
