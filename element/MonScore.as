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
        contextNode.addlabel(
        "300 Dragon Stones Giveaway! Build the Best Miracle Empire! Go to your friends' land and give their empires scores. The scores you give them will help determine the winner, but don't forget, to win you also have to tell us why your empire is great in the #Miracle Empire# circle! The empire with the highest score will win 100 dragon stones, and the next 20 best empires will win 10 dragon stones each!", 
        null, 20, FONT_NORMAL, 374, 0, ALIGN_LEFT).pos(200, 84).color(0, 0, 0, 100);

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
