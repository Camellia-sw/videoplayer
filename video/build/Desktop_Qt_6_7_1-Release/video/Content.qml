import QtQuick
import QtMultimedia
import QtQuick.Dialogs
import QtQuick.Controls

Item {
    property alias dialogs: dialogs
    property alias mediaPlayer:_mediaPlayer
    property alias videoItem:_videoItem
    property alias audio: _audio
    property int curIndex: 0
    property url audioSource

    Dialogs{
        id:dialogs
        openfile.onAccepted:{
            audioSource=openfile.selectedFile
            playerlist.videoPath=audioSource
            mediaPlayer.play()
        }
    }

    Item{
        id:_videoItem
        anchors.fill: parent
        focus:true
        MediaPlayer{
            id:_mediaPlayer
            source:audioSource
            audioOutput: AudioOutput{
                id:_audio
            }
            videoOutput: videoOutput
        }
        VideoOutput{
            id:videoOutput
            anchors.fill:parent
            fillMode: VideoOutput.PreserveAspectFit
        }
    }


}

