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
function forward(){
    content.mediaPlayer.position(content.mediaPlayer.currentTime+10)
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

player.on('click',function() {
  // 调用截屏方法
  player.takeSnapshot(function(dataUrl) {
    // 在这里处理截屏图像，例如显示在屏幕上或保存到文件
    console.log(dataUrl);
  });
});
