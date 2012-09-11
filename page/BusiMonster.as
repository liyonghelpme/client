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

        bg = sprite("monster_"+str(kind)+"_1.png").pos(map.monPoses[posId]);
        movAct = repeat(animate(1000, "monster_"+str(kind)+"_1.png", "monster_"+str(kind)+"_2.png","monster_"+str(kind)+"_3.png")); 

        bg.addaction(movAct);
        bg.setevent(EVENT_TOUCH, touchBegan);
    }
    //var attAct;
    function goDead()
    {
        bg.addaction(sequence(delaytime(3000), stop(), itexture("monster_"+str(kind)+"_dead.png", UPDATE_SIZE),delaytime(1000),animate(2500,"01.png","02.png","03.png","04.png","05.png","06.png","07.png","08.png","09.png","10.png","11.png","12.png","13.png","14.png","15.png"),itexture("")));
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
    var monPoses = [[411, 1070], [1014, 230], [834, 300], [561, 400], [357, 529], [2076, 156], [483, 1169], [756, 1243], [1656, 1302], [2250, 437]]; 
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
