class Trading extends ContextObject{
    var house;
    function Trading(h){
        contextname = "dialog-trading";
        contextNode = null;
        house = h;
    }

    var food = 0;
    var sell = 0;
    //A B NUMA NUMB time
    //0 coin 1 food 2 cae
    //sell buy numa numb time
    var foodTab;
    var coinTab;
    var sellTab;
    var buyTab;
    function paintNode(){
        contextNode = sprite("trade.png").anchor(0, 0).pos(365, 70);
        //149 319 200 167
        contextNode.addsprite("girl1.png").size(149, 319).pos(-175, 100).anchor(0, 0);
        //58 30
        contextNode.addsprite("shipTip.png").anchor(0, 0).pos(-307, -40);

        foodTab = contextNode.addsprite("foodTradeSel.png").anchor(50,50).pos(-24, 81).setevent(EVENT_UNTOUCH, showTab, 0);
        coinTab = contextNode.addsprite("coinTradeUn.png").anchor(50,50).pos(-24, 147).setevent(EVENT_UNTOUCH, showTab, 1);

        sellTab = contextNode.addsprite("sellOut.png").anchor(50, 50).pos(143, -23).setevent(EVENT_UNTOUCH, chooseSell, 0);
        buyTab = contextNode.addsprite("buyIn.png").anchor(50, 50).pos(244, -23).setevent(EVENT_UNTOUCH, chooseSell, 1);

        contextNode.addsprite("sel.png").anchor(50, 50).pos(186, 70).setevent(EVENT_UNTOUCH, doTrade, 0);
        contextNode.addsprite("sel.png").anchor(50, 50).pos(186, 150).setevent(EVENT_UNTOUCH, doTrade, 1);
        contextNode.addsprite("sel.png").anchor(50, 50).pos(186, 230).setevent(EVENT_UNTOUCH, doTrade, 2);

        contextNode.addsprite("close.png").anchor(50, 50).pos(347, 16).setevent(EVENT_UNTOUCH, closedialog);

        getCurTrades();
    }
    function doTrade(n, e, p, x, y, points)
    {
        var cost = dict();
        var kind = curTrades[p];
        var trading = TradeKinds[kind];
        trace("trading", trading);
        if(trading[0] == 0)//coin
            cost.update("money", trading[2]);
        else if(trading[0] == 1)
            cost.update("food", trading[2]);
        else if(trading[0] == 2)
            cost.update("caesars", trading[2]);

        var ret = global.user.testCost(cost);
        if(ret != 0)
        {
            global.popContext();
            global.http.addrequest(0, "shipc/trade", ["uid", "kind"], [global.userid, kind], house, "trade");
        }
    }
    function chooseSell(n, e, p, x, y, points)
    {
        sell = p;
        getCurTrades();
    }

    function showTab(n, e, p, x, y, points)
    {
        food = p;
        getCurTrades();
    }
    
    var headPos = [56, 56, 56, 138, 56, 220];
    var difGX = 241-56;
    var difGY = 60-56;
    var difTX = 74-56;
    var difTY = 79-56;

    var difNX = 10;
    var difNX2 = 10;

    var curTrades;
    function getCurTrades()
    {
        if(sell == 0)
        {
            food = 0;
            coinTab.visible(0);
        }
        else
        {
            coinTab.visible(1);
        }
        if(food == 0)
        {
            foodTab.texture("foodTradeSel.png");
            coinTab.texture("coinTradeUn.png");
        }
        else
        {
            foodTab.texture("foodTradeUn.png");
            coinTab.texture("coinTradeSel.png");
        }
        if(sell == 0)
        {
            sellTab.scale(120);
            buyTab.scale(100);
        }
        else
        {
            sellTab.scale(100);
            buyTab.scale(120);
        }
        var i = 0;
        curTrades = [];
        for(i = 0; i < len(TradeKinds); i++)
            if(TradeKinds[i][sell] == (1-food))
                curTrades.append(i);
        showTabs();
    }
    var curTabs = null; 
    function showTabs()
    {
        if(curTabs != null)
            curTabs.removefromparent();
        curTabs = contextNode.addnode();
        var selPng = ["money_big.png", "food.png", "caesars_big.png"]; 
        for(var i = 0; i < len(curTrades) && i < 3; i++)
        {
            var kind = curTrades[i];
            var selFood = TradeKinds[kind][0];
            var buyFood = TradeKinds[kind][1];
            var curX = headPos[i*2];
            var curY = headPos[i*2+1];

            curTabs.addsprite(selPng[selFood]).anchor(50, 50).pos(curX, curY).size(18, 18);
            curTabs.addlabel(str(TradeKinds[kind][2]), null, 16).anchor(0, 50).pos(curX+difNX, curY).color(0, 0, 0, 100);

            curTabs.addsprite(selPng[buyFood]).anchor(50, 50).pos(curX+difGX, curY+difGY).size(16, 16);
            curTabs.addlabel(str(TradeKinds[kind][3]), null, 20).anchor(0, 50).pos(curX+difGX+difNX2, curY+difGY).color(0, 0, 0, 100);
         
            curTabs.addlabel(global.gettimestr(TradeKinds[kind][4]), null, 16).anchor(0, 50).pos(curX+difTX, curY+difTY).color(0, 0, 0, 100);
        }
    }
    function closedialog(node,event,p){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}
