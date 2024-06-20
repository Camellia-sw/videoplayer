import QtQuick
import Qt.labs.folderlistmodel
import QtQuick.Dialogs
import QtMultimedia

Item {
    property bool isFullScreen: false
    property alias dialogs: allDialogs

    signal fullScreen()
    signal window()

    Dialogs{
        id:allDialogs
        fileOpen.onAccepted:
            setFilesModel(fileOpen.selectedFiles)

        folderOpen.onAccepted:
            setFolderModel(folderOpen.selectedFolder);
    }
}
