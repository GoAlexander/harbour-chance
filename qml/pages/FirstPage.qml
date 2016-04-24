import QtQuick 2.0
import Sailfish.Silica 1.0
import QtSensors 5.0


Page {
    id: page
    allowedOrientations: Orientation.All

    function makeDecision() {
        //return Math.ceil(Math.random() *2);
        return Math.ceil(shakeSensor.random * 1000) % 2;
    }

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("About")
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Chance.")
            }

            Text {
                id: output
                width: parent.width
                horizontalAlignment: Text.Center
                color: Theme.secondaryColor
                font.bold: true
                wrapMode: Text.Wrap
                EnterKey.onClicked: makeDecision();
            }

            Label {
                id: convertButton
                text: qsTr("Shake for answer!")
                anchors.horizontalCenter: parent.horizontalCenter

                /*onClicked: {
                    if (makeDecision() === 1) {
                        output.text = "Yes!";
                    } else {
                        output.text = "No!";
                    }
                }*/
            }
        }
    }

    ShakeSensor {
        id: shakeSensor

        property real random: 0
        property real count: 0

        active: true

        onShaked: {
            // console.log("-- -- -- x:" + reading.x + ";\t y: " + reading.y + ";\t z: "+ reading.z);
            if (count == 0) {
                output.text = "";
            }

            count += 1;
            random += Math.abs(reading.x) + Math.abs(reading.y) + Math.abs(reading.y);
            if (random > 1000) {
                random -= 1000;
            }
            shakeTimeout.restart();
        }
    }
    Timer {
        id: shakeTimeout
        interval: 1200
        repeat: false
        onTriggered: {
            // console.log("makeDecision", shakeSensor.count, shakeSensor.random);
            if (shakeSensor.count >= 2) {
                if (makeDecision() === 1) {
                    output.text = "Yes!";
                } else {
                    output.text = "No!";
                }
            }
            shakeSensor.count = 0;
        }
    }
}
