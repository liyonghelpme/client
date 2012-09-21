class Noticedialog extends ContextObject{
    function Noticedialog(){
        contextname = "dialog-notice";
        contextNode = null;
    }
    var updatenum;
    var showlabel;
    var buttonlabel;
    const newupdate = [
        "服务器更新啦！你需要在9月23号之前下载新客户端。在新客户端中我们即将上线新的功能哦，敬请期待！"
    ]; 
    function paintNode(){
        updatenum=-1;
        contextNode = sprite("dialogback_expand.png",ARGB_8888).anchor(50,50).pos(400,300);
        contextNode.addsprite("girl1.png").anchor(50,100).pos(0,310).size(191,409);
        showlabel=contextNode.addlabel("",null,25,FONT_BOLD,308,0,ALIGN_LEFT).anchor(0,50).pos(100,110).color(0,0,0,100);

        var but0 = contextNode.addsprite("boxbutton1.png").anchor(50,50).pos(155,234).setevent(EVENT_UNTOUCH,nextupdate);
        buttonlabel = but0.addlabel("现在下载",null,BUTTONFONTSIZE).anchor(50,50).pos(62, 19);

        but0 = contextNode.addsprite("boxbutton1.png").anchor(50,50).pos(295,234).setevent(EVENT_UNTOUCH, onCancel);
        but0.addlabel("取消",null,BUTTONFONTSIZE).anchor(50,50).pos(62, 19);
        nextupdate();
    }
    function onCancel()
    {
        global.popContext(null);
    }
    
    function nextupdate(){
        updatenum++;
        var l = len(newupdate);
        if(updatenum == l){//点击确定 下载对话框   
            openUrl("http://uhz000738.chinaw3.com/miracleEmpire.apk");
            global.popContext(null);
            return 0;
        }
        else{
            if(updatenum == l-1){
                buttonlabel.text("现在下载");
            }
            else{
                buttonlabel.text("下一条");
            }
            showlabel.text(newupdate[updatenum]);
        }
    }
    
    function deleteContext(){
        contextNode.removefromparent();
    }
}
