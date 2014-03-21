//import element.TooManyUser;
//import element.Score;
import element.Rank;
//import element.OldUser;
//import element.Vip;
//import element.Unlock;
import element.MonScore;
//import element.MonRank;
//import element.Invite;
//import element.MonScore;
import element.Rank;
import element.ShipHouse;
import element.Ship;
import element.Trading;
import element.BuildData;
class CastlePage extends ContextObject{
    var lastpoint;
    var centerpoint;
    var lastlength;
    var mode;
    var lastmode;
    var lastcenter;
    
    var pid;
    var menu;
    var topmenu;
    var leftmenu;
    var leftbutton;
    var rightmenu;
    var rightbutton;
    var giftbutton;
    
    var fmenu;
    var fback;
    var newstate;
    var favatar;

    var ub;
    var moneyb;

    var planback0;
    var planback1;

    var select;

    var hidden;
    var hiddentime;
    var flaganimate;
    var flagbird;
    var flagwind;
    
    var flagmove;
    var flagbuild;
    var flagnew;
    var flagfriend;

    var friendlevlabel;
    var friendnamelabel;
    var friendinfolabel;
    var friendmoney;


    var allybutton;
    var friendbutton;
    var medalbutton;
    var blocknode;
    var changes;
    var grounds;
    var map;
    var pagedict;
    var datadict;
    
    var cpid;
    var cuid;
    var ccid;
    var ccard;
    var lock;
    var initlock;

    var cmdlist;
    var reqlist;
    
    var friend;
    var warmap;
    var warpage;
    var box;

    var friendpredict;
    var waitfriend;
    
    var msgbut;
    var fb;
    var inpos = -140;
    var LoadPage;
    var rankYet = 1;

    var monsterNode = null;
    function setMonsterNode(monNode)
    {
        if(monNode != null)
        {
            monsterNode = monNode;
            if(contextNode != null)
                contextNode.add(monsterNode, 1000);
        }
    }
    function clearMonsterNode()
    {
        monsterNode = null;
    }
    function CastlePage(){
        contextname = "page-castle";
        contextNode = null;
        lastpoint = null;
        hiddentime = 10;
        hidden = 0;
        flaganimate = 1;
        flagbird = 0;
        flagwind = 0;
        flagmove = 1;
        flagbuild = 0;
        flagfriend = 0;
        grounds = new Array(0);
        centerpoint = [400,240];
        changes = null;
        lock=0;
        cmdlist = new Array(0);
        reqlist = new Array(0);
        map = new Array(0);
        for(var i=0;i<1600;i++)
            map.append(0);
        datadict = dict();
        friendpredict = dict();
        waitfriend = -1;
        friend = new FriendControl();
        box = new BoxControl();
        cuid=0;
        ccid=0;
        cpid=0;
        flagally=0;
        lastclicktime=0;
        friendmoney=0;
        timeisend=0;
        initlock=0;
        needlock=0;
        global.castalPage = this;
    }

    override function paintNode(){
        contextNode = sprite("800480.jpg",ARGB_8888).size(PAGE_W,PAGE_H).anchor(50,50).pos(400,240);
        setMonsterNode(monsterNode);

        contextNode.addsprite("empirebacklefttop.png").scale(300);
        contextNode.addsprite("empirebackrighttop.png").anchor(100,0).pos(PAGE_W,0).scale(300);
        contextNode.addsprite("empirebackleftbottom.png").anchor(0,100).pos(0,PAGE_H).scale(300);
        rightBottom = contextNode.addsprite("empirebackrightbottom.png").anchor(100,100).pos(PAGE_W,PAGE_H).scale(300);
        contextNode.add(node(),20000,1);
        if(global.system.flagnight==0 && global.system.enableNight){
            contextNode.texture("800480night.jpg");
            contextNode.add(sprite("dark.png").color(6,6,12,40).size(PAGE_W,PAGE_H),0,0);
            contextNode.get(1).color(50,50,60,100);
        }
        contextNode.setevent(EVENT_TOUCH,nodeMoveEvent);
        contextNode.setevent(EVENT_UNTOUCH,nodeMoveEvent);
        contextNode.setevent(EVENT_MULTI_TOUCH,nodeMoveEvent);
        contextNode.setevent(EVENT_MULTI_UNTOUCH,nodeMoveEvent);
        contextNode.setevent(EVENT_MOVE,nodeMoveEvent);
        contextNode.setevent(EVENT_KEYDOWN,keydownevent);
        contextNode.focus(1);
    }

    function buycaesars(n,e){
        hiddentime = 10;
        clearHidden();
        if(global.currentLevel == contextLevel){
            global.pushContext(self,new BuyControl(),NonAutoPop);
        }
    }

    function keydownevent(n,e,p,kc){
        hiddentime=10;
        clearHidden();
        if(kc == 4){
            global.pushContext(self,new Quitdialog(),NonAutoPop);
        }
        else if(kc==82 && flagfriend==0){
            global.pushContext(self,global.system,NonAutoPop);
        }
        return 0;
    }
        

    //get friend of ppy_userid
    function goback(n,e){
        if(friend.flist!=null){
            friend.flagmove=0;
            friend.friendclicked(n,EVENT_UNTOUCH,global.papaId,0);
        }
        else{
            getfriend(global.papaId);
            friend.selectp=global.papaId;
        }
    }

    var flagally;
    function ally(n,e,p){
        if(p != 3){
            global.pushContext(self,new AllyControl(flagally),NonAutoPop);
        }
        else{
            global.pushContext(self,new AllyControl(3),NonAutoPop);
        }
    }

    function gotomedal(){
        global.pushContext(self,new Medaldialog(ccard),NonAutoPop);
    }

    function gotoGift(n,e){
        if(global.currentLevel==0){
            global.pushContext(self,new GiftControl(),NonAutoPop);
        }
    }
    
    function opensendmsg(){
        if(cpid==0){
        }
        else
            global.pushContext(null,new Chatdialog(cuid),NonAutoPop);
    }
    //var actButton;
    //var monButton;
    var tipButton;
    //var moreGames;
    function initialMenu(){
        flagally = 0;
        menu = sprite().size(800,480);
        if(global.system.flagnight==0 && global.system.enableNight == 1){
            menu.color(50,50,60,100);
        }
        else{
            menu.color(100,100,100,100);
        }

        contextNode.parent().add(menu,1);

        
        fmenu = menu.addsprite().visible(0);
        //actButton = menu.addsprite("heart.png").anchor(100, 0).pos(RightMenuAlign, MenuY+MenuDifY).setevent(EVENT_UNTOUCH, showAct).scale(60*100/70, 60*100/70);
        //monButton = menu.addsprite("MonAct.png").anchor(100, 0).pos(RightMenuAlign, MenuY+MenuDifY).setevent(EVENT_UNTOUCH, showMon).scale(60*100/70, 60*100/70);
        //actButton.prepare();
        //moreGames = menu.addsprite("moreGame.png").anchor(100, 0).pos(RightMenuAlign, MenuY+MenuDifY).setevent(EVENT_TOUCH, showMore).scale(60*100/47);

        tipButton = sprite("tips.png").anchor(100, 0).pos(RightMenuAlign, MenuY).setevent(EVENT_UNTOUCH, showTipDia);

        friendbutton = fmenu.addsprite("friendbutton1.png").anchor(100,100).pos(790,470).setevent(EVENT_TOUCH,openfriendmenu,0);
        fback = fmenu.addsprite("planover.png").anchor(100,0).pos(780,10).setevent(EVENT_UNTOUCH,goback);
        var b = fmenu.addsprite("friendboard.png");

        fb = sprite("personboard1.png");
        fmenu.add(fb.pos(inpos,0),-1,-1);
        msgbut = sprite("message.png").anchor(50,50).pos(395,22).setevent(EVENT_UNTOUCH,opensendmsg);
        fb.add(msgbut, 0, 1);
        
        friendlevlabel = b.addlabel("Level 1",null,16).color(0,0,0,100).anchor(50,100).pos(39,80);
        friendnamelabel = b.addlabel(DEFAULT_NAME,null,20).color(0,0,0,100).anchor(0,50).pos(69,20);
        b.add(sprite().anchor(50,50).pos(80,45),1,1);
        friendinfolabel = b.addlabel("",null,14).color(0,0,0,100).anchor(0,50).pos(0,50).pos(95,45);
        friendmoney = 0;
        /*以上要改*/
        allybutton = fmenu.addsprite("bindButton.png").anchor(100,0).pos(780, MenuY).setevent(EVENT_UNTOUCH,ally);
        giftbutton=fmenu.addsprite("giftButton.png").pos(20,280).setevent(EVENT_UNTOUCH,gotoGift);
        medalbutton = fmenu.addsprite("medalIcon.png").pos(20,140).setevent(EVENT_UNTOUCH,gotomedal);
        favatar = b.addsprite().pos(12,8).size(50,50);

        topmenu = menu.addsprite();
        ub = topmenu.addsprite("userboard.png").setevent(EVENT_UNTOUCH,openinputview);
        var expfiller = ub.addsprite("expfiller.png",ARGB_8888).pos(93,40).size(0,0);
        var explabel = ub.addlabel("0/0",null,16).anchor(50,50).pos(152,47).color(0,0,0,100);
        var levellabel = ub.addlabel("Level 1",null,16).color(0,0,0,100).anchor(50,100).pos(39,80);
        var empirelabel = ub.addlabel(DEFAULT_NAME,null,20).color(0,0,0,100).anchor(0,50).pos(69,20);
        global.user.initExp(explabel,expfiller,levellabel,global.user,LEV_EXP);
        global.user.initText("cityname",empirelabel);
        ub.addsprite(avatar_url(global.papaId)).pos(12,8).size(50,50);

        var personb = sprite("personboard1.png");
        var magicbar = personb.addsprite("mana_bar.png").anchor(0, 0).pos(39, 19).size(1, 18);
        var magiclabel = personb.addlabel("0/0", null, 18).anchor(50, 50).pos(83, 29).color(0, 0, 0, 100);
        global.user.initMagic(magiclabel,magicbar);
        var personlabel = personb.addlabel("0",null,18).anchor(50,50).pos(207,29).color(0,0,0,100);
        global.user.initPerson(personlabel,global.user);
        var foodlabel = personb.addlabel("0",null,18).anchor(0,50).pos(294,29).color(0,0,0,100);
        global.user.initText("food",foodlabel);
        personb.add(sprite("personopen.png").anchor(50,50).pos(395,22).scale(-100,100).setevent(EVENT_UNTOUCH,openpersonbar),0,1);
        
        topmenu.add(personb.pos(210,0),-1,1);
        moneyb = menu.addnode().pos(640,43);
        var mb = topmenu.addsprite("moneyboard.png").anchor(100,0).pos(800,0).setevent(EVENT_UNTOUCH,buycaesars);

        mb.addsprite("mail.png").anchor(50, 50).pos(142, 54);

        var moneylabel = mb.addlabel("0",null,18).anchor(0,50).pos(37,16).color(0,0,0,100);
        var caesarslabel = mb.addlabel("0",null,18).anchor(0,50).pos(61,44).color(0,0,0,100);
        global.user.initText("money",moneylabel);
        global.user.initText("caesars",caesarslabel);
        var buy = sprite("buycaesars.png").anchor(100,0).pos(156,61).setevent(EVENT_UNTOUCH,buycaesars);
        mb.add(buy,-1);
        
        leftmenu = menu.addnode().anchor(0,100).pos(-287,470);
        rightmenu = menu.addnode().anchor(100,100).pos(945,470);

        topmenu.add(global.task.enternode.pos(50,250));
        topmenu.add(global.wartask.enternode.pos(50,330));
        menu.add(box.boxbutton);
        box.init(box,global);
        global.user.setValue("godtime",[-1,-1,-1,-1,-1,-1]);
        global.user.setValue("godlevel",[-1,-1,-1,-1,-1,-1]);

        //var loveButton = menu.addsprite("love_in.png").anchor(50, 50).pos(750, 310);
        //loveButton.setevent(EVENT_UNTOUCH, loveShow);
    }
    function showMore()
    {
        openUrl("appfloodpanel", PANEL_BOTTOM);
    }
    function addHeart()
    {
        if(rankYet == 0)
        {
            //rankYet = 1;
            //setRankYet();
            trace("rankHeart", global.userid, cuid);
            useaction("rankHeart", null, null);
            //global.http.addrequest(0, "rankHeart", ["uid", "oid"], [global.userid, cuid], this, "rankHeart");
        }
    }
    function showAct()
    {
        //global.pushContext(null, new Vip(), NonAutoPop);
        //global.pushContext(null, new MonScore(), NonAutoPop);
        global.pushContext(null, new MonScore(), NonAutoPop);
    }
    function showMon()
    {
        global.pushContext(null, new MonScore(), NonAutoPop); 
        //global.pushContext(null, new MonRank(), NonAutoPop);

    }
    function showTipDia(n, e, p, x, y, points)
    {
        global.pushContext(null, new Tip(), NonAutoPop);
    }
    var leftbuttonnum;
    var rightbuttonnum;
    function refreshbuttons(){
        var bs = leftmenu.subnodes();
        var i;
        if(bs!=null){
            for(i=0;i<len(bs);i++){
                bs[i].removefromparent();
            }
        }
        bs = rightmenu.subnodes();
        if(bs!=null){
            for(i=0;i<len(bs);i++){
                bs[i].removefromparent();
            }
        }
        var buttons = [0,1,2,3,4,5,6,7,8,10];
        var buttonname = ["quitbutton.png","menubutton.png","mapbutton.png","planbutton.png","buildbutton.png","rightbutton.png","leftbutton.png","friendbutton1.png","newsbutton.png","medalbutton3.png"];
        rightbuttonnum=4;
        if(global.user.getValue("nobility")>=0){
            buttons.insert(8,9);
            buttonname.insert(8,"friendbutton2.png");
            rightbuttonnum++;
        }
        leftbuttonnum = 6;
        for(i=0;i<leftbuttonnum;i++){
            var button = leftmenu.addsprite("buttonback0.png").anchor(0,100).pos(3+71*i,0);
            var be = sprite(buttonname[i]).anchor(50,50).pos(34,34);
            if(i==5){
                leftbutton = be;
            }
            else if(i==2){
                var nd = button.addnode().anchor(100,100).pos(58,70);
                global.user.initMultiText("battlenum",nd);
            }
            button.add(be,0,1);
            button.setevent(EVENT_TOUCH,menubuttonclicked,buttons[i]);
            button.setevent(EVENT_UNTOUCH,menubuttonclicked,buttons[i]);
        }
        if(leftmenu.pos()[0]!=0){
            leftmenu.pos(-3-71*(leftbuttonnum-2),470);
        }
        else{
            be.rotate(180);
        }
        for(i=0;i<rightbuttonnum;i++){
            button = rightmenu.addsprite("buttonback0.png").anchor(100,100).pos(-71*i-3,0);
            var ri=leftbuttonnum+rightbuttonnum-1-i;
            be = sprite(buttonname[ri]).anchor(50,50).pos(34,34);
            button.add(be,0,1);
            button.setevent(EVENT_TOUCH,menubuttonclicked,buttons[ri]);
            button.setevent(EVENT_UNTOUCH,menubuttonclicked,buttons[ri]);
            if(buttons[ri]==8){
                nd = button.addnode().anchor(100,100).pos(58,70);
                global.user.initMultiText("newgift",nd);
            }
        }
        if(rightmenu.pos()[0]!=800){
            rightmenu.pos(803+71*(rightbuttonnum-1),470);
        }
        else{
            be.rotate(180);
        }
        rightbutton = be;
    }
    
