class BuyShip extends ContextObject{
    var callback;
    var pop;
    var words;
    function BuyShip(c, p, s){
        contextname = "dialog-BuyShip";
        contextNode = null;
        callback = c;
        pop = p;
        words = s;
    }

    function paintNode(){
        contextNode = sprite("dialogback_b.png").anchor(50,50).pos(400,240);
        contextNode.addsprite("pic5.jpg").anchor(50,50).pos(80, 120);
        contextNode.addsprite("boxbutton1.png").anchor(50, 50).pos(108, 232).setevent(EVENT_UNTOUCH, clicked, 0);
        contextNode.addsprite("boxbutton4.png").anchor(50, 50).pos(288, 232).setevent(EVENT_UNTOUCH, clicked, 1);

        //contextNode.addlabel("BuyWithCoins", null, 25).pos(108, 232).anchor(50, 50).color(100, 100, 100, 100);
        contextNode.addsprite("money_big.png").anchor(50, 50).pos(64, 232);
        contextNode.addlabel(str(DOCK_COST[0]), null, 25).pos(80, 232).anchor(0, 50).color(100, 100, 100, 100);


        //contextNode.addlabel("BuyWithCaesar", null, 25).pos(288, 232).anchor(50, 50).color(100, 100, 100, 100);
        contextNode.addsprite("caesars_big.png").anchor(50, 50).pos(254, 232);
        contextNode.addlabel(str(DOCK_COST[1]), null, 25).pos(270, 232).anchor(0, 50).color(100, 100, 100, 100);

        contextNode.addlabel(words, null, 25, FONT_NORMAL, 200, 0, ALIGN_LEFT).anchor(50, 50).pos(268, 105).color(0, 0, 0, 100);
        contextNode.addsprite("close.png").anchor(50, 50).pos(372, 27).setevent(EVENT_TOUCH, closedialog);
    }
    function clicked(n, e, p, x, y, points)
    {
        var cost;
        if(p == 0)
        {
            global.popContext(null);
            cost = dict([["money", DOCK_COST[0]]]);
        }
        else{
            global.popContext(null);
            cost = dict([["caesars", DOCK_COST[1]]]);
        }
        var ret = global.user.testCost(cost);
        if(ret != 0)
        {
            callback(p);
        }
    }
    function closedialog(node,event,p){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}
