import QtQuick 2.0
import Sailfish.Silica 1.0
import QtSensors 5.0


Page {
    id: page
    allowedOrientations: Orientation.All

    function answer() {
        var answers = ["It is certain.", "It is decidedly so.", "Without a doubt.", "Yes — definitely.", "You may rely on it.",
                "As I see it, yes.", "Most likely.", "Outlook good.", "Signs point to yes.", "Yes.",
                "Reply hazy, try again.", "Ask again later.", "Better not tell you now.", "Cannot predict now.", "Concentrate and ask again.",
                "Don’t count on it.", "My reply is no.", "My sources say no.", "Outlook not so good.", "Very doubtful."];

        //return Math.ceil(Math.random() *2);
        //return Math.ceil(shakeSensor.random * 1000) % 2;
        return answers [Math.ceil(shakeSensor.random * 1000) % 20]; //TODO Is it right? I mean probability is correct?!
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
                EnterKey.onClicked: answer();
            }

            Label {
                id: convertButton
                text: qsTr("Shake for answer!")
                anchors.horizontalCenter: parent.horizontalCenter

                /*onClicked: {
                    if (answer() === 1) {
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
            // console.log("answer", shakeSensor.count, shakeSensor.random);
            if (shakeSensor.count >= 2) {
                /*
                if (answer() === 1) {
                    output.text = "Yes!";
                } else {
                    output.text = "No!";
                }
                */
                output.text = answer();
            }
            shakeSensor.count = 0;
        }
    }

    /*
    IconButton {
        id: magicBall
        width: parent.width
        icon.source: "./magic-ball.png"
        //icon.source: "$PROJECT/icons/256x256/harbour-chance.png"
        //icon.source: "../icons/256x256/harbour-chance.png"
        //icon.source: "image://theme/icon-l-play"
        onClicked: output.text = answer();
    }
    */
}
