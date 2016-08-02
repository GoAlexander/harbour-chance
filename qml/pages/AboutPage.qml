import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: aboutPage

    Column {
        id: column
        spacing: 5
        width: parent.width

        PageHeader {
            title: qsTr("Chance.")
        }

        Text
        {
            id: titleLabel
            anchors { horizontalCenter: parent.horizontalCenter }
            width: parent.width
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
            font { family: Theme.fontFamily; pixelSize: Theme.fontSizeSmall }
            color: Theme.highlightColor
            text: "<style>a:link { color: " + Theme.highlightColor + "; }</style><br/>" +
                qsTr("This program evolved to 8-ball. So, \"Chance.\" answers you with classical magic ball expressions. ;)") +
                "<br/>" +
                qsTr("License: GPLv3") +
                "<br/><br/>" + qsTr("You can find the source code at the:") +
                "<br/> <a href=\"https://github.com/GoAlexander/harbour-chance\">" +
                qsTr("GitHub") + "</a>" +
                "<br/><br/>" + qsTr("Special thanks:") +
                "<br/>" + qsTr("-Quent-in for french translation") +
                "<br/>" + qsTr("-Stefano (aka palikao) for italian translation and cool emojis") +
                "<br/>" + qsTr("-amilcarsantos for code of shaking");

            onLinkActivated:
            {
                Qt.openUrlExternally("https://github.com/GoAlexander/harbour-chance");
            }

        }
    }

}
