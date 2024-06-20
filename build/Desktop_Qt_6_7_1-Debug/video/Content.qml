import QtQuick
import QtQuick.Dialogs
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia
//窗口的内容组件
Item{
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
