//import element.Ship;
//import element.BuyShip;
//import element.MyWarnDialog;
class ShipHouse
{
    var bg;
    var state = FINISH_BUILDING;//2 free 3 working --> 4finishing working 5 SHIP_WAITING 
    var timeBegin = 0;//time Begin
    var timeNeed = 0;//time Need 
    var leftTime = 0;
    var selling;//minus when buy
    var goodsKind;
    var num;

    var hasShip = 0;

    var ship = null;//my ship
    var funcs = [null, null, whenFree, whenWorking, whenFinish, whenWaiting];
    var buildcontextname = "dock";
    var objectid = 0;
    var contextid = 2;

    //state startTime timeNeed goodsKind num sid 
    //0 1 2 coin food cae
    var house;
    var myTexture = "shipHouse.png";
    function whenWaiting()
    {
    }
    function ShipHouse(d)
    {
        bg = node();
        house = bg.addsprite(myTexture).anchor(50, 50).pos(2106, 1191).setevent(EVENT_UNTOUCH, touchEnded);
        global.timer.addlistener(time()/1000+86400, this);
        if(d[0] == -1)
            state = FINISH_BUILDING;
        else
            state = FINISH_BUILDING+d[0];
        timeBegin = global.timer.times2c(d[1]);
        timeNeed = d[2];
        goodsKind = d[3];
        num = d[4];
        hasShip = (d[0] != -1);
        makeShip();
        global.myDock = this;
        showNight();
    }
    function showNight()
    {
        if(global.system.flagnight == 0 && global.system.enableNight)
        {
            house.color(50, 50, 60, 100);
            if(ship != null)
                ship.showNight();
        }
    }
    function recover()
    {
        house.color(100, 100, 100, 100);
        ship.recover();
    }
    function showBuyShip()
    {
        var level = global.user.getValue("level");
        if(level >= 15)
        {
            global.pushContext(null, new BuyShip(buyShip, 1, global.getStaticString("BuyShipNow")), NonAutoPop);
        }
        else 
        {
            global.pushContext(null, new MyWarnDialog(null, 1, global.getStaticString("BuyShip")), NonAutoPop);
        }
    }
    var buyKind;
    function buyShip(p)
    {
        buyKind = p;
        global.http.addrequest(0, "shipc/buyShip", ["uid", "kind"], [global.userid, p], this, "buyShip");
    }
    function useaction(p, rc, c)
    {
        var data = json_loads(c);
        var id = data.get("id");
        if(id == 0)
            return;
        if(p == "buyShip")
        {
            hasShip = 1;
            if(buyKind == 0)
                global.user.changeBuildValue(this, "money", -DOCK_COST[0], -2);
            else
                global.user.changeBuildValue(this, "caesars", -DOCK_COST[1], -2);
            makeShip();
        }
        else if(p == "collectOver")
        {
            trace("collectOver", c);
            var reward = json_loads(c);
            var money = reward.get("coin", 0);
            var food = reward.get("food", 0);
            if(money != 0)
                global.user.changeBuildValue(this, "money", money, 2);
            else
                global.user.changeBuildValue(this, "food", food, 2);
            state = FINISH_BUILDING;
            //ship.inDock();
        }
        else if(p == "trade")
        {
            c = json_loads(c);
            var kind = c.get("kind");
            var trading = TradeKinds[kind];
            var selKind = trading[0];
            trace("trade", trading);
            if(selKind == 0)
                global.user.changeBuildValue(this, "money", -trading[2], -2);
            else if(selKind == 1)
                global.user.changeBuildValue(this, "food", -trading[2], -2);
            else if(selKind == 2) 
                global.user.changeBuildValue(this, "caesars", -trading[2], -2);
            state = WORKING;
            timeBegin = time()/1000;
            timeNeed = trading[4];
            goodsKind = trading[1];
            num = trading[3];
            ship.outDock();
        }
    }
    function makeShip()
    {
        if(hasShip == 1 && ship == null)
        {
            ship = new Ship(this);
            bg.add(ship.bg);
        }
    }

    function showTrading()
    {
        global.pushContext(null, new Trading(this), NonAutoPop) 
    }
    function whenFree()
    {
        if(hasShip == 0)
        {
            showBuyShip();            
        }
        else
        {
            showTrading();
        }
    }
    var timeisend = 0;
    var showFinishYet = 0;
    function getTimePass()
    {
        var passTime = time()/1000 - timeBegin;
        return passTime*1000/timeNeed; 
    }
    function timerefresh()
    {
        var passTime = time()/1000 - timeBegin;
        leftTime = timeNeed - passTime;
        if(leftTime <= 0)
        {
            leftTime = 0;
            if(state == WORKING)
            {
                state = FINISH_WORKING; 
                showFinish();       
            }
        }
    }
    function showFinish()
    {
        if(showFinishYet == 0)
        {
            showFinishYet = 1;
            var states = sprite("dockGoods.png").anchor(50, 50).pos(104, 9).setevent(EVENT_UNTOUCH, collect).addaction(repeat(scaleto(750, 150, 150), delaytime(500), scaleto(750, 100, 100)));
            house.add(states, 0, 1);
        }
    }
    function collect()
    {
        showFinishYet = 0;
        state = SHIP_WAITING;
        house.remove(1);
        ship.inDock();
        //global.http.addrequest(0, "shipc/collect", ["uid"], [global.userid], this, "collectOver")
    }


    function whenWorking()
    {
        global.pushContext(null, new BuildData(this), AutoPop);
    }
    function whenFinish()
    {
        collect();
    }
    function touchEnded(n, e, p, x, y, points)
    {
        if(state >= 0 && state < len(funcs))
        {
            var l = funcs[state];
            l();
        }
    }
}
