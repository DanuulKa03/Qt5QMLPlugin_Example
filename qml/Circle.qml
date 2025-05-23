import QtQuick 2.15

Rectangle {
    id: root

    required property int size

    implicitHeight: root.size
    implicitWidth: root.size

    radius: root.width
}