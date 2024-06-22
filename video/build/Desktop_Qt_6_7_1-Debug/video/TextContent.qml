import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

TextArea{
    anchors.fill: parent
    property url filepath

    function isTitle(){
        return filepath.toString() !== "";
    }

    function updateFilepathAndSyncTitle(newFilepath:url){
        if(newFilepath.toString() === "")
            return;
        filepath = newFilepath

        let index = newFilepath.toString().lastIndexOf('/');
        if (index !== -1) {
            text.title = newFilepath.toString().substring(index + 1);
            console.log("title:", text.title)
        }
    }

    function saveFile(newFilepath : url): bool{
        if(newFilepath.toString() === ""){
            textDocument.save()
            if(textDocument.status === TextDocument.WriteError)
                return false;
            updateModified(false)
            return true
        } else {
            textDocument.saveAs(newFilepath)
            console.log("textDocument.status:", textDocument.status)
            if(textDocument.status === TextDocument.WriteError)
                return false;
            updateFilepathAndSyncTitle(newFilepath)
            updateModified(false)
            return true
        }
    }
}
