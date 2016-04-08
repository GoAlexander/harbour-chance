import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: aboutPage

    Column { //test
        id: column
        spacing: 5
        width: parent.width

        /*
        Label {
            anchors { horizontalCenter: parent.horizontalCenter }
            x: Theme.paddingLarge
            text: qsTr("ТЕСТ1\nТЕСТ")
            color: Theme.secondaryHighlightColor
            font.pixelSize: Theme.fontSizeExtraLarge
        }
        */

        //TODO удалить лишнее и сделать разметку по подобию firstPage
        PageHeader {
            title: qsTr("Chance.")
        }


        Text //test
        {
            id: titleLabel
            anchors { horizontalCenter: parent.horizontalCenter }
            width: parent.width
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
            font { family: Theme.fontFamily; pixelSize: Theme.fontSizeSmall }
            color: Theme.secondaryColor
            text: "<style>a:link { color: " + Theme.highlightColor + "; }</style><br/>" +
            qsTr("This program answers you yes/no if you can`t make a decision. ;)") + 
            "<br/>" + 
            qsTr("Write about LICENSE...") +
            "<br/>" + 
            qsTr("Flattr link :)") +
            "<br/><br/>" + qsTr("You can find the source code at the:") +
            "<br/> <a href=\"https://github.com/GoAlexander/harbour-chance\">" + 
            qsTr("GitHub") + "</a>";
            onLinkActivated:
            {
                //Qt.openUrlExternally(link); //is it right?
                Qt.openUrlExternally("https://github.com/GoAlexander/harbour-chance");
            }
        }
    }

}




