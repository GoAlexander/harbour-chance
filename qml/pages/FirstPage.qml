
import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page

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
            Label {
                x: Theme.paddingLarge
                text: qsTr("КНОПКА, ТЕСТ")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }

            /*
            Image //неправильно, нужен "action"
            {
                anchors { horizontalCenter: parent.horizontalCenter }
                source: "image://theme/icon-l-new"
            }
            */
            //попробовать для теста взять
            //test

            IconButton //TODO сделать больше
            {
                anchors { horizontalCenter: parent.horizontalCenter }
                icon.source: "image://theme/icon-l-new"
                //visible: graph.dayOffset > 0
                onClicked:
                {
                    //--graph.dayOffset;
                    //graph.refresh();
                }

            }

        }
    }
}


