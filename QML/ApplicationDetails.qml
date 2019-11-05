import QtQuick 2.0
import QtQuick.Controls 2.5
import "../data/variables.js" as Vars

Page {
    width: 1280;
    height: 720;
    // write code here
    HeaderBar {
        id: headerBar;
        currentState: Vars.STR_APPLICATIONS;
    }
}
