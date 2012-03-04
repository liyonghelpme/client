class Expandover extends ContextObject{
    function Expandover(){
        contextname = "dialog-expand";
        contextNode = null;
    }

    function paintNode(){
        contextNode = sprite("dialogback_expand.png",ARGB_8888).anchor(50,50).pos(400,300);
        contextNode.addsprite("girl1.png").anchor(50,100).pos(0,310).size(191,409);
        //contextNode.addsprite("expandfont.jpg").anchor(0,50).pos(100,100);
        contextNode.addlabel(global.getStaticString("expandOver"),null,28,FONT_BOLD,308,0,ALIGN_LEFT).anchor(0,50).pos(100,100).color(0,0,0,100);
        contextNode.addsprite("boxbutton1.png").anchor(50,50).pos(150,234).setevent(EVENT_UNTOUCH,closedialog,1);
        contextNode.addlabel(global.getStaticString("share"),null,BUTTONFONTSIZE).anchor(50,50).pos(150,234);
        contextNode.addsprite("boxbutton2.png").anchor(50,50).pos(300,234).setevent(EVENT_UNTOUCH,closedialog,null);
        contextNode.addlabel(global.getStaticString("back"),null,BUTTONFONTSIZE).anchor(50,50).pos(300,234);
    }
    
    function closedialog(n,e,p){
        global.popContext(null);
        if(p!=null){
            global.http.addrequest(0,"share",["uid"],[global.userid],global.context[0],"share");
            ppy_postnewsfeed(global.getFormatString("expandPost", ["[NAME]", ppy_username()]), NewsURL);
        }
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}
