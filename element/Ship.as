class Ship
{
    var bg;
    var house;
    var state = 0;

    //state startTime timeNeed goodsKind num sid 
    function Ship(h)
    {
        house = h;
        bg = sprite("ship0.png").anchor(50, 50).pos(2202, 1239).setevent(EVENT_UNTOUCH, touchEnded);
        global.timer.addlistener(time()/1000+86400, this);
        if(house.state == WORKING)
            outDock();
        showNight();
    }
    function recover()
    {
        bg.color(100, 100, 100, 100);
    }
    function showNight()
    {
        if(global.system.flagnight == 0 && global.system.enableNight)
            bg.color(50, 50, 60, 100);
    }
    var moves = [2202, 1239, 1830, 1602, 2991, 1602, 2913, 957];
    var timeisend = 0;
    var notMoveYet = 0;
    var MoveTime = 3000;
    function moveShip()
    {
        curPos++;
        curPos %= len(moves)/2;
        if(notMoveYet == 0)
        {
            notMoveYet = 1;
            bg.addaction(
             spawn(
                    repeat(animate(500, "ship0.png", "ship1.png", "ship2.png")),
                    sequence(
                        moveto(MoveTime, moves[curPos*2], moves[curPos*2+1]), 
                        callfunc(moveOver)
                    )
                 ));
        }
        else
        {
            bg.addaction(
                sequence(
                    moveto(MoveTime, moves[curPos*2], moves[curPos*2+1]), 
                    callfunc(moveOver)
                ));
        }
    }
    function outDock()
    {
        state = 1;
        trace("outDock");
        bg.pos(2202, 1239);
        curPos = 0;
        moveShip();
    }

    function inDock()
    {
        //if((house.state == FINISH_WORKING || house.state == FINISH_BUILDING) && state == 0 && curPos != 0)
        //{
        state = 1;
        trace("inDock");
        bg.pos(2913, 957);
        curPos = len(moves)/2-1;
        moveShip();
        //}
    }

    var showStatus = 0;
    function timerefresh()
    {
        //trace("ship state", state, house.state, curPos, bg.pos());
        //working always move
        if(state == 0 && house.state == WORKING)
        {
            //state = 1;
            //outDock();
            //moveShip();
        }
        //finishWorking stop at dock
        else if((house.state == FINISH_WORKING || house.state == FINISH_BUILDING) && state == 0 && curPos != 0)
        {
            //state = 1;
            //inDock();
            //moveShip();
        }
        else if(house.state == SHIP_WAITING && state == 0 && notMoveYet == 1)
        {
            notMoveYet = 0;
            bg.addaction(stop());
            var states = sprite("dockGoods.png").anchor(50, 50).pos(59, 9).setevent(EVENT_UNTOUCH, collect).addaction(repeat(scaleto(750, 150, 150), delaytime(500), scaleto(750, 100, 100)));
            showStatus = 1;
            bg.add(states, 0, 1);
        }
    }
    function collect()
    {
        if(showStatus == 1)
        {
            showStatus = 0;
            bg.remove(1);
            global.http.addrequest(0, "shipc/collect", ["uid"], [global.userid], house, "collectOver")
        }
    }
    var curPos = 0;
    function moveOver()
    {
        state = 0;
    }
    function touchEnded(n, e, p, x, y, points)
    {
        if(showStatus == 1)
        {
            collect();
        }
        if(house.state == FINISH_BUILDING)
        {
        }
        else if(house.state == WORKING)
        {
        }
        else if(house.state == FINISH_WORKING)
        {
        }
    }
    function startTrading()
    {
        
    }

}
