import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12

import "./qml/control"

import Backend 1.0

ApplicationWindow {
    id: main
    width: 1100
    height: 1000
    visible: true
    color: "#00000000"
    property alias anim: anim
    title: qsTr("FraktalEditor")

    flags: Qt.Window | Qt.FramelessWindowHint
    /*
    DragHandler {
        onActiveChanged: if(active){
                            main.startSystemMove()
                         }
    }
    */
    Rectangle {
        id: background
        color: "#ffffff"
        border.color: "#005474"
        border.width: 3
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        z: 0
        anchors.rightMargin: 11
        anchors.leftMargin: 11
        anchors.bottomMargin: 11
        anchors.topMargin: 11


        Rectangle {
            id: container
            color: "#ffffff"
            anchors.fill: parent
            z: 0
            anchors.rightMargin: 3
            anchors.leftMargin: 3
            anchors.bottomMargin: 3
            anchors.topMargin: 3

            Rectangle {

                DragHandler {
                    onActiveChanged: if(active){
                                        main.startSystemMove()
                                     }
                }

                id: barUp
                height: 65
                color: "#ffffff"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0



                CustomButton {
                    anchors.left: parent.left
                    anchors.right: title.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0

                    onClicked: anim.running = true

                }

                Rectangle {
                    id: barUpDescription
                    y: 37
                    height: 25
                    color: "#ffffff"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 70
                    anchors.bottomMargin: 0

                    Label {
                        id: upBarDesc
                        color: "#999999"
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 10
                        anchors.bottomMargin: 0
                        anchors.rightMargin: 301
                        anchors.leftMargin: 11
                        anchors.topMargin: 0
                    }

                    Label {
                        id: upBarDesc1
                        color: "#999999"
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 8
                        anchors.topMargin: 0
                        font.pointSize: 10
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 0
                    }
                }

                Rectangle {
                    id: title
                    height: 40
                    color: "#ffffff"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 100
                    anchors.leftMargin: 70
                    anchors.topMargin: 0



                    Image {
                        id: image
                        width: 30
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "imgs/svg_icons/titlepic.svg"
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 5
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        id: label
                        color: "#1e3d59"
                        text: qsTr("Fraktal generator")
                        anchors.left: image.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 12
                        anchors.leftMargin: 5
                    }
                }

                Row {
                    id: row
                    x: 867
                    width: 91
                    height: 34
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 14
                    anchors.topMargin: 0

                    MinimizeBtn {
                        id: minimizedB
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        onClicked: main.showMinimized()

                    }

                    MaximizeBtn {
                        id: maximizedB
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        onClicked: main.showMaximized()
                    }

                    CloseBut {
                        id: closeB
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        onClicked: main.close()
                    }
                }
            }

            Rectangle {
                id: cont
                color: "#00198bd5"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: barUp.bottom
                anchors.bottom: parent.bottom
                z: 10
                anchors.topMargin: 0

                Rectangle {
                    id: morelsysopt
                    x: 55
                    y: 19
                    width: if(lMenu.width == 70) return 0; else return 0;
                    height: 364
                    color: "#1e3d59"

                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.leftMargin: 200
                    anchors.topMargin: 0

                    z: 12
                    transformOrigin: Item.Center
                    layer.smooth: false
                    antialiasing: false

                    PropertyAnimation {
                        id: lsysanim
                        target: morelsysopt
                        property: "width"
                        to: if(morelsysopt.width == 0) return 200; else return 0
                        duration: 1200
                        easing.type: Easing.InOutQuint
                    }

                    LeftMenuIcons {
                        id: koch
                        x: 8
                        y: 0
                        width: 184
                        height: 55
                        visible: if(morelsysopt.width == 200) return true; else return false
                        text: qsTr("Koch Snowflake")
                        onClicked: {
                            displayBridge.displayKoch(4);
                        }

                        Openbtn {
                            id: openKoch
                            x: 161
                            y: 21
                            width: 14
                            height: 14
                            onClicked: {
                                kochAnimOpen.running = true
                                kochSliderAnim.running = true
                            }

                            PropertyAnimation {
                                id: kochAnimOpen
                                target: openKoch
                                property: "rotation"
                                to: if(kochSlider.width == 0) return 45; else return 180
                                duration: 150
                            }
                        }
                    }

                    LeftMenuIcons {
                        id: hilbertCurve
                        x: 8
                        y: 56
                        width: 184
                        height: 55
                        visible: if(morelsysopt.width == 200) return true; else return false
                        text: qsTr("Hilbert Curve")
                        photoSource: "imgs/svg_icons/hilbertcurve.svg"
                        onClicked: {
                            displayBridge.displayHilbert(4)
                        }

                        Openbtn {
                            id: openHilbert
                            x: 161
                            y: 21
                            width: 14
                            height: 14
                            onClicked: {
                                hilbertAnimOpen.running = true
                                hilbertSliderAnim.running = true
                            }

                            PropertyAnimation {
                                id: hilbertAnimOpen
                                target: openHilbert
                                property: "rotation"
                                to: if(hilbertSlider.width == 0) return 45; else return 180
                                duration: 150
                            }
                        }
                    }

                    LeftMenuIcons {
                        id: levyCCurve
                        x: 8
                        y: 117
                        width: 184
                        height: 55
                        visible: if(morelsysopt.width == 200) return true; else return false
                        text: qsTr("levyCCurve")
                        photoSource: "imgs/svg_icons/Levy_C_Curve.svg"
                        onClicked: {
                            displayBridge.displayLevyC(4)
                        }

                        Openbtn {
                            id: openLevyCurve
                            x: 161
                            y: 21
                            width: 14
                            height: 14
                            onClicked: {
                                levyAnimOpen.running = true
                                levyCCurveAnim.running = true
                            }

                            PropertyAnimation {
                                id: levyAnimOpen
                                target: openLevyCurve
                                property: "rotation"
                                duration: 150
                                to: if(levyCCurveSlider.width == 0) return 45; else return 180
                            }
                        }
                    }

                    LeftMenuIcons {
                        id: segment32Curve
                        x: 8
                        y: 178
                        width: 184
                        height: 55
                        visible: if(morelsysopt.width == 200) return true; else return false
                        text: qsTr("segment32Curve")
                        photoSource: "imgs/svg_icons/32segemnt.svg"
                        onClicked: {
                            displayBridge.displaySegment32(2)
                        }

                        Openbtn {
                            id: openSegment32
                            x: 161
                            y: 21
                            width: 14
                            height: 14
                            onClicked: {
                                segment32Open.running = true
                                segment32Anim.running = true
                            }

                            PropertyAnimation {
                                id: segment32Open
                                target: openSegment32
                                property: "rotation"
                                duration: 150
                                to: if(segment32Slider.width == 0) return 45; else return 180
                            }
                        }
                    }

                    LeftMenuIcons {
                        id: dragonCurve
                        x: 8
                        y: 239
                        width: 184
                        height: 55
                        visible: if(morelsysopt.width == 200) return true; else return false
                        text: qsTr("dragonCurve")
                        photoSource: "imgs/svg_icons/Dragon_Curve.svg"
                        onClicked: {
                            displayBridge.displayDragon(4)
                        }

                        Openbtn {
                            id: openDragon
                            x: 161
                            y: 21
                            width: 14
                            height: 14
                            onClicked: {
                                dragonCurveOpen.running = true
                                dragonCurveAnim.running = true
                            }

                            PropertyAnimation {
                                id: dragonCurveOpen
                                target: openDragon
                                property: "rotation"
                                duration: 150
                                to: if(dragonCurveSlider.width == 0) return 45; else return 180
                            }
                        }
                    }

                    LeftMenuIcons {
                        id: siepinskiSieve
                        x: 8
                        y: 287
                        width: 184
                        height: 55
                        visible: if(morelsysopt.width == 200) return true; else return false
                        text: qsTr("siepinskiSieve")
                        photoSource: "imgs/svg_icons/Sierpinski_triangle.svg"
                        onClicked: {
                            displayBridge.displaySiepinski(10)
                        }

                        Openbtn {
                            id: openSiepinski
                            x: 161
                            y: 21
                            width: 14
                            height: 14
                            onClicked: {
                                siepinskiOpen.running = true
                                siepinskiAnim.running = true
                            }

                            PropertyAnimation {
                                id: siepinskiOpen
                                target: openSiepinski
                                property: "rotation"
                                duration: 150
                                to: if(siepinskiSlider.width == 0) return 45; else return 180
                            }
                        }
                    }

                }

                Rectangle {
                    id: lMenu
                    width: 70
                    color: "#1e3d59"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    z: 10
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    PropertyAnimation {
                        id: anim
                        target: lMenu
                        property: "width"
                        to: if(lMenu.width == 70) return 200; else return 70
                        duration: 500
                        easing.type: Easing.InOutQuint
                    }

                    Column {
                        id: column
                        width: 70
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 73
                        anchors.topMargin: 0

                        LeftMenuIcons {
                            id: lsys
                            text: "L-System"
                            clip: false

                            Openbtn {

                                id: lsysactions
                                x: 164
                                y: 21
                                width: 14
                                height: 14
                                clip: false
                                onClicked: {
                                    lsysAnimOpen.running = true
                                    lsysanim.running = true
                                    morelsysopt.z = 11
                                   }
                                PropertyAnimation {
                                    id: lsysAnimOpen
                                    target: lsysactions
                                    property: "rotation"
                                    to: if(morelsysopt.width == 0) return 45; else return 180
                                    duration: 150
                                }
                            }
                        }

                        LeftMenuIcons {
                            id: growth
                            visible: true
                            text: qsTr("Growth")
                            photoSource: "./imgs/svg_icons/growth.svg"
                            clip: false

                            Openbtn {
                                id: growthactions
                                x: 164
                                y: 21
                                width: 14
                                height: 14
                                onClicked: {
                                    growthAnimOpen.running = true
                                    growthanim.running = true
                                }

                                PropertyAnimation {
                                    id: growthAnimOpen
                                    target: growthactions
                                    property: "rotation"
                                    duration: 150
                                    to: if(growthopt.width == 0) return 45; else return 180
                                }
                                clip: false
                            }
                        }

                        LeftMenuIcons {
                            id: complex
                            text: qsTr("Complex fractals")
                            photoSource: "imgs/svg_icons/julia.svg"
                            clip: false

                            Openbtn {
                                id: complexactions
                                x: 164
                                y: 21
                                width: 14
                                height: 14
                                onClicked: {
                                    complexAnimOpen.running = true
                                    complexanim.running = true
                                }
                                PropertyAnimation {
                                    id: complexAnimOpen
                                    target: complexactions
                                    property: "rotation"
                                    duration: 150
                                    to: if(complexopt.width == 0) return 45; else return 180
                                }
                                clip: false
                            }
                        }

                    }
                }

                Rectangle {
                    id: mainContent
                    color: "#f5f0e1"
                    anchors.left: lMenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    z: 10
                    clip: true
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 40
                    anchors.topMargin: 0

                        FigureCanvas {
                            anchors.fill: parent
                            id: mplView
                            objectName : "figure"
                            dpi_ratio: Screen.devicePixelRatio
                            width : 200
                        }

                        Slider {
                            id: kochSlider
                            x: 235
                            y: 8
                            width: if(morelsysopt.width == 0) return 0; else return 0
                            visible: if(kochSlider.width > 50) return true; else return false;
                            value: 0
                            stepSize: 1
                            to: 10
                            onValueChanged: {
                                displayBridge.displayKoch(value)
                            }

                            PropertyAnimation {
                                id: kochSliderAnim
                                target: kochSlider
                                property: "width"
                                to: if(kochSlider.width == 0) return 200; else return 0
                                duration: 1200
                                easing.type: Easing.InOutQuint
                            }

                        }

                        Slider {
                            id: hilbertSlider
                            x: 235
                            y: 66
                            width: if(morelsysopt.width == 0) return 0; else return 0
                            visible: if(hilbertSlider.width > 50) return true; else return false;
                            value: 1
                            stepSize: 1
                            to: 6
                            onValueChanged: {
                                displayBridge.displayHilbert(value)
                            }

                            PropertyAnimation {
                                id: hilbertSliderAnim
                                target: hilbertSlider
                                property: "width"
                                to: if(hilbertSlider.width == 0) return 200; else return 0
                                duration: 1200
                                easing.type: Easing.InOutQuint
                            }
                        }

                        Slider {
                            id: levyCCurveSlider
                            x: 235
                            y: 124
                            width: if(morelsysopt.width == 0) return 0; else return 0
                            visible: if(levyCCurveSlider.width > 50) return true; else return false;
                            stepSize: 1
                            onValueChanged: {
                                displayBridge.displayLevyC(value)
                            }


                            PropertyAnimation {
                                id: levyCCurveAnim
                                target: levyCCurveSlider
                                property: "width"
                                easing.type: Easing.InOutQuint
                                duration: 1200
                                to: if(levyCCurveSlider.width == 0) return 200; else return 0
                            }
                            value: 1
                            to: 16
                        }

                        Slider {
                            id: segment32Slider
                            x: 235
                            y: 192
                            width: if(morelsysopt.width == 0) return 0; else return 0
                            visible: if(segment32Slider.width > 50) return true; else return false;
                            stepSize: 1
                            onValueChanged: {
                                displayBridge.displaySegment32(value)
                            }


                            PropertyAnimation {
                                id: segment32Anim
                                target: segment32Slider
                                property: "width"
                                easing.type: Easing.InOutQuint
                                duration: 1200
                                to: if(segment32Slider.width == 0) return 200; else return 0
                            }
                            value: 1
                            to: 3
                        }

                        Slider {
                            id: dragonCurveSlider
                            x: 235
                            y: 249
                            width: if(morelsysopt.width == 0) return 0; else return 0
                            visible: if(dragonCurveSlider.width > 50) return true; else return false;
                            stepSize: 1
                            onValueChanged: {
                                displayBridge.displayDragon(value)
                            }


                            PropertyAnimation {
                                id: dragonCurveAnim
                                target: dragonCurveSlider
                                property: "width"
                                easing.type: Easing.InOutQuint
                                duration: 1200
                                to: if(dragonCurveSlider.width == 0) return 200; else return 0
                            }
                            value: 1
                            to: 16
                        }

                        Slider {
                            id: siepinskiSlider
                            x: 235
                            y: 311
                            width: if(morelsysopt.width == 0) return 0; else return 0
                            visible: if(siepinskiSlider.width > 50) return true; else return false;
                            stepSize: 1
                            onValueChanged: {
                                displayBridge.displaySiepinski(value)
                            }

                            PropertyAnimation {
                                id: siepinskiAnim
                                target: siepinskiSlider
                                property: "width"
                                easing.type: Easing.InOutQuint
                                duration: 1200
                                to: if(siepinskiSlider.width == 0) return 200; else return 0
                            }
                            value: 1
                            to: 8
                        }

                        Slider {
                            id: bush1Slider
                            x: 211
                            y: 66
                            value: 1
                            to: 6
                            stepSize: 1
                            width: if(growthopt.width == 0) return 0; else return 0
                            visible: if(bush1Slider.width > 50) return true; else return false;
                            onValueChanged: {
                                displayBridge.displayBush1(value)
                            }

                            PropertyAnimation {
                                id: bush1Anim
                                target: bush1Slider
                                property: "width"
                                easing.type: Easing.InOutQuint
                                duration: 1200
                                to: if(bush1Slider.width == 0) return 200; else return 0
                            }
                        }

                        Slider {
                            id: stickSlider
                            x: 211
                            y: 129
                            value: 1
                            to: 6
                            stepSize: 1
                            width: if(growthopt.width == 0) return 0; else return 0
                            visible: if(stickSlider.width > 50) return true; else return false;
                            onValueChanged: {
                                displayBridge.displayStick(value)
                            }

                            PropertyAnimation {
                                id: stickAnim
                                target: stickSlider
                                property: "width"
                                easing.type: Easing.InOutQuint
                                duration: 1200
                                to: if(stickSlider.width == 0) return 200; else return 0
                            }
                        }

                        Slider {
                            id: bush2Slider
                            x: 211
                            y: 182
                            value: 1
                            to: 6
                            stepSize: 1
                            width: if(growthopt.width == 0) return 0; else return 0
                            visible: if(bush2Slider.width > 50) return true; else return false;
                            onValueChanged: {
                                displayBridge.displayBush2(value)
                            }

                            PropertyAnimation {
                                id: bush2Anim
                                target: bush2Slider
                                property: "width"
                                easing.type: Easing.InOutQuint
                                duration: 1200
                                to: if(bush2Slider.width == 0) return 200; else return 0
                            }
                        }

                        Slider {
                            id: bush3Slider
                            x: 211
                            y: 238
                            value: 1
                            to: 6
                            stepSize: 1
                            width: if(growthopt.width == 0) return 0; else return 0
                            visible: if(bush3Slider.width > 50) return true; else return false;
                            onValueChanged: {
                                displayBridge.displayBush3(value)
                            }
                            PropertyAnimation {
                                id: bush3Anim
                                target: bush3Slider
                                property: "width"
                                easing.type: Easing.InOutQuint
                                duration: 1200
                                to: if(bush3Slider.width == 0) return 200; else return 0
                            }

                        }

                        Slider {
                            id: stick2Slider
                            x: 211
                            y: 295
                            value: 1
                            to: 10
                            stepSize: 1
                            width: if(growthopt.width == 0) return 0; else return 0
                            visible: if(stick2Slider.width > 50) return true; else return false;
                            onValueChanged: {
                                displayBridge.displayStick2(value)
                            }
                            PropertyAnimation {
                                id: stick2Anim
                                target: stick2Slider
                                property: "width"
                                easing.type: Easing.InOutQuint
                                duration: 1200
                                to: if(stick2Slider.width == 0) return 200; else return 0
                            }
                        }

                        Slider {
                            id: algaeSlider
                            x: 211
                            y: 351
                            value: 1
                            to: 25
                            stepSize: 1
                            width: if(growthopt.width == 0) return 0; else return 0
                            visible: if(algaeSlider.width > 50) return true; else return false;
                            onValueChanged: {
                                displayBridge.displayAlgae(value)
                            }
                            PropertyAnimation {
                                id: algaeAnim
                                target: algaeSlider
                                property: "width"
                                easing.type: Easing.InOutQuint
                                duration: 1200
                                to: if(algaeSlider.width == 0) return 200; else return 0
                            }
                        }

                        Slider {
                            id: mandSlider
                            x: 193
                            y: 124
                            value: 10
                            to: 1000
                            stepSize: 1
                            width: if(complexopt.width == 0) return 0; else return 0
                            visible: if(mandSlider.width > 50) return true; else return false;
                            onValueChanged: {
                                displayBridge.displayMand(value)
                            }
                            PropertyAnimation {
                                id: mandAnim
                                target: mandSlider
                                property: "width"
                                easing.type: Easing.InOutQuint
                                duration: 1200
                                to: if(mandSlider.width == 0) return 200; else return 0
                            }
                        }

                        Slider {
                            id: juliaSlider
                            x: 193
                            y: 192
                            value: 100
                            to: 1000
                            stepSize: 100
                            width: if(complexopt.width == 0) return 0; else return 0
                            visible: if(juliaSlider.width > 50) return true; else return false;
                            onValueChanged: {
                                displayBridge.displayJulia(value)
                            }
                            PropertyAnimation {
                                id: juliaAnim
                                target: juliaSlider
                                property: "width"
                                easing.type: Easing.InOutQuint
                                duration: 1200
                                to: if(juliaSlider.width == 0) return 200; else return 0
                            }
                        }


                }

                    Rectangle {
                        id: growthopt
                        x: 200
                        y: 55
                        width: 0
                        height: 347
                        color: "#1e3d59"
                        z: 10

                        PropertyAnimation {
                            id: growthanim
                            target: growthopt
                            property: "width"
                            to: if(growthopt.width == 0) return 200; else return 0
                            duration: 1200
                            easing.type: Easing.InOutQuint
                        }

                        LeftMenuIcons {
                            id: bush1
                            x: 8
                            y: 0
                            width: 184
                            height: 55
                            visible: if(growthopt.width == 200) return true; else return false
                            text: qsTr("Bush 1")
                            photoSource: "imgs/svg_icons/bush1.svg"
                            onClicked: {
                                displayBridge.displayBush1(2);
                            }

                            Openbtn {
                                id: bush1Open
                                x: 161
                                y: 21
                                width: 14
                                height: 14
                                onClicked: {
                                    bush1AnimOpen.running = true
                                    bush1Anim.running = true
                                }

                                PropertyAnimation {
                                    id: bush1AnimOpen
                                    target: bush1Open
                                    property: "rotation"
                                    to: if(bush1Slider.width == 0) return 45; else return 180
                                    duration: 150
                                }
                            }
                        }

                        LeftMenuIcons {
                            id: stick
                            x: 8
                            y: 61
                            width: 184
                            height: 55
                            visible: if(growthopt.width == 200) return true; else return false
                            text: qsTr("Stick")
                            photoSource: "imgs/svg_icons/stick.svg"
                            onClicked: {
                                displayBridge.displayStick(2);
                            }

                            Openbtn {
                                id: stickOpen
                                x: 161
                                y: 21
                                width: 14
                                height: 14
                                onClicked: {
                                    stickAnim.running = true
                                    stickAnimOpen.running = true
                                }

                                PropertyAnimation {
                                    id: stickAnimOpen
                                    target: stickOpen
                                    property: "rotation"
                                    duration: 150
                                    to: if(stickSlider.width == 0) return 45; else return 180
                                }

                            }
                        }

                        LeftMenuIcons {
                            id: bush2
                            x: 8
                            y: 115
                            width: 184
                            height: 55
                            visible: if(growthopt.width == 200) return true; else return false
                            text: qsTr("Bush 2")
                            photoSource: "imgs/svg_icons/bush2.svg"
                            onClicked: {
                                displayBridge.displayBush2(2);
                            }

                            Openbtn {
                                id: bush2Open
                                x: 161
                                y: 21
                                width: 14
                                height: 14
                                onClicked: {
                                    bush2Anim.running = true
                                    bush2AnimOpen.running = true
                                }

                                PropertyAnimation {
                                    id: bush2AnimOpen
                                    target: bush2Open
                                    property: "rotation"
                                    duration: 150
                                    to: if(bush2Slider.width == 0) return 45; else return 180
                                }

                            }
                        }

                        LeftMenuIcons {
                            id: bush3
                            x: 8
                            y: 170
                            width: 184
                            height: 55
                            visible: if(growthopt.width == 200) return true; else return false
                            text: qsTr("Bush 3")
                            photoSource: "imgs/svg_icons/bush3.svg"
                            onClicked: {
                                displayBridge.displayBush3(2);
                            }

                            Openbtn {
                                id: bush3Open
                                x: 161
                                y: 21
                                width: 14
                                height: 14
                                onClicked: {
                                    bush3Anim.running = true
                                    bush3AnimOpen.running = true
                                }
                                PropertyAnimation {
                                    id: bush3AnimOpen
                                    target: bush3Open
                                    property: "rotation"
                                    duration: 150
                                    to: if(bush3Slider.width == 0) return 45; else return 180
                                }
                            }
                        }

                        LeftMenuIcons {
                            id: stick2
                            x: 8
                            y: 231
                            width: 184
                            height: 55
                            visible: if(growthopt.width == 200) return true; else return false
                            text: qsTr("Stick 2")
                            photoSource: "imgs/svg_icons/sticks2.svg"
                            onClicked: {
                                displayBridge.displayStick2(2);
                            }

                            Openbtn {
                                id: stick2Open
                                x: 161
                                y: 21
                                width: 14
                                height: 14
                                onClicked: {
                                    stick2Anim.running = true
                                    stick2AnimOpen.running = true
                                }

                                PropertyAnimation {
                                    id: stick2AnimOpen
                                    target: stick2Open
                                    property: "rotation"
                                    duration: 150
                                    to: if(stick2Slider.width == 0) return 45; else return 180
                                }
                            }
                        }

                        LeftMenuIcons {
                            id: algae
                            x: 8
                            y: 284
                            width: 184
                            height: 55
                            visible: if(growthopt.width == 200) return true; else return false
                            text: qsTr("Algae")
                            photoSource: "imgs/svg_icons/algae.svg"
                            onClicked: {
                                displayBridge.displayAlgae(2);
                            }
                            Openbtn {
                                id: openAlgae
                                x: 161
                                y: 21
                                width: 14
                                height: 14
                                onClicked: {
                                    algaeAnim.running = true
                                    algaeAnimOpen.running = true
                                }
                                PropertyAnimation {
                                    id: algaeAnimOpen
                                    target: openAlgae
                                    property: "rotation"
                                    duration: 150
                                    to: if(algaeSlider.width == 0) return 45; else return 180
                                }
                            }
                        }
                    }

                    Rectangle {
                        id: complexopt
                        x: 200
                        y: 110
                        width: 0
                        height: 137
                        color: "#1e3d59"
                        z: 10

                        PropertyAnimation {
                            id: complexanim
                            target: complexopt
                            property: "width"
                            to: if(complexopt.width == 0) return 200; else return 0
                            duration: 1200
                            easing.type: Easing.InOutQuint
                        }

                        LeftMenuIcons {
                            id: mandelbrot
                            x: 0
                            y: 8
                            width: 178
                            height: 55
                            visible: if(complexopt.width == 200) return true; else return false
                            text: qsTr("Mandelbrot")
                            photoSource: "imgs/svg_icons/mand.svg"
                            onClicked: {
                                displayBridge.displayMand(100);
                            }

                            Openbtn {
                                id: openMandel
                                x: 161
                                y: 21
                                width: 14
                                height: 14
                                onClicked: {
                                    mandAnim.running = true
                                    mandOpen.running = true

                                }

                                PropertyAnimation {
                                    id: mandOpen
                                    target: openMandel
                                    property: "rotation"
                                    duration: 150
                                    to: if(mandSlider.width == 0) return 45; else return 180
                                }
                            }
                        }

                        LeftMenuIcons {
                            id: julia
                            x: 0
                            y: 74
                            width: 178
                            height: 55
                            visible: if(complexopt.width == 200) return true; else return false
                            text: qsTr("Julia Set")
                            photoSource: "imgs/svg_icons/julia.svg"
                            z: 0
                            onClicked: {
                                displayBridge.displayJulia(1000);
                            }

                            Openbtn {
                                id: openJulia
                                x: 161
                                y: 21
                                width: 14
                                height: 14
                                onClicked: {
                                    juliaAnim.running = true
                                    juliaOpen.running = true

                                }
                                PropertyAnimation {
                                    id: juliaOpen
                                    target: openJulia
                                    property: "rotation"
                                    duration: 150
                                    to: if(juliaSlider.width == 0) return 45; else return 180
                                }
                            }
                        }
                    }


/*
                    StackView {
                        id: stackView
                        anchors.fill: parent
                        z: 0
                        initialItem: Qt.resolvedUrl("./qml/strany/lSystemPage.qml")
                    }*/
                }

                Rectangle {
                    id: rectangle
                    color: "#f5f0e1"
                    anchors.left: lMenu.right
                    anchors.right: parent.right
                    anchors.top: mainContent.bottom
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    ToolBar {
                        id: toolBar
                        x: -1003
                        y: -40
                        width: 1003
                        height: 40
                        z: 12


                        RowLayout {
                            x: 358
                            y: 0
                            width: 126
                            height: 40
                            z: 12
                            DownButtons {

                                text: qsTr("home")
                                photoSource: "imgs/svg_icons/home.svg"
                                onClicked: {
                                    displayBridge.home();
                                }
                            }

                            DownButtons {

                                text: qsTr("back")
                                photoSource: "imgs/svg_icons/back.svg"
                                onClicked: {
                                    displayBridge.back();
                                }
                            }

                            DownButtons {
                                visible: true
                                text: qsTr("forward")
                                photoSource: "imgs/svg_icons/forward.svg"
                                onClicked: {
                                    displayBridge.forward();
                                }
                            }

                            /*ToolSeparator{}*/

                            DownButtons {
                                id: pan
                                text: qsTr("pan")
                                photoSource: "imgs/svg_icons/move.svg"
                                checkable: true
                                onClicked: {
                                    if (zoom.checked) {
                                        zoom.checked = false;
                                    }
                                    displayBridge.pan();
                                }
                            }

                            DownButtons {
                                id: zoom
                                text: qsTr("zoom")
                                photoSource: "imgs/svg_icons/zoom_to_rect.svg"
                                checkable: true
                                onClicked: {
                                    if (pan.checked) {
                                        // toggle pan off
                                        pan.checked = false;
                                    }
                                    displayBridge.zoom();
                                }
                            }
                            ToolSeparator {}
                            TextInput {
                                id: location
                                readOnly: true
                                text: displayBridge.coordinates
                                z: 14
                            }
                        }
                    }

                }


            }
        }
    }















