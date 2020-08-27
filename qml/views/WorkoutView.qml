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
            Layout.preferredWidth: root.width*0.8

            GridView
            {
                width: grid.width
                height: grid.height
                anchors.left: parent.left
                cellWidth: 150 //grid.width*0.5
                cellHeight: 250 //grid.width*0.6
                flow: Qt.LeftToRight

                model: 6
                delegate: Component {

                    Rectangle
                    {
                        anchors.centerIn: parent
                        width: 140
                        height: 245

                        Rectangle
                        {
                            color: "yellow"
                            anchors.fill: parent
                            anchors.margins: 5

                            Image
                            {
                                anchors.centerIn: parent
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

            Layout.preferredHeight: 40
            Layout.preferredWidth: 100
            Layout.bottomMargin: 30
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
