import QtQuick 2.0
import Sailfish.Silica 1.0
import QtSensors 5.0

Page {
    id: page
    allowedOrientations: Orientation.All

    property real number: 0

    function getAnswer(number) {
        var answers = [
                    qsTr("It is certain."),
                    qsTr("It is decidedly so."),
                    qsTr("Without a doubt."),
                    qsTr("Yes — definitely."),
                    qsTr("You may rely on it."),
                    qsTr("As I see it, yes."),
                    qsTr("Most likely."),
                    qsTr("Outlook good."),
                    qsTr("Signs point to yes."),
                    qsTr("Yes."),
                    qsTr("Reply hazy, try again."),
                    qsTr("Ask again later."),
                    qsTr("Better not tell you now."),
                    qsTr("Cannot predict now."),
                    qsTr("Concentrate and ask again."),
                    qsTr("Don’t count on it."),
                    qsTr("My reply is no."),
                    qsTr("My sources say no."),
                    qsTr("Outlook not so good."),
                    qsTr("Very doubtful.")];

        return answers[number];
    }

    function answer() {
        number = Math.ceil(shakeSensor.random * 1000) % 20;
        return getAnswer(number);
    }

    function buttonAnswer() {
        number =  Math.ceil(Math.random() * 20);
        return getAnswer(number);
    }

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    function randEmoji(number) {
        if (number >= 0 && number <= 9)
            return getRandomInt(0, 2);
        else
            if (number >= 10 && number <= 14)
                return getRandomInt(3, 5);
            else
                if (number >= 15 && number <= 19)
                    return getRandomInt(6, 7);
                else //quick fix (find a bug)
                    return 0;
    }

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        //It listens tap on the screen
        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("It works!");
                output.text = buttonAnswer();
            }
        }

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("About")
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

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
                color: Theme.highlightColor
                font.bold: true
                wrapMode: Text.Wrap
                font.pixelSize: Theme.fontSizeExtraLarge
            }

            Label {
                id: label
                color: Theme.highlightColor
                text: qsTr("Click or shake!")
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: Theme.fontSizeExtraSmall
            }

            Image {
                 id: emoji
                 source: "../emojis/emoji-" + randEmoji(number) + ".svg"
                 anchors.horizontalCenter: parent.horizontalCenter
                 width: parent.width
                 height: sourceSize.height * width / sourceSize.width
                 sourceSize: parent
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
        interval: 600 //1200
        repeat: false
        onTriggered: {
            // console.log("answer", shakeSensor.count, shakeSensor.random);
            if (shakeSensor.count >= 2) {
                output.text = answer();
            }
            shakeSensor.count = 0;
        }
    }

}
