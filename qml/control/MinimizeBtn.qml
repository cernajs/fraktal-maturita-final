import QtQuick 2.0
import QtQuick.Controls 2.15

Button {
    id: closeBtn
    implicitWidth: 30
    implicitHeight: 30

    property color btnColorDefault: "#ffffff"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"

    QtObject{
            id: dynamic
            property var dynamicColor: if(closeBtn.down){
                                           closeBtn.down ? btnColorClicked : btnColorDefault
                                       } else {
                                           closeBtn.hovered ? btnColorMouseOver : btnColorDefault
                                       }
        }

    background: Rectangle{
        color: dynamic.dynamicColor
        id: menubut

        Image {
            id: meenuBtn
            source: "../../imgs/svg_icons/minimize.svg"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 18
            width: 18
            fillMode: Image.PreserveAspectFit
            antialiasing: false
        }


    }
}