    function openpersonbar(n,e){
        var p = topmenu.get(1).pos();

        if(p[0] == inpos){
            topmenu.get(1).addaction(moveto(200,210,0));
            topmenu.get(1).get(1).addaction(sequence(delaytime(200),scaleto(200,-100,100)));
        }
        else{
            topmenu.get(1).addaction(moveto(200, inpos,0));
            topmenu.get(1).get(1).addaction(sequence(delaytime(200),scaleto(200,100,100)));
        }
    }
    
    function setmovelock(lo){
        if(lo==1){
            planback1.texture("buildyes.png",GRAY);
            planback1.setevent(EVENT_UNTOUCH,null);
            flagbuild=3;
        }
        else{
            planback1.texture("buildyes.png",NORMAL);
            planback1.setevent(EVENT_UNTOUCH,planover,1);
            flagbuild=1;
        }
    }

    function menubuttonclicked(n,e,p){
        hiddentime = 10;
        clearHidden();
        if(global.currentLevel == contextLevel){
            if(e == EVENT_TOUCH){
                n.texture("buttonback1.png");
                return 0;
            }
            else if(e==EVENT_UNTOUCH){
                n.texture("buttonback0.png");
                if(p == 0){
                    global.pushContext(self,new Quitdialog(),NonAutoPop);
                }
                else if(p==1){
                    global.pushContext(self,global.system,NonAutoPop);
                }
                else if(p==2){
                    if(global.flagnew == 0){
                        global.pushContext(self,new WarChoose(),AutoPop);
                    }
                    else{
                        global.pushContext(self,warmap,NonAutoPop);
                    }
                }
                else if(p==3){
                    flagbuild = 1;
                    blocknode.visible(1);
                    changes = new Array(0);
                    for(var i=0;i<len(grounds);i++){
                        if(grounds[i].objectid >0 && grounds[i].objectid<500||grounds[i].objectid>=600&&grounds[i].objectid<700)
                            grounds[i].objnode.stateNode.visible(0);
                        changes.append(grounds[i].posi[0]*RECTMAX+grounds[i].posi[1]);
                    }

                    hideHomeMenu();
                    box.boxbutton.visible(0);

                    lastmode = mode;
                    sizeModeft(mode,PS_MAX);
                    planback0 = menu.addsprite("buildno.png").anchor(100,100).pos(790,470).size(70,70).setevent(EVENT_UNTOUCH,planover,0);
                    planback1 = menu.addsprite("buildyes.png").anchor(100,100).pos(680,470).size(70,70).setevent(EVENT_UNTOUCH,planover,1);
                }
                else if(p==4){
                    global.pushContext(self,new Builddialog(),NonAutoPop);
                }
                else if(p==5){
                    if(leftmenu.pos()[0]==0){
                        leftmenu.addaction(moveto(200,-3-71*(leftbuttonnum-2),470));
                        leftbutton.addaction(sequence(delaytime(200),rotateto(200,0)));
                    }
                    else{
                        leftmenu.addaction(moveto(200,  0,470));
                        leftbutton.addaction(sequence(delaytime(200),rotateto(200,180)));
                        if(rightmenu.pos()[0]==800){
                            rightmenu.addaction(moveto(200,803+71*(rightbuttonnum-1),470));
                            rightbutton.addaction(sequence(delaytime(200),rotateto(200,0)));
                        }
                    }
                }
                else if(p==6){
                    if(rightmenu.pos()[0]==800){
                        rightmenu.addaction(moveto(200,803+71*(rightbuttonnum-1),470));
                        n.get(1).addaction(sequence(delaytime(200),rotateto(200,0)));
                    }
                    else{
                        rightmenu.addaction(moveto(200,800,470));
                        n.get(1).addaction(sequence(delaytime(200),rotateto(200,180)));
                        if(leftmenu.pos()[0]==0){
                            leftmenu.addaction(moveto(200,-3-71*(leftbuttonnum-2),470));
                            leftbutton.addaction(sequence(delaytime(200),rotateto(200,0)));
                        }
                    }
                }
                else if(p==7){
                    openfriendmenu(0,0,1);
                }
                else if(p==9){
                    openfriendmenu(0,0,2);
                }
                else if(p==8){
                    global.pushContext(self,new Infodialog(),NonAutoPop);
                }
                else if(p==10){
                    global.pushContext(null,new Medaldialog(global.card),NonAutoPop);
                }
            }
        }
    }
    
    function buildover(b){
        if(b== 0){
            var c = contextNode.world2node(400,240);
            nodeMove(lastcenter[0]-c[0],lastcenter[1]-c[1]);
            sizeModeft(mode,lastmode);
            changes.deleteContext();
            changes = null;
            flagbuild = 0;
            blocknode.visible(0);
            showHomeMenu();

            for(var i=0;i<len(grounds);i++){
                if(grounds[i].objectid >0&& grounds[i].objectid<500||grounds[i].objectid>=600&&grounds[i].objectid<700)
                    grounds[i].objnode.stateNode.visible(global.system.flagnotice);
            }        
        }
        else {
            var gr = changes.posi[0]*RECTMAX+changes.posi[1];
            var gi=0;
            gi = changes.objectid;
            global.http.addrequest(1,"build",["user_id","city_id","ground_id","grid_id"],[global.userid,global.cityid,gi,gr],self,"build");
        }
    }
    
    function useaction(p,rc,c){
        if(p == "build"){
            buildovertrue(0,rc,c);
        }
        else if(p=="move"){
            moveover(0,rc,c);
        }
        else if(p=="getfriend"){
            getfriendover(json_loads(c));
        }
        else if(p=="getidback"){
            getidback(0,rc,c);
        }
        else if(p=="battlelist"){
            getbattlelist(0,rc,c);
        }
        else if(p=="addnewbattle"){
            addnewbattle(0,rc,c);
        }
        else if(p=="expandover"){
            expandover(0,rc,c);
        }
        else if(p=="receiveover"){
            receiveover(0,rc,c);
        }
        else if(p=="foodlost"){
            var f=json_loads(c).get("foodlost",0);
            if(f>0){
                var cmd=dict();
                cmd.update("name","monsterfood");
                cmd.update("food",f);
                addcmd(cmd);
                global.system.flagrob=1;
            }
        }
        else if(p=="share" && json_loads(c).get("id")==1){
            global.user.changeValueAnimate2(moneyb,"money",100,-6);
        }
        else if(p=="levelup"){
            levelup(0,rc,c);
        }
        else if(p=="addprefriend"){
            if(len(friendpredict)>5){
                friendpredict.clear();
            }
            f = json_loads(c);
            friendpredict.update(int(f.get("id")),f);
        }
        else if(p=="getmypets"){
            var data=json_loads(c);
            if(data.get("id")==1){
                var pets = data.get("pets");
                for(var i=0;i<len(pets);i++){
                    var draBuild = getobjectby(pets[i][2]/RECTMAX,pets[i][2]%RECTMAX);
                    if(draBuild != null)
                        draBuild.loadpets(pets[i]);
                }
            }
        }
        else if(p == "addmana"){
            data = json_loads(c);
            trace("mana", data);
            var now = time();
            if(data.get("id") == 1)
            {   
                trace("add mana");
                var mana = data.get("mana");
                var boundary = data.get("boundary");
                global.user.setValue("mana", mana);
                global.user.setValue("boundary", boundary);
                global.user.setValue("manatime", now);
            }
            else
            {
                global.user.setValue("manatime", now);
            }
            addManaLock = 0;
        }
        else if(p == "changeBoundary")
        {
            changeBoundary();
        }
        else if(p == "rankHeart")
        {
            f = global.getfriend(cpid);
            global.pushContext(this, new Warningdialog(["If "+f.get("empirename")+" is beautiful, you can give "+f.get("name")+" scores. You can only give 1 score to the same friend per day.", RankFri, 4]), NonAutoPop);

        }
        else if(p == "rankHeartFin")
        {
            setRankYet();
        }
        else if(p == "getCode")
        {
            if(rc != 0)
            {
                c = json_loads(c);
                global.user.inviteCode = c.get("code");
                //global.pushContext(null, new LoginInvite(), NonAutoPop);
            }
        }
        else if(p == "getMyResult")
        {
            if(rc != 0)
                addMonResult(json_loads(c).get("res")); 
        }
        else if(p == "getRewardOver")
        {
            if(rc != 0)
            {
                trace("getRewardOver", c);
                c = json_loads(c);
                var dragonNum = c.get("dragonNum");
                var monNum = c.get("monNum");
                //if(dragonNum > 0)
                addcmd(dict([["name", "notice"], ["dragonNum", dragonNum], ["monNum", monNum]])); 
            }
        }
    }
    var monsterResult = [];
    function addMonResult(res)
    {
        trace("addMonResult", res);
        monsterResult += res; 
    }
    
