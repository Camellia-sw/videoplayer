import QtQuick
import QtMultimedia
import QtQuick.Dialogs
import QtQuick.Controls

Item {
    property alias dialogs: dialogs
    property alias mediaPlayer:_mediaPlayer
    property alias videoItem:_videoItem
     property alias audio: _audio
    //property alias bgimg:_bgimg

    property url audioSource

    Dialogs{
        id:dialogs
        openfile.onAccepted:{
            audioSource=openfile.selectedFile
            console.log("Dialogs:"+audioSource)
            //content.bgimg.visible=false
        }
    }

    function openfileTriggered(){
        content.dialogs.openfile.open();
    }

    //视频播放器和输出
    Item{
        id:_videoItem
        anchors.fill: parent
        focus:true
        MediaPlayer{
            id:_mediaPlayer
            source:audioSource
            audioOutput: AudioOutput{//声音
                id:_audio
            }
            videoOutput: videoOutput
            autoPlay: true
        }
        VideoOutput{
            id:videoOutput
            anchors.fill:parent
            fillMode: VideoOutput.PreserveAspectFit
        }
    }

}

