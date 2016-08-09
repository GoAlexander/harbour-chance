import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
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

    function buttonAnswer() {
        number =  Math.ceil(Math.random() * 20);
        return getAnswer(number);
    }

    Label {
        id: label
        anchors.centerIn: parent
        horizontalAlignment: Text.Center
        width: parent.width
        wrapMode: Text.WordWrap
        font.bold: true
        color: Theme.highlightColor
        text: qsTr("Chance.")
    }

    CoverActionList {
        id: coverAction

        CoverAction {   //source: https://sailfishos.org/develop/docs/jolla-ambient/
            iconSource: "image://theme/icon-cover-refresh"

            onTriggered: {
                label.text = buttonAnswer();
            }
        }
    }
}
