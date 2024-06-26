//对话框
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


    MessageDialog {
        id: _about
        modality: Qt.WindowModal
        buttons:MessageDialog.Ok
        informativeText: qsTr("About")
        text:"This is a vedio"
    }

}
