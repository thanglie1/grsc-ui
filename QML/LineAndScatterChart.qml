import QtQuick 2.0
import QtCharts 2.3

ChartView {
    property bool shouldShow: false;
    property var current: new Date(2019, 10, 16);
    property var sevenDaysAgo: new Date(2019, 10, 10);
    id: chartView;
    legend.visible: false;
    antialiasing: true;
    DateTimeAxis {
       id: axisX;
       gridVisible: false;
       lineVisible: false;
       visible: true;
       format: "dd/MM"
       tickCount:  7;
       max:  current;
       min:  sevenDaysAgo;
   }
    ValueAxis {
        id: axisY;
        tickCount:  2;
        visible: false;
        max: 1;
        min: 0;
    }
    LineSeries {
        id: lineSeries1;
        color: "orange";
        axisX : axisX;
        axisY : axisY;
    }
    ScatterSeries {
        id: scatterSeries1
        color: "orange";
        axisX: axisX;
        axisY: axisY;
    }
    ScatterSeries {
        id: scatterSeries2
        color: "green"
        axisX: axisX;
        axisY: axisY;
    }
    LineSeries {
        id: lineSeries2;
        color: "green"
        axisX : axisX;
        axisY : axisY;
    }

    Component.onCompleted: {
        var value;
        for (var i = 10; i < 17; i++) {
            value = Math.random();
            lineSeries2.append(toMsecsSinceEpoch(new Date(2019, 10, i)), value);
            scatterSeries2.append(toMsecsSinceEpoch(new Date(2019, 10, i)), value);
            value = Math.random();
            lineSeries1.append(toMsecsSinceEpoch(new Date(2019, 10, i)), value);
            scatterSeries1.append(toMsecsSinceEpoch(new Date(2019, 10, i)), value);
        }

        scatterSeries1.axisX.max = scatterSeries2.axisX.max = lineSeries2.axisX.max =  current;
        scatterSeries1.axisX.min = scatterSeries2.axisX.min = lineSeries2.axisX.min =  sevenDaysAgo;
    }

    // DateTimeAxis is based on QDateTimes so we must convert our JavaScript dates to
    // milliseconds since epoch to make them match the DateTimeAxis values
    function toMsecsSinceEpoch(date) {
        var msecs = date.getTime();
        return msecs;
    }
}
