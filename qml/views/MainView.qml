import QtQuick 2.0
import QtQuick.Layouts 1.3

import "../views"
import "../components"

Item {
    anchors.fill: parent

    property alias activityPopup: activityPopup

    StackLayout
    {
        id: stackView
        anchors.fill: parent
        currentIndex: 0

        SignInView
        {
            id: signInView
        }

        SignUpView
        {
            id: signUpView
        }

        DashboardView
        {
            id: dashboardView
        }

        WorkoutView
        {
            id: workoutView
        }
    }

    ActivityPopup
    {
        id: activityPopup

        x: (mainApp.width-width)/2
        y: (mainApp.height-height)/2
    }
}
