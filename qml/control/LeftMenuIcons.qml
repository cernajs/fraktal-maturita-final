import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    property url photoSource: "../../imgs/svg_icons/koch.svg"
    property int iconWidth: 18
    property int iconHeight: 18
    property color btnColorDefault: "#1e3d59"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"



    id: leftMenu
    text: "L-System"
    implicitWidth: 240
    implicitHeight: 55

    background: Rectangle{
        color: dynamic.dynamicColor
        id: menubut
    }

    QtObject{
        id: dynamic
        property var dynamicColor: if(leftMenu.down){
                                       leftMenu.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       leftMenu.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    contentItem: Item {
        id: content
        anchors.fill: parent
        Image {
            id: menuBtn
            source: photoSource
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter

            anchors.left: parent.left
            sourceSize.width: iconWidth
            sourceSize.height: iconHeight
            height: 30
            width: 30
            fillMode: Image.PreserveAspectFit

        }

        ColorOverlay {
            anchors.fill: menuBtn
            source: menuBtn
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            width: iconWidth
            height: iconHeight
        }


        Text {
            id: lsystem
            text: leftMenu.text
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 75
            color: "#f5f0e1"
        }
    }
}

/*
    TEXT
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.verticalCenter: parent.verticalCenter
            anchors.bottomMargin: 42
            anchors.topMargin: 20
            anchors.leftMargin: 120
            minimumPixelSize: 14


        BUTTON

         transformOrigin: Item.Center
*/

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
