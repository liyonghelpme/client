class Monster{
    var bg;
    var map;
    var power;
    var id;
    var leftHealth;
    //http need
    var contextname;
    var shiftAct;
    var center;
    function Monster(m, d){
        map = m;
        contextname = "monsterKill";
        power = d.get("power");
        id = d.get("id");
        load_sprite_sheet("soldierm160.plist");
        bg = sprite("soldierm160.plist/ss160m0.png"); 
        leftHealth = bg.addlabel("", null, 20).pos(5, -30).color(100, 0, 0);
        bg.setevent(EVENT_TOUCH, touchBegan);
        bg.addaction(repeat(animate(2000, "soldierm160.plist/ss160m0.png", "soldierm160.plist/ss160m1.png", "soldierm160.plist/ss160m2.png", "soldierm160.plist/ss160m3.png", "soldierm160.plist/ss160m4.png", "soldierm160.plist/ss160m5.png", "soldierm160.plist/ss160m6.png", UPDATE_SIZE)) );
        shiftAct = moveto(2000, 0, 0);
        setLeftPower(power);
        global.timer.addlistener(time()/1000+86400, this);
    }

    function timeend()
    {
    }
    function timerefresh()
    {
        shiftAct.stop();
        var tar = [center[0]+rand(MAP_WIDTH)-MAP_WIDTH/2, center[1]+rand(MAP_HEIGHT)-MAP_HEIGHT/2];
        shiftAct = moveto(1000, tar[0], tar[1]);
        bg.addaction(shiftAct);
    }
    var timeisend = 0;
    function touchBegan(n, e, p, x, y, points)
    {
        global.pushContext(null, new MonsterAttack(this), NonAutoPop);
    }
    function setPos(p)
    {
        center = p;
        bg.pos(p);
    }
    function setLeftPower(le)
    {
        power = le;
        leftHealth.text(str(power));

        if(power == 0)
        {
            timeisend = 1;
            bg.removefromparent();
            map.removeMonster(this);
            global.http.addrequest(0, "monsterc/getMyResult", ["uid"], [global.userid], this, "resOver");
        }
    }
    function useaction(p, rc, c)
    {
        trace(p, rc, c);
        if(p == "resOver")
        {
            if(rc != 0)
            {
                c = json_loads(c);
                if(c.get("id") == 1)
                {
                    //global.context[0].addMonResult(c.get("res"));
                    //global.context[0].addMonResult(c.get("res"));
                    //addcmd(dict([["name", "monsterResult"], ["data", res]]));
                    var data = c.get("res");
                    if(len(data) > 0)
                    {
                        data = data[0];
                        var words = global.getFormatString("monsterResult", ["[NUM]", str(data.get("dragonNum"))]); 
                        global.pushContext(null, new MyWarnDialog(null, 1, words), NonAutoPop); 
                        global.user.changeValue("dragonStone", data.get("dragonNum"));
                    }
                }

            }
        }
    }
}
