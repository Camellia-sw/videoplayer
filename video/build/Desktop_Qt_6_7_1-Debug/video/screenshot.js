function save(){
    // let currentStates = content.currentState()
    // let modified = currentStates[0]
    // let titled = currentStates[1]
    // console.log(modified, titled)

    // if(titled && !modified){
    //     return //r1
    // }else if(titled && modified){
    //     if(!content.textContent.saveFile())
    //         content.dialogs.failToSave.open()
    //     return  //r2,r3
    // }

    // untitled
    content.dialogs.save.open()  //打开一个文件存储的对话框

    content.dialogs.save.rejected.  //查询对话框是否选择接收或拒绝
    connect(()=>{ return })//r4

    content.dialogs.save.accepted.
    connect(()=>{
                //fileSaveAcceptedHandler
                let filepath = content.dialogs.save.selectedFile
                console.log(filepath.toString())

                if(filepath.toString() !== "")
                if(!content.textContent.saveFile(filepath))
                //content.dialogs.failToSave.open()
                return;} )//r5,r6
}
