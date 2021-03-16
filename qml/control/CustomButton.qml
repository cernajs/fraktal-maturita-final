import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    property color btnColorDefault: "#1e3d59"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"

    id: menuOpen
    implicitWidth: 60
    implicitHeight: 55

    QtObject{
        id: dynamic
        property var dynamicColor: if(menuOpen.down){
                                       menuOpen.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       menuOpen.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    background: Rectangle{
        color: dynamic.dynamicColor
        id: menubut

        Image {
            id: menuBtn
            source: "../../imgs/svg_icons/circle.svg"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 30
            width: 30
            fillMode: Image.PreserveAspectFit
            antialiasing: false

        }

        ColorOverlay {
            source: menuBtn
            anchors.fill: menuBtn
            color: "#f5f0e1"
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:40;width:60}
}
##^##*/
