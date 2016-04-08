import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {

    function makeDecision() {
        return Math.ceil(Math.random() *2);
    }

    Label {
        id: label
        anchors.centerIn: parent
        font.bold: true
        text: qsTr("Chance.")
        EnterKey.onClicked: makeDecision();
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
            }
        }
    }
}


