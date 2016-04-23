/*
 * based on: Alex Gibson - https://github.com/alexgibson/shake.js
 */

import QtSensors 5.0

Accelerometer {
    id: shaker

    property real threshold: 5
    property real timeout: 500

    signal shaked(var timeDifference)

    //use date to prevent multiple shakes firing
    property var _lastTime
    //accelerometer values
    property var _lastX
    property var _lastY
    property var _lastZ

    dataRate: 8

    onActiveChanged: {
        if (active) {
            reset();
        }
    }

    function reset() {
        _lastTime = new Date();
        _lastX = null;
        _lastY = null;
        _lastZ = null;
    }

    onReadingChanged: {
        //console.log("-- -- x:" + reading.x + ";\t y: " + reading.y + ";\t z: "+ reading.z);

        if (_lastX === null) {
            _lastX = reading.x;
            _lastY = reading.y;
            _lastZ = reading.z;
            return
        }
        var deltaX = Math.abs(_lastX - reading.x);
        var deltaY = Math.abs(_lastY - reading.y);
        var deltaZ = Math.abs(_lastZ - reading.z);

        if (((deltaX > threshold) && (deltaY > threshold)) || ((deltaX > threshold) && (deltaZ > threshold)) || ((deltaY > threshold) && (deltaZ > threshold))) {
            //calculate time in milliseconds since last shake registered
            var currentTime = new Date();
            var timeDifference = currentTime.getTime() - _lastTime.getTime();
            if (timeDifference > timeout) {
                shaked(timeDifference)
                _lastTime = currentTime
            }
        }
        _lastX = reading.x;
        _lastY = reading.y;
        _lastZ = reading.z;
    }
}

