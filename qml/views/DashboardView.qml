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
    property string timerTimeOne: ""
    property string timerTimeTwo: ""
    property string setTime: ""
    property  int hb: 0
    property var days: ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]

    function getDayOfWeek()
    {
        var dt = Qt.formatDate(new Date(), "dddd");
        var index = dt==="Monday"?0:dt==="Tuesday"? 1:dt==="Wednesday"? 2:dt==="Thursday"? 3:dt==="Friday"? 4:dt==="Saturday"? 5:6
        return parseInt(index)
    }

    Connections
    {
        target: QmlInterface

        function onEmitTimeChanged(hrs)
        {
            timerTimeOne = hrs;
        }

        function onEmitMsecChanged(m_msecs)
        {
            timerTimeTwo = m_msecs;
        }
    }


    Timer
    {
        repeat: true
        running: isCounterRunning
        interval: 10

        onTriggered: {

            var df = (new Date()).getTime()-startTime

            QmlInterface.getDateInHMSMs(df);  //.split("-"); //parseDateToString(df)
        }
    }

    onIsCounterRunningChanged: {
        if(isCounterRunning)
        {
            startTime = (new Date()).getTime()
            console.log(startTime)
        }
    }

    Component.onCompleted: {
        today = days[getDayOfWeek()]

        if(checkIfDayExists(today)){
            var arr = getTimeSaved(today)
            var a = arr[0]<10? "0"+arr[0].toString():arr[0].toString()
            var b = arr[1]<10? "0"+arr[1].toString():arr[1].toString()
            setTime = a + ":" + b;
        }
    }

    Timer
    {
        interval: 3000
        repeat: true
        running: true

        onTriggered: {
            var rand = Math.floor(Math.random()*10)
            var val = [74, 75, 76, 73, 70, 74, 75, 72, 70, 74]
            hb = val[rand]
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

                val: hb
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

                    onClicked: {
                        selected = days[model.index]
                        activityPopup.open();
                    }
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
                    text: setTime //qsTr("4:30 PM")
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

        Item
        {
            visible: isCounterRunning
            Layout.preferredHeight: 30
            Layout.minimumWidth: 150
            Layout.alignment: Qt.AlignHCenter

            RowLayout
            {
                anchors.fill: parent

                AppText
                {
                    text: timerTimeOne
                    size: 18
                    color: "white"

                    Layout.preferredWidth: 60
                    horizontalAlignment: AppText.AlignLeft
                }

                AppText
                {
                    text: timerTimeTwo
                    size: 18
                    color: "white"

                    Layout.preferredWidth: 20
                    horizontalAlignment: AppText.AlignLeft
                }
            }
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