    function levelup(r,rc,c){
        if(rc!=0){
            var data = json_loads(c);
            var tid = data.get("task",-1);
            if(tid>-1 && global.task.tasktype == -1){
                global.task.inittask(tid,0);
            }
            data.update("level", global.user.getValue("level"))
            addcmd(dict([["name","levup"], ["data", data]]));
        }
    }

    function buildovertrue(r,rc,c){
        if(rc==0 || json_loads(c).get("id")<=0)
            buildover(0);
        else{
            var ctpos = contextNode.world2node(400,240);
            if(changes.objectid<500&&changes.objectid !=0 || changes.objectid>=600){
                changes.objnode.beginbuild();
                changes.objnode.setstate();
                flagbuild = 0;
                blocknode.visible(0);

                showHomeMenu();

                for(var i=0;i<len(grounds);i++){
                    if(grounds[i].objectid >0&& grounds[i].objectid<500 || grounds[i].objectid >= 600 && grounds[i].objectid <= 700 )
                        grounds[i].objnode.stateNode.visible(global.system.flagnotice);
                }
                nodeMove(lastcenter[0]-ctpos[0],lastcenter[1]-ctpos[1]);
                sizeModeft(mode,lastmode);
                changes.flagnew = 0;
                grounds.append(changes);
                changes = null;
            }
            else{
                var p = OBJ_PRICE[changes.objectid-500];
                var add = OBJ_PERSON[changes.objectid-500];
                var cost = dict();
                if(p<0){
                    global.user.changeValueAnimate(changes,"caesars",p,2);
                    cost.update("caesars",-p);
                }
                else{
                    global.user.changeValueAnimate(changes,"money",-p,2);
                    cost.update("money",p);
                }
                if(add > 0)
                    global.user.changeValueAnimate(changes,"personmax",add,0);
                else
                {
                    add = -add;
                    global.user.changeValueAnimate(changes,"boundary",add,0);
                    //global.user.changeValue("boundary", add);
                    /*
                    for(var i = 0; i < add; i++)
                        global.http.addrequest(1,"changeboundary",["userid"],[global.userid],self,"changeBoundary");
                    */
                }   
                
                changes.flagnew = 0;
                grounds.append(changes);
                lastcenter = [ctpos[0],ctpos[1]];
                ctpos[0] = ctpos[0]-PBX-4;
                ctpos[1] = ctpos[1]-PBY+33;
                var flagoff = 0;
                var cid = changes.contextid;
                var posx = (ctpos[0]+2*ctpos[1])/62+cid/2;
                var posy = (-ctpos[0]+2*ctpos[1]-2*posx)/68+cid/2;
                if(posx<cid-1){
                    flagoff = 1;
                    posx = cid-1;
                }
                else if(posx >= global.rect){
                    flagoff = 1;
                    posx = global.rect-1;
                }
                if(posy<cid/1000-1){
                    flagoff = 1;
                    posy = cid-1;
                }
                else if(posy >= global.rect){
                    flagoff = 1;
                    posy = global.rect-1;
                }
                var obj = new NormalObject(changes.objectid,posy,posx);
                obj.flagnew = 1;
                obj.init(obj, global);
                obj.getNode();
                obj.resetgrid();
                changes = obj;
                if(global.user.testCost(cost)==0){
                    buildover(0);
                }
            }
        }
    }
    
    function planover(n,e,p){
        flagbuild = 0;
        blocknode.visible(0);
        var flagmoved = 0;
        var movestring = str(global.cityid);
        sizeModeft(mode,lastmode);
        if(p==0){
            moveover(0,0,0);
            return 0;
        }

        for(var i=0;i<len(grounds);i++){
            if(grounds[i].posi[0]*RECTMAX+grounds[i].posi[1] != changes[i]){
                if(flagmoved == 0)
                    movestring = movestring+":";
                else
                    movestring = movestring+";";
                flagmoved = 1;
                movestring = movestring+str(changes[i])+","+str(grounds[i].posi[0]*RECTMAX+grounds[i].posi[1]);
            }
            else changes[i] = -1;
        }
        if(flagmoved == 1){
            global.http.addrequest(1,"move",["movestring"],[movestring],self,"move");
        }
        else
            moveover(0,0,0);
    }

    function moveover(r,rc,c){
        if(rc==0 || json_loads(c).get("id")==0){
            for(var i=0;i<len(changes);i++){
                if(changes[i] != -1){
                    grounds[i].changemap(0);
                    grounds[i].flagnew =0;
                    grounds[i].posi = [changes[i]/RECTMAX,changes[i]%RECTMAX];
                    grounds[i].resetgrid();
                }
            }
            for(i=0;i<len(changes);i++){
                if(changes[i]!=-1){
                    grounds[i].changemap(1);
                }
            }
        }
        for(i=0;i<len(grounds);i++){
            if(grounds[i].objectid >0&& grounds[i].objectid<500||grounds[i].objectid>=600&&grounds[i].objectid<700)
                grounds[i].objnode.stateNode.visible(global.system.flagnotice);
        }
        showHomeMenu();

        box.setbox(-1,0,0);
        planback0.removefromparent();
        planback0 = null;
        planback1.removefromparent();
        planback1 = null;
    }

    function entermap(n,e){
        trace("enter map page");
        hiddentime =10;
        clearHidden();
        if(contextLevel >= global.currentLevel){
            spriteManager.getWar();
        }
    }

    function openfriendmenu(n,e,p){
        hiddentime = 10;
        clearHidden();
        friend.openfriendmenu(p);
        friendbutton.texture("friendbutton"+str(friend.friendmode)+".png");
    }
    
    var curFriend = -1;
    function getfriend(p){
        trace("getfriend", p);
        curFriend = p;
        hiddentime =10;
        clearHidden();
        if(p==null||p == cpid){
            return 0;
        }
        else{
            pushdata();
            //visit yet!
            if(pagedict.get(p,null)!=null){
                self.pause();
                cpid = p;
                popdata();
                pausepos = pagedict.get(cpid);
                if(p==global.papaId){//back
                    flagfriend = 0;
                    showHomeMenu();
                    //actButton.texture("heart.png");

                    fmenu.visible(0);
                }
                else{//go to friend
                    flagfriend = 1;
                    fmenu.visible(1);
                    trace("remove Down Icon");
                    //spriteManager.removeDownIcon();
                    if(cpid==0){
                        favatar.texture("avatar_caesar.png");
                        //msgbut.removefromparent();
                    }
                    else{
                        favatar.texture(avatar_url(cpid));

                    }
                    var f=global.getfriend(cpid);
                    friendlevlabel.text("Level "+str(f.get("level")));
                    friendnamelabel.text(f.get("empirename"));
                    if(ccard[12]<0){
                        friendinfolabel.parent().get(1).texture("money_big.png").size(25,25);
                        friendinfolabel.text(str(friendmoney));
                    }
                    else{
                        friendinfolabel.parent().get(1).texture("nobi"+str(ccard[12]%100)+".png").size(25,25);
                        friendinfolabel.text(NOBNAME[ccard[12]%100]);
                    }
                    f.update("nob", ccard[12]%100);
                    hideHomeMenu();
                    
                    /*
                    if(cpid != 0)
                        actButton.visible(1);

                    actButton.texture("heartPlus.png");//add Heart to Friend
                    */
                }
                box.setbox(-1,0,0);
                self.resume();
                initlock=-1;
                delayresume();
                return 0;
            }
            
            if(p!=global.papaId){//not visit yet
                pid = p;
                global.flock();
                needlock=1;
                if(friendpredict.get(p)!=null){
                    waitfriend = p;
                }
                else{
                    trace("getfriend", global.userid, p, 0);
                    global.http.addrequest(0,"getfriend",["userid","otherid","user_kind"],[global.userid,p,0],self,"getfriend");
                }
            }
        }
    }

    function pushdata(){
        if(datadict.get(cpid)==null&&len(datadict)>1){
            var items = datadict.items();
            var mtime=null;
            var mi=-1;
            for(var i=0;i<len(datadict);i++){
                if(items[i][0] != global.papaId)
                {
                //if(items[i][0]!=global.papaId&&(mtime==null||items[i][1][10]<mtime)){
                    mtime = items[i][1][10];
                    mi = items[i][0];
                    break;
                }
            }
            datadict.pop(mi);
            pagedict.pop(mi);
        }

        var data = new Array(grounds,ccard,box.helpperson,box.maxperson,box.boxfriends,flagally,map,cuid,ccid,friendmoney,time(),mode, rankYet);
        datadict.update(cpid,data);
        pagedict.update(cpid,contextNode.pos());
    }

    function popdata(){
        var data = datadict.get(cpid);
        rankYet = data[12];
        trace("pop Rank Yet", rankYet);
        grounds = data[0];
        box.helpperson = data[2];
        box.maxperson = data[3];
        box.boxfriends = data[4];
        box.setbox(-1,0,0);
        if(box.boxbutton.visible() != 0){
            giftbutton.pos(20,280);
        }
        else{
            giftbutton.pos(20,210);
        }
        if(cpid==0){
            giftbutton.pos(-200,210);
        }
        if(cpid==0||global.user.getValue("nobility")<0){
            allybutton.visible(0);
        }
        else{
            allybutton.visible(1);
        }
        flagally = data[5];
        map = data[6];
        cuid = data[7];
        ccid = data[8];
        friendmoney = data[9];
        ccard = data[1];
        mode = data[11];
        if(flagally == 1)
            allybutton.texture("unbindButton.png",UPDATE_SIZE);
        else
            allybutton.texture("bindButton.png",UPDATE_SIZE);
    }
    function addprefriend(p){
        if(p==null||p==global.papaId||friendpredict.get(p)!=null||global.ppyuserdict.get(str(p))==null){
            return 0;
        }
        friendpredict.update(p,1);
        global.http.addrequest(0,"getfriend",["userid","otherid","user_kind"],[global.userid,p,0],self,"addprefriend");
    }
    //main Home Menu
    function showHomeMenu()
    {
        topmenu.visible(1);
        leftmenu.visible(1);
        rightmenu.visible(1);
        //actButton.visible(1);
        //monButton.visible(1);
        //moreGames.visible(1);
        //actButton.texture("heart.png");
        //actButton.setevent(EVENT_UNTOUCH, showAct);

        tipButton.visible(1);
        spriteManager.showDownIcon();
    }
    function hideHomeMenu()
    {
        topmenu.visible(0);
        leftmenu.visible(0);
        rightmenu.visible(0);
        //actButton.visible(0);
        //monButton.visible(0);
        //moreGames.visible(0);
        /*
        if(rankYet == 0)
            actButton.texture("heartPlus.png");
        else 
            actButton.texture("heartPlus.png", GRAY);
        actButton.setevent(EVENT_UNTOUCH, addHeart);
        */

        tipButton.visible(0);
        spriteManager.hideDownIcon();
    }


