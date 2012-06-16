class MonScore extends ContextObject{
    function MonScore(){
        contextname = "dialog-monscore";
        contextNode = null;
    }

    function paintNode(){
        contextNode = sprite("dialogback_normal.png").anchor(50,50).pos(400,240);
        contextNode.addlabel(
        "大家好，杀怪比赛上线拉！从今天起到7月1号，每杀死一只怪兽就能获得1分，分数最高的将会获得100个仙龙石，第2到100名将会获得10个仙龙石！"
        , null, 25, FONT_NORMAL, 374, 0, ALIGN_LEFT).pos(200, 84).color(0, 0, 0, 100);

        contextNode.addsprite("boxbutton1.png").pos(275, 406).anchor(50, 50).setevent(EVENT_UNTOUCH, getRank);
        contextNode.addlabel("Ranking", null, 20).pos(275, 406).anchor(50, 50).color(100, 100, 100, 100);

        contextNode.addsprite("boxbutton2.png").pos(453, 406).anchor(50, 50).setevent(EVENT_UNTOUCH, closedialog);
        contextNode.addlabel("OK", null, 20).pos(453, 406).anchor(50, 50).color(100, 100, 100, 100);
    }
    function getRank()
    {
        global.popContext();
        global.pushContext(null, new Rank(), NonAutoPop);
    }
    function closedialog(node,event,p){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}
