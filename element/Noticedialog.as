class Noticedialog extends ContextObject{
    function Noticedialog(){
        contextname = "dialog-notice";
        contextNode = null;
    }
    var updatenum;
    var showlabel;
    var buttonlabel;
    const newupdate = [
    "为前天木瓜服务器挂了，离线未增加魔法值bug，战争要塞bug道歉！特补偿给12月14日23点前登录过的用户10个凯撒币。感谢大家的支持！这周末会上线圣诞节活动，敬请期待！",
    "魔法值上线啦！加速，一键，神迹，保护功能都可以通过魔法值施展。魔法值每5分钟回复1点。有建议请在圈子内反馈，谢谢！"];
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
