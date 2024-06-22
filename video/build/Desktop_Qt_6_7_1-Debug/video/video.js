function save(){

    content.dialogs.fileSave.open()  //打开一个文件存储的对话框

    content.dialogs.fileSave.rejected.  //查询对话框是否选择接收或拒绝
    connect(()=>{ return })

    content.dialogs.fileSave.accepted.
    connect(()=>{
                //fileSaveAcceptedHandler
                let filepath = content.dialogs.fileSave.selectedFile
                console.log(filepath.toString())

                if(filepath.toString() !== "")
                if(!content.textContent.saveFile(filepath))
                content.dialogs.failToSave.open()
                return;} )
}
