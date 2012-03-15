const UNIT = 1000;
class Stone
{
    var tar;
    var body;
    var speedY;
    var speedX;
    var acc;
    var lastTime = 0;
    var totalTime;
    var battle;
    var initY;
    var initPos;
    var ene;
    var attack;
    function Stone(t, p, b, a)
    {
        battle = b;
        ene = t;
        tar = t.body.pos();
        attack = a;
        body = sprite("cataStone.png");
        //spriteManager.getPic("cataStone", body);
        body.pos(p);
        body.anchor(50, 50);
        initPos = p;

        var dx = tar[0] - p[0];
        var dy = tar[1] - p[1];
        dx *= UNIT;
        dy *= UNIT;

        //acc = 20*UNIT;//m/s2
        speedX = 200*UNIT;//m/s
        if(dx < 0)
            speedX = -speedX;
        var tx = dx*UNIT/speedX;//ms
        acc = (dy+50*UNIT)*2*UNIT/tx*UNIT/tx;
        totalTime = tx;
        speedY = dy*UNIT/tx-acc*tx/UNIT/2;// m/s
        //trace("stone", dy, p, tar, speedX, speedY, tx);
    }

    function update(diff)
    {
        var pos=body.pos();
        if(pos[1] > (tar[1]-20))
       {
            battle.removeStone(this);            
            ene.health -= attack;
            return;
        }
        lastTime += diff;
        var deg = lastTime*360/500;

        //var dx = speedX*diff/1000/UNIT;
        //var dy = speedY*diff/1000/UNIT;
        //speedY += acc*diff/1000;
        
        var dx = initPos[0] + speedX*lastTime/1000/UNIT;
        var dy = initPos[1] + speedY*lastTime/1000/UNIT + acc*lastTime/1000*lastTime/1000/UNIT/2;
        body.rotate(deg);
        body.pos(dx, dy);

        //trace(dx, dy);

    }
}
class CataControl
{
    var attack;
    var health;
    var level;
    var body;
    var color;
    var state;
    var speed;
    var move;
    var post;
    var lastTime;
    var interval;
    var tar;
    var battle;
    //var beAttack;
    var scalex;
    var lastAttackTime;
    var attackInterval;
    var range;
    var attInter;
    var lastFrame;
    var defencenum;
    
