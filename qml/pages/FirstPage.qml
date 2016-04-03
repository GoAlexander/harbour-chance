
import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page
    property int decison //delete??

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
            /*
            Label {
                id: decison
                x: Theme.paddingLarge
                text: qsTr("")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }*/
            Text {
                id: output
                width: parent.width
                color: Theme.secondaryColor
                font.bold: true
                wrapMode: Text.Wrap
                EnterKey.onClicked: makeDecision();
            }

            Button {
                id: convertButton
                text: qsTr("Make decision!")
                anchors.horizontalCenter: parent.horizontalCenter

                onClicked: {
                    //output.text = "Decision:  " + "test";
                    //makeDecision();
                    //output.text = "Decision:  " + Math.ceil(Math.random() *2); //javascript?! // maybe impleent c++?
                    //column.decision = Math.ceil(Math.random() *2);
                    if (Math.ceil(Math.random() *2) === 1) {
                        output.text = "Decision:  " + "yes";
                    } else {
                        output.text = "Decision:  " + "no";
                    }
                }
            }

        }
        //why don t work?

        function makeDecision() {
            //output.text = "Decision:  " + Math.ceil(Math.random() *5);

        }

    }
}
