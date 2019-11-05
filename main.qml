import QtQuick 2.12
import QtQuick.Controls 2.5
import "data/variables.js" as VARIABLES
ApplicationWindow {
    id: mainWindow
    visible: true;
    width: 1100;
    height: 720;
    //flags: Qt.FramelessWindowHint;
    flags: Qt.MSWindowsFixedSizeDialogHint;
    Loader {
        id: loader
        anchors.fill: parent;
        source: "qml/Dashboard.qml";
    }
}
