class Noticedialog extends ContextObject{
    function Noticedialog(){
        contextname = "dialog-notice";
        contextNode = null;
    }
    var updatenum;
    var showlabel;
    var buttonlabel;
        //"特给予50凯撒币补偿您之前获得过的一键免费操作。感谢支持！"
    const newupdate = [
        "情人节快乐，新上线了4个情人节装饰，快去看看吧！"
    ]; 
    function paintNode(){
        updatenum=-1;
        contextNode = sprite("dialogback_expand.png",ARGB_8888).anchor(50,50).pos(400,300);
        contextNode.addsprite("girl1.png").anchor(50,100).pos(0,310).size(191,409);
        showlabel=contextNode.addlabel("",null,25,FONT_BOLD,308,0,ALIGN_LEFT).anchor(0,50).pos(100,110).color(0,0,0,100);
        contextNode.addsprite("boxbutton1.png").anchor(50,50).pos(225,234).setevent(EVENT_UNTOUCH,nextupdate);
        buttonlabel=contextNode.addlabel("",null,BUTTONFONTSIZE).anchor(50,50).pos(225,234);
        nextupdate();
    }
    
    function nextupdate(){
        updatenum++;
        var l = len(newupdate);
        if(updatenum == l){
            global.popContext(null);
            return 0;
        }
        else{
            if(updatenum == l-1){
                buttonlabel.text("确定");
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