    //var data = new Array(grounds,ccard,box.helpperson,box.maxperson,box.boxfriends,flagally,map,cuid,ccid,friendmoney,time(),mode, rankYet);
    function setRankYet()
    {
        trace("rankYet");
        rankYet = 1;
        //actButton.texture("heartPlus.png", GRAY); 
        var fri = datadict.get(cpid);

        if(fri != null)
        {
            fri[12] = 1;        
        }
        //friendpredict.update(int(f.get("id")),f);
        fri = friendpredict.get(cpid);
        if(fri != null)
        {
            fri["rankYet"] = 1;
        }
    }
    function getfriendover(data){
        /*
        var fitems = friendpredict.items();
        if(len(fitems) >= 2)
        {
            friendpredict.pop(fitems[0][0]);
        }
        trace("perFri len", len(fitems));
        friendpredict.update(pid,data);

        */
        //friendpredict.update(pid,data);
        //if(friend.flist!=null && friend.friendmode==1){
            /*
            for(var fi=friend.selectf+1;fi<friend.selectf+2&&fi<friend.flength;fi++){
                if((fi-2) >= len(friend.flist1))
                    continue;
                addprefriend(friend.flist1[fi-2].get("id"));
            }
            */
        //}
        trace("rankYet", rankYet);
        rankYet = data.get("rankYet", 0); 
        //trace("first rank", rankYet, data);
        cpid = int(data.get("id"));
        cuid = data.get("frienduserid");
        ccid = data.get("city_id");
        self.pause();
        mode=0;
        paintNode();
        menu.parent().add(contextNode,0);
        flagfriend = 1;
        fmenu.visible(1);
        if(cpid==0){
            favatar.texture("avatar_caesar.png");
            fb.removefromparent();
        }
        else{
            favatar.texture(avatar_url(cpid));
            if(fb.parent() == null)
                fmenu.add(fb.pos(inpos,0),-1,-1);
        }
        pagedict.update(cpid,contextNode.pos());
        var f = global.getfriend(cpid);

        friendlevlabel.text("Level "+str(f.get("level")));
        var ename = data.get("empirename");
        friendnamelabel.text(ename);
        friendmoney = data.get("money");
        f.update("empirename",ename);
        
        hideHomeMenu();
        /*
        if(cpid != 0)
            actButton.visible(1);
        if(rankYet == 1)
        {
            actButton.texture("heartPlus.png", GRAY); 
        }
        */
        map = new Array(0);
        for(var k=0;k<1600;k++) map.append(0);
        var objs = data.get("stri").split(";");
        var btime = data.get("time");
        var cityid = data.get("city_id",0);
        grounds = new Array(0);
        if(btime <0) btime = 16100000;
        var minusstr = data.get("minusstr","");
        ccard = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
        var cardstr = data.get("monsterdefeat","-1;0;0;0;0;0;0;0;0;0;0;0");
        var cards = cardstr.split(";");
        for(k=0;k<12 && k<len(cards);k++){
            ccard[k]=int(cards[k]);
        }
        var ecard = data.get("cardlist",[]);
        if(ecard==null){
            ecard=[];
        }
        for(k=0;k<len(ecard);k++){
            ccard[13+k] = ecard[k];
        }
        ccard[13] = ccard[13]+data.get("loginNum",0)*1000;
        if(data.get("nobility",-1)<0){
            ccard[12] = -1;
        }
        else{
            ccard[12] = data.get("nobility")*3+data.get("casubno",0)+100*data.get("sub",1);
        }
        if(ccard[12]<0){
            friendinfolabel.parent().get(1).texture("money_big.png").size(25,25);
            friendinfolabel.text(str(friendmoney));
        }
        else{
            friendinfolabel.parent().get(1).texture("nobi"+str(ccard[12]%100)+".png").size(25,25);
            friendinfolabel.text(NOBNAME[ccard[12]%100]);
        }
        f.update("nob", ccard[12]%100);

        var state2dict = dict();
        if(minusstr != ""){
            var minus = minusstr.split(";");
            for(var i=0;i<len(minus);i++){
                if(minus[i]==""){
                    continue;
                }
                var minu = minus[i].split(",");
                state2dict.update(int(minu[1]),int(minu[0]));
            }
        }
        for(var x=0;x<len(objs);x++){
            var objdata = objs[x].split(",");
            if(len(objdata)!=5||objdata[4]==""){
                continue;
            }
            var gid = int(objdata[0]);
            if(gid == -1)
                continue;
            var g = int(objdata[1]);
            i = g/RECTMAX;
            var j = g%RECTMAX;
            var s = new NormalObject(gid,i,j);
            s.init(s,global);
            grounds.append(s);
            if(gid == 0)
            {
                s.empireLevel = int(objdata[2]);
            }
            if(gid>0 && gid < 500||gid>=600){
                var objid = int(objdata[2]);
                var time = int(objdata[3]);
                var finish = int(objdata[4]);
                var KindID = gid/100;

                var state;
                if(time == 0){
                    state = FINISH_BUILDING;
                }
                else if(finish == 0){
                    state = BUILDING;
                }
                else {
                    if(KindID == DISK)
                        state = FINISH_BUILDING;
                    else
                        state = WORKING;
                }
                if(gid>=1000&&gid<1100){
                    state=0;
                    objid=-1;
                    time=btime;
                    global.http.addrequest(0,"getPets",["uid","cid"],[cuid,ccid],self,"getmypets");
                }
                else if(gid<600 || KindID == DISK){
                    if(gid==424&&ccard[18]==0){
                        ccard[18]=1;
                    }
                    gid=gid%100;
                }
                s.objnode.loaddata(state,gid,objid,btime-time);
                s.objnode.state2 = state2dict.get(g,0);
            }
            else if(gid == 0){
                var cp = contextNode.node2world(PBX+i*(-34)+j*30,PBY-181+i*17+j*16);
                nodeMove(400-cp[0],240-cp[1]);
            }
        }
        box.maxperson = data.get("treasurenum",0);
        if(box.maxperson<=0){
            box.helpperson = 0;
            box.boxfriends = [];
            giftbutton.pos(20,210);
        }
        else{
            var persons = data.get("friends","");
            if(persons==""){
                box.helpperson = 0;
                box.boxfriends = [];
            }
            else{
                box.boxfriends = persons.split(";");
                box.helpperson = len(box.boxfriends);
            }
            giftbutton.pos(20,280);
        }
        box.setbox(-1,0,0);
        if(cpid==0){
            giftbutton.pos(-200,210);
        }
        if(cpid==0||global.user.getValue("nobility")<0){
            allybutton.visible(0);
        }
        else{
            allybutton.visible(1);
        }
        if(friend.flist2.index(cpid)==-1){
            allybutton.texture("bindButton.png",UPDATE_SIZE);
            flagally = 0;
        }
        else{
            allybutton.texture("unbindButton.png",UPDATE_SIZE);
            flagally = 1;
        }
        var visitn = data.get("visited");
        data.update("visited",1);
        trace("visited", data.get("visited"), data.get("corn"));
        if(visitn==0){
            visitn = data.get("corn",0);
            global.pushContext(self,new Visitreward(visitn),NonAutoPop);
        }
        if(ccard[18]>1000){
            ccard[18]=ccard[18]%10+1;
        }
        if(ccard[18]==4 && f.get("level")>=40){
            ccard[18]=5;
        }
        if(int(sysinfo(21))>=5){
            system_gc();
        }
        c_invoke(delayresume,200,null);
    }

    function openinputview(n,e){
        hiddentime = 10;
        clearHidden();
        if(contextLevel >= global.currentLevel){
            global.pushContext(self,new TestInputControl(),NonAutoPop);
        }
    }

    function sizeModeftAnimate(){
        /*var mcenter = contextNode.pos();
        var cp = contextNode.world2node(400,240);
        var cp2 = contextNode.node2world(cp[0],cp[1]);
        nodeMove(400-cp2[0],240-cp2[1]);*/
        if(mode<=20){
            sizeModeft(mode,50);
        }
        else{
            sizeModeft(mode,0);
        }
    }

    function sizeWithMode(){
        var cp = contextNode.world2node(400,240);
        contextNode.scale(100+mode);
        if(changes != null &&  type(changes)!=2)
            changes.statenode.scale(15000/(100+mode));
        var cp2 = contextNode.node2world(cp[0],cp[1]);
        nodeMove(400-cp2[0],240-cp2[1]);
    }

    var lastclicktime;
    function nodeMoveEvent(node,event,param,x,y,points){
        hiddentime = 10;
        clearHidden();
        if(contextLevel >= global.currentLevel){
            if(event == EVENT_TOUCH){
                lastpoint = contextNode.node2world(x,y);
            }
            else if(event == EVENT_MULTI_TOUCH){
                var p0 = points.get(0);
                var p1 = points.get(1);
                lastlength = sqrt((p0[0]-p1[0])*(p0[0]-p1[0])+(p0[1]-p1[1])*(p0[1]-p1[1]));
                lastpoint = contextNode.node2world((p0[0]+p1[0])/2,(p0[1]+p1[1])/2);
            }
            else if(event == EVENT_MULTI_UNTOUCH){
                if(len(points)==3){
                    var flg = 1-points.get(-1);
                    var pl = points.get(flg);
                    lastpoint = contextNode.node2world(pl[0],pl[1]);
                }
            }
            else if(event == EVENT_UNTOUCH){
                if(lastclicktime!=0 && time()-lastclicktime<400){
                    lastclicktime=0;
                    sizeModeftAnimate();
                }
                else{
                    lastclicktime = time();
                }
            }
            else if(event == EVENT_MOVE){
                if(points==null || len(points) != 3){
                    var point = contextNode.node2world(x,y);
                    var i = point[0]-lastpoint[0];
                    var j = point[1]-lastpoint[1];
         
                    nodeMove(i,j);
                    lastpoint = point;
                }
                else{
                    p0 = points.get(0);
                    p1 = points.get(1);/*
                    if(flagmove == 0){
                        lastlength = sqrt((p0[0]-p1[0])*(p0[0]-p1[0])+(p0[1]-p1[1])*(p0[1]-p1[1]));
                        lastpoint = contextNode.node2world((p0[0]+p1[0])/2,(p0[1]+p1[1])/2);
                        centerpoint = lastpoint;
                        flagmove = 1;
                        return 0;
                    }*/
                    point = contextNode.node2world((p0[0]+p1[0])/2,(p0[1]+p1[1])/2);
                    nodeMove(point[0]-lastpoint[0],point[1]-lastpoint[1]);
                    lastpoint = point;
                    var length = sqrt((p0[0]-p1[0])*(p0[0]-p1[0])+(p0[1]-p1[1])*(p0[1]-p1[1]));
                    //if(length < lastlength - 30 ||length > lastlength + 30){
                    var pm = length*(100+mode)/lastlength;
                    sizeModeft(mode,pm-100);
                    //}
                }
            }
        }
    }

