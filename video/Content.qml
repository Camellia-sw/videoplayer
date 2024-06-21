import QtQuick
import QtMultimedia
import QtQuick.Dialogs
import QtQuick.Controls

Item {
    property alias dialogs: dialogs
    property alias player:_player
    property alias videoItem:_videoItem

    property url audioSource

    // function capture(){
    //     var canvas=document.create('canvas');
    //     canvas.width=video.width;
    //     canvas.height=video.height

    //     var context=canvas.getContext('2d');
    //     context.drawImage(video,0,0,canvas.width,canvas.height);

    //     var image=new Image();
    //     image.src=canvas.toDateURL();
    //     return image;
    // }

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

