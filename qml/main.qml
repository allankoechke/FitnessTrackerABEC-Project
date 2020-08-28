import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.LocalStorage 2.12

import "./views"

Window {
    id: mainApp

    visible: true
    width: 350
    height: 600
    title: qsTr("Ogeto's")

    property alias fontAwesomeFontLoader: fontAwesomeFontLoader
    property alias monsterratFontLoader: monsterratFontLoader

    property string today: ""
    property string selected: ""

    function getDb()
    {
        return LocalStorage.openDatabaseSync("QDeclarativeExampleDB", "1.0", "Ogeto's App!", 1000000);
    }

    function initializeDb()
    {
        var db = getDb();
        db.transaction(
                    function (tx) {
                        tx.executeSql('CREATE TABLE IF NOT EXISTS Record(date TEXT, hour INT, min INT)');
                    });
    }

    function checkIfDayExists(day)
    {
        var db = getDb();
        db.transaction(
                    function (tx) {
                        var rs = tx.executeSql('SELECT date FROM Record WHERE date=?', day);

                        if(rs.rows.length===0)
                        {
                            return false;
                        }

                        else
                        {
                            return true;
                        }
                    });
    }

    function getTimeSaved(day)
    {
        var db = getDb();
        db.transaction(
                    function (tx) {
                        var rs = tx.executeSql('SELECT hour, min FROM Record WHERE date=?', day);

                        if(rs.rows.length!==0)
                        {
                            var arr = []
                            arr[0] = rs.rows[0].hour;
                            arr[0] = rs.rows[0].min;

                            console.log(arr);

                            return arr;
                        }
                    });
    }

    function addWorkoutDay(day, hr, min)
    {
        var db = getDb();

        try
        {
            db.transaction(
                        function (tx) {
                            tx.executeSql('INSERT INTO Record(date, hour, min) VALUES(?,?,?)', [day, hr, min]);
                        });
            return true;

        } catch (err){
            console.log("Err: ", err);
            return false;
        }
    }

    Component.onCompleted: initializeDb();

    MainView
    {
        id: mainView
    }

    FontLoader
    {
        id: fontAwesomeFontLoader
        source: "qrc:/assets/fonts/fontawesome.otf"
    }

    FontLoader
    {
        id: monsterratFontLoader
        source: "qrc:/assets/fonts/Montserrat-Regular.ttf"
    }
}