    function nodeMove(x,y){
        var s = contextNode.size();
        var c1 = contextNode.node2world(0,0);
        var c2 = contextNode.node2world(s[0],s[1]);
        if(c1[0]+x >0)
            x = -c1[0];
        if(c1[1] + y>0)
            y = -c1[1];
        if(c2[0]+x<800)
            x = 800-c2[0];
        if(c2[1]+y<480)
            y = 480-c2[1];
        contextNode.addaction(imoveby(x,y));
    }

    function initialFactorys(page){
        LoadPage = page;
        page.put(10);
        blocknode = contextNode.addnode().visible(0);
        cpid = global.papaId;
        pagedict = dict();
        pagedict.update(cpid,contextNode.pos());
        initlock = 1;
        //global.papaId = global.papaId;
        if(global.papaId == 0)
        {
            ppy_login();
        }
        global.http.addrequest(0,"logsign",["papayaid","user_kind","md5"],[global.papaId, 1,md5(str(global.papaId)+"-0800717193")],self,"getidback");
    }

    var getImageYet = 0;
    var imageUrl = null;
    var packageDownload = null;
    var toIdentifier = null;
    function finGetImage(rid, rcode, con)
    {
        trace("finGetImage", rid, rcode, con);
        if(rcode == 0)
            return;

        con = json_loads(con);
        trace("finGet", con.get("toIdentifier"), con.get("toImageUrl"), con.get("toPackageDownloadLink"));

        imageUrl = con.get("toImageUrl");
        packageDownload = con.get("toPackageDownloadLink");
        toIdentifier = con.get("toIdentifier");
        getImageYet = 1;
    }
    function getImageAndUrl()
    {
        var did = sysinfo(31);
        trace("deviceId", did);
        did = md5(did);
        http_request("http://connect.papayamobile.com:8080/xpromt/apple/requestInfo?userid="+did+"&fromIdentifier=com.papaya.miracle1", finGetImage);
    }

    var statestr="";
    var week = -1;
    var getBonus = 0;
    function getMonResult()
    {
        global.http.addrequest(0, "monsterc/getMyResult", ["uid"], [global.userid], this, "getMyResult");
    }
    var busiMonster;
    function getidback(r,rc,c){
        if(rc != 0){

            //getImageAndUrl();
            var data = json_loads(c);
            global.userid = data.get("id",0);
            cuid = global.userid;
            if(global.userid == 0){
                quitgame();
            }
            getMonResult();
            busiMonster = new BusiMonster(this);
            busiMonster.updateData();

            global.user.prepareCode(this);
            newstate = data.get("newstate",3);
            week = data.get("week");

            if(newstate < 3)
                global.InNew = 1;
            else
                global.InNew = 0;
            LoadPage.put(newstate);
            LoadPage = null;


            if(data.get("ppyname")!=ppy_username()){
                global.http.addrequest(0,"updateppyname",["uid","ppyname"],[global.userid,ppy_username()],self,"nothing");
            }
            global.task.inittask(data.get("task"),data.get("taskstring"));
            global.wartask.initwartask(data.get("wartask",-1),data.get("wartaskstring",0));
            global.cityid = data.get("city_id",0);
            ccid = global.cityid;

            var btime = data.get("time",190000000);

            global.user.setValue("mana", data.get("mana", 0));
            global.user.setValue("boundary", data.get("boundary", 0));
            global.user.setValue("catapult", data.get("catapultnum", 0)); 
            global.user.setValue("actFood", data.get("actFood", 0));



            var diff = btime - data.get("lasttime", 0);
            var now = time() - diff*1000;
            global.user.setValue("manatime", now);//btime serverTime  time()/1000 clientTime
            trace("mana", global.user.getValue("mana"));
            trace("manatime", global.user.getValue("manatime"));



            global.user.setValue("caesars",data.get("cae",0));
            global.user.setValue("citydefence",data.get("citydefence",0));
            

            global.user.setValue("person",data.get("population",570));
            global.user.setValue("labor",data.get("labor_num",390));
            global.user.setValue("personmax",data.get("popupbound", 1500));
            var goods = data.get("goods", dict());
            goods = goods.get("0", 0);
            global.user.setValue("dragonStone", goods)
            global.allymax = data.get("allyupbound",1);
            if(newstate<3){
            	global.user.setValue("nobility",-3);
                setShotScreen();
          	}
          	else{
            	global.user.setValue("nobility",data.get("nobility",-1)*3+data.get("subno",0));
                addcmd(dict([["name","notice"]]));
            }

            var landkind =  data.get("landkind",0);
            global.user.setValue("cityname",data.get("empirename",DEFAULT_NAME));
            global.user.setValue("stone",data.get("stone",0));
            global.user.setValue("wood",data.get("wood",0));
            global.rect = 20+2*landkind;
            global.soldiers[0]=data.get("infantrypower",0);
            global.soldiers[1]=data.get("cavalrypower",0);
            global.soldiers[2]=data.get("scout1_num",0);
            global.soldiers[3]=data.get("scout2_num",0);
            global.soldiers[4]=data.get("scout3_num",0);
            CheckSoldiers();
            global.card = range(0, 21);//21 card
            for(var ccount = 0; ccount < len(global.card); ccount++)
                global.card[ccount] = 0;
            //[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
            var cardstr = data.get("monsterdefeat","0;0;0;0;0;0;0;0;0;0;0;0");
            var cards = cardstr.split(";");
            for(var k=0;k<12&&k<len(cards);k++){
                global.card[k]=int(cards[k]);
            }
            var ecard = data.get("cardlist",[]);
            if(ecard==null){
                ecard=[];
            }
            if(global.user.getValue("nobility")<0){
                global.card[12]=-1;
            }
            else{
                global.card[12] = global.user.getValue("nobility")+100*data.get("sub",0);
            }
            for(k=0;k<len(ecard);k++){
                global.card[13+k] = ecard[k];
            }
            ccard = global.card;
            ccard[13] = ccard[13]+data.get("loginNum",0)*1000;
            global.user.setValue("food",data.get("food",0));
            var moneyN = data.get("corn", 0);
            //money too much just ignore part
            if(moneyN < 0)
                moneyN = MAX_INT;
            global.user.setValue("money", moneyN);
            global.user.setValue("exp",data.get("exp",0));
            if(data.get("lev",1)<global.user.getValue("level")){
                global.http.addrequest(0,"levup",["uid","lev"],[global.userid,global.user.getValue("level")],self,"levelup");
            }

            global.mapid = data.get("map_id",0);
            var godtimestr = ["foodgodtime","populationgodtime","wealthgodtime","wargodtime"];
            var block = sprite("grid20.png");
            for(var i=0;i<2;i++){
                for(var j=0;j<2;j++){
                    blocknode.add(block.copy().anchor(53,0).pos(PBX+4+(i*(-34)+j*30)*2*landkind,PBY-33+(i*17+j*16)*2*landkind),0,i*2+j);
                }
            }
            var minusstr = data.get("minusstr","");
            var state2dict = dict();
            if(minusstr != ""){
                var minus = minusstr.split(";");
                for(i=0;i<len(minus);i++){
                    if(minus[i]==""){
                        continue;
                    }
                    var minu = minus[i].split(",");
                    state2dict.update(int(minu[1]),int(minu[0]));
                }
            }
            var spec = data.get("specialgoods","a,0;b,0;c,0;d,0;e,0;f,0;g,0;h,0;i,0;j,0;k,0;l,0").split(";");
            global.special = new Array(12);
            for(i=0;i<12;i++){
                var spec1 = spec[i].split(",");
                global.special[ord(spec1[0])-97] = int(spec1[1]);
            }
                if(global.user.getValue("level")>=3){
                    var db = c_opendb(1,"friendnew");
                    if(db.get("new")==null||db.get("new")<NEWFLAG){
                        global.flagshownew=1;
                        db.put("new",NEWFLAG);
                        //addcmd(dict([["name","notice"]]));
                    }
                }
            var objs = data.get("stri","0,370,0,0,0").split(";");
            global.inittimer(btime);


            var hour=btime%86400/3600;
            if(hour<6||hour>=20){
                global.system.flagnight=0;
                if(global.system.enableNight)
                {
                    menu.color(50,50,60,100);
                    if(contextNode.get(0)==null){
                        contextNode.add(sprite("dark.png").color(6,6,12,40).size(PAGE_W,PAGE_H),0,0);
                    }
                    contextNode.texture("800480night.jpg");
                    contextNode.get(1).color(50,50,60,100);
                }
            }
            else{
                global.system.flagnight=1;
                menu.color(100,100,100,100);
                contextNode.texture("800480.jpg");
                contextNode.get(1).color(100,100,100,100);
                contextNode.remove(0);
            }

            var ship = data.get("ship", [0, 0, 0, 0, 0]);//state startTime, timeNeed , goodsKind, num
            var dock = new ShipHouse(ship);
            contextNode.add(dock.bg);

            //groundid gridid objectid producttime finish
            for(var x=0;x<len(objs);x++){
                var objdata = objs[x].split(",");
                if(len(objdata)!=5||objdata[4]==""){
                    continue;
                }
                var gid = int(objdata[0]);
                if(gid == -1)
                    continue;
                var g = int(objdata[1]);
                i = g/RECTMAX;
                j = g%RECTMAX;
                // ground_id grid_id object_id, producttime finish
                var s = new NormalObject(gid,i,j);
                s.init(s,global);

                grounds.append(s);
                var objid;
                var time;
                var finish;
                objid = int(objdata[2]);
                time = int(objdata[3]);
                finish = int(objdata[4]);
                if(gid/100 ==  DISK)
                {
                    global.user.setValue("hasDisk", 1);
                }
                if(gid == CASTAL)
                {
                    s.empireLevel = objid;
                    var cp = contextNode.node2world(PBX+i*(-34)+j*30,PBY-181+i*17+j*16);
                    nodeMove(400-cp[0],240-cp[1]);
                }
                else if(gid/100 != DECORATION){//not decoration
                    if(gid/100 == GOD){//god
                        if(gid<420){
                            objid=0;
                            if(finish != 0){
                                time = btime;
                                global.user.setValueInArray("godtime",gid%4,data.get(godtimestr[gid%4],0));
                            }
                            else{
                                global.user.setValueInArray("godtime",gid%4,0);
                            }
                            global.user.setValueInArray("godlevel",gid%4,gid%100/4);
                        }
                        else{
                            var ttt=[3600,21600,86400];
                            if(time==0){
                                global.user.setValueInArray("godtime",(gid-400)/5,0);
                            }
                            else{
                                if(finish==0){
                                    global.user.setValueInArray("godtime",(gid-400)/5,0);
                                }
                                else{
                                    var tttt=ttt[objid]+time-btime;
                                    if(tttt<0) tttt=0;
                                    global.user.setValueInArray("godtime",(gid-400)/5,tttt);
                                    time=btime;
                                }
                            }
                            global.user.setValueInArray("godlevel",(gid-400)/5,(gid-420)%5);
                        }
                    }
                    //state 0 1 2 3 4
                    //0  1 building 2 finishBuilding 3 working 4 harvest enabled
                    var state;
                    if(time == 0 && finish == 1 ){//finish Building 
                        state = FINISH_BUILDING;
                    }
                    else if(finish == 0)
                        state = BUILDING;
                    else 
                    {
                        var KindID = gid/100;
                        if(KindID == DISK)
                            state = FINISH_BUILDING;
                        else
                            state = WORKING;
                    }

                    if(state == FINISH_BUILDING && gid/100== FACT){//factory time = 0 
                        state = BUILDING;
                    }

                    /*
                    //CASTAL FARM ROOM CAMP FACT GOD DECORATION  STATUE DISK  DRAGON  
                    if(gid/100 == DECORATION || gid/100 == CASTAL || gid == DRAGON_ID)//no need to building
                    {
                        state = FINISH_BUILDING;
                    }
                    else if(finish == 0){//not finish Building 
                        state = BUILDING;
                    }
                    else
                    {
                        var KindID = gid/100;
                        if(KindID == DISK || (KindID == ROOM || KindID == CAMP || KindID == STATUE) && objid == -1)
                            state = FINISH_BUILDING;
                        else
                            state = WORKING;//working
                    }
                    */
                    /*
                    if(state == FINISH_BUILDING && gid/100== FACT){//factory time = 0 
                        state = BUILDING;
                    }
                    */
                    if(time <= ACC_TIME){//finish accelerate - one day 
                        time=btime-86400;
                    }
                    s.objnode.init(s.objnode,global);
                    if(gid >= DRAGON_ID && gid < 1100){
                        global.user.setValue("build"+str(gid),1);
                        state=0;
                        objid=-1;
                        time=btime;
                        global.http.addrequest(0,"getPets",["uid","cid"],[global.userid,global.cityid],self,"getmypets");
                    }
                    else if(gid/100 != STATUE){//STATUE DRAGON NAME diff
                        if(gid == 424 && ccard[18] == 0)
                            ccard[18] = 1;
                        gid=gid%100;
                    }
                    //btime Current System Time
                    //time StartTime 

                    s.objnode.loaddata(state,gid,objid,btime-time);
                    s.objnode.state2 = state2dict.get(g,0);
                    s.objnode.setstate();

                    if(gid<DRAGON_ID){
                        if(s.objnode.state == BUILDING || s.objnode.state == WORKING)
                            s.objnode.timerefresh();
                    }
                }
            }
            friend.flist2 = new Array(0);
            friend.fnob = new Array(0);
            var flist2 = data.get("allylis",[]);
            for(i=0;i<len(flist2);i=i+2){
                friend.flist2.append(int(flist2[i]));
                friend.fnob.append(flist2[i+1]);
            }
            box.maxperson = data.get("treasurenum",0);
            if(box.maxperson>0){
                var persons = data.get("treasurebox","");
                if(persons==""){
                    box.helpperson = 0;
                    box.boxfriends = [];
                }
                else{
                    box.boxfriends = persons.split(";");
                    box.helpperson = len(box.boxfriends);
                }
            }
            box.setbox(-1,0,0);
            if(newstate == 3){
                global.user.setValue("wonnum",data.get("wonNum",0));
                global.user.setValue("newgift",data.get("giftnum",0));
                global.system.flagrob = data.get("foodlost", 0);

                var bonus = data.get("bonus",0);
                getBonus = bonus;

                //how to solve this problem ? 
                //by random ? 
                trace("get box", box.maxperson, global.system.flagrob);
                if(box.maxperson == 0 && global.system.flagrob < 2){
                    box.helpperson = 0;
                    box.boxfriends = [];

                    if(global.user.getValue("level")>=5)
                    //&&(global.task.taskid==-1||global.task.taskid>12))
                    {
                        box.maxperson = rand(5)+6;
                        global.http.addrequest(0,"newtbox",["user_id","num"],[global.userid,box.maxperson],box,"setbox");
                    }
                }

                //如果得到的dragonNum > 0 则显示notice


                if(bonus != 0){
                    global.http.addrequest(0, "getReward", ["uid"], [global.userid], this, "getRewardOver");


                    
                    //addcmd(dict([["name","notice"]]));
                    //addcmd(dict([["name", "loginInvite"]]));

                    var level = global.user.getValue("level");
                    var nobility = global.user.getValue("nobility");
                    /*
                    if(level >= 6 && nobility < 0)
                    {
                        addcmd(dict([["name", "unlock"]]));
                    }
                  */

                    var bdict = dict();
                    bdict.update("name","daily");
                    bdict.update("bonus",bonus);
                    addcmd(bdict);

                    var clevel = allcardlevelnum[0].index(global.card[13]%1000);
                    if(clevel!=-1){
                        bdict = dict();
                        bdict.update("name","getcard");
                        bdict.update("cardid",13);
                        bdict.update("cardlevel",clevel+1);
                        addcmd(bdict);
                    }
                }

                if(data.get("wonBonus",0)!=0){
                    bdict = dict();
                    bdict.update("name","wonbonus");
                    bdict.update("money",data.get("wonBonus"));
                    bdict.update("num",data.get("wonNum"));
                    addcmd(bdict);
                }

            }

            //if(global.TooMany == 0)
            initlock = 0;
            addcmd(dict([["name", "showBanner"]]));



            friend.loaddata(global,friend);
            friend.loadourdata();
            menu.add(friend.friendback);
            warmap = new MapPage();
            warmap.init(warmap,global);
            warmap.initialdata();
            warmap.monstercontroller.mlevel = data.get("monsterid",-1);
            warmap.monstercontroller.initdata(data.get("monsterstr","0,7"),data.get("monstertime",0));
            warpage = new WarPage();
            warpage.init(warpage,global);
            var fcardlevel = ccard[18];
            if(ccard[18]==0&&global.user.getValue("godlevel")[4]==4){
                ccard[18]=1;
            }
            if(ccard[18]>1000){
                ccard[18]=ccard[18]%10+1;
            }
            if(ccard[18]==4&&global.user.getValue("level")>=40){
                ccard[18]=5;
            }
            if(ccard[18]!=fcardlevel){
                global.http.addrequest(0,"changecard",["userid","cardnum","type"],[global.userid,ccard[18],4],self,null);
                bdict = dict();
                bdict.update("name","getcard");
                bdict.update("cardid",18);
                bdict.update("cardlevel",ccard[18]);
                addcmd(bdict);
            }
            if(int(sysinfo(21))>=5){
                system_gc();
            }
            c_invoke(delayresume,2000,null);


        }
        else{
            quitgame();
        }
    }
    
