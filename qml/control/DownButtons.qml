import QtQuick 2.12
import QtQuick.Controls 2.12

Button {
    id: downBtn
    implicitWidth: 30
    implicitHeight: 30

    property color btnColorDefault: "#BEBFBE"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"
    property url photoSource: "../../imgs/svg_icons/home.svg"

    QtObject{
        id: dynamic
        property var dynamicColor: if(downBtn.down){
                                       downBtn.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       downBtn.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    background: Rectangle{
        color: dynamic.dynamicColor
        id: menubut

        Image {
            id: downBtns
            source: photoSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 18
            width: 18
            fillMode: Image.PreserveAspectFit
            antialiasing: false
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:6}
}
##^##*/
