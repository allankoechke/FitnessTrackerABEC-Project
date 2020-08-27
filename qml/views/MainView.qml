import QtQuick 2.0
import QtQuick.Layouts 1.3

import "../views"
import "../components"
Item {
    anchors.fill: parent

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
}
