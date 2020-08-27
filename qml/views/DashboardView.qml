import QtQuick 2.0
import QtQuick.Layouts 1.3

import "../views"
import "../components"

Rectangle {
    id: root
    Layout.fillHeight: true
    Layout.fillWidth: true

    color: "#002e4d"

    property bool isCounterRunning: false
    property string startTime: ""
    property string timerTime: ""
    property var days: ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]

    function getDayOfWeek()
    {
        var dt = Qt.formatDate(new Date(), "dddd");
        var index = dt==="Monday"?0:dt==="Tuesday"? 1:dt==="Wednesday"? 2:dt==="Thursday"? 3:dt==="Friday"? 4:dt==="Saturday"? 5:6
        return parseInt(index)
    }

    function parseDateToString(df)
    {
        console.log(df)
        var min = df%3600000
        var sec = min%60000
        var usec = sec%1000
        var hr = Math.floor(df/3600000)<10? "0"+Math.floor(df/3600000).toString():Math.floor(df/3600000).toString()
        var _min = Math.floor(min/60000)<10? "0"+Math.floor(min/60000).toString():Math.floor(df/60000).toString()
        var _sec = Math.floor(sec/1000)<10? "0"+Math.floor(sec/1000).toString():Math.floor(df/1000).toString()

        return hr + ":" + _min + ":" + _sec + " " + usec.toString()
    }

    Timer
    {
        repeat: true
        running: isCounterRunning
        interval: 100

        onTriggered: {

            var df = (new Date()).getTime()-startTime

            timerTime = parseDateToString(df)
        }
    }

    onIsCounterRunningChanged: {
        if(isCounterRunning)
        {
            startTime = (new Date()).getTime()
            console.log(startTime)
        }
    }

    ColumnLayout
    {
        anchors.fill: parent
        spacing: 10

        Rectangle
        {
            Layout.preferredWidth: root.width*0.4
            height: width
            radius: height/2
            border.width: 5
            border.color: "white"
            //clip: true

            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 10

            Image
            {

                anchors.centerIn: parent
                //source: "qrc:/assets/images/Profile Picture.jpg"
                fillMode: Image.PreserveAspectCrop
            }
        }

        AppText
        {
            text: qsTr("Hey there,It's Workout Time!!!")
            size: 18
            color: "white"
            font.italic: true
            //font.bold: true

            Layout.alignment: Qt.AlignHCenter
        }

        Item
        {
            Layout.preferredWidth: root.width*0.5
            Layout.preferredHeight: width
            Layout.alignment: Qt.AlignHCenter

            RoundProgressBar
            {
                width: parent.width; height: width

                val: 55
                anchors.centerIn: parent

                AppText
                {
                    id: txt
                    anchors.centerIn: parent

                    size: 80
                    color: "white"
                    text: parent.val.toString()
                }

                AppText
                {
                    anchors.top: txt.bottom
                    anchors.topMargin: -20
                    anchors.horizontalCenter: parent.horizontalCenter

                    size: 25
                    color: "white"
                    text: qsTr("bpm")
                }
            }
        }

        Item
        {
            Layout.fillWidth: true
            Layout.preferredHeight: 35

            AppText
            {
                text: qsTr("Set Weekly Workout Day & Time")
                size: 18
                color: "white"
                font.italic: true
                font.bold: true

                anchors.centerIn: parent
            }

            Rectangle
            {
                color: "#ff9000"
                height: 3
                width: 120

                anchors.bottom: parent.bottom
                anchors.bottomMargin: 1
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        ListView
        {
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: 50
            Layout.minimumWidth: 300
            orientation: Qt.Horizontal

            model: 7
            spacing: 3
            delegate: Component{
                id: _delegate

                DailyWidgetDelegate
                {
                    label: days[model.index]
                    isToday: getDayOfWeek()===index
                }
            }
        }

        Item
        {
            Layout.fillWidth: true
            Layout.preferredHeight: 35
            RowLayout
            {
                anchors.centerIn: parent
                spacing: 10

                AppText
                {
                    text: qsTr("4:30 PM")
                    size: 15
                    color: "white"

                    Layout.alignment: Qt.AlignHCenter|Qt.AlignVCenter
                }

                Rectangle
                {
                    color: "transparent"
                    border.color: "white"
                    border.width: 1
                    height: 30
                    width: 200
                    radius: height/2

                    RowLayout
                    {
                        anchors.centerIn: parent
                        spacing: 5

                        AppIcon
                        {
                            color: "#ff9000"
                            size: 15
                            icon: isCounterRunning? "\uf04d":"\uf04b"

                            Layout.alignment: Qt.AlignVCenter|Qt.AlignHCenter
                        }

                        AppText
                        {
                            text: isCounterRunning? qsTr("Stop Worktime"):qsTr("Start Worktime")
                            size: 18
                            color: "#ff9000"

                            Layout.alignment: Qt.AlignVCenter|Qt.AlignHCenter
                        }
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked: isCounterRunning = !isCounterRunning;
                    }
                }
            }
        }

        AppText
        {
            visible: isCounterRunning
            text: timerTime
            size: 18
            color: "white"

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
            Layout.bottomMargin: 40
            Layout.alignment: Qt.AlignHCenter

            AppText
            {
                text: qsTr("GUIDE")
                size: 18
                color: "white"

                anchors.centerIn: parent
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked: stackView.currentIndex=3;
            }
        }
    }
}
