import QtQuick 2.0
import RadialBar 1.0
import QtQuick.Layouts 1.3

Item {
    property int val: 55

    RadialBar
    {
        anchors.centerIn: parent

        width: parent.width //-10
        startAngle: 270
        spanAngle: 360
        value: val
        minValue: 0
        maxValue: 100
        dialWidth: 4
        backgroundColor: "transparent"
        progressColor: "#ff9000"
        foregroundColor: "#c9cdd2"

        showText: false

        Rectangle
        {
            color: "#ff9000"
            width: 70
            height: 70
            radius: height/2

            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: -width*0.25
            anchors.bottomMargin: -height*0.25

            ColumnLayout
            {
                anchors.centerIn: parent

                AppText
                {
                    color: "#09324a"
                    size: 17
                    text: qsTr("HR")
                    font.bold: true

                    Layout.alignment: Qt.AlignHCenter
                }

                AppIcon
                {
                    color: "#09324a"
                    size: 25
                    icon: "\uf21e"

                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }
    }
}
