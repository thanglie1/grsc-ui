import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import "../data/variables.js" as Vars

Rectangle{
    id: headerBar;
    property string currentState;
    width: 200;
    height: parent.height;
    color: Vars.COLOR_BACKGROUND;
    Image {
        id: icon
        source: Vars.IMG_APP_ICON;
        fillMode: Image.PreserveAspectCrop
        width: parent.width;
        height: 100;
        anchors.top: parent.top;
    }
//    Button {
//        id: btnSetting
//        width: 30;
//        height: 30;
//        anchors.right: parent.right
//        anchors.rightMargin: 40;
//        Image {
//            id: imgSetting;
//            anchors.fill: parent
//            source: Vars.IMG_APP_ICON;
//            fillMode: Image.PreserveAspectCrop;
//        }
//        anchors.verticalCenter: parent.verticalCenter;
//        Material.foreground: Material.Blue;
//    }
//    Button {
//        id: btnFreeUser
//        width: 100;
//        height: 30;
//        anchors.right: btnSetting.left;
//        anchors.rightMargin: 30;
//        text: Vars.STR_FREE_USER;
//        anchors.verticalCenter: parent.verticalCenter;
//        Material.foreground: Material.Blue;
//    }
    Column {
        id: menu
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: icon.bottom;
        anchors.topMargin: 40;
        spacing: 20
        Item {
            id: dashboard
            width: 120
            height: 50;
            Rectangle {
                id: recDashboard
                width: parent.width
                height: parent.height
                gradient: Gradient {
                    GradientStop { position: 0.9; color: Vars.COLOR_BACKGROUND }
                    GradientStop { position: 0.91; color: recDashboard.color }
                   }
                Text {
                    id: txtDashboard;
                    text: Vars.STR_DASHBOARD;
                    font.pixelSize: 17;
                    anchors.centerIn: parent;
                }
            }
            state: currentState === Vars.STR_DASHBOARD ? "SELECTED" : "EXITED";
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: loader.source = Vars.PAGE_DASHBOARD;
                onEntered: if (dashboard.state != "SELECTED") dashboard.state = "ENTERED";
                onExited: if (dashboard.state != "SELECTED") dashboard.state = "EXITED";
            }
            states: [
                State {
                    name: "ENTERED"
                    PropertyChanges { target: recDashboard; color: "grey"}
                    PropertyChanges { target: txtDashboard; color: "grey"}
                },
                State {
                    name: "SELECTED"
                    PropertyChanges { target: recDashboard; color: "blue"}
                    PropertyChanges { target: txtDashboard; color: "blue"}
                },
                State {
                    name: "EXITED"
                    PropertyChanges { target: recDashboard; color: Vars.COLOR_BACKGROUND}
                }
            ]
            transitions: [
                Transition {
                    from: "ENTERED"
                    to: "SELECTED"
                    ColorAnimation { target: recDashboard; duration: 1}
                },
                Transition {
                    from: "ENTERED"
                    to: "EXITED"
                    ColorAnimation { target: recDashboard; duration: 200}
                },
                Transition {
                    from: "EXITED"
                    to: "ENTERED"
                    ColorAnimation { target: recDashboard; duration: 300}
                }
            ]
        }
        Item {
            id: applications
            width: 120
            height: 50;
            Rectangle {
                id: recApplications
                width: parent.width
                height: parent.height;
                gradient: Gradient {
                    GradientStop { position: 0.9; color: Vars.COLOR_BACKGROUND }
                    GradientStop { position: 0.91; color: recApplications.color }
                   }
                Text {
                    id: txtApplications
                    text: Vars.STR_APPLICATIONS
                    font.pixelSize: 17;
                    anchors.centerIn: parent;
                }
            }
            state: currentState === Vars.STR_APPLICATIONS ? "SELECTED" : "EXITED";
            MouseArea {
                anchors.fill: parent;
                hoverEnabled: true;
                onClicked: loader.source = Vars.PAGE_APPLICATIONS;
                onEntered: if (applications.state != "SELECTED") applications.state = "ENTERED";
                onExited: if (applications.state != "SELECTED") applications.state = "EXITED";
            }
            states: [
                State {
                    name: "SELECTED"
                    PropertyChanges { target: recApplications; color: "blue"}
                    PropertyChanges { target: txtApplications; color: "blue"}
                },
                State {
                    name: "ENTERED"
                    PropertyChanges { target: recApplications; color: "grey"}
                    PropertyChanges { target: txtApplications ; color: "grey"}
                },
                State {
                    name: "EXITED"
                    PropertyChanges { target: recApplications; color: Vars.COLOR_BACKGROUND}
                }
            ]
            transitions: [
                Transition {
                    from: "ENTERED"
                    to: "SELECTED"
                    ColorAnimation { target: recApplications; duration: 1}
                },
                Transition {
                    from: "ENTERED"
                    to: "EXITED"
                    ColorAnimation { target: recApplications; duration: 200}
                },

                Transition {
                    from: "EXITED"
                    to: "ENTERED"
                    ColorAnimation { target: recApplications; duration: 300}
                }
            ]
        }
        Item {
            id: missingPatches
            width: 120
            height: 50;
            Rectangle {
                id : recMissingPatches
                width: parent.width;
                height: parent.height;
                gradient: Gradient {
                    GradientStop { position: 0.9; color: Vars.COLOR_BACKGROUND }
                    GradientStop { position: 0.91; color: recMissingPatches.color }
                   }
                Text {
                    id: txtMissingPatches
                    text: Vars.STR_MISSING_PATCHES
                    font.pixelSize: 17;
                    anchors.centerIn: parent;
                }
            }
            state: currentState === Vars.STR_MISSING_PATCHES ? "SELECTED" : "EXITED";
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: loader.source = Vars.PAGE_MISSING_PATCHES;
                onEntered: if (missingPatches.state != "SELECTED") missingPatches.state = "ENTERED";
                onExited: if (missingPatches.state != "SELECTED") missingPatches.state = "EXITED";
            }
            states: [
                State {
                    name: "ENTERED"
                    PropertyChanges { target: recMissingPatches; color: "grey"}
                    PropertyChanges { target: txtMissingPatches; color: "grey"}
                },
                State {
                    name: "SELECTED"
                    PropertyChanges { target: recMissingPatches; color: "blue"}
                    PropertyChanges { target: txtMissingPatches; color: "blue"}
                },
                State {
                    name: "EXITED"
                    PropertyChanges { target: recMissingPatches; color: Vars.COLOR_BACKGROUND}
                }
            ]
            transitions:[
                Transition {
                    from: "ENTERED"
                    to: "EXITED"
                    ColorAnimation { target: recMissingPatches; duration: 100}
                },
                Transition {
                    from: "ENTERED"
                    to: "SELECTED"
                    ColorAnimation { target: recMissingPatches; duration: 1}
                },
                Transition {
                    from: "EXITED"
                    to: "ENTERED"
                    ColorAnimation { target: recMissingPatches; duration: 100}
                }
            ]
        }
        Item {
            id: settings
            width: 120
            height: 50;
            Rectangle {
                id : recSettings
                width: parent.width;
                height: parent.height;
                color: Vars.COLOR_BACKGROUND;
                gradient: Gradient {
                    GradientStop { position: 0.9; color: Vars.COLOR_BACKGROUND }
                    GradientStop { position: 0.91; color: recSettings.color }
                   }
                Text {
                    id: txtSetting
                    text: Vars.STR_SETTINGS
                    font.pixelSize: 17;
                    anchors.centerIn: parent;
                }
            }
            state: currentState === Vars.STR_SETTINGS ? "SELECTED" : "EXITED";
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onClicked: loader.source = Vars.PAGE_SETTINGS;
                onEntered: if (settings.state != "SELECTED") settings.state = "ENTERED";
                onExited: if (settings.state != "SELECTED") settings.state = "EXITED";
            }
            states: [
                State {
                    name: "ENTERED"
                    PropertyChanges { target: recSettings; color: "grey"}
                    PropertyChanges { target: txtSetting; color: "grey"}
                },
                State {
                    name: "SELECTED"
                    PropertyChanges { target: recSettings; color: "blue"}
                    PropertyChanges { target: txtSetting; color: "blue"}
                },
                State {
                    name: "EXITED"
                    PropertyChanges { target: recSettings; color: Vars.COLOR_BACKGROUND}
                }
            ]
            transitions:[
                Transition {
                    from: "ENTERED"
                    to: "EXITED"
                    ColorAnimation { target: recSettings; duration: 100}
                },
                Transition {
                    from: "ENTERED"
                    to: "SELECTED"
                    ColorAnimation { target: recSettings; duration: 1}
                },
                Transition {
                    from: "EXITED"
                    to: "ENTERED"
                    ColorAnimation { target: recSettings; duration: 100}
                }
            ]
        }
    }
}

