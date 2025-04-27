pragma Singleton

import QtQuick 2.15
import QtQuick.Window 2.15

QtObject {
    id: consts

    readonly property int mockupScreenWidth: 1200
    readonly property int mockupScreenHeight: 800

    readonly property int screenWidth: 1200 // Screen.width
    readonly property int screenHeight: 800 //Screen.height

    readonly property real xCoord: mockupScreenWidth / screenWidth
    readonly property real yCoord:  mockupScreenHeight / screenHeight


    readonly property real radialSize: Math.min(xCoord, yCoord)
    readonly property real fontSize: Math.max(xCoord, yCoord)

    readonly property int mainRadiusComponent: 2 * radialSize

    property var target

    // ...
} // QtObject
