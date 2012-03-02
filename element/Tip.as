class Tip extends ContextObject{
    var showLabel;
    function Tip(){
        contextname = "dialog-tip";
        contextNode = null;
    }

    function paintNode(){
        contextNode = sprite("dialogback_expand.png", ARGB_8888).anchor(50,50).pos(400,300);
        contextNode.addsprite("girl1.png").anchor(50, 100).pos(0, 310).size(191, 409);

        contextNode.addsprite("boxbutton1.png").anchor(50,50).pos(225, 234).setevent(EVENT_UNTOUCH,closedialog);
        contextNode.addlabel(global.getStaticString("ok"), null, 30).anchor(50, 50).pos(225, 234);

        var level = global.user.getValue("level");
        var str = Tips.get(level, "");
        showLabel = contextNode.addlabel(str, null, 25, FONT_NORMAL, 309, 0, ALIGN_LEFT).anchor(0, 50).pos(100, 110).color(0, 0, 0, 100);
    }

    function closedialog(node,event,p){
        global.popContext(null);
        removeTip();
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}
