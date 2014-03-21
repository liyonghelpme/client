class MonsterDia extends ContextObject{
    var monster;
    var flagdefeatable = 1;
    var defeatCae;
    function MonsterDia(m){
        monster = m;
        contextname = "dialog-monster";
        contextNode = null;
    }


    //const dialogsize = [[439,383],[404,270],[381,374],[558,471]];

    //var w=dialogsize[dialogtype][0];
    //var h=dialogsize[dialogtype][1]-42;
    
    function paintNode(){
        contextNode = sprite("dialogback_a.png").anchor(50,50).pos(400,240);
        contextNode.addsprite("monsterelement.png").anchor(50,50).pos(219,160);

        contextNode.addlabel(monster.name, null, 20).anchor(50,50).pos(219,78).color(0,0,0,100);

        var monPic = contextNode.addsprite("monster_"+str(monster.kind)+"_1.png").anchor(50,50).pos(219,160);
        var bSize = monPic.prepare().size();
        var sca = min(112*100/bSize[0], 93*100/bSize[1]);
        monPic.scale(sca);

        contextNode.addlabel(global.getStaticString("attackIs")+str(monster.power),null,20).anchor(50,50).pos(219,242).color(0,0,0,100);


        var warning = contextNode.addlabel("",null,20).anchor(50,50).pos(219,285).color(100,0,0,100);
    
        var totalPower = global.soldiers[0]+global.soldiers[1]+global.user.getValue("catapult");
        if(totalPower < monster.power){
            warning.text(global.getStaticString("powerlack"));
            flagdefeatable = 0;
        }

        var width = 439;
        var height = 383-42;
        var but0 = contextNode.addsprite("boxbutton1.png").anchor(50,50).pos(width/3-17, height);
        but0.addlabel(global.getStaticString("attack"), null, BUTTONFONTSIZE).anchor(50,50).pos(62,19);
        but0.setevent(EVENT_UNTOUCH, attack);

        var but1 = contextNode.addsprite("boxbutton2.png").anchor(50,50).pos(width*2/3+17, height);
        but1.addlabel(global.getStaticString("back"), null, BUTTONFONTSIZE).anchor(50,50).pos(62,19);
        but1.setevent(EVENT_UNTOUCH, closedialog);


        defeatCae = (monster.power+99)/100;

        if(flagdefeatable == 0)
        {
            but0.addsprite("caesars_big.png").pos(0, 20).anchor(50, 50);
            but0.addlabel(str(defeatCae), null, 24, FONT_BOLD).color(100, 100, 100, 100).pos(10, 15);
            if(global.user.getValue("caesars") < defeatCae)
            {
                but0.texture("boxbutton2.png");
                but0.setevent(EVENT_UNTOUCH,null);
            }
        }
    }
    function attack()
    {
        global.popContext(null);
        monster.bg.setevent(EVENT_TOUCH, null);
        if(flagdefeatable == 0)
        {
            global.http.addrequest(0, "myMonsterc/attackMonster", ["uid", "mid", "kind"], [global.userid, monster.id, 0], this, "attackOver");
        }
        else
        {
            global.http.addrequest(0, "myMonsterc/attackMonster", ["uid", "mid", "kind"], [global.userid, monster.id, 1], this, "attackOver");
        }
    }
    function useaction(p, rc, c)
    {
        trace(p, rc, c);
        if(rc == 0)
            return;
        if(p == "attackOver")
        {
            c = json_loads(c);
            if(c.get("id") == 0)
            {
                monster.bg.setevent(EVENT_TOUCH, monster.touchBegan);
                var status = c.get("status");
                if(status == 0)
                {
                    global.pushContext(null, new MyWarnDialog(null, 1, "Soldier not enough!"), NonAutoPop);
                }
                else if(status == 1)
                {
                    global.pushContext(null, new MyWarnDialog(null, 1, "Monster not exist!"), NonAutoPop);
                }
                else if(status == 2)
                {
                    global.pushContext(null, new MyWarnDialog(null, 1, "Caesar coins not enough!"), NonAutoPop);
                }
            }
            else
            {
                monster.draNum = c.get("dragonNum");
                var sid = "2"; 
                var s = monster.bg.addsprite("animate_self_left_"+sid+"_2.png").anchor(100,100).pos(-40, monster.bg.size()[1]).color(0,0,0,0).scale(50);
                s.addaction(sequence(tintto(1000,100,100,100,100),
                spawn(moveby(1000,60,0),repeat(animate(500,"animate_self_left_"+sid+"_1.png","animate_self_left_"+sid+"_2.png"),2)),
                repeat(animate(250,"animate_self_left_"+sid+"_3.png","animate_self_left_"+sid+"_2.png"),4),delaytime(500),
                spawn(repeat(animate(500,"animate_self_"+sid+"_1.png","animate_self_"+sid+"_2.png"),4),sequence(delaytime(1000),tintto(1000,0,0,0,0))),
                callfunc(monster.showReward)));
                monster.goDead();
                monster.removeSelf();


                if(flagdefeatable == 0)
                {
                    global.user.changeValueAnimate2(global.context[0].moneyb, "caesars", -c.get("caeCost"), -2);
                }
                else
                {
                    var lostInf = c.get("lostInf");
                    var lostCav = c.get("lostCav");
                    var lostCata = c.get("lostCata");

                    ChangeSoldier(0, -lostInf);
                    ChangeSoldier(1, -lostCav);
                    global.user.changeValue("catapult", -lostCata);
                }
                global.user.changeValue("dragonStone", c.get("dragonNum"));
                //global.user.changeValueAnimate2(global.context[0].moneyb, "dragonStone", draNum, -4);
                //monster.removeSelf(c.get("dragonNum"));
                showDragonStone(c.get("dragonNum"));
            }
        }
    }

    function showDragonStone(value)
    {
        var ps = monster.bg.pos();
        var bSize = monster.bg.size();
        var x = ps[0] + bSize[0]/2;
        var y = ps[1] - 17;
        var n = node().pos(x,y);
        n.add(sprite("opbutton27.png").anchor(100, 50).pos(-5, 0));

        var ns = str(value);
        var f = 0;
        if(value > 0){
            ns = "+"+ns;
            f = 1;
        }
        n.addlabel(ns,null,40).color(100,f*100,0,100).anchor(0,50).pos(5,0);
        n.addaction(sequence(itintto(0, 0, 0, 0), delaytime(5000), itintto(100, 100, 100, 100), moveby(1000,0,-80),tintto(1000,0,0,0,0),callfunc(removeself)));
        global.context[0].contextNode.add(n.scale(80),20000);
    }

    function closedialog(node,event,p){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}