    function getbattlelist(r,rc,c){
        if(rc==1){
            var data=json_loads(c);
            trace(data);
            //global.battlelist.clear();
            var attackList = [];
            var defenceList = [];
            //endtime oid att/def gid inf cav -cid
            for(var i=0;i<len(global.battlelist);i++){
                if(global.battlelist[i][2] == 1)
                    attackList.append(global.battlelist[i][3]);//attack gid
                else //defence oid gid
                    defenceList.append(global.battlelist[i][1]+"-"+str(global.battlelist[i][3]));
            }
            var alist = data.get("attacklist");
            var length = len(alist);
            for(i=0;i<length;i++){
                if(attackList.index(alist[i][5])==-1)//attack other gid not same
                    global.battlelist.append([global.timer.times2c(alist[i][1]),alist[i][0],1,alist[i][5],alist[i][2],alist[i][3],0]);
            }
            //TODO alist[i][4]是用户类型
            alist = data.get("defencelist");
            length =len(alist);
            for(i=0;i<length;i++){
                if(defenceList.index(alist[i][0]+"-"+str(alist[i][5]))==-1)
                    global.battlelist.append([global.timer.times2c(alist[i][1]),alist[i][0],0,alist[i][5],alist[i][2],alist[i][3],0]);
            }
            alist = data.get("emptyAtt");
            length =len(alist);
            for(i=0;i<length;i++){
                if(attackList.index(alist[i][6])==-1)
                    global.battlelist.append([global.timer.times2c(alist[i][2]),alist[i][0],1,alist[i][6],alist[i][3],alist[i][4],-alist[i][1]]);
            }
            alist = data.get("emptyDef");
            length =len(alist);
            for(i=0;i<length;i++){
                if(defenceList.index(alist[i][0]+"-"+str(alist[i][6]))==-1)
                    global.battlelist.append([global.timer.times2c(alist[i][2]),alist[i][0],0,alist[i][6],alist[i][3],alist[i][4],-alist[i][1]]);
            }
            trace("battlelist", global.battlelist);
        }
    }

    function initialControls(){
        mode = 0;
        global.timer.addlistener(time()/1000+86400,self);
        for(var i=0;i<len(grounds);i++){
            if(grounds[i].objectid>0&&grounds[i].objectid<500){
                grounds[i].objnode.setstate();
            }
        }
        refreshbuttons();
        if(global.user.getValue("petanimate")!=0){
            global.user.getValue("petanimate").executeAnimate();
        }
        spriteManager.downloadAllPic();
        showTip();
    }

    function getobjectby(x,y){
        for(var i=0;i<len(grounds);i++){
            if(grounds[i].posi[0] == x && grounds[i].posi[1]==y)
                return grounds[i].objnode;
        }
        return null;
    }

