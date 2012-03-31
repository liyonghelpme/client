class WarReward extends ContextObject{
    var num;
    var kind;
    function WarReward(n, k){
        num = n;
        kind = k;
        contextname = "dialog-warreward";
        contextNode = null;
    }

    function paintNode(){
        contextNode = sprite("dialogback_b.png").anchor(50,50).pos(400,240);
        contextNode.addlabel(global.getFormatString("drumReward", ["[NUM]",str(num), "[MONEY]", str(num*kind)]), null, 25, FONT_NORMAL, 300, 0, ALIGN_LEFT).pos(58, 51).color(0, 0, 0, 100);
        contextNode.addsprite("boxbutton1.png").pos(103, 224).anchor(50, 50).setevent(EVENT_UNTOUCH, share);
        contextNode.addsprite("boxbutton2.png").pos(278, 224).anchor(50, 50).setevent(EVENT_UNTOUCH, close);
        contextNode.addlabel(global.getStaticString("share"), null, 25).pos(103, 224).anchor(50, 50);
        contextNode.addlabel(global.getStaticString("ok"), null, 25).pos(278, 224).anchor(50, 50);

    }
    function share()
    {
        global.popContext();
        ppy_postnewsfeed(global.getFormatString("drumFeed", ["[NAME]",ppy_username(), "[NUM]",str(num) , "[MONEY]", str(num*kind) ]), NewsURL, null);
    }
    function close()
    {
        global.popContext();
    }
    function closedialog(node,event,p){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}
