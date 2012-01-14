const UNIT = 1000;
class Stone
{
    var tar;
    var bg;
    var speedY;
    var speedX;
    var acc;
    var lastTime = 0;
    var totalTime;
    var battle;
    var initY;
    var initPos;
    function Stone(t, p, b)
    {
        battle = b;
        tar = t.bg.pos();
        bg = sprite("cataStone.png");
        bg.pos(p);
        bg.anchor(50, 50);
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
        var pos=bg.pos();
        if(pos[1] > (tar[1]-20))
       {
            battle.removeStone(this);            
            return;
        }
        lastTime += diff;
        var deg = lastTime*360/500;

        //var dx = speedX*diff/1000/UNIT;
        //var dy = speedY*diff/1000/UNIT;
        //speedY += acc*diff/1000;
        
        var dx = initPos[0] + speedX*lastTime/1000/UNIT;
        var dy = initPos[1] + speedY*lastTime/1000/UNIT + acc*lastTime/1000*lastTime/1000/UNIT/2;
        bg.rotate(deg);
        bg.pos(dx, dy);

        //trace(dx, dy);

    }
}
class CataControl
{
    var attack;
    var health;
    var level;
    var bg;
    var color;
    var state;
    var speed;
    var move;
    var post;
    var lastTime;
    var interval;
    var tar;
    var battle;
    var beAttack;
    var scalex;
    var lastAttackTime;
    var attackInterval;
    var range;
    var attInter;
    var lastFrame;
    function CataControl(l, pos, c, p, b)
    {
        level = l;
        battle = b;
        beAttack = 0;
        bg = sprite("move"+str(l+1)+"-1.png");
        bg.pos(pos);
        bg.anchor(50, 50);
        trace("pos", bg.pos());
        move = ["move"+str(l+1)+"-1.png", "move"+str(l+1)+"-2.png", "move"+str(l+1)+"-3.png", "move"+str(l+1)+"-4.png"];
        post = ["move"+str(l+1)+"-1.png", "throw"+str(l+1)+"-1.png", "throw"+str(l+1)+"-2.png", "throw"+str(l+1)+"-2.png", "throw"+str(l+1)+"-1.png"];
        color = c;
        attack = p;
        health = p*10;
        state = 0;//STOP
        speed = 50;
        lastTime = 0;
        interval = 50;
        attInter = 300;
        scalex = 100;
        range = 400;

        attackInterval = 1000;
        lastAttackTime = attackInterval;
        lastFrame = -1;
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
            for(var i = 0; i < len(battle.Cata); i++)
            {
                var ene = battle.Cata[i];
                if(ene.color != color && ene.beAttack < 2 && ene.health >= 0)
                {
                    dis = distance(bg.pos(), ene.bg.pos());
                    if(dis < mindis)
                    {
                        mindis = dis;
                        t = ene;
                    }
               }
            }
            if(t != null)
            {
                trace("dis", mindis);
                state = 1;
                lastTime = 0;
                tar = t;
                tar.beAttack += 1;
            }
        }
        else if(state == 1)//MOVE
        {
            if(tar.health >= 0)
            {
                dis = distance(tar.bg.pos(), bg.pos());
                if(dis < range*range && bg.pos()[0] > 20 && bg.pos()[0] < 780)
                {
                    lastTime = 0;
                    lastAttackTime = 0;
                    state = 2;
                }
                else
                {
                    var p1 = bg.pos();
                    var p2 = tar.bg.pos();
                    var mx = p2[0] - p1[0];
                    var my = p2[1] - p1[1];
                    
                    trace("movex, movey", diff, sqrt(dis), mx, my);
                    mx = mx*100/sqrt(dis)*speed*diff/1000/100;
                    my = my*100/sqrt(dis)*speed*diff/1000/100;
                    trace("movex, movey",  mx, my);
                    p1[0] += mx;
                    p1[1] += my;
                    bg.pos(p1);
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
                dis = distance(bg.pos(), tar.bg.pos());
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
                tar.beAttack -= 1;
                tar = null;
            }
        }
        
        if(state == 1)
        {
            var dx = tar.bg.pos()[0] - bg.pos()[0];
            if(dx < 0)
            {
                if(scalex != -100)
                {
                    bg.scale(-100, 100);
                    scalex = -100;
                }
            }
            else if(scalex != 100)
            {
                bg.scale(100, 100);
                scalex = 100;
            }
             var frame = lastTime/interval;
             if(frame >= len(move))
             {
                frame = 0;
                lastTime = 0;
             }
             bg.texture(move[frame]);
        }
        else if(state == 2)
        {
            dx = tar.bg.pos()[0] - bg.pos()[0];
            if(dx < 0)
            {   
                if(scalex != -100)
                {
                    bg.scale(-100, 100);
                    scalex = -100;
                }
            }
            else if(scalex != 100)
            {
                bg.scale(100, 100);
                scalex = 100;
            }
            frame = lastTime/attInter;
            p1 = bg.pos();
            if(frame==1 && lastFrame != frame)
            {
                if(dx < 0)
                    bg.pos(p1[0]+10, p1[1]);
                else
                    bg.pos(p1[0]-10, p1[1]);
            }
            else if(frame == 2 && lastFrame != frame)//0 1 2 1 0 post stone
            {

                if(dx >= 0)
                {
                    battle.addStone(new Stone(tar, [p1[0]-55+35, p1[1]-55], battle)); 
                }
                else
                {
                    battle.addStone(new Stone(tar, [p1[0]+55-35, p1[1]-55], battle)); 
                }
            }
            else if(frame == 4 && lastFrame != frame)
            {
                if(dx < 0)
                    bg.pos(p1[0]-10, p1[1]);
                else
                    bg.pos(p1[0]+10, p1[1]);
            }
            lastFrame = frame;
            if(frame >= len(post))
            {
                frame = 0;
                lastTime = 0;
            }
            bg.texture(post[frame]);
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
        back.add(sta.bg);
    }
    function removeStone(sta)
    {
        stones.remove(sta);
        sta.bg.removefromparent();
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
    const yinit = 100;
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
        trace("cata", len(Cata));
        for(i = 0; i < len(Cata); i++)
        {
            back.add(Cata[i].bg);
            trace("add i", i);
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




