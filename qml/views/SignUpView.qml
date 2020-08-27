import QtQuick 2.0
import QtQuick.Layouts 1.3

import "../views"
import "../components"

Item {
    Layout.fillWidth:  true
    Layout.fillHeight: true

    ColumnLayout
    {
        width: parent.width*0.8
        height: parent.height
        anchors.centerIn: parent
        spacing: 10

        Image
        {
            Layout.fillWidth: true
            Layout.preferredHeight: width*(464/796)
            Layout.topMargin: 20

            source: "qrc:/assets/images/4195594-05.png"
            fillMode: Image.PreserveAspectFit
        }

        AppText
        {
            color: "#0b294d"
            size: 18
            text: qsTr("Account Details")

            Layout.alignment: Qt.AlignHCenter
        }

        Item
        {
            Layout.fillWidth: true
            Layout.preferredHeight: 40

            RowLayout
            {
                anchors.fill: parent
                spacing: 0

                Rectangle
                {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    color: "#003860"

                    AppText
                    {
                        anchors.centerIn: parent

                        color: "white"
                        size: 14
                        text: qsTr("SIGN UP")
                    }
                }

                Rectangle
                {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    color: "#ff8e00"

                    AppText
                    {
                        anchors.centerIn: parent

                        color: "white"
                        size: 14
                        text: qsTr("LOGIN")
                    }
                }
            }
        }

        FramelessTextInput
        {
            hintText: qsTr("Phone number")
        }

        FramelessTextInput
        {
            hintText: qsTr("Password")
            isPassword: true
        }

        FramelessTextInput
        {
            hintText: qsTr("Confirm password")
            isPassword: true
        }

        Rectangle
        {
            Layout.preferredHeight: 45
            Layout.preferredWidth: 150
            Layout.alignment: Qt.AlignHCenter

            color: "#002e4c"
            radius: height/2

            AppText
            {
                color: "white"
                size: 15
                text: qsTr("SIGN UP")

                anchors.centerIn: parent
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked: stackView.currentIndex = 2;
            }
        }

        AppText
        {
            color: "#002e4c"
            size: 12
            text: qsTr("Already have an account? Sign in")

            Layout.alignment: Qt.AlignHCenter
            Layout.bottomMargin: 80

            MouseArea
            {
                anchors.fill: parent
                onClicked: stackView.currentIndex = 0;
            }
        }
    }
}
