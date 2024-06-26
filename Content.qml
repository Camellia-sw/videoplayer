//播放视频文件
import QtQuick
import QtMultimedia
import QtQuick.Dialogs
import QtQuick.Controls
//包含播放器的相关控制元素
Item {
    // 定义一个别名 dialogs，指向名为 dialogs 的 Dialogs 对象
    property alias dialogs: dialogs
    // 定义一个别名 mediaPlayer，指向名为 _mediaPlayer 的 MediaPlayer 对象
    property alias mediaPlayer:_mediaPlayer
    // 定义一个别名 videoItem，指向名为 _videoItem 的 Item 对象
    property alias videoItem:_videoItem
    // 定义一个别名 audio，指向名为 _audio 的 AudioOutput 对象
    property alias audio: _audio
    //property alias bgimg:_bgimg
    // 定义一个 url 属性，用于存储音频源的路径
    property url audioSource
    // 定义一个 Dialogs 对象
    Dialogs{
        id:dialogs
        // 当 openfile 对话框被接受时，执行 onAccepted 函数
        openfile.onAccepted:{
            audioSource=openfile.selectedFile
            console.log("Dialogs:"+audioSource)
            //content.bgimg.visible=false
        }
    }
    // 定义一个函数 openfileTriggered，用于打开 openfile 对话框
    function openfileTriggered(){
        content.dialogs.openfile.open();
    }
    // 视频播放器和输出
    Item{
        id:_videoItem
        // 设置 Item 的锚点模式为填充整个父元素
        anchors.fill: parent
        // 设置 Item 可以获取焦点
        focus:true
        // 创建一个 MediaPlayer 对象
        MediaPlayer{
            id:_mediaPlayer
            // 设置音频源的路径为 audioSource 属性的值
            source:audioSource
            // 创建一个 AudioOutput 对象，并将其赋值给 _audio 属性
            audioOutput: AudioOutput{// 声音
                id:_audio
            }
            // 创建一个 VideoOutput 对象
            videoOutput: videoOutput
            // 设置媒体播放器自动播放
            autoPlay: true
        }
        VideoOutput{
            id:videoOutput
            // 设置 VideoOutput 的锚点模式为填充整个父元素
            anchors.fill:parent
            // 设置 VideoOutput 的填充模式为保持视频的原始宽高比
            fillMode: VideoOutput.PreserveAspectFit
        }
    }
}
