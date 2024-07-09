//设置ListView的数据模型，控制播放S

function setFilesModel(){
    //arguments[0] 是传递给 setFilesModel 函数的第一个
    //参数fileOpen.selectedFiles。Controler.setFilesModel(fileOpen.selectedFiles)
    filesModel.clear();
    for(var i = 0; i < arguments[0].length; i++){
        var data = {"filePath": arguments[0][i]};
        filesModel.append(data);
    }
    ListView.model = filesModel;
    ListView.currentIndex = 0;
    content.mediaPlayer.source = arguments[0][0]
    content.mediaPlayer.play()
}


function play() {
    content.mediaPlayer.play()
}


function pause() {
    content.mediaPlayer.pause()
}

function stop() {
    content.mediaPlayer.stop()
}

function half(){
    content.mediaPlayer.setPlaybackRate(0.5)
}
function two(){
    content.mediaPlayer.setPlaybackRate(2)
}

