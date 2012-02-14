class Noticedialog extends ContextObject{
    function Noticedialog(){
        contextname = "dialog-notice";
        contextNode = null;
    }
    var updatenum;
    var showlabel;
    var buttonlabel;
    const newupdate = [
        //"元宵节快乐！新上线了阁楼（民居），快去看看吧！"
        "Happy every day!"
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
            showlabel.text(newupdate[updatenum]);
        }
    }
    
    function deleteContext(){
        contextNode.removefromparent();
    }
}
