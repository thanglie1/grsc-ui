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
        //Chart Trend of Critical Vulnerabilities in last 7 days
        Text {
            id: txtTrend;
            anchors.top: recFindBar.bottom;
            anchors.topMargin: 10;
            anchors.left: parent.left;
            anchors.leftMargin: 9;
            text: Vars.STR_TREND_OF_CRITICAL_VUL;
            font.pixelSize:16;
        }

        LineAndScatterChart {
            id: chartView;
            width: parent.width* 0.5;
            height: (parent.height - recFindBar.height) /2 - 30;
            anchors.top: txtTrend.bottom;
            anchors.left:parent.left;
        }
        Rectangle {
            id:recCVEsInfo
            height: chartView.height;
            anchors.bottom: chartView.bottom;
            anchors.bottomMargin: 9;
            anchors.left: chartView.right;
            anchors.leftMargin: 10;
            anchors.right: parent.right;
            anchors.rightMargin: 30;
            anchors.top: chartView.top;
            anchors.topMargin: 9;
            PieChart {
                id: pieView;
                width: parent.width;
                height: parent.height* 0.7;
                anchors.bottom: parent.bottom;
                anchors.left: parent.left;
            }
            Text {
                id: txtNumCVEsInTotal;
                anchors.left: parent.left;
                anchors.leftMargin: 20;
                anchors.top: parent.top;
                anchors.topMargin: 10;
                text: dashboard.totalCVEs;
                font.pixelSize: 50;
                color: "orange";
            }
            Text {
                text: Vars.STR_CVES_IN_TOTAL;
                anchors.top: txtNumCVEsInTotal.bottom;
                anchors.topMargin: 5;
                anchors.left: txtNumCVEsInTotal.left;
                anchors.leftMargin: 5;
                font.pixelSize: 15;
            }
            Button {
                text: Vars.STR_SCAN;
                anchors.right: parent.right;
                anchors.rightMargin: 40;
                anchors.top: parent.top;
                anchors.topMargin: 30;
                onClicked: dashboard.onClickScan();
            }
        }


        //Applications
        Text {
            id: txtApps;
            anchors.top: chartView.bottom;
            anchors.left: recApps.left;
            text: Vars.STR_APPLICATIONS;
            font.pixelSize:16;
        }

        Rectangle {
            id: recApps;
            width: parent.width*0.3;
            anchors.top: txtApps.bottom;
            anchors.topMargin: 10;
            anchors.bottom: parent.bottom;
            anchors.bottomMargin: 30;
            anchors.left: parent.left;
            anchors.leftMargin: 10;
            Item{
                id: itemScore
                width: txtVulApps.width + txtTotalVulApps.width;
                height: txtVulApps.height;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.top: parent.top;
                anchors.topMargin: 10;
                Text {
                    id: txtVulApps;
                    text: dashboard.vulApps;
                    font.pixelSize: 45;
                    color: "red";
                }
                Text {
                    id: txtTotalVulApps;
                    text: " / " + dashboard.totalVulApps;
                    anchors.left: txtVulApps.right;
                    anchors.verticalCenter: txtVulApps.verticalCenter;
                    font.pixelSize: 30;
                }
            }
            Text {
                id: txtVul;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.top: itemScore.bottom;
                text: Vars.STR_VULNERABLE;
                font.pixelSize: 16;
            }
            Text {
                id: txtCheck;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.top: txtVul.bottom;
                anchors.topMargin: 5;
                text: Vars.STR_CHECK;
                font.pixelSize: 20;
                color: "blue";
            }
            Text {
                id: txtOutdatedApps;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.bottom: btnUpdateAll.top;
                anchors.bottomMargin: 15;
                font.pixelSize: 16;
                text: Vars.STR_OUTDATED_APPS;
            }
            Button {
                id: btnUpdateAll;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.bottom: parent.bottom;
                anchors.bottomMargin: 20;
                text: Vars.STR_UPDATE_ALL;
                font.pixelSize: 16;
                onClicked: dashboard.onClickUpdateAll();
            }
        }

        // To do list
        Text {
            id: txtToDoList;
            anchors.left: recToDoList.left;
            anchors.top: recCVEsInfo.bottom;
            anchors.topMargin: 9;
            text: Vars.STR_TO_DO_LIST;
            font.pixelSize: 16;
        }

        Item {
            id: recToDoList;
            anchors.top: txtToDoList.bottom;
            anchors.topMargin: 10;
            anchors.bottom: recApps.bottom;
            anchors.right: recCVEsInfo.right;
            anchors.left: recApps.right;
            anchors.leftMargin: 30;
            Rectangle {
                id: recDeviceIsAtRisk
                width: parent.width;
                height: 60;
                border.width: 1;
                border.color: "lightgrey";
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
                    model: dashboard.toDoList;
                    delegate: toDoListItem;
                    clip: true;
                    //snapMode: ListView.SnapOneItem;
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
                                width: parent.width * 0.4;
                                height: parent.height;
                                Text {
                                    text: numCVEs;
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
                                    text: foundIn;
                                    anchors.left: parent.left;
                                    anchors.verticalCenter: parent.verticalCenter;
                                    anchors.leftMargin: 10;
                                    width: parent.width;
                                    elide : Text.ElideRight;
                                }
                            }
                            Rectangle {
                                id: recPath;
                                width: parent.width * 0.4;
                                height: parent.height;
                                Text {
                                    text: solution;
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


    //Menu Bar
    HeaderBar {
        id: menu;
        width: 200;
        height: parent.height;
        currentState: Vars.STR_DASHBOARD;
        anchors.left: parent.left;
        anchors.verticalCenter: parent.verticalCenter;
    }
}