    var timeisend;
    function timeend(){
        global.timer.addlistener(time()/1000+86400,self);
    }
    var addManaLock = 0;
    var downAllPic = 0;
    var lastTime = 0;
    var freeTime = 0;
    var curAdPic = null;
    function visitSuc(rid, rcode, con)
    {
        trace("visitSuc", rid, rcode, con);
    }
    function visitAd()
    {
        openUrl(packageDownload);
        curAdPic.removefromparent();
        curAdPic = null;
        var did = sysinfo(31);
        did = md5(did);
        http_request("http://connect.papayamobile.com:8080/xpromt/apple/clickImage?userid="+did+"&fromIdentifier=com.papaya.miracle1&toIdentifier="+toIdentifier, visitSuc);
    }
    function timerefresh(timer,tick,param){
        if(len(monsterResult) > 0)
        {
            var res = monsterResult.pop(0);
            addcmd(dict([["name", "monsterResult"], ["data", res]]));
        }
        if(getImageYet == 1)
        {
            curAdPic = sprite(imageUrl).setevent(EVENT_TOUCH, visitAd).anchor(50, 50).pos(400, 240);
            getscene().add(curAdPic, 1000);
            getImageYet = 0;
        }

        var i;
        var now = time();
        var dif = 0;
        if(lastTime == 0)
        {
            lastTime = time();
        }
        else
        {
            dif = now - lastTime;
            lastTime = now;
        }
        if(gloBanner == null)
            gloTime += dif;
        if(gloTime >= 180000 && hidden == 1)
        {
            gloTime = 0;
            addcmd(dict([["name", "showGlobal"]]));
        }
            
        if(banner != null)
        {
            banTime += dif;
            trace("removeBanner", banTime);
            if(banTime > 10000)
            {
                banner.removefromparent();
                banner = null;
            }
        }

        if((now - global.user.getValue("manatime")) > ManaChargeTime && addManaLock == 0 )
        {
            addManaLock = 1;
            trace("manatime", now, global.user.getValue("manatime"));
            trace("increase mana");
            var mana = global.user.getValue("mana");
            var boundary = global.user.getValue("boundary");

            if(mana < boundary)
                global.http.addrequest(0,"addmana",["userid"],[global.userid],self,"addmana");
            else
            {
                global.user.setValue("manatime", now);
                addManaLock = 0;
            }
        }
        if(initlock == 0){
            initlock = -1;
            if(global.TooMany == 1)
            {
                //global.pushContext(null, new TooManyUser(), NonAutoPop);
            }
            else
            {
                if(newstate < 3 && global.flagnew == 0){
                    trace("update flagnew", global.flagnew);
                    global.pushContext(self,new NewControl(newstate),NotAdd);
                    //actButton.visible(0);
                }
                else{//new user not popup foodlost
                    var monNum = warmap.monstercontroller.monsternum;
                    if(global.system.flagrob == 0 && global.flagnew == 0 && monNum != 0)
                    {
                        global.pushContext(null,new Warningdialog([global.getStaticString("monster_foodwilllost"),null,1]),NonAutoPop);
                    }
                    if(global.system.flagrob < 2 && global.flagnew == 0)
                    {
                        global.http.addrequest(0,"foodlost",["uid"],[global.userid],self,"foodlost");
                    }
                }
                global.user.flaginit = 0;
                global.user.setValue("plantpage",1);
            }
        }
        else if(initlock<-1){
            initlock++;
            if(initlock==-1){
                delayresume();
            }
            return 0;
        }
        if(hiddentime == 0){
            hidden = 1;
            hiddentime = -1;
            menu.addaction(sequence(tintto(1000,  0,  0,  0,0),callfunc(menuvisible)));
            //addcmd(dict([["name", "showGlobal"]]));
        }
        else if(hiddentime > 0){
            if(global.currentLevel +global.flagnew== 0)
                hiddentime = hiddentime-1;
            if(hidden==1){
                if(global.system.flagnight==0 && global.system.enableNight){
                    menu.addaction(sequence(callfunc(menuvisible),tintto(1000,50,50,60,100)));
                }
                else{
                    menu.addaction(sequence(callfunc(menuvisible),tintto(1000,100,100,100,100)));
                }
                hidden =0;
            }
        }
        function menuvisible(n){
            n.visible(1-n.visible());
        }
        flaganimate = flaganimate+1;
        if(waitfriend != -1){
            if(friendpredict.get(waitfriend)!=null&&friendpredict.get(waitfriend)!=1){
                getfriendover(friendpredict.get(waitfriend));
                waitfriend=-1;
            }
        }
        if(global.user.getValue("nobility")>=0 && global.http.flag_netstate==0){
            if(flaganimate%300==5){
                global.http.addrequest(0,"battlelist",["uid"],[global.userid],self,"battlelist");
            }
            if(flaganimate%10 ==2){
                var iswar = 0;
                var ctime = time()/1000;
                for(var iw=len(global.battlelist)-1;iw>=0;iw--){
                    if(global.battlelist[iw][0]<ctime-1){
                        global.battlelist.pop(iw);
                        iswar=1;
                    }
                }
                if(iswar==1||flaganimate<10){//emptyBattle result
                    global.http.addrequest(0,"war",["uid"],[global.userid],self,"addnewbattle");
                }
                global.user.setValue("battlenum",len(global.battlelist));
            }
            if(warpage.contextNode!=null&&warpage.rightmenu!=null&&warpage.rightmenu.pos()[0]==800){
                warpage.refreshlist();
            }
        }
        if(flagbuild == 0){
            for(i=0;i<len(grounds);i++){
                if(grounds[i].objectid >0 && grounds[i].objectid<DECORATION_ID|| grounds[i].objectid >= STATUE_ID && grounds[i].objectid < DRAGON_ID){
                    var obj = grounds[i].objnode;
                    if(obj.state == BUILDING || obj.state == WORKING){
                        obj.timerefresh();
                    }
                }
            }
        }
        if(global.currentLevel ==0||(global.currentLevel ==1&&global.context[1].contextname.rfind("page")!=-1)&&global.lockpage==null){
            if(len(cmdlist)>0){
                var cmd = cmdlist.pop(0);
                executecmd(cmd);
            }
            else if(len(reqlist)>0&&reqlock==0){
                reqlock=1;
                var req = reqlist.pop(0);
                var name = req.get("name");
                if(name == "receivegift"){
                    var rl = len(reqlist);
                    for(i=0;i<rl;i++){
                        var treq = reqlist.pop(0);
                        if(treq.get("name") == name){
                            req.update("giftstr",req.get("giftstr")+";"+treq.get("giftstr"));
                        }
                        else
                            reqlist.append(treq);
                    }
                    global.http.addrequest(0,name,["uid","giftstr"],[global.userid,req.get("giftstr")],self,"receiveover");
                }
            }
        }
        if(flaganimate % 30 == 0){
            if(flagbird == 0){
                if(global.system.flagnight==1){
                    var bird=sprite("bird1.png").anchor(100,0).pos(0,1000+rand(1000));
                    contextNode.get(1).add(bird,3280);
                    bird.addaction(repeat(animate(1000,"bird1.png","bird2.png","bird3.png","bird4.png")));
                    bird.addaction(sequence(moveto(35000+rand(3)*10000,2600,rand(500)-250),callfunc(birdremove),stop()));
                }
            }
            if(flagwind < 7){
                var num = flagwind+rand(2);
                if(num > 7) num = 7;
                for(flagwind=flagwind;flagwind<num;flagwind++){
                    var height = rand(870+280);
                    var wi = sprite("wind"+str(rand(3)+1)+".png").anchor(100,0).pos(-500,height);
                    contextNode.get(1).add(wi,3280 + height);
                    wi.addaction(sequence(moveby(200000+rand(5)*60000,3500,0),callfunc(windremove)));
                }
            }
        }
    }
    //war 
    //emptyResult  battleresult
    function addnewbattle(r,rc,c){
        if(rc!=0){
            var data = json_loads(c);
            if(data!=null&&data.get("id",1) == 1){
                var battles = data.get("battleresult", []);
                trace("addnewbattle", data);
/*battleresult
att/def  otheruid   att-win/lose  lostPower attFullPow  defFullPow attReward 
0       uid         1/0
defOtherid defEmpirename defNobility attGod defGod catapult defCatapult 
*/
                var dragonAtt = data.get("dragonAtt");
                var dragonHealth = data.get("dragonHealth");
                trace("warresult dragon", dragonAtt, dragonHealth);
                //normal object
                for(var gc = 0; gc < len(grounds); gc++)
                {
                    if(grounds[gc].objectid == 1000)
                    {
                        grounds[gc].objnode.health = dragonHealth;
                        grounds[gc].objnode.trainAttack = dragonAtt;
                        break;
                    }
                }

                var nob = data.get("nobility");
                var sub = data.get("minus",1);//next nobility need enemy
                global.card[12] = nob+100*sub;
                var alllist = [];
                trace("battles", battles);
                if(type(battles) == type([])){
                    trace("handle battleresult");
                    for(var i=0;i<len(battles);i++){
                        var btems=battles[i];
                        btems.insert(0, 0);//type
                        btems.insert(1, 0);//readed
                        alllist.append(btems);
                        //attack and successful 
                        if(getBattleResult("kind", btems) == 0 && getBattleResult("win", btems) == 1 && warpage.inite == 1)
                        {
                            warpage.occupyEne(btems);
                        }
                        if(getBattleResult("kind", btems) == 1 && getBattleResult("win", btems) == 1 && warpage.inite==1){
                    
                            for(var j=len(warpage.atklist)-1;j>=0;j--){
                                if(warpage.atklist[j][0]== getBattleResult("defOtherid", btems)){
                                    warpage.atklist.pop(j)[8]=1;
                                    break;
                                }
                            }
                        }
                    }
                    if(global.currentLevel >= 1 && global.context[1].contextname=="page-war"){
                        global.context[1].refreshmap(1);
                        global.context[1].refreshlist();
                    }
                }

                trace("warrecordlist is allist at CastalPage finish War");
                global.user.setValue("warrecordlist",alllist);
                var alist = data.get("emptyResult");
                trace("emptyResult");
/*
eid  kind suc/fail       myotherid suc/fail  lostPower attFullPow defFullPow 
    0att 1def 2send               1/0            
defOtherid defEmpirename defNobility attGod defGod battle.catapult
    0/others->mon/user 
reward 
*/
                for(i=0;i<len(alist);i++){
                    if(getEmptyResult("kind", alist[i]) == 2){
                        //ignore sendArmy to myEmpty
                        alist.pop(i);
                        i--;
                    }
                    else{
                        var empItems = alist[i];
                        empItems.insert(0, 1);//type empty
                        empItems.insert(1, 0);//readed
                        alllist.append(empItems);
                    }
                }
/*battleresult alllist format
empty/Normal    att/def  otheruid   att-win/lose  lostPower attFullPow  defFullPow attReward 
0       uid         1/0
defOtherid defEmpirename defNobility attGod defGod catapult defCatapult 
*/
                trace("alllist merge emptyResult and battleresult ");
                if(len(alllist)>0){//new warresult
                    var bdict = dict();
                    bdict.update("name","battleresult");
                    bdict.update("num",len(alllist));
                    addcmd(bdict);
                }
                global.user.setValue("warrecordnum",len(alllist));
                if(sub<=0){
                    nob=nob/3*3+2;
                    global.user.setValue("nobility",nob/3*3+2);
                    global.card[12] = nob;
                }
                if(nob>global.user.getValue("nobility") || global.card[12]<18)
                {
                    global.user.setValue("nobility",nob);
                    var cmd = dict();
                    cmd.update("name","nobility");
                    addcmd(cmd);
                }
                global.user.setValue("citydefence",data.get("defence"));
                global.user.setValue("money",data.get("corn",global.user.getValue("money")));
                global.user.setValue("caesars",data.get("cae",global.user.getValue("caesars")));
                global.soldiers[0] = data.get("inf",global.soldiers[0]);
                global.soldiers[1] = data.get("cav",global.soldiers[1]);
                CheckSoldiers();

                global.user.setValue("catapult", data.get("catapult"));
                if(warpage.inite==1){
                    var list = data.get("empty", []);
                    warpage.loadempty(list);
                }
            }
        }
    }

    function sizeModeft(from,to){
        if((from == PS_MIN && to <= PS_MIN) || (from == PS_MAX && to>=PS_MAX))
            return 0;
        if(to <= PS_MIN){
            to=PS_MIN;
        }
        else if(to>=PS_MAX){
            to = PS_MAX;
        }
        mode = to;
        sizeWithMode();
    }

    function sizeMode(node,event,param){
        hiddentime = 10;
        gloTime = 0;
        if(contextLevel >= global.currentLevel){
            if((mode== -60 && param < 0)||(mode== 50 && param > 0))
                return 0;
            if(event == EVENT_TOUCH){
                node.scale(120);
                centerpoint = [400,240];
                return 0;
            }
            node.scale(100);
            sizeModeft(mode,mode+param);
            return 0;
        }
    }


