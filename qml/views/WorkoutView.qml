import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4

import "../views"
import "../components"

Rectangle {
    id: root
    Layout.fillHeight: true
    Layout.fillWidth: true

    color: "#002e4d"

    property var days: ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]

    function getDayOfWeek()
    {
        var dt = Qt.formatDate(new Date(), "dddd");
        var index = dt==="Monday"?0:dt==="Tuesday"? 1:dt==="Wednesday"? 2:dt==="Thursday"? 3:dt==="Friday"? 4:dt==="Saturday"? 5:6
        return parseInt(index)
    }

    ColumnLayout
    {
        anchors.fill: parent
        spacing: 20

        AppText
        {
            text: qsTr("WORKOUT USER GUIDE")
            size: 18
            color: "white"
            font.italic: true
            font.bold: true

            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 20
            Layout.bottomMargin: 20
        }

        ScrollView
        {
            id: grid
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.leftMargin: 30
            Layout.rightMargin: 30
            clip: true

            ColumnLayout
            {
                anchors.fill: parent
                spacing: 2

                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: grid.width*0.6

                    RowLayout
                    {
                        anchors.fill: parent
                        spacing: 2

                        Rectangle
                        {
                            color: "white"
                            width: grid.width*0.48
                            height: grid.width*0.6

                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            Image {
                                source: "qrc:/assets/images/EazerFit-10.jpg"
                                width: parent.width*0.9
                                height: width

                                anchors.centerIn: parent
                            }

                            Rectangle
                            {
                                color: "#002e4d"
                                height: 25
                                width: txt.width + 20
                                radius: height/2

                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 5
                                anchors.horizontalCenter: parent.horizontalCenter

                                AppText
                                {
                                    id: txt
                                    anchors.centerIn: parent

                                    size: 12
                                    color: "white"
                                    text: qsTr("Back Shoulder")
                                }
                            }
                        }

                        Rectangle
                        {
                            color: "white"
                            width: grid.width*0.48
                            height: grid.width*0.6

                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            Image {
                                source: "qrc:/assets/images/EazerFit-10.jpg"
                                width: parent.width*0.9
                                height: width

                                anchors.centerIn: parent
                            }

                            Rectangle
                            {
                                color: "#002e4d"
                                height: 25
                                width: txt1.width + 20
                                radius: height/2

                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 5
                                anchors.horizontalCenter: parent.horizontalCenter

                                AppText
                                {
                                    id: txt1
                                    anchors.centerIn: parent

                                    size: 12
                                    color: "white"
                                    text: qsTr("Back")
                                }
                            }
                        }
                    }
                }

                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: grid.width*0.6

                    RowLayout
                    {
                        anchors.fill: parent
                        spacing: 2

                        Rectangle
                        {
                            color: "white"
                            width: grid.width*0.48
                            height: grid.width*0.6

                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            Image {
                                source: "qrc:/assets/images/EazerFit-11.jpg"
                                width: parent.width*0.9
                                height: width

                                anchors.centerIn: parent
                            }

                            Rectangle
                            {
                                color: "#002e4d"
                                height: 25
                                width: txt3.width + 20
                                radius: height/2

                                anchors.bottom: parent.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.bottomMargin: 5

                                AppText
                                {
                                    id: txt3
                                    anchors.centerIn: parent

                                    size: 12
                                    color: "white"
                                    text: qsTr("Back of Arm")
                                }
                            }
                        }

                        Rectangle
                        {
                            color: "white"
                            width: grid.width*0.48
                            height: grid.width*0.6

                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            Image {
                                source: "qrc:/assets/images/EazerFit-12.jpg"
                                width: parent.width*0.9
                                height: width

                                anchors.centerIn: parent
                            }

                            Rectangle
                            {
                                color: "#002e4d"
                                height: 25
                                width: txt4.width + 20
                                radius: height/2

                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 5
                                anchors.horizontalCenter: parent.horizontalCenter

                                AppText
                                {
                                    id: txt4
                                    anchors.centerIn: parent

                                    size: 12
                                    color: "white"
                                    text: qsTr("Shoulder")
                                }
                            }
                        }
                    }
                }

                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: grid.width*0.6

                    RowLayout
                    {
                        anchors.fill: parent
                        spacing: 2

                        Rectangle
                        {
                            color: "white"
                            width: grid.width*0.48
                            height: grid.width*0.6

                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            Image {
                                source: "qrc:/assets/images/EazerFit-14.jpg"
                                width: parent.width*0.9
                                height: width

                                anchors.centerIn: parent
                            }

                            Rectangle
                            {
                                color: "#002e4d"
                                height: 25
                                width: txt5.width + 20
                                radius: height/2

                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 5
                                anchors.horizontalCenter: parent.horizontalCenter


                                AppText
                                {
                                    id: txt5
                                    anchors.centerIn: parent

                                    size: 12
                                    color: "white"
                                    text: qsTr("Back of Arm")
                                }
                            }
                        }

                        Rectangle
                        {
                            color: "white"
                            width: grid.width*0.48
                            height: grid.width*0.6

                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            Image {
                                source: ""
                                width: parent.width*0.9
                                height: width

                                anchors.centerIn: parent
                            }

                            Rectangle
                            {
                                color: "#002e4d"
                                height: 25
                                width: txt6.width + 20
                                radius: height/2

                                anchors.bottom: parent.bottom
                                anchors.bottomMargin: 5
                                anchors.horizontalCenter: parent.horizontalCenter


                                AppText
                                {
                                    id: txt6
                                    anchors.centerIn: parent

                                    size: 12
                                    color: "white"
                                    text: qsTr("Abs")
                                }
                            }
                        }
                    }
                }

            }
        }


        AppText
        {
            text: qsTr("Hey there,It's Workout Time!!!")
            size: 15
            color: "white"
            font.italic: true
            //font.bold: true

            Layout.alignment: Qt.AlignHCenter
        }

        Rectangle
        {
            border.width: 2
            border.color: "#ff9000"
            color: root.color
            radius: height/2

            Layout.preferredHeight: 30
            Layout.preferredWidth: 100
            Layout.bottomMargin: 10
            Layout.alignment: Qt.AlignHCenter

            AppText
            {
                text: qsTr("HOME")
                size: 18
                color: "white"

                anchors.centerIn: parent
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked: stackView.currentIndex=2;
            }
        }
    }
}
