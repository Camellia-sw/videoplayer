import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Video Clip")

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem { action:actions.open }
            MenuItem { action:actions.exit }
        }

        Menu{
            title: qsTr("&Help")
            contentData:[ actions.contents,
                actions.about ]
        }
    }

    header: ToolBar {
        RowLayout{
            ToolButton{ action: actions.open }
            ToolButton{ action: actions.folder }
        }
    }

    Actions{
        id:actions
        open.onTriggered: content.dialogs.fileOpen.open()
        folder.onTriggered: content.dialogs.folderOpen.open()
    }
    Content{
        id:content
        anchors.fill: parent
        onFullScreen: {
            menuBar.visible = false;
            header.visible = false;
            appWindow.showFullScreen();
            isFullScreen = true;
            singleView();
        }
        onWindow: {
            menuBar.visible = true
            header.visible = true
            appWindow.showNormal()
            isFullScreen=false;
        }
    }

    ColumnLayout{
        anchors.fill: parent
        spacing: 0

        Frame{
            anchors.right: parent.right
            Layout.preferredWidth: 200
            Layout.fillHeight: true
            padding:0
        }
        Footer{
            id:footer
        }
    }
}

