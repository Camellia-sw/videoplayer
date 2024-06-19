import QtQuick
import Qt.labs.folderlistmodel
import QtQuick.Dialogs


Item {
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


