class Noticedialog extends ContextObject{
    var monNum;
    var dragonNum;
    function Noticedialog(m, d){
        monNum = m;
        dragonNum = d;
        newupdate[0] = global.getFormatString("getReward", ["[N0]", str(monNum), "[N1]", str(monNum/10)]); 
        contextname = "dialog-notice";
        contextNode = null;
    }
    var updatenum;
    var showlabel;
    var buttonlabel;
    var newupdate = [
        "" 
    ]; 
    function paintNode(){
        updatenum=-1;
        contextNode = sprite("dialogback_expand.png",ARGB_8888).anchor(50,50).pos(400,300);
        contextNode.addsprite("girl1.png").anchor(50,100).pos(0,310).size(191,409);
        showlabel = contextNode.addlabel("",null,20,FONT_BOLD,308,0,ALIGN_LEFT).anchor(0,50).pos(100,110).color(0,0,0,100);
        contextNode.addsprite("boxbutton1.png").anchor(50,50).pos(225,234).setevent(EVENT_UNTOUCH,nextupdate);
        buttonlabel=contextNode.addlabel("",null,BUTTONFONTSIZE).anchor(50,50).pos(225,234);
        nextupdate();
    }
    
    function nextupdate(){
        updatenum++;
        //var newupdate=newupdate1;
        var l = len(newupdate);
        if(updatenum == l){
            global.popContext(null);
            return 0;
        }
        else{
            if(updatenum == l-1){
                buttonlabel.text(global.getStaticString("ok"));
            }
            else{
                buttonlabel.text(global.getStaticString("next"));
            }
            //显示怪兽数量 奖励仙龙石数量
            //newupdate[updatenum] = newupdate[updatenum].replace("[N0]", str(monNum));
            //newupdate[updatenum] = newupdate[updatenum].replace("[N1]", str(monNum/10));
            trace(newupdate[updatenum]);
            showlabel.text(newupdate[updatenum]);
        }
    }
    
    function deleteContext(){
        contextNode.removefromparent();
    }
}
