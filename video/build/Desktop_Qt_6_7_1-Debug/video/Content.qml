import QtQuick
import QtMultimedia
import QtQuick.Dialogs
import QtQuick.Controls

Item {
    property alias dialogs: dialogs
    property alias player:_player
    property alias videoItem:_videoItem

    property url audioSource

    property alias textContent: _textContent

    TextContent{
        id:_textContent
    }

    Dialogs{
        id:dialogs
        openfile.onAccepted:{
            audioSource=openfile.selectedFile
            console.log("Dialogs:"+audioSource)
            player.play()
        }
    }

    Item{
        id:_videoItem
        anchors.fill: parent
        focus:true
        MediaPlayer{
            id:_player
            source:audioSource
            audioOutput: AudioOutput{}
            videoOutput: videoOutput
        }
        VideoOutput{
            id:videoOutput
            anchors.fill:parent
            fillMode: VideoOutput.PreserveAspectFit
        }
    }


}

