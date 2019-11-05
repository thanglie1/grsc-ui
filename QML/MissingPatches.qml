import QtQuick 2.0
import QtQuick.Controls 2.5
import "../data/variables.js" as Vars

Page {

    HeaderBar {
        id: menu;
        width: 200;
        height: parent.height;
        currentState: Vars.STR_MISSING_PATCHES;
        anchors.left: parent.left;
        anchors.verticalCenter: parent.verticalCenter;
    }
}
