class Disk extends ContextObject{
    var arrow;
    var but1;
    var but2;
    var lock = 0;
    var stoneNum;
    var stoneNum1;
    var caeNum;
    var caeNum1;

    var disk;

    var Degree;
    var result;
    var kind;

    var spe;

    function Disk(){
        contextname = "dialog-disk";
        contextNode = null;
        lock = 0;
        Degree = 360/len(DiskRewards);

        global.timer.addlistener(-1, this);
    }

    function paintNode(){
        contextNode = sprite("diskback.jpg", ARGB_8888).anchor(50,50).pos(400,240);
        disk = contextNode.addsprite("dragonDisk.png").anchor(50, 50).pos(274, 225);
        arrow = contextNode.addsprite("dragonhead.png").anchor(50, 50).pos(274, 225);
        disk.rotate(180);


        but1 = contextNode.addsprite("boxbutton1.png").anchor(50,50).pos(685, 151).setevent(EVENT_UNTOUCH, startGame, 0);
        contextNode.addlabel(global.getStaticString("OrdStart"), null, 20).anchor(50, 50).pos(695, 151);

        var stone = but1.addsprite("opbutton27.png").anchor(50, 50).pos(0, 19);
        stoneNum = stone.addlabel(str(global.user.getValue("dragonStone")), null, 26, FONT_BOLD).pos(40, 30).color(0, 0, 0, 100);
        stoneNum1 = stone.addlabel(str(global.user.getValue("dragonStone")), null, 24, FONT_BOLD).pos(40, 30).color(100, 100, 100, 100);



        but2 = contextNode.addsprite("boxbutton4.png").anchor(50, 50).pos(685, 250).setevent(EVENT_UNTOUCH, startGame, 1);
        contextNode.addlabel(global.getStaticString("SpeStart"), null, 20).anchor(50, 50).pos(695, 250);

        var cae = but2.addsprite("caesars_big.png").scale(150).anchor(50, 50).pos(0, 19);
        //22 13 + base
        caeNum = but2.addlabel(str(global.user.getValue("caesars")), null, 26, FONT_BOLD).pos(3+7, 19).color(0, 0, 0, 100);
        caeNum1 = but2.addlabel(str(global.user.getValue("caesars")), null, 24, FONT_BOLD).pos(3+7, 19).color(100, 100, 100, 100);


        contextNode.addsprite("builddialogclose.png").anchor(50, 50).pos(752, 47).setevent(EVENT_UNTOUCH, closedialog);


    }
        
    var timeisend = 0;
    function timerefresh()
    {   
        if(lock == 1 && finish == 1)
        {
            var rew = DiskRewards[result];
            rew = rew.items()[0];
            if(rew[0] != "spe")
            {
                global.user.changeValueAnimate2(global.context[0].moneyb, rew[0], rew[1], -2);
            }
            else
            {
                global.special[0]++;
            }
            trace("rotate", disk.rotate());
            stoneNum.text(str(global.user.getValue("dragonStone")));
            stoneNum1.text(str(global.user.getValue("dragonStone")));
            caeNum.text(str(global.user.getValue("caesars")));
            caeNum1.text(str(global.user.getValue("caesars")));
            global.pushContext(this, new Warningdialog([DiskGoods[result], DiskShare, 6]), NonAutoPop);

            finish = 0;
            lock = 0;
            but1.texture("boxbutton1.png");
            but2.texture("boxbutton4.png");
        }
    }
    function reloadNode(re)
    {
        if(re == DiskShare)
        {
            ppy_postnewsfeed(global.getFormatString("PlayingDra", ["[NAME]", ppy_username()]), NewsURL, null);
        }
    }
    var finish = 0;
    function startGame(n, e, p, x, y, points)
    {
        var need;
        if(p == 0)
        {
            need = global.user.getValue("dragonStone")
            if(need < 1)
            {
                global.pushContext(null, new Warningdialog([global.getStaticString("DraNot"), null, 6]), NonAutoPop);
                return;
            }
        }
        else
        {
            need = global.user.getValue("caesars");
            if(need < 1)
            {
                global.pushContext(null, new Warningdialog([global.getStaticString("CaeNot"), null, 6]), NonAutoPop)
                return;
            }
        }
        if(lock == 1)
            return;
        lock = 1;
        finish = 0;
        kind = p;
        global.http.addrequest(0, "goodsc/startDragon", ["uid", "kind"], [global.userid, p], this, "start");
        
    }

    var PopTime = 6000;
    function useaction(act, rc, c)
    {
        if(act == "start")
        {
            c = json_loads(c);
            if(c.get("id") == 1)
            {
                if(kind == 0)
                {
                    global.user.changeValue("dragonStone", -1);
                    stoneNum.text(str(global.user.getValue("dragonStone")));
                    stoneNum1.text(str(global.user.getValue("dragonStone")));
                }
                else
                {
                    global.user.changeValue("caesars", -1);
                    caeNum.text(str(global.user.getValue("caesars")));
                    caeNum1.text(str(global.user.getValue("caesars")));
                }
                result = c.get("result"); //0 - 8
                var rot = 360*6-Degree*result;
                trace("result", c, rot, disk.rotate());
                disk.rotate(180);
                but1.texture("boxbutton2.png");
                but2.texture("boxbutton2.png");

                disk.addaction(expio(rotateby(PopTime, rot)) );
                c_invoke(finishRot, PopTime+200, null);
            }
            else
            {
                lock = 0;
            }
        }
    }
    function finishRot()
    {
        finish = 1;
    }


    function closedialog(node,event,p){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.removefromparent();
        timeisend = 1;
    }
}