    var eneSoldier;
    var deadTime;
    function CataControl(l, pos, c, p, b)
    {
        level = l;
        battle = b;
        //beAttack = 0;
        defencenum = 0;
        body = sprite("move"+str(l+1)+"-1.png");
        body.pos(pos);
        body.anchor(50, 50);
        //trace("pos", body.pos());
        move = ["move"+str(l+1)+"-1.png", "move"+str(l+1)+"-2.png", "move"+str(l+1)+"-3.png", "move"+str(l+1)+"-4.png"];
        post = ["move"+str(l+1)+"-1.png", "throw"+str(l+1)+"-1.png", "throw"+str(l+1)+"-2.png", "throw"+str(l+1)+"-2.png", "throw"+str(l+1)+"-1.png", "move"+str(l+1)+"-1.png", "move"+str(l+1)+"-1.png", "move"+str(l+1)+"-1.png"];
        color = c;
        attack = 10;
        health = 20;
        state = 0;//STOP
        speed = 50;
        lastTime = 0;
        interval = 50;
        attInter = 300;
        scalex = 100;
        range = 400;
        deadTime = 200;

        attackInterval = 1000;
        lastAttackTime = attackInterval;
        lastFrame = -1;

        
        if(len(battle.soldiers1) > 0)
        {
            if(color == 0)
                eneSoldier = battle.soldiers2;
            else
                eneSoldier = battle.soldiers1;
            /*
            if(battle.soldiers1[0].color != color )
                eneSoldier = battle.soldiers1;
            else
                eneSoldier = battle.soldiers2;
            */
        }
        else
        {
            if(color == 0)
                eneSoldier = battle.soldiers2;
            else
                eneSoldier = battle.soldiers1;
            /*
            if(battle.soldiers2[0].color != color)
                eneSoldier = battle.soldiers2;
            else
                eneSoldier = battle.soldiers1;
            */
        }
    }
    function distance(p1, p2)
    {
        return (p1[0]-p2[0])*(p1[0]-p2[0]) + (p1[1]-p2[1])*(p1[1]-p2[1]);
    }
    function update(diff)
    {
        lastTime += diff;
        if(health < 0)
        {
            state = 3;
        }
        var dis;
        if(state == 0)//STOP
        {
            var mindis = 999999;
            var t = null;
            var i;
            var ene;


            for(i = 0; i < len(eneSoldier); i++)
            {
                ene = eneSoldier[i];
                //trace("soldier ene", ene.body, ene.health);
                if(ene.health >= 0 && ene.body != null)
                {   
                    dis = distance(body.pos(), ene.body.pos());
                    if(dis < mindis)
                    {
                        mindis = dis;
                        t = ene;
                    }
                }
            }
            if(t != null)
            {
                state = 1;
                lastTime = 0;
                tar = t;
                //trace("tar", tar.body.pos());
            }
            else
            {
                for(i = 0; i < len(battle.Cata); i++)
                {
                    ene = battle.Cata[i];
                    if(ene.color != color  && ene.health >= 0)
                    {
                        dis = distance(body.pos(), ene.body.pos());
                        if(dis < mindis)
                        {
                            mindis = dis;
                            t = ene;
                        }
                   }
                }
                
                if(t != null)
                {
                    //trace("dis", mindis);
                    state = 1;
                    lastTime = 0;
                    tar = t;
                    //tar.beAttack += 1;
                }
            }
        }
        else if(state == 1)//MOVE
        {
            if(tar.health >= 0)
            {
                dis = distance(tar.body.pos(), body.pos());
                if(dis < range*range && body.pos()[0] > 20 && body.pos()[0] < 780)
                {
                    lastTime = 0;
                    lastAttackTime = 0;
                    state = 2;
                }
                else
                {
                    var p1 = body.pos();
                    var p2 = tar.body.pos();
                    var mx = p2[0] - p1[0];
                    var my = p2[1] - p1[1];
                    
                    //trace("movex, movey", diff, sqrt(dis), mx, my);
                    mx = mx*100/sqrt(dis)*speed*diff/1000/100;
                    my = my*100/sqrt(dis)*speed*diff/1000/100;
                    //trace("movex, movey",  mx, my);
                    p1[0] += mx;
                    p1[1] += my;
                    body.pos(p1);
                }
            }
            else
            {
                lastTime = 0;
                state = 0;
            }
        }
        else if(state == 2)//ATTACK
        {
            if(tar.health >= 0 )
            {
                dis = distance(body.pos(), tar.body.pos());
                if(dis > (range+20)*(range+20))
                {
                    state = 1;//trace
                    lastTime = 0;
                } 
            }
            else
            {
                state = 0;
            }
        }
        else if(state == 3)//DEAD
        {
            if(tar != null)
            {
                //tar.beAttack -= 1;
                tar = null;
                lastTime = 0;
            }
        }
        
        if(state == 1)
        {
            var dx = tar.body.pos()[0] - body.pos()[0];
            if(dx < 0)
            {
                if(scalex != -100)
                {
                    body.scale(-100, 100);
                    scalex = -100;
                }
            }
            else if(scalex != 100)
            {
                body.scale(100, 100);
                scalex = 100;
            }
             var frame = lastTime/interval;
             if(frame >= len(move))
             {
                frame = 0;
                lastTime = 0;
             }
             body.texture(move[frame]);
        }
        else if(state == 2)
        {
            dx = tar.body.pos()[0] - body.pos()[0];
            if(dx < 0)
            {   
                if(scalex != -100)
                {
                    body.scale(-100, 100);
                    scalex = -100;
                }
            }
            else if(scalex != 100)
            {
                body.scale(100, 100);
                scalex = 100;
            }
            frame = lastTime/attInter;
            p1 = body.pos();
            if(frame==1 && lastFrame != frame)
            {
                if(dx < 0)
                    body.pos(p1[0]+10, p1[1]);
                else
                    body.pos(p1[0]-10, p1[1]);
            }
            else if(frame == 2 && lastFrame != frame)//0 1 2 1 0 post stone
            {

                if(dx >= 0)
                {
                    battle.addStone(new Stone(tar, [p1[0]-55+35, p1[1]-55], battle, attack)); 
                }
                else
                {
                    battle.addStone(new Stone(tar, [p1[0]+55-35, p1[1]-55], battle, attack)); 
                }
            }
            else if(frame == 5 && lastFrame != frame)
            {
                if(dx < 0)
                    body.pos(p1[0]-10, p1[1]);
                else
                    body.pos(p1[0]+10, p1[1]);
            }
            lastFrame = frame;
            if(frame >= len(post))
            {
                frame = 0;
                lastTime = 0;
            }
            body.texture(post[frame]);
        }
        else if(state == 3)//dead time 0-500 100-0
        {
            if(lastTime <= deadTime)
                body.color(100, 100, 100, 100-lastTime*100/deadTime);
            else
                body.removefromparent();
        }
    }
}
class Battle
{
    var leftSoldierPower;
    var leftCataPower;
    var rightSoldierPower;
    var rightCataPower;
    var Cata;
    var back;
    var lastTime = 0;
    var stones;
    function addStone(sta)
    {
        stones.append(sta);
        back.add(sta.body);
    }
    function removeStone(sta)
    {
        stones.remove(sta);
        sta.body.removefromparent();
    }
    function getCata(power)
    {
        var temp = [0, 0, 0];
        if(power > 0)
        {
            if(power < 400)
                temp = [(power+199)/200, 0, 0];
            else if(power < 1000)
                temp = [1, power/500, 0];
            else
                temp = [1, 1, 1];
        }
        return temp;
    }
    function Battle(data)
    {
        leftSoldierPower = data.get("leftSoldierPower");
        leftCataPower = data.get("leftCataPower");
        rightSoldierPower = data.get("rightSoldierPower");
        rightCataPower = data.get("rightCataPower");
        init();
    }
    const yinit = 150;
    function init()
    {
        var temp = getCata(leftCataPower);
        Cata = [];
        stones = [];
        var ypos = yinit;
        var dify = 100;
        var p = temp[0]+temp[1]*2+temp[2]*4;
        var ep = leftSoldierPower/p;
        for(var j = 0; j < len(temp); j++)
        {
            for(var i = 0; i < temp[j]; i++)
            {
                Cata.append(new CataControl(j, [100, ypos], 0, ep*(1<<j), this));
                ypos += dify;
            }
        }
        temp = getCata(rightCataPower);
        p = temp[0]+temp[1]*2+temp[2]*4;
        ep = leftSoldierPower/p;
        ypos = yinit; 
        for(j = 0; j < len(temp); j++)
        {
            for(i = 0; i < temp[j]; i++)
            {
                Cata.append(new CataControl(j, [700, ypos], 1, ep*(1<<j), this));
                ypos += dify;
            }
        }
        back = node();
        //trace("cata", len(Cata));
        for(i = 0; i < len(Cata); i++)
        {
            back.add(Cata[i].body);
            //trace("add i", i);
        }
    }
    function update()
    {
        var diff;
        if(lastTime == 0)
        {
            lastTime = time();
            diff = 0;
        }
        else
        {
            var now = time();
            diff = now - lastTime;
            lastTime = now;
        }
        
        for(var i = 0; i < len(Cata); i++)
        {
            Cata[i].update(diff);
        }
        for(i = 0; i < len(stones); i++)
        {
            stones[i].update(diff);
        }
    }
}




