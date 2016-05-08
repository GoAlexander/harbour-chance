import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {


    function makeDecision() {
        return Math.ceil(Math.random() *2);
    } 

    function buttonAnswer() {
        var answers = ["It is certain.", "It is decidedly so.", "Without a doubt.", "Yes — definitely.", "You may rely on it.",
                "As I see it, yes.", "Most likely.", "Outlook good.", "Signs point to yes.", "Yes.",
                "Reply hazy, try again.", "Ask again later.", "Better not tell you now.", "Cannot predict now.", "Concentrate and ask again.",
                "Don’t count on it.", "My reply is no.", "My sources say no.", "Outlook not so good.", "Very doubtful."];

        return answers [Math.ceil(Math.random() * 20)];
    }


    Label {
        id: label
        anchors.centerIn: parent
        font.bold: true
        text: qsTr("Chance.")
        EnterKey.onClicked: answer();
        //EnterKey.onClicked: buttonAnswer();
    }

    CoverActionList {
        id: coverAction

        CoverAction {   //source: https://sailfishos.org/develop/docs/jolla-ambient/
            iconSource: "image://theme/icon-cover-refresh"

            onTriggered: {

                if (makeDecision() === 1) {
                    label.text = "Yes!";
                } else {
                    label.text = "No!";
                }

                //label.text = buttonAnswer(); // some answers are out of cover!
            }
        }
    }
}


