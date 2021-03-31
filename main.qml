import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12

import "./qml/control"

import Backend 1.0

ApplicationWindow {
    /*hlavní objekt ve kterém je celá aplikace rozložena*/
    id: main
    width: 1100
    height: 1000
    visible: true
    color: "#00000000"
    property alias anim: anim
    title: qsTr("FraktalEditor")

    flags: Qt.Window | Qt.FramelessWindowHint

    Rectangle {
        /*pozadí aplikace*/
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
                /*umožňuje pohyb s aplikací*/
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
                    /*tlačítko pro otevření hlavního menu*/
                    anchors.left: parent.left
                    anchors.right: title.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0

                    onClicked: anim.running = true

                }

                Rectangle {
                    /*horní lišta aplikace*/
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
                        /*obrázek aplikace v horní liště*/
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
                        /*nadpis aplikace*/
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
                /*



                TLAČÍTKA PRO OVLÁDÁNÍ FRAKTÁLŮ


                */
                Row {
                    /*řada v které jsou tlačítka pro ovládání aplikace*/
                    id: row
                    x: 867
                    width: 91
                    height: 34
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 14
                    anchors.topMargin: 0

                    MinimizeBtn {
                        /*tlačítko pro minimalizaci*/
                        id: minimizedB
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        onClicked: main.showMinimized()

                    }

                    MaximizeBtn {
                        /*tlačítko pro maximalizaci*/
                        id: maximizedB
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        onClicked: main.showMaximized()
                    }

                    CloseBut {
                        /*tlačítko pro zavření aplikace*/
                        id: closeB
                        anchors.top: parent.top
                        anchors.topMargin: 5
                        onClicked: main.close()
                    }
                }
            }
            /*



            ZÁKLADNÍ L-SYSTÉM FRAKTÁLY



            */
            Rectangle {
                /*hlavní kontent aplikace
                leží zde konkrétní volby fraktálů*/
                id: cont
                color: "#00198bd5"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: barUp.bottom
                anchors.bottom: parent.bottom
                z: 10
                anchors.topMargin: 0

                Rectangle {
                    /*menu ve kterém se nachází možnosti základních l-systém fraktálů*/
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

                    z: if(lMenu.width == 70) return -2; else return 14
                    transformOrigin: Item.Center
                    layer.smooth: false
                    antialiasing: false

                    PropertyAnimation {
                        /*vysune menu se základníma l-systém fraktály*/
                        id: lsysanim
                        target: morelsysopt
                        property: "width"
                        to: if(morelsysopt.width == 0) return 200; else return 0
                        duration: 1200
                        easing.type: Easing.InOutQuint
                    }

                    LeftMenuIcons {
                        /*tlačítko generující kochovu vločku*/
                        id: koch
                        x: 8
                        y: 0
                        width: 184
                        height: 55
                        visible: if(morelsysopt.width == 200) return true; else return false
                        text: qsTr("Koch Snowflake")
                        onClicked: {
                            displayBridge.display_koch(4);
                        }

                        Openbtn {
                            /*vysune slider pro výběr počtu iterací kochovy vločky*/
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
                                /*promění + na x podle toho, jestli je slider otevřený nebo zavřený*/
                                id: kochAnimOpen
                                target: openKoch
                                property: "rotation"
                                to: if(kochSlider.width == 0) return 45; else return 180
                                duration: 150
                            }
                        }
                    }

                    LeftMenuIcons {
                        /*tlačítko generující hilbertovy křivky*/
                        id: hilbertCurve
                        x: 8
                        y: 56
                        width: 184
                        height: 55
                        visible: if(morelsysopt.width == 200) return true; else return false
                        text: qsTr("Hilbert Curve")
                        photoSource: "imgs/svg_icons/hilbertcurve.svg"
                        onClicked: {
                            displayBridge.display_hilbert(4)
                        }

                        Openbtn {
                            /*vysune slider pro výběr počtu iterací hilbertovy křivky*/
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
                                /*promění + na x podle toho, jestli je slider otevřený nebo zavřený*/
                                id: hilbertAnimOpen
                                target: openHilbert
                                property: "rotation"
                                to: if(hilbertSlider.width == 0) return 45; else return 180
                                duration: 150
                            }
                        }
                    }

                    LeftMenuIcons {
                        /*tlačítko generující levyCCurve*/
                        id: levyCCurve
                        x: 8
                        y: 117
                        width: 184
                        height: 55
                        visible: if(morelsysopt.width == 200) return true; else return false
                        text: qsTr("levyCCurve")
                        photoSource: "imgs/svg_icons/Levy_C_Curve.svg"
                        onClicked: {
                            displayBridge.display_levyC(4)
                        }

                        Openbtn {
                            /*vysune slider pro výběr počtu iterací levyCCurve*/
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
                                /*promění + na x podle toho, jestli je slider otevřený nebo zavřený*/
                                id: levyAnimOpen
                                target: openLevyCurve
                                property: "rotation"
                                duration: 150
                                to: if(levyCCurveSlider.width == 0) return 45; else return 180
                            }
                        }
                    }

                    LeftMenuIcons {
                        /*tlačítko generující segment 32 křivky*/
                        id: segment32Curve
                        x: 8
                        y: 178
                        width: 184
                        height: 55
                        visible: if(morelsysopt.width == 200) return true; else return false
                        text: qsTr("segment32Curve")
                        photoSource: "imgs/svg_icons/32segemnt.svg"
                        onClicked: {
                            displayBridge.display_segment32(2)
                        }

                        Openbtn {
                            /*vysune slider pro výběr počtu iterací segment 32 křivky*/
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
                                /*promění + na x podle toho, jestli je slider otevřený nebo zavřený*/
                                id: segment32Open
                                target: openSegment32
                                property: "rotation"
                                duration: 150
                                to: if(segment32Slider.width == 0) return 45; else return 180
                            }
                        }
                    }

                    LeftMenuIcons {
                        /*tlačítko generující dračí křivky*/
                        id: dragonCurve
                        x: 8
                        y: 239
                        width: 184
                        height: 55
                        visible: if(morelsysopt.width == 200) return true; else return false
                        text: qsTr("dragonCurve")
                        photoSource: "imgs/svg_icons/Dragon_Curve.svg"
                        onClicked: {
                            displayBridge.display_dragon(4)
                        }

                        Openbtn {
                            /*vysune slider pro výběr počtu iterací dračí křivky*/
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
                                /*promění + na x podle toho, jestli je slider otevřený nebo zavřený*/
                                id: dragonCurveOpen
                                target: openDragon
                                property: "rotation"
                                duration: 150
                                to: if(dragonCurveSlider.width == 0) return 45; else return 180
                            }
                        }
                    }

                    LeftMenuIcons {
                        /*tlačítko generující siepinskiho trojuhelník*/
                        id: siepinskiSieve
                        x: 8
                        y: 287
                        width: 184
                        height: 55
                        visible: if(morelsysopt.width == 200) return true; else return false
                        text: qsTr("siepinskiSieve")
                        photoSource: "imgs/svg_icons/Sierpinski_triangle.svg"
                        onClicked: {
                            displayBridge.display_siepinski(10)
                        }

                        Openbtn {
                            /*vysune slider pro výběr počtu iterací siepinskiho trojuhelníku*/
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
                                /*promění + na x podle toho, jestli je slider otevřený nebo zavřený*/
                                id: siepinskiOpen
                                target: openSiepinski
                                property: "rotation"
                                duration: 150
                                to: if(siepinskiSlider.width == 0) return 45; else return 180
                            }
                        }
                    }

                }
                /*



                LEVÉ MENU APLIKACE



                */
                Rectangle {
                    /*levé menu aplikace ve kterém se nachízejí základní volby fraktálů*/
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
                        /*vysune leevé menu ze zkrácené verze na větší*/
                        id: anim
                        target: lMenu
                        property: "width"
                        to: if(lMenu.width == 70) return 200; else return 70
                        duration: 500
                        easing.type: Easing.InOutQuint
                    }

                    Column {
                        /*sloupec držící volby fraktálů*/
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
                            /*otevře konkrétní možnosti generování l-systém fraktálů*/
                            id: lsys
                            text: "L-System"
                            clip: false
                            onClicked: {
                                lsysanim.running = true
                               }
                        }

                        LeftMenuIcons {
                            /*otevře konkrétní možnosti generování l-systém growth fraktálů*/
                            id: growth
                            visible: true
                            text: qsTr("Growth")
                            photoSource: "./imgs/svg_icons/growth.svg"
                            clip: false
                            onClicked: {
                                growthanim.running = true
                            }
                        }

                        LeftMenuIcons {
                            /*otevře konkrétní možnosti generování TEA fraktálů*/
                            id: complex
                            text: qsTr("Complex fractals")
                            photoSource: "imgs/svg_icons/julia.svg"
                            clip: false
                            onClicked: {
                                complexanim.running = true
                            }
                        }
                    }
                }
                /*



               HLAVNÍ OKNO APLIKACE



                */
                Rectangle {
                    /*halvní kontent obsahující canvas pro tovrbu fraktálů a slidery na modifikaci iterací*/
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
                            /*canvas pro generování fraktálů*/
                            anchors.fill: parent
                            id: mplView
                            objectName : "figure"
                            dpi_ratio: Screen.devicePixelRatio
                            width : 200
                        }
                        /*



                        SLIDERY VŠECH FRAKTÁLŮ



                        */
                        Slider {
                            /*slider na modifikaci počtu iterací kochovy vločky*/
                            id: kochSlider
                            x: 235
                            y: 8
                            width: if(morelsysopt.width == 0) return 0; else return 0
                            visible: if(kochSlider.width > 50) return true; else return false;
                            value: 0
                            stepSize: 1
                            to: 10
                            onValueChanged: {
                                displayBridge.display_koch(value)
                            }

                            PropertyAnimation {
                                /*animace vysunutí slideru*/
                                id: kochSliderAnim
                                target: kochSlider
                                property: "width"
                                to: if(kochSlider.width == 0) return 200; else return 0
                                duration: 1200
                                easing.type: Easing.InOutQuint
                            }

                        }

                        Slider {
                            /*slider na modifikaci počtu iterací hilbertovy křivky*/
                            id: hilbertSlider
                            x: 235
                            y: 66
                            width: if(morelsysopt.width == 0) return 0; else return 0
                            visible: if(hilbertSlider.width > 50) return true; else return false;
                            value: 1
                            stepSize: 1
                            to: 6
                            onValueChanged: {
                                displayBridge.display_hilbert(value)
                            }

                            PropertyAnimation {
                                /*animace vysunutí slideru*/
                                id: hilbertSliderAnim
                                target: hilbertSlider
                                property: "width"
                                to: if(hilbertSlider.width == 0) return 200; else return 0
                                duration: 1200
                                easing.type: Easing.InOutQuint
                            }
                        }

                        Slider {
                            /*slider na modifikaci počtu iterací levyCCurve*/
                            id: levyCCurveSlider
                            x: 235
                            y: 124
                            width: if(morelsysopt.width == 0) return 0; else return 0
                            visible: if(levyCCurveSlider.width > 50) return true; else return false;
                            stepSize: 1
                            onValueChanged: {
                                displayBridge.display_levyC(value)
                            }


                            PropertyAnimation {
                                /*animace vysunutí slideru*/
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
                            /*slider na modifikaci počtu iterací segment 32 křivky*/
                            id: segment32Slider
                            x: 235
                            y: 192
                            width: if(morelsysopt.width == 0) return 0; else return 0
                            visible: if(segment32Slider.width > 50) return true; else return false;
                            stepSize: 1
                            onValueChanged: {
                                displayBridge.display_segment32(value)
                            }


                            PropertyAnimation {
                                /*animace vysunutí slideru*/
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
                            /*slider na modifikaci počtu iterací dračí křivky*/
                            id: dragonCurveSlider
                            x: 235
                            y: 249
                            width: if(morelsysopt.width == 0) return 0; else return 0
                            visible: if(dragonCurveSlider.width > 50) return true; else return false;
                            stepSize: 1
                            onValueChanged: {
                                displayBridge.display_dragon(value)
                            }


                            PropertyAnimation {
                                /*animace vysunutí slideru*/
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
                            /*slider na modifikaci počtu iterací siepinskiho trojuhelníku*/
                            id: siepinskiSlider
                            x: 235
                            y: 311
                            width: if(morelsysopt.width == 0) return 0; else return 0
                            visible: if(siepinskiSlider.width > 50) return true; else return false;
                            stepSize: 1
                            onValueChanged: {
                                displayBridge.display_siepinski(value)
                            }

                            PropertyAnimation {
                                /*animace vysunutí slideru*/
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
                            /*slider na modifikaci počtu iterací bush1 growth fraktálu*/
                            id: bush1Slider
                            x: 211
                            y: 66
                            value: 1
                            to: 6
                            stepSize: 1
                            width: if(growthopt.width == 0) return 0; else return 0
                            visible: if(bush1Slider.width > 50) return true; else return false;
                            onValueChanged: {
                                displayBridge.display_bush1(value)
                            }

                            PropertyAnimation {
                                /*animace vysunutí slideru*/
                                id: bush1Anim
                                target: bush1Slider
                                property: "width"
                                easing.type: Easing.InOutQuint
                                duration: 1200
                                to: if(bush1Slider.width == 0) return 200; else return 0
                            }
                        }

                        Slider {
                            /*slider na modifikaci počtu iterací stick growth fraktálu*/
                            id: stickSlider
                            x: 211
                            y: 129
                            value: 1
                            to: 6
                            stepSize: 1
                            width: if(growthopt.width == 0) return 0; else return 0
                            visible: if(stickSlider.width > 50) return true; else return false;
                            onValueChanged: {
                                displayBridge.display_stick(value)
                            }

                            PropertyAnimation {
                                /*animace vysunutí slideru*/
                                id: stickAnim
                                target: stickSlider
                                property: "width"
                                easing.type: Easing.InOutQuint
                                duration: 1200
                                to: if(stickSlider.width == 0) return 200; else return 0
                            }
                        }

                        Slider {
                            /*slider na modifikaci počtu iterací bush2 growth fraktálu*/
                            id: bush2Slider
                            x: 211
                            y: 182
                            value: 1
                            to: 6
                            stepSize: 1
                            width: if(growthopt.width == 0) return 0; else return 0
                            visible: if(bush2Slider.width > 50) return true; else return false;
                            onValueChanged: {
                                displayBridge.display_bush2(value)
                            }

                            PropertyAnimation {
                                /*animace vysunutí slideru*/
                                id: bush2Anim
                                target: bush2Slider
                                property: "width"
                                easing.type: Easing.InOutQuint
                                duration: 1200
                                to: if(bush2Slider.width == 0) return 200; else return 0
                            }
                        }

                        Slider {
                            /*slider na modifikaci počtu iterací bush3 growth fraktálu*/
                            id: bush3Slider
                            x: 211
                            y: 238
                            value: 1
                            to: 6
                            stepSize: 1
                            width: if(growthopt.width == 0) return 0; else return 0
                            visible: if(bush3Slider.width > 50) return true; else return false;
                            onValueChanged: {
                                displayBridge.display_bush3(value)
                            }
                            PropertyAnimation {
                                /*animace vysunutí slideru*/
                                id: bush3Anim
                                target: bush3Slider
                                property: "width"
                                easing.type: Easing.InOutQuint
                                duration: 1200
                                to: if(bush3Slider.width == 0) return 200; else return 0
                            }

                        }

                        Slider {
                            /*slider na modifikaci počtu iterací stick2 growth fraktálu*/
                            id: stick2Slider
                            x: 211
                            y: 295
                            value: 1
                            to: 10
                            stepSize: 1
                            width: if(growthopt.width == 0) return 0; else return 0
                            visible: if(stick2Slider.width > 50) return true; else return false;
                            onValueChanged: {
                                displayBridge.display_stick2(value)
                            }
                            PropertyAnimation {
                                /*animace vysunutí slideru*/
                                id: stick2Anim
                                target: stick2Slider
                                property: "width"
                                easing.type: Easing.InOutQuint
                                duration: 1200
                                to: if(stick2Slider.width == 0) return 200; else return 0
                            }
                        }

                        Slider {
                            /*slider na modifikaci počtu iterací algae growth fraktálu*/
                            id: algaeSlider
                            x: 211
                            y: 351
                            value: 1
                            to: 25
                            stepSize: 1
                            width: if(growthopt.width == 0) return 0; else return 0
                            visible: if(algaeSlider.width > 50) return true; else return false;
                            onValueChanged: {
                                displayBridge.display_algae(value)
                            }
                            PropertyAnimation {
                                /*animace vysunutí slideru*/
                                id: algaeAnim
                                target: algaeSlider
                                property: "width"
                                easing.type: Easing.InOutQuint
                                duration: 1200
                                to: if(algaeSlider.width == 0) return 200; else return 0
                            }
                        }

                        Slider {
                            /*slider na modifikaci počtu iterací mandelbrotovy množiny*/
                            id: mandSlider
                            x: 211
                            y: 124
                            value: 10
                            to: 1000
                            stepSize: 1
                            width: if(complexopt.width == 0) return 0; else return 0
                            visible: if(mandSlider.width > 50) return true; else return false;
                            onValueChanged: {
                                displayBridge.display_mand(value)
                            }
                            PropertyAnimation {
                                /*animace vysunutí slideru*/
                                id: mandAnim
                                target: mandSlider
                                property: "width"
                                easing.type: Easing.InOutQuint
                                duration: 1200
                                to: if(mandSlider.width == 0) return 200; else return 0
                            }
                        }

                        Slider {
                            /*slider na modifikaci počtu iterací juliovy množiny*/
                            id: juliaSlider
                            x: 211
                            y: 192
                            value: 100
                            to: 1000
                            stepSize: 100
                            width: if(complexopt.width == 0) return 0; else return 0
                            visible: if(juliaSlider.width > 50) return true; else return false;
                            onValueChanged: {
                                displayBridge.display_julia(value)
                            }
                            PropertyAnimation {
                                /*animace vysunutí slideru*/
                                id: juliaAnim
                                target: juliaSlider
                                property: "width"
                                easing.type: Easing.InOutQuint
                                duration: 1200
                                to: if(juliaSlider.width == 0) return 200; else return 0
                            }
                        }


                }
                     /*



                     GROWTH L-SYSTÉM FRAKTÁLY



                    */
                    Rectangle {
                        /*menu obsahující growth l-systém fraktály*/
                        id: growthopt
                        x: 200
                        y: 55
                        width: if(lMenu.width == 70) return 0; else return 0;
                        height: 347
                        color: "#1e3d59"
                        z: if(lMenu.width == 70) return -2; else return 14

                        PropertyAnimation {
                            /*rozšíří menu s growth l-systém fraktály*/
                            id: growthanim
                            target: growthopt
                            property: "width"
                            to: if(growthopt.width == 0) return 200; else return 0
                            duration: 1200
                            easing.type: Easing.InOutQuint
                        }

                        LeftMenuIcons {
                            /*tlačítko generující bush1 fraktál*/
                            id: bush1
                            x: 8
                            y: 0
                            width: 184
                            height: 55
                            visible: if(growthopt.width == 200) return true; else return false
                            text: qsTr("Bush 1")
                            photoSource: "imgs/svg_icons/bush1.svg"
                            onClicked: {
                                displayBridge.display_bush1(2);
                            }

                            Openbtn {
                                /*vysune slider*/
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
                                    /*promění + na x podle toho, jestli je slider otevřený nebo zavřený*/
                                    id: bush1AnimOpen
                                    target: bush1Open
                                    property: "rotation"
                                    to: if(bush1Slider.width == 0) return 45; else return 180
                                    duration: 150
                                }
                            }
                        }

                        LeftMenuIcons {
                            /*tlačítko generující stick fraktál*/
                            id: stick
                            x: 8
                            y: 61
                            width: 184
                            height: 55
                            visible: if(growthopt.width == 200) return true; else return false
                            text: qsTr("Stick")
                            photoSource: "imgs/svg_icons/stick.svg"
                            onClicked: {
                                displayBridge.display_stick(2);
                            }

                            Openbtn {
                                /*vysune slider*/
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
                                    /*promění + na x podle toho, jestli je slider otevřený nebo zavřený*/
                                    id: stickAnimOpen
                                    target: stickOpen
                                    property: "rotation"
                                    duration: 150
                                    to: if(stickSlider.width == 0) return 45; else return 180
                                }

                            }
                        }

                        LeftMenuIcons {
                            /*tlačítko generující bush2 fraktál*/
                            id: bush2
                            x: 8
                            y: 115
                            width: 184
                            height: 55
                            visible: if(growthopt.width == 200) return true; else return false
                            text: qsTr("Bush 2")
                            photoSource: "imgs/svg_icons/bush2.svg"
                            onClicked: {
                                displayBridge.display_bush2(2);
                            }

                            Openbtn {
                                /*vysune slider*/
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
                                    /*promění + na x podle toho, jestli je slider otevřený nebo zavřený*/
                                    id: bush2AnimOpen
                                    target: bush2Open
                                    property: "rotation"
                                    duration: 150
                                    to: if(bush2Slider.width == 0) return 45; else return 180
                                }

                            }
                        }

                        LeftMenuIcons {
                            /*tlačítko generující bush3 fraktál*/
                            id: bush3
                            x: 8
                            y: 170
                            width: 184
                            height: 55
                            visible: if(growthopt.width == 200) return true; else return false
                            text: qsTr("Bush 3")
                            photoSource: "imgs/svg_icons/bush3.svg"
                            onClicked: {
                                displayBridge.display_bush3(2);
                            }

                            Openbtn {
                                /*vysune slider*/
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
                                    /*promění + na x podle toho, jestli je slider otevřený nebo zavřený*/
                                    id: bush3AnimOpen
                                    target: bush3Open
                                    property: "rotation"
                                    duration: 150
                                    to: if(bush3Slider.width == 0) return 45; else return 180
                                }
                            }
                        }

                        LeftMenuIcons {
                            /*tlačítko generující stick2 fraktál*/
                            id: stick2
                            x: 8
                            y: 231
                            width: 184
                            height: 55
                            visible: if(growthopt.width == 200) return true; else return false
                            text: qsTr("Stick 2")
                            photoSource: "imgs/svg_icons/sticks2.svg"
                            onClicked: {
                                displayBridge.display_stick2(2);
                            }

                            Openbtn {
                                /*vysune slider*/
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
                                    /*promění + na x podle toho, jestli je slider otevřený nebo zavřený*/
                                    id: stick2AnimOpen
                                    target: stick2Open
                                    property: "rotation"
                                    duration: 150
                                    to: if(stick2Slider.width == 0) return 45; else return 180
                                }
                            }
                        }

                        LeftMenuIcons {
                            /*tlačítko generující algae fraktál*/
                            id: algae
                            x: 8
                            y: 284
                            width: 184
                            height: 55
                            visible: if(growthopt.width == 200) return true; else return false
                            text: qsTr("Algae")
                            photoSource: "imgs/svg_icons/algae.svg"
                            onClicked: {
                                displayBridge.display_algae(2);
                            }
                            Openbtn {
                                /*vysune slider*/
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
                                    /*promění + na x podle toho, jestli je slider otevřený nebo zavřený*/
                                    id: algaeAnimOpen
                                    target: openAlgae
                                    property: "rotation"
                                    duration: 150
                                    to: if(algaeSlider.width == 0) return 45; else return 180
                                }
                            }
                        }
                    }
                    /*



                    KOMPLEXNÍ FRAKTÁLY



                    */
                    Rectangle {
                        id: complexopt
                        x: 200
                        y: 110
                        width: if(lMenu.width == 70) return 0; else return 0;
                        height: 137
                        color: "#1e3d59"
                        z: if(lMenu.width == 70) return -2; else return 14

                        PropertyAnimation {
                            /*rozšíří menu s komplexními fraktály*/
                            id: complexanim
                            target: complexopt
                            property: "width"
                            to: if(complexopt.width == 0) return 200; else return 0
                            duration: 1200
                            easing.type: Easing.InOutQuint
                        }

                        LeftMenuIcons {
                            /*tlačítko generující mandelbrotovu množinu*/
                            id: mandelbrot
                            x: 0
                            y: 8
                            width: 178
                            height: 55
                            visible: if(complexopt.width == 200) return true; else return false
                            text: qsTr("Mandelbrot")
                            photoSource: "imgs/svg_icons/mand.svg"
                            onClicked: {
                                displayBridge.display_mand(100);
                            }

                            Openbtn {
                                /*vysune slider*/
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
                                    /*promění + na x podle toho, jestli je slider otevřený nebo zavřený*/
                                    id: mandOpen
                                    target: openMandel
                                    property: "rotation"
                                    duration: 150
                                    to: if(mandSlider.width == 0) return 45; else return 180
                                }
                            }
                        }

                        LeftMenuIcons {
                            /*tlačítko generující juliovu množinu*/
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
                                displayBridge.display_julia(1000);
                            }

                            Openbtn {
                                /*vysune slider*/
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
                                    /*promění + na x podle toho, jestli je slider otevřený nebo zavřený*/
                                    id: juliaOpen
                                    target: openJulia
                                    property: "rotation"
                                    duration: 150
                                    to: if(juliaSlider.width == 0) return 45; else return 180
                                }
                            }
                        }
                    }



                }
                /*



                TOOLBAR



                */
                Rectangle {
                    /*menu pro ToolBar v dolní části aplikace*/
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
                        anchors.right: parent.horizontalCenter
                        anchors.rightMargin: 0
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
                                /*vrátí úpravu zpět*/
                                text: qsTr("back")
                                photoSource: "imgs/svg_icons/back.svg"
                                onClicked: {
                                    displayBridge.back();
                                }
                            }

                            DownButtons {
                                /*vrátí předešlou úpravu grafu*/
                                visible: true
                                text: qsTr("forward")
                                photoSource: "imgs/svg_icons/forward.svg"
                                onClicked: {
                                    displayBridge.forward();
                                }
                            }

                            /*ToolSeparator{}*/

                            DownButtons {
                                /*tlačítko pro posunutí fraktálů*/
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
                                /*tlačítko pro zoom fraktálu*/
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
                                /*souřadnice kurzoru*/
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

















