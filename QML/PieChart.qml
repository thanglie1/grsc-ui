import QtQuick 2.0
import QtCharts 2.3
import "../data/variables.js" as Vars

ChartView {
    id: pieView
    legend.visible: true;
    //legend.alignment: Qt.AlignRight;
    legend.alignment: Qt.AlignRight
    antialiasing: true;

    PieSeries {
        id: pieOuter
        size: 1;
        holeSize: 0.85;
        //PieSlice { id: slice; label: "File Processed"; value: 19511; color: "#99CA53"; }
        PieSlice {value: 5; color: "red"; label: Vars.STR_UNRESOLVED_CRITICAL_CVES; }
        PieSlice {value: 15; color: "orange"; label: Vars.STR_UNRESOLVED_CVES; }
        PieSlice {value: 80; color: "green"; label: Vars.STR_RESOLVED_CVES;}
    }

    Component.onCompleted: {
    // Set the common slice properties dynamically for convenience
        for (var i = 0 ; i<pieOuter.count ; i++ ){
            pieOuter.at(i).borderWidth = 4;
        }
    }
}
