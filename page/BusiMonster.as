class MonsterOnBusi
{
    var bg;
    var map;
    var kind;
    var power;
    var id;
    var posId;
    var name;
    var movAct;
    function MonsterOnBusi(m, i, k, p, pId)
    {
        map = m;
        kind = k;
        power = p;
        id = i;
        posId = pId;
        name = map.monName.get(kind); 
        map.mPids.update(posId, 1);
        trace("mapPid", map.monPoses[posId], id, "soldierm"+str(kind)+".plist/ss"+str(kind)+"m0.png");

        //load_sprite_sheet("soldierm"+str(kind)+".plist");
        //"soldierm"+str(kind)+".plist/ss"+str(kind)+"m0.png"
        bg = sprite("monster_"+str(kind)+"_1.png").pos(map.monPoses[posId]).anchor(50, 100);
        //movAct = repeat(animate(2000, "soldierm"+str(kind)+".plist/ss"+str(kind)+"m0.png", "soldierm"+str(kind)+".plist/ss"+str(kind)+"m1.png", "soldierm"+str(kind)+".plist/ss"+str(kind)+"m2.png", "soldierm"+str(kind)+".plist/ss"+str(kind)+"m3.png", "soldierm"+str(kind)+".plist/ss"+str(kind)+"m4.png", "soldierm"+str(kind)+".plist/ss"+str(kind)+"m5.png", "soldierm"+str(kind)+".plist/ss"+str(kind)+"m6.png", UPDATE_SIZE));
        movAct = repeat(animate(1000, "monster_"+str(kind)+"_1.png", "monster_"+str(kind)+"_2.png","monster_"+str(kind)+"_3.png")); 

        bg.addaction(movAct);
        bg.setevent(EVENT_TOUCH, touchBegan);
    }
    //var attAct;
    function goDead()
    {
        //load_sprite_sheet("soldiera"+str(kind)+".plist");
        //movAct.stop();
        //attAct = repeat(animate(1000, "soldiera"+str(kind)+".plist/ss"+str(kind)+"a0.png", "soldiera"+str(kind)+".plist/ss"+str(kind)+"a1.png", "soldiera"+str(kind)+".plist/ss"+str(kind)+"a2.png", "soldiera"+str(kind)+".plist/ss"+str(kind)+"a3.png", "soldiera"+str(kind)+".plist/ss"+str(kind)+"a4.png", "soldiera"+str(kind)+".plist/ss"+str(kind)+"a5.png", "soldiera"+str(kind)+".plist/ss"+str(kind)+"a6.png", UPDATE_SIZE));
        //attAct = repeat(animate(500, "monster_"+str(kind)+"_1.png","monster_"+str(kind)+"_2.png","monster_"+str(kind)+"_3.png", UPDATE_SIZE));
        //bg.addaction(attAct);
        bg.addaction(sequence(delaytime(3000), stop(), itexture("monster_"+str(kind)+"_dead.png", UPDATE_SIZE),delaytime(1000),animate(2500,"01.png","02.png","03.png","04.png","05.png","06.png","07.png","08.png","09.png","10.png","11.png","12.png","13.png","14.png","15.png"),itexture("")));
        /*
        bg.addaction(sequence(
                delaytime(3000), 
                stop(),
                callfunc(stopAtt))
        );
        */
    }
    function stopAtt()
    {
        //attAct.stop();
        //bg.texture("monster_"+str(kind)+"_dead.png", UPDATE_SIZE);
    }
    var tempNode;
    function removeNode()
    {
        tempNode.removefromparent();
    }
    function showReward()
    {
        bg.removefromparent(); 
        map.mPids.remove(posId);
        global.user.changeValueAnimate2(global.context[0].moneyb, "dragonStone", draNum, -4);
        
        /*
        var OFFX = 50;
        var OFFY = 50;

        var basePos = bg.pos();
        for(var i = 0; i < draNum; i++)
        {
            var row = i/3;
            var col = i%3;

            var dra = tempNode.addsprite("opbutton27.png").pos(basePos[0]+-50+col*OFFX, basePos[1]+-50+row*OFFY).scale(60).anchor(50, 100);
            //dra.addaction(sequence(tintto(500,100,100,100,100),delaytime(3000),tintto(1000,0,0,0,0)));
        }
        */
    }
    var draNum;
    function removeSelf()
    {
        trace("removeSelf", draNum);
        tempNode = map.monView.addnode();
        tempNode.addaction(sequence(delaytime(7000), callfunc(removeNode)));
    }

    function touchBegan(n, e, p, x, y, points)
    {
        global.pushContext(null, new MonsterDia(this), NonAutoPop);
    }
}
class BusiMonster
{
    //怪兽最多有10个保证有10个位置可以放置怪兽
    var monPoses = [[411, 1050], [1014, 258], [834, 321], [561, 417], [357, 552], [2076, 186], [483, 1149], [756, 1323], [1566, 1413], [2250, 417]]; 
    //18-35
    var monName = dict([
        [18, "Snake King"],
        [19, "Snake King"],
        [20, "Snake King"],
        [21, "Boar King"],
        [22, "Boar King"],
        [23, "Boar King"],
        [24, "Wolf King"],
        [25, "Wolf King"],
        [26, "Wolf King"],
        [27, "Bear King"],
        [28, "Bear King"],
        [29, "Bear King"],
        [30, "Lion King"],
        [31, "Lion King"],
        [32, "Lion King"],
        [33, "Dragon King"],
        [34, "Dragon King"],
        [35, "Dragon King"],
    ]);
    var monView;
    //var monsters;
    var map;
    var mPids = dict();
    function BusiMonster(m)
    {
        map = m;
        monView = map.contextNode.addnode();
    }
    function updateData()
    {
        global.http.addrequest(0, "myMonsterc/getMonsters", ["uid"], [global.userid], this, "getMonsters");
    }
    function getNewPos()
    {
        for(var i = 0; i < len(monPoses); i++)
        {
            
            if(mPids.get(i, null) == null)
                return i;
        }
        return -1;
    }
    function useaction(p, rc, c)
    {
        trace(p, rc, c);
        if(rc == 0)
            return;
        if(p == "getMonsters")
        {
            c = json_loads(c);
            var monsters = c.get("monsters", []);
            monView.removefromparent(); 
            monView = node();
            //map.contextNode.add(monView, 1000);
            map.setMonsterNode(monView);
            for(var i = 0; i < len(monsters); i++)
            {
                var mData = monsters[i];
                //var pid = getNewPos();

                trace("mData pid", mData);
                //if(pid != -1)
                //{
                var mon = new MonsterOnBusi(this, mData[0], mData[1], mData[2], mData[3]);           
                monView.add(mon.bg);
                //}
            }
        }
    }
}
