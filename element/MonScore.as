/*
经营页面MonScore
显示活动说明

*/
class MonScore extends ContextObject{
    function MonScore(){
        contextname = "dialog-monscore";
        contextNode = null;
    }

    function paintNode(){
        contextNode = sprite("dialogback_normal.png").anchor(50,50).pos(400,240);
        contextNode.addlabel("Hey,Sire! There are monsters on the battlefront! From now until June 21st, you will earn a point for each monster you defeat. The player with the highest score will receive 100 Dragon Stones while the next 99 highest scores will get 10 Dragon Stones each.", null, 25, FONT_NORMAL, 374, 0, ALIGN_LEFT).pos(200, 84).color(0, 0, 0, 100);

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
