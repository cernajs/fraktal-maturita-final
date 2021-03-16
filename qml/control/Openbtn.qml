import QtQuick 2.0
import QtQuick.Controls 2.15

Button {
    id: openBtnFurther
    implicitWidth: 14
    implicitHeight: 14

    Rectangle {
        id: rectangle
        color: "#1e3d59"
        width: 15
        height: 15

        Rectangle{
            id: verticalLine
            x: 7
            y: 3
            width: 1
            height: 9
            color: "#e2e3e3"
            antialiasing: true
        }


        Rectangle{
            id: horizontalLine
            x: 3
            y: 7
            width: 9
            height: 1
            color: "#e2e3e3"
            antialiasing: true
        }
    }

}



/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:8;height:14;width:14}
}
##^##*/
