import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtMultimedia
import QtCore

Item {
    property alias openfile:_openfile
    property alias about:_about


    FileDialog {
        id: _openfile
        title: "Select some Video files"
        currentFolder: StandardPaths.writableLocation(StandardPaths.VideoLocation)
        fileMode: FileDialog.OpenFiles
        nameFilters: [ "Video files (*.mkv *.mp4)" ]
    }


    Dialog {
        id: _about
        title: qsTr("About")

        Label {
            anchors.fill: parent
            text: qsTr("A QML Video Viewer\n")
            horizontalAlignment: Text.AlignHCenter
        }
    }

}





