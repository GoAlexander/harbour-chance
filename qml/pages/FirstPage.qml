import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page
    allowedOrientations: Orientation.All

    function makeDecision() {
        return Math.ceil(Math.random() *2);
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

            Button {
                id: convertButton
                text: qsTr("Randomize!")
                anchors.horizontalCenter: parent.horizontalCenter

                onClicked: {
                    if (makeDecision() === 1) {
                        output.text = "Yes!";
                    } else {
                        output.text = "No!";
                    }
                }
            }
        }
    }
}
