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
        Degree = 360/len(DiskRewards[0]);

        global.timer.addlistener(-1, this);
    }
    var state = 0;
    function paintNode(){
        contextNode = sprite("diskback.jpg", ARGB_8888).anchor(50,50).pos(400,240);
        disk = contextNode.addsprite("dragonDisk.png").anchor(50, 50).pos(274, 225);
        arrow = contextNode.addsprite("dragonhead.png").anchor(50, 50).pos(274, 225);
        disk.rotate(180);


        but1 = contextNode.addsprite("boxbutton1.png").anchor(50,50).pos(685, 151).setevent(EVENT_UNTOUCH, startGame, 0);
        contextNode.addlabel("普通开始", null, 20).anchor(50, 50).pos(695, 151);
        /*

        moneylabel1 = cae.addlabel("",null,30,FONT_BOLD).pos(22,13).color(0,0,0,100);
        moneylabel = cae.addlabel("",null,24,FONT_BOLD).pos(25,16).color(100,100,100,100);
        */

        var stone = but1.addsprite("opbutton27.png").anchor(50, 50).pos(0, 19);
        stoneNum = stone.addlabel(str(global.user.getValue("dragonStone")), null, 26, FONT_BOLD).pos(40, 30).color(0, 0, 0, 100);
        stoneNum1 = stone.addlabel(str(global.user.getValue("dragonStone")), null, 24, FONT_BOLD).pos(40, 30).color(100, 100, 100, 100);



        but2 = contextNode.addsprite("boxbutton4.png").anchor(50, 50).pos(685, 250).setevent(EVENT_UNTOUCH, startGame, 1);
        contextNode.addlabel("特殊开始", null, 20).anchor(50, 50).pos(695, 250);

        var cae = but2.addsprite("caesars_big.png").scale(150).anchor(50, 50).pos(0, 19);
        //22 13 + base
        caeNum = but2.addlabel(str(global.user.getValue("caesars")), null, 26, FONT_BOLD).pos(3+7, 19).color(0, 0, 0, 100);
        caeNum1 = but2.addlabel(str(global.user.getValue("caesars")), null, 24, FONT_BOLD).pos(3+7, 19).color(100, 100, 100, 100);


        contextNode.addsprite("builddialogclose.png").anchor(50, 50).pos(752, 47).setevent(EVENT_UNTOUCH, closedialog);

        contextNode.addsprite("changeDisk.png").pos(713, 404).anchor(50, 50).setevent(EVENT_UNTOUCH, refreshDisk).scale(80);
        showWord = contextNode.addlabel("", null, 20, FONT_NORMAL, 200, 0, ALIGN_LEFT).pos(535, 281).color(100, 0, 0, 100);

    }
    var showWord = null;
    var play = 1;
    function refreshDisk()
    {
        if(lock == 0)
        {
            lock = 1;
            state += 1;
            state %= 3;
            if(state == 0)
            {
                play = 1;
                disk.texture("dragonDisk.png");
                showWord.visible(0);
                but1.texture("boxbutton1.png");
                but2.texture("boxbutton4.png");
            }
            else if(state == 1)
            {

                disk.texture("powDisk.png");
                var nob = global.user.getValue("nobility");
                play = 1;
                showWord.visible(0);
                but1.texture("boxbutton1.png");
                but2.texture("boxbutton4.png");
                if(nob < 3)
                {
                    play = 0;
                    showWord.text("你需要升级到男爵才可以使用战斗力转盘，开启战争模式可以提升爵位！");
                    showWord.visible(1);
                    but1.texture("boxbutton2.png");
                    but2.texture("boxbutton2.png");
                }
                    
            }
            else
            {
                disk.texture("caeDisk.png");
                play = 1;
                nob = global.user.getValue("nobility");
                showWord.visible(0);
                but1.texture("boxbutton1.png");
                but2.texture("boxbutton4.png");
                if(nob < 6)
                {
                    play = 0;
                    showWord.text("你需要升级到子爵才可以使用凯撒币转盘，开启战争模式可以提升爵位！");
                    showWord.visible(1);
                    but1.texture("boxbutton2.png");
                    but2.texture("boxbutton2.png");
                }
            }

            lock = 0;
        }
    }
    var timeisend = 0;
    function timerefresh()
    {   
        if(lock == 1 && finish == 1)
        {
            var rew = DiskRewards[state][result];
            rew = rew.items()[0];
            if(rew[0] != "spe")
            {
                if(rew[0] != "power")
                    global.user.changeValueAnimate2(global.context[0].moneyb, rew[0], rew[1], -2);
                else
                    ChangeSoldier(0, rew[1]);
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
            var showWords = "恭喜你！你得到了"+str(DiskRewards[state][result][1])+global.getStaticString(DiskRewards[state][result][0]);
            global.pushContext(this, new Warningdialog([showWords, DiskShare, 6]), NonAutoPop);

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
            ppy_postnewsfeed(ppy_username()+"正在玩幸运龙盘， 赶快加入奇迹帝国一起玩吧!", ShareURL, null);
            //global.http.addrequest(0,"share",["uid"],[global.userid],global.context[0],"share");
        }
    }
    var finish = 0;
    function startGame(n, e, p, x, y, points)
    {
        var need;
        if(lock == 1 || play == 0)
            return;
        lock = 1;
        if(p == 0)
        {
            need = global.user.getValue("dragonStone")
            if(need < 1)
            {
                global.pushContext(null, new Warningdialog(["抱歉，仙龙石不足！ 可以通过杀怪和开宝箱来免费获得仙龙石。", null, 6]), NonAutoPop);
                lock = 0;
                return;
            }
        }
        else
        {
            need = global.user.getValue("caesars");
            if(need < 1)
            {
                global.pushContext(null, new Warningdialog(["抱歉，凯撒币不足！", null, 6]), NonAutoPop)
                lock = 0;
                return;
            }
        }

        finish = 0;
        kind = p;
        global.http.addrequest(0, "goodsc/startDragon", ["uid", "kind"], [global.userid, state*1000+kind], this, "start");
        but1.texture("boxbutton2.png");
        but2.texture("boxbutton2.png");
        
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


                disk.addaction(expio(rotateby(PopTime, rot)) );
                c_invoke(finishRot, PopTime+200, null);
            }
            else
            {
                lock = 0;
                but1.texture("boxbutton1.png");
                but2.texture("boxbutton4.png");
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