    function birdremove(n){
        n.removefromparent();
        flagbird = 0;
    }
    function windremove(n){
        n.removefromparent();
        flagwind = flagwind-1;
    }
    function reloadNode(re){
        hiddentime = 10;
        gloTime = 0;
        if(re == RankFri)
        {
            global.http.addrequest(0, "rankHeart", ["uid", "oid"], [global.userid, cuid], this, "rankHeartFin");
        }
        else if(re == DownWarn)
        {
            spriteManager.DecideToDown(); 
        }
        else if(re == ShowDownYet)
        {
            spriteManager.showDownNow();
        }
        else if(re >= DRAGON_ID || re< 0){
            if(re > DRAGON_ID){//other building
                re = re%1000;
            }
            else{
                re = -re;
            }
            var ctpos = contextNode.world2node(400,240);
            lastcenter = [ctpos[0],ctpos[1]];
            lastmode = mode;
            ctpos[0] = ctpos[0]-PBX-4;
            ctpos[1] = ctpos[1]-PBY+33;
            var flagoff = 0;
            var cid=global.data.getSize(re);
            var posx = (ctpos[0]+2*ctpos[1])/62+cid/2;
            var posy = (-ctpos[0]+2*ctpos[1]-2*posx)/68+cid/2;
            if(posx<cid-1){
                flagoff = 1;
                posx = cid-1;
            }
            else if(posx >= global.rect){
                flagoff = 1;
                posx = global.rect-1;
            }
            if(posy<cid/1000-1){
                flagoff = 1;
                posy = cid-1;
            }
            else if(posy >= global.rect){
                flagoff = 1;
                posy = global.rect-1;
            }
            trace("beginBuild", re, posy, posx);
            //object id
            changes = new NormalObject(re,posy,posx);
            changes.flagnew = 1;
            changes.init(changes,global);
            changes.getNode();
            changes.resetgrid();
            blocknode.visible(1);
            flagbuild = 2;

            for(var ii=0;ii<len(grounds);ii++){//begin building
                if(grounds[ii].objectid >0 && grounds[ii].objectid<500||grounds[ii].objectid>=600&&grounds[ii].objectid<700)
                    grounds[ii].objnode.stateNode.visible(0);
            }

            hideHomeMenu();

            box.boxbutton.visible(0);
            if(mode<50 || flagoff==1){
                var c = changes.getNode().pos();
                var p = contextNode.node2world(c[0]+3,c[1]-changes.contextid*33/2);
                nodeMove(-p[0]+400,-p[1]+240);
                sizeModeft(mode,50);
            }
        }
        else if(re >= EXPAND_ID){
            expandtype = re-EXPAND_ID;
            global.http.addrequest(1,"expand",["user_id","city_id","type"],[global.userid,global.cityid,expandtype],self,"expandover");
        }
        else if(re == WARABOUT){
            global.pushContext(null,new Waraboutinfo(0),NonAutoPop);
        }
        return 0;
    }
    function addcmd(c){
        if(initlock==-1&&(global.currentLevel ==0||(global.currentLevel ==1&&global.context[1].contextname.rfind("page")!=-1))&&global.lockpage==null){
            executecmd(c);
        }
        else{
            cmdlist.append(c);
        }
    }
    function changeBoundary()
    {
        global.user.changeValueAnimate2(global.context[0].moneyb, "boundary", 1, -6);
    }
    var banner = null;
    var banTime = 0;
    var gloTime = 0;
    var gloBanner = null;
    function executecmd(cmd){
        trace("cmd is", cmd);
        var name = cmd.get("name");
        if(name == "daily" && global.flagnew==0){
            var bonus = cmd.get("bonus");
            global.pushContext(self,new DailyDialog(bonus),NonAutoPop);
        }
        else if(name == "gift"){
            global.pushContext(self,new GiftDialog(cmd.get("ppyid"),cmd.get("giftid"),cmd.get("askorgive")),NonAutoPop);
        }
        else if(name == "nobility"){
            //nobility level up increase 1 boundary
            global.http.addrequest(1,"changeboundary",["userid"],[global.userid],self,"changeBoundary");
            global.pushContext(self,new Nobilitydialog(),NonAutoPop);
        }
        else if(name == "levup"){
            global.pushContext(self,new Levelupdialog(cmd.get("data")),NonAutoPop);
        }
        else if(name == "monsterfood"){
            global.pushContext(self,new Monsterrobfood(cmd.get("food")),NonAutoPop);
        }
        else if(name == "monsterrefresh"){
            global.pushContext(self,new Monsterrefresh(cmd.get("max")),NonAutoPop);
        }
        else if(name  == "monstercomplete"){
            global.pushContext(self,new Monstercomplete(cmd.get("power")),NonAutoPop);
        }
        else if(name == "getcard"){
            if(cmd.get("cardid") < 12)//monster card
            {
                if(cmd.get("cardlevel") == 5)
                {
                    global.http.addrequest(1,"changeboundary",["userid"],[global.userid],self,"changeBoundary");
                    global.http.addrequest(1,"changeboundary",["userid"],[global.userid],self,"changeBoundary");
                }
            }
            else//other card
            {
                global.http.addrequest(1,"changeboundary",["userid"],[global.userid],self,"changeBoundary");
            }
            global.pushContext(self,new Cardget(cmd.get("cardid"),cmd.get("cardlevel")),NonAutoPop);
        }
        else if(name == "battleresult"){
            for(var i=1;i<len(cmdlist);i++){
                if(cmdlist[i].get("name")=="battleresult"){
                    cmd=cmdlist.pop(i);
                    i--;
                }
            }
            global.pushContext(self,new Warningdialog([global.getFormatString("warrecord_notice_format",["[NUM]",str(cmd.get("num"))]),800,3]),NonAutoPop);
        }
        else if(name == "notice"){
            var dragonNum = cmd.get("dragonNum");
            global.user.changeValue("dragonStone", dragonNum);
            var monNum = cmd.get("monNum");
            global.pushContext(self,new Noticedialog(monNum, dragonNum),NonAutoPop);
        }
        else if(name == "wonbonus"){
            global.pushContext(self,new Wonbonus(cmd.get("num"),cmd.get("money")),NonAutoPop);
        }
        else if(name == "chat"){
            if(cpid!=0)
                global.pushContext(null,new Chatdialog(cuid),NonAutoPop);
        }
        else if(name == "oldUser")
        {
            //global.pushContext(null, new OldUser(), NonAutoPop);
            //global.pushContext(null, new Warningdialog([global.getStaticString("oldUser"), null, 1]), NonAutoPop);
        }
        else if(name == "unlock")
        {   
            //global.pushContext(null, new Unlock(), NonAutoPop);
        }
        else if(name == "inviteFriend")
        {
            if(global.flagnew == 0 && getBonus != 0)
            {
                trace("week", week, getBonus);
                if(week == 2 || week == 5)
                {
                    //global.pushContext(null, new Invite(), NonAutoPop);
                    friend.inviteAll();
                }
            }
        }
        else if(name == "showBanner")
        {
            trace("show Banner");
            if(global.flagnew == 0)
            {
                banner = v_create(V_APPFLOOD_BANNER, 0, 0, 400, 70);
                trace("banner", banner);
                if(banner == null)
                    return;
                v_root().addview(banner); 
                //openUrl("appfloodad");
            }
        }
        else if(name == "showGlobal")
        {
            if(global.flagnew == 0 && gloBanner == null)
            {
                gloBanner = 1;
                openUrl("appfloodad"); 
                trace("globalBanner", gloBanner);
            }
        }
        else if(name == "loginInvite")
        {

            global.pushContext(null, new LoginInvite(), NonAutoPop);
        }
        else if(name == "monsterResult")
        {
            var data = cmd.get("data"); 
            var words = global.getFormatString("monsterResult", ["[NUM]", str(data.get("dragonNum"))]); 
            global.pushContext(null, new MyWarnDialog(null, 1, words), NonAutoPop); 
            global.user.changeValue("dragonStone", data.get("dragonNum"));
        }
    }
    var reqlock=0;
    function receiveover(r,rc,c){
        if(rc!=0 && json_loads(c).get("id")==1){
        }
        reqlock=0;
    }
    function clearHidden()
    {
        gloBanner = null;
        gloTime = 0;
    }
    var expandtype;
    function expandover(r,rc,c){
        if(rc!=0 && json_loads(c).get("id")==1){
            var expandid = (global.rect-20)/2;
            global.rect = global.rect+2;
            global.user.changeValueAnimate2(ub,"exp",EXPAND_EXP[expandid],-6);
            var landkind = expandid+1;
            for(var i=0;i<2;i++){
                for(var j=0;j<2;j++){
                    blocknode.get(i*2+j).pos(PBX+4+(i*(-34)+j*30)*2*landkind,PBY-33+(i*17+j*16)*2*landkind);
                }
            }
            if(expandtype==1){
                global.user.changeValueAnimate2(moneyb,"caesars",-EXPAND_CAESARS[expandid],-6);
            }
            else if(expandtype==2){
                global.user.changeValueAnimate2(moneyb,"money",-EXPAND_MONEY[expandid],-6);
            }
            global.pushContext(self,new Expandover(),NonAutoPop);
        }
    }
    var pausepos;
    function pause(){
        if(global.currentLevel>1 && global.context[2].contextname=="dialog-papayas"){
            global.context[2].pause();
        }
        pausepos = contextNode.pos();
        contextNode.removefromparent();
        contextNode = null;
        if(flagfriend==0){
            blocknode.removefromparent();
            blocknode = null;
        }
        for(var i=0;i<len(grounds);i++){
            if(grounds[i].objectid >0 && grounds[i].objectid<500 ||grounds[i].objectid>=600){
                var objnode = grounds[i].objnode;
                if(objnode.stateNode!=null){
                    objnode.stateNode.addaction(stop());
                    objnode.stateNode.removefromparent();
                    objnode.stateNode = null;
                }
                if(objnode.lockNode!=null){
                    objnode.lockNode.addaction(stop());
                    objnode.lockNode.removefromparent();
                    objnode.lockNode = null;
                }
                objnode.contextNode.removefromparent();
                objnode.contextNode = null;
                if(grounds[i].objectid<5){
                    objnode.plantNode.removefromparent();
                    objnode.plantNode=null;
                }
                if(objnode.sfilter != null){
                    objnode.sfilter.removefromparent();
                    objnode.sfilter = null;
                    objnode.slabel.removefromparent();
                    objnode.slabel = null;
                }
            }
            else{
                grounds[i].objnode.removefromparent();
                grounds[i].objnode = null;
            }
            grounds[i].contextNode.removefromparent();
            grounds[i].contextNode = null;
        }
    }
    function delayresume(){
        contextNode.setevent(EVENT_TOUCH,nodeMoveEvent);
        contextNode.setevent(EVENT_UNTOUCH,nodeMoveEvent);
        contextNode.setevent(EVENT_MULTI_TOUCH,nodeMoveEvent);
        contextNode.setevent(EVENT_MULTI_UNTOUCH,nodeMoveEvent);
        contextNode.setevent(EVENT_MOVE,nodeMoveEvent);
        contextNode.setevent(EVENT_KEYDOWN,keydownevent);

        contextNode.focus(1);
        if(flagfriend==0){
            blocknode=contextNode.addsprite().visible(0);
            var block = sprite("grid20.png");
            var landkind = global.rect-20;
            for(var i=0;i<2;i++){
                for(var j=0;j<2;j++){
                    blocknode.add(block.copy().anchor(53,0).pos(PBX+4+(i*(-34)+j*30)*landkind,PBY-33+(i*17+j*16)*landkind),0,i*2+j);
                }
            }
        }
        
        for(i=0;i<len(grounds);i++){
            contextNode.add(grounds[i].getNode());
            grounds[i].resetgrid();
        }
        if(global.currentLevel>1 && global.context[2].contextname=="dialog-papayas"){
            global.context[2].resume();
        }
        if(needlock==1){
            needlock=0;
            global.unlock();
        }
    }
    var rightBottom = null;
    function resume(){
        contextNode = global.screen.addsprite("800480.jpg",ARGB_8888).size(PAGE_W,PAGE_H).anchor(50,50).pos(pausepos).scale(100+mode);
        setMonsterNode(monsterNode);
        contextNode.addsprite("empirebacklefttop.png").scale(300);
        contextNode.addsprite("empirebackrighttop.png").anchor(100,0).pos(PAGE_W,0).scale(300);
        contextNode.addsprite("empirebackleftbottom.png").anchor(0,100).pos(0,PAGE_H).scale(300);
        rightBottom = contextNode.addsprite("empirebackrightbottom.png").anchor(100,100).pos(PAGE_W,PAGE_H).scale(300);
        contextNode.add(global.myDock.bg);
        global.myDock.showNight();

        contextNode.add(node(),20000,1);
        if(global.system.flagnight==0 && global.system.enableNight){
            contextNode.texture("800480night.jpg");
            contextNode.add(sprite("dark.png").color(6,6,12,40).size(PAGE_W,PAGE_H),0,0);
            contextNode.get(1).color(50,50,60,100);
        }
        initlock = -2;
        if(global.lockpage==null){
            global.lock();
            needlock=1;
        }
    }
    var needlock;
}
