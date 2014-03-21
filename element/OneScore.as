class OneScore extends ContextObject{
    var uname;
    function OneScore(u){
        uname = u;
        contextname = "dialog-one";
        contextNode = null;
    }

    function paintNode(){
        contextNode = sprite("dialogback_b.png").anchor(50,50).pos(400,240);
        //contextNode.addsprite("love_back.png").anchor(50,50).pos(704, 408).setevent(EVENT_TOUCH,closedialog);
        contextNode.addlabel("If the castle is beautiful, you can give "+uname+" scores. You can give 1 score to the same friend one day.", null, 20, FONT_NORMAL, 300, 0, ALIGN_LEFT).pos(52, 50).color(0, 0, 0, 100);
        contextNode.addsprite("boxbutton1.png").anchor(50, 50).pos(198, 222).setevent(EVENT_UNTOUCH, closedialog);
        contextNode.addlabel("OK", null, 20).anchor(50, 50).pos(198, 222);
    }

    function closedialog(node,event,p){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}
