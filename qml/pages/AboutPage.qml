
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
            qsTr("Write about algorithm...") +
            "<br/>" + 
            qsTr("Write about LICENSE...") +
            "<br/>" + 
            qsTr("Flattr link :)") +
            "<br/><br/>" + qsTr("You can find the source code at the:") +
            "<br/> <a href=\"https://github.com/GoAlexander/harbour-chance\">" + 
            qsTr("GitHub Project Page") + "</a>";
            onLinkActivated:
            {
                Qt.openUrlExternally(link);
            }
        }
    }

    /*
    property var model: [
        { aboutItemText: qsTr("Программа, отвечающая рандомно yes/no <под лицензией GNU GPLv3>.") },
        { aboutItemText: qsTr("Написать про алгоритм.") },
        { aboutItemText: qsTr("Со всеми возникающими вопросами, пожеланиями и предложениями можно обращаться по следующим ссылкам:") },
        { aboutItemText: "<a href=\"https://github.com/osanwe/Kat\">" + qsTr("GitHub") + "</a>" },
        { aboutItemText: "<a href=\"https://flattr.com/submit/auto?user_id=osanwe&url=https://vk.com/kat_sailfishos&title=Kat\">" + qsTr("Поддержать разработчика") + "</a>" },
    ]

    SilicaListView {
        anchors.fill: parent
        model: aboutPage.model

        header: PageHeader {
            title: "About"
        }

        delegate: Item {
            anchors.horizontalCenter: parent.horizontalCenter
            height: aboutPageItem.height + Theme.paddingMedium
            width: parent.width - Theme.paddingLarge * 2

            property var item: model.modelData ? model.modelData : model

            Label {
                id: aboutPageItem
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: index > 1 ? Text.AlignHCenter : Text.AlignLeft
                textFormat: Text.StyledText
                linkColor: Theme.highlightColor
                wrapMode: TextEdit.Wrap
                onLinkActivated: Qt.openUrlExternally(link)
                text: item.aboutPageItemText
            }

        }

        VerticalScrollDecorator {}
    }
    */

}




