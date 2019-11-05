import QtQuick 2.0
import QtQuick.Controls 2.5
import "../data/variables.js" as Vars

Page {
    Rectangle {
        id: main;
        color: Vars.COLOR_BACKGROUND;
        anchors.left: menu.right;
        width: parent.width-menu.width;
        height: parent.height;
        Item {
            id: recFindBar
            height: 100;
            width: parent.width;
            anchors.left: parent.left;
            anchors.leftMargin: 9;
            anchors.top: parent.top;
            anchors.right: parent.right;
            TextField {
                id: txtFieldFind
                width: parent.width * 0.8;
                height: parent.height* 0.5;
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left: parent.left;
                font.pixelSize: 16;
                placeholderText: Vars.STR_TODAYS_TIP;
            }
            ComboBox {
                id: control;
                anchors.left: txtFieldFind.right;
                anchors.leftMargin: 20;
                anchors.right: parent.right;
                anchors.rightMargin: 30;
                flat: true;
                anchors.verticalCenter: txtFieldFind.verticalCenter;
                displayText: Vars.STR_NAME_USER;
                model: ListModel {
                    id: model
                    ListElement { text: "Banana" }
                    ListElement { text: "Apple" }
                    ListElement { text: "Coconut" }
                }
                delegate: ItemDelegate {
                       width: control.width
                       contentItem: Text {
                           text: modelData
                           font: control.font
                           elide: Text.ElideRight
                           verticalAlignment: Text.AlignVCenter
                       }
                       highlighted: control.highlightedIndex === index
                   }
               indicator: Canvas {
                   id: canvas
                   x: control.width - width - control.rightPadding;
                   y: control.topPadding + (control.availableHeight - height) / 2
                   width: 12
                   height: 8
                   contextType: "2d"
                   onPaint: {
                       context.moveTo(0, 0);
                       context.lineTo(width, 0);
                       context.lineTo(width / 2, height);
                       context.fill();
                   }
               }
            }
        }
        Item {
            id: recToDoList;
            anchors.left: parent.left;
            anchors.leftMargin: 20;
            anchors.right: parent.right;
            anchors.rightMargin: 20;
            anchors.top: recFindBar.bottom;
            anchors.bottom: parent.bottom;
            Rectangle {
                id: recDeviceIsAtRisk
                width: parent.width;
                height: 60;
                border.width: 1;
                border.color: "lightgrey";
                MouseArea {
                    anchors.fill: parent;
                    onClicked: applications.onClickAddItem();
                }
                Text {
                    id: numDeviceIsAtRisk
                    anchors.verticalCenter: parent.verticalCenter;
                    anchors.left: parent.left;
                    anchors.leftMargin: 10;
                    text: dashboard.deviceIsAtRisk;
                    color: "orange";
                    font.pixelSize: 25;
                }
                Text {
                    id: txtCVEsLeft
                    anchors.bottom: numDeviceIsAtRisk.bottom;
                    anchors.bottomMargin: 2;
                    anchors.left: numDeviceIsAtRisk.right;
                    text: " / " + dashboard.totalCVEs +" "+ Vars.STR_CVES_LEFT;
                    font.pixelSize: 15;
                }
                Text {
                    anchors.bottom: txtCVEsLeft.bottom;
                    anchors.right: parent.right;
                    anchors.rightMargin: 20;
                    text: Vars.STR_YOUR_DEVICE_IS_AT_RISK;
                    color: "orange";
                    font.pixelSize: 15;
                }
            }
            Item{
                anchors.top:  recDeviceIsAtRisk.bottom;
                anchors.bottom: parent.bottom;
                width: parent.width;
                ListView {
                    id: listToDoList;
                    anchors.fill: parent;
                    model: applications.CVEsInfoList
                    delegate: toDoListItem;
                    clip: true;
                }
                // 1 Item
                Component {
                    id: toDoListItem;
                    Rectangle {
                        id: fileDetails
                        width: parent.width
                        height: 55
                        border.color: "lightgrey";
                        border.width: 1;
                        Row {
                            width: parent.width - 2;
                            height: parent.height - 2;
                            anchors.centerIn: parent;
                            Rectangle {
                                id: recName
                                width: parent.width * 0.2;
                                height: parent.height;
                                Text {
                                    text: CVEId;
                                    anchors.left: parent.left;
                                    anchors.verticalCenter: parent.verticalCenter;
                                    anchors.leftMargin: 10;
                                    width: parent.width;
                                    elide : Text.ElideRight;
                                    color: "purple";
                                }
                            }
                            Rectangle {
                                id: recInfection;
                                width: parent.width * 0.2;
                                height: parent.height;
                                Text {
                                    text: lastUpdatedTime;
                                    anchors.left: parent.left;
                                    anchors.verticalCenter: parent.verticalCenter;
                                    anchors.leftMargin: 10;
                                    width: parent.width;
                                    elide : Text.ElideRight;
                                }
                            }
                            Rectangle {
                                id: recPath;
                                width: parent.width * 0.2;
                                height: parent.height;
                                Text {
                                    text: OPSWATScore;
                                    anchors.left: parent.left;
                                    anchors.verticalCenter: parent.verticalCenter;
                                    anchors.leftMargin: 10;
                                    width: parent.width;
                                    elide : Text.ElideRight;
                                    color: "blue";
                                }
                            }
                            Rectangle {
                                id: recCVSS3;
                                width: parent.width * 0.2;
                                height: parent.height;
                                Text {
                                    text: CVSS3Score;
                                    anchors.left: parent.left;
                                    anchors.verticalCenter: parent.verticalCenter;
                                    anchors.leftMargin: 10;
                                    width: parent.width;
                                    elide : Text.ElideRight;
                                    color: "blue";
                                }
                            }
                            Rectangle {
                                id: recCVSS2;
                                width: parent.width * 0.2;
                                height: parent.height;
                                Text {
                                    text: CVSS2Score;
                                    anchors.left: parent.left;
                                    anchors.verticalCenter: parent.verticalCenter;
                                    anchors.leftMargin: 10;
                                    width: parent.width;
                                    elide : Text.ElideRight;
                                    color: "blue";
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    HeaderBar {
        id: menu;
        width: 200;
        height: parent.height;
        currentState: Vars.STR_APPLICATIONS;
        anchors.left: parent.left;
        anchors.verticalCenter: parent.verticalCenter;
    }
}
