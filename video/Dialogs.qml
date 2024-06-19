import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtMultimedia
Item {
    property alias fileOpen: _fileOpen
    property alias folderOpen:_folderOpen
    property alias about:_about


    FileDialog {
        id: _fileOpen
        title: "Select some Music files"
        currentFolder: StandardPaths.writableLocation(StandardPaths.MusicLocation)
        fileMode: FileDialog.OpenFiles
        nameFilters: [ "Video files (*.mp4)" ]
    }

    FolderDialog {
        id: _folderOpen
        currentFolder: StandardPaths.writableLocation(StandardPaths.MusicLocation)
        title: "Select an music folder"
    }

    Dialog {
        id: _about
        title: qsTr("About")

        Label {
            anchors.fill: parent
            text: qsTr("A QML Pictures Viewer\n")
            horizontalAlignment: Text.AlignHCenter
        }
    }

}





