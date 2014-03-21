class NestObject extends BuildObject{
    const Train_Mana = 2;
    const Train_Power = 10;
    function NestObject(b){
        contextname = "object-build-nest";
        buildname = "build";
        buildindex = 5;
        initwithbase(b);
    }

    override function beginbuild(){
        var data = global.data.getbuild(bid);
        global.user.changeValueAnimate(baseobj,"money", -data.get("price"),2); 
        global.user.changeValueAnimate(baseobj,"food", -data.get("food"),0);
        global.user.changeValueAnimate(baseobj,"personmax",data.get("personmax"),-2);
        state = 1;
        lefttime = 10;
        global.user.setValue("build"+str(bid),1);
        helpfriends = [];
        super.beginbuild();
    }
    
    override function objSelected(n,e,p,x,y,ps){
        if(contextLevel >= global.currentLevel && lock ==0 ){
            if(global.context[0].flagbuild!=0){
                return baseobj.objSelected(n,e,p,x,y);
            }
            if(global.context[0].flagfriend == 1 && state==2)
                return 0;
            if(e == EVENT_HITTEST){
                if(n == stateNode && state!=2 && state!=4)
                    return 0;
                return 1;
            }
            else if(e == EVENT_TOUCH){
                select = 1;
                var c = n.node2world(x,y);
                c = global.context[0].getNode().world2node(c[0],c[1]);
                global.context[0].nodeMoveEvent(n,EVENT_TOUCH,p,c[0],c[1],ps);
                flagmulti = 0;
                return 1;
            }
            else if(e==EVENT_MULTI_TOUCH){
                select = 0;
                flagmulti++;
                var p0 = ps.get(0);
                p0 = n.node2world(p0[0],p0[1]);
                p0 = global.context[0].contextNode.world2node(p0[0],p0[1]);
                ps.update(0,p0);
                p0 = ps.get(1);
                p0 = n.node2world(p0[0],p0[1]);
                p0 = global.context[0].contextNode.world2node(p0[0],p0[1]);
                ps.update(1,p0);
                global.context[0].nodeMoveEvent(n,EVENT_MULTI_TOUCH,0,0,0,ps);
                return 1;
            }
            else if(e== EVENT_MULTI_UNTOUCH){
                flagmulti--;
                p0 = ps.get(0);
                p0 = n.node2world(p0[0],p0[1]);
                p0 = global.context[0].contextNode.world2node(p0[0],p0[1]);
                ps.update(0,p0);
                p0 = ps.get(1);
                p0 = n.node2world(p0[0],p0[1]);
                p0 = global.context[0].contextNode.world2node(p0[0],p0[1]);
                ps.update(1,p0);
                global.context[0].nodeMoveEvent(n,EVENT_MULTI_UNTOUCH,0,0,0,ps);
                return 1;
            }
            else if(e == EVENT_MOVE){
                if(select == 1){
                    var coor = n.size();
                    if(x <0 || y <0 || x>coor[0] || y>coor[1])
                        select = 0;
                }
                else{
                    var c2 = n.node2world(x,y);
                    c2 = global.context[0].getNode().world2node(c2[0],c2[1]);
                    if(flagmulti==1){
                        p0 = ps.get(0);
                        p0 = n.node2world(p0[0],p0[1]);
                        p0 = global.context[0].contextNode.world2node(p0[0],p0[1]);
                        ps.update(0,p0);
                        p0 = ps.get(1);
                        p0 = n.node2world(p0[0],p0[1]);
                        p0 = global.context[0].contextNode.world2node(p0[0],p0[1]);
                        ps.update(1,p0);
                    }
                    global.context[0].nodeMoveEvent(n,EVENT_MOVE,p,c2[0],c2[1],ps);
                }
                return 0;
            }
            else if(e == EVENT_UNTOUCH && select == 0){
                global.context[0].nodeMoveEvent(n,EVENT_UNTOUCH,0,0,0,ps);
                return 0;
            }
            if(state==0){
                return;
            }
            //lock = 1;
            if(state >= 2){

                if(state > 2&&global.context[0].flagfriend==0&&petname==global.getStaticString("default_petname")){
                    global.pushContext(self,new PetRename(self),NonAutoPop);
                }
                else if(state>=3 && global.context[0].flagfriend==0 && health>=hmax[state-3]){
                    global.http.addrequest(1,"getUp",["uid","pid"],[global.userid,pid],self,"getup");
                }
                else{
                    global.pushContext(self,new BuildControl(5,self),AutoPop);
                }
                lock=0;
            }
            else if(state == 1){
                global.pushContext(self,new Nestbuilddialog(helpfriends),NonAutoPop);
                lock=0;
            }
            setstate();
        }
    }
    
    function loadpets(c){
        pid=c[0];
        bbid=c[1];
        state=c[3]+1;
        objid=c[4];
        health = c[5];
        helpfriends = json_loads("{'fr':"+c[7]+"}").get("fr");
        petname = c[8];
        trainAttack = c[9];
        feeded = c[10]%2;
        extendid=c[11];
        substate=0;
        setstate();
        trainnum = c[9];
        //initial power, trainAttack, (Egg Attribute+Kind Attri) * health
        attack=PETS_POWER[objid]+trainAttack+(PETS_UP[objid]+EXTEND_UP[extendid])*health;
        istrain=0;
        if(global.context[0].flagfriend==1)
            c_invoke(executeAnimate,1000,null);
        else{
            if(global.context[0].initlock==-1){
                c_invoke(executeAnimate,1000,null);
            }
            else{
                global.user.setValue("petanimate",self);
            }
        }
    }
    
    var pid;
    var bbid;
    var health;
    var petname;
    var trainAttack;
    var attack;
    var feeded;
    var extendid;
    var substate;
    var istrain;
    var trainnum = 0;
    override function setstate(){
        if(contextNode == null){
            return 0;
        }
        if(state == 0)
            contextNode.color(50,50,50,50);
        else if(state==1)
            contextNode.color(40,40,40,100);
        else{
            if(global.system.flagnight==0 && global.system.enableNight){
                contextNode.color(50,50,60,100);
            }
            else{
                contextNode.color(100,100,100,100);
            }
        }
        if(stateNode == null){
            stateNode = baseobj.contextNode.addsprite("",ALPHA_TOUCH).anchor(50,100);
            stateNode.setevent(EVENT_HITTEST,objSelected);
            stateNode.setevent(EVENT_MOVE,objSelected);
            stateNode.setevent(EVENT_UNTOUCH,objSelected);
            stateNode.setevent(EVENT_TOUCH,objSelected);
            stateNode.setevent(EVENT_MULTI_TOUCH,objSelected);
            stateNode.setevent(EVENT_MULTI_UNTOUCH,objSelected);
            lockNode=null;
        }
        if(lockNode!=null && lock==0){
            lockNode.removefromparent();
            lockNode.addaction(stop());
            lockNode = null;
        }
        else if(lock == 1){
            if(lockNode==null){
                lockNode = sprite("wait1.png").anchor(50,50).size(75,75).pos(baseobj.contextid*33+1,0);
                lockNode.add(sprite("lock1.png").size(75,75),-1);
                if(buildindex == 4 && bid%4!=1){
                    lockNode.pos(baseobj.contextid*33+1,54);
                }
                lockNode.addaction(waitaction1);
                stateNode.texture();
                contextNode.add(lockNode);
            }
            return 0;
        }
        if(state > 0){
            if(state == 1){
                stateNode.size(104,18).texture("nestbuildingback.png").pos(baseobj.contextid*33+1,baseobj.contextid*33-contextNode.size()[1]);
                sreload();
            }
            else{
                if(sfilter != null){
                    slabel.removefromparent();
                    sfilter.removefromparent();
                    sfilter = null;
                    slabel = null;
                }
                if(state==3){
                    var stt = health/17+1;
                    if(stt>3) stt=3;
                    var s=sprite("egg-"+str(stt)+"-0.png");
                    //spriteManager.getPic("egg-"+str(stt)+"-0.png", s);
                    if(contextNode.get(1)!=null){
                        contextNode.get(1).addaction(stop());
                        contextNode.remove(1);
                    }
                    contextNode.add(s,1,1);
                }
                else if(state==4){
                    var petstr = EXTEND_NAME[extendid];
                    if(contextNode.get(1)!=null){
                        destroynode(contextNode.get(1));
                    }
                    if(substate==0){
                        s = sprite(petstr+"-1.png").anchor(0,100).pos(0,contextNode.size()[1]);
                        //spriteManager.getPic(petstr+"-1.png", s);
                        s.addsprite("zzz1.png").anchor(50,100).pos(125,0).addaction(repeat(animate(1600,"zzz2.png","zzz3.png","","zzz1.png")));
                        contextNode.add(s,1,1);
                    }
                    else{
                        s = sprite(petstr+"-4.png").anchor(0,0).pos(0,-21);
                        //spriteManager.getPic(petstr+"-4.png", s);
                        contextNode.add(s,1,1);
                    }
                }
                else if(state>=5){
                    petstr = EXTEND_NAME[extendid];
                    if(contextNode.get(1)!=null){
                        destroynode(contextNode.get(1));
                    }
                    s = sprite(petstr+"-1-1.png").anchor(50,50).pos(contextNode.size()[0]/2,contextNode.size()[1]/2);
                    s.addsprite("zzz1.png").anchor(50,100).pos(125,0).addaction(repeat(animate(1600,"zzz2.png","zzz3.png","","zzz1.png")));
                    contextNode.add(s,1,1);
                }
                stateNode.texture();
                objectsetstate();
            }
        }
        else{
            if(sfilter != null){
                slabel.removefromparent();
                sfilter.removefromparent();
                sfilter = null;
                slabel = null;
            }
            stateNode.texture();
            stateNode.texture();
        }
        if(global.context[0].flagfriend == 1 && (state!=3||(state2!=1 && state2!=2))){
            stateNode.visible(global.system.flagnotice);
        }
        else{
            stateNode.visible(global.system.flagnotice);
        }
    }
    
    function executeAnimate(){
        if(contextNode==null){//not initial call 1000ms later
            c_invoke(executeAnimate,1000,null);
            return 0;
        }
        var stime=global.timer.timec2s(global.timer.currenttime)%86400/3600;
        //trace("dragon system time, state, health", stime, state, health);
        if(contextNode.get(1)!=null){//dragon picture
            //Dragon is an egg
            if(state==3){//dragon State 0not 1active 2buyegg 3child 4young 5old 
                var stt = health/17+1;
                if(stt>3) stt=3;
                var prestr = "egg-"+str(stt)+"-";
                if(health<34){
                    contextNode.get(1).addaction(sequence(stop(),repeat(animate(600,prestr+"1.png",prestr+"2.png",prestr+"3.png",prestr+"0.png"),3)));
                }
                else{
                    contextNode.get(1).addaction(sequence(stop(),repeat(delaytime(150),itexture(prestr+"1.png"),delaytime(150),itexture(prestr+"2.png"),delaytime(250),itexture(prestr+"3.png"),delaytime(100),itexture(prestr+"4.png"),delaytime(250),itexture(prestr+"5.png"),delaytime(150),itexture(prestr+"6.png"),delaytime(150),itexture(prestr+"7.png"),delaytime(150),itexture(prestr+"0.png"),2)));
                }
                if(global.context[0].flagfriend==0){//self train
                    if(istrain==1){
                        var to=node();
                        to.addaction(callfunc(train));
                        contextNode.add(to);
                    }
                }
            }
            //dragon is young
            else if(state==4){
                prestr = EXTEND_NAME[extendid]+"-";
                if(substate==0){
                    var talktime=0;
                    var tback=contextNode.get(1).addsprite("talk.png").anchor(50,100).pos(95,15);
                    tback.color(0,0,0,0);
                    talktime=2000;
                    var tlabel = tback.addlabel("",null,16,FONT_NORMAL,160,0,ALIGN_LEFT).pos(18,8).color(0,0,0,100);
                    if(global.context[0].flagfriend==0){//self train
                        if(stime>=6&&stime<10){
                            tlabel.text(global.getStaticString("nest_talk_morning"));
                        }
                        else if(stime>=11&&stime<14){
                            tlabel.text(global.getStaticString("nest_talk_noon"));
                        }
                        else if(stime>=20||stime<6){
                            tlabel.text(global.getStaticString("nest_talk_night"));
                        }
                        else{
                            tlabel.text(global.getStaticString("nest_talk_other"));
                        }
                        //train action do 10s later building subnode
                        if(istrain==1){
                            to=node();
                            to.addaction(callfunc(train));
                            contextNode.add(to);
                        }
                    }
                    else if(len(helpfriends)>=5||helpfriends.index(global.papaId)!=-1){
                            tlabel.text(global.getStaticString("nest_talk_feedover"));
                    }
                    else{
                            tlabel.text(global.getStaticString("nest_talk_notfeedover"));
                    }
                    tback.addaction(sequence(stop(),delaytime(800),itintto(100,100,100,100),delaytime(talktime),callfunc(removeself)));
                    contextNode.get(1).subnodes()[0].addaction(sequence(itintto(0,0,0,0),delaytime(12000+talktime),itintto(100,100,100,100)));
                    //spriteManager.getAnimation([prestr+"2.png",prestr+"3.png",prestr+"4.png", prestr+"5.png",prestr+"6.png",prestr+"7.png", prestr+"f1.png",prestr+"9.png",prestr+"f2.png",prestr+"f3.png",prestr+"f4.png"]);
                    contextNode.get(1).addaction(sequence(stop(),animate(800,prestr+"2.png",prestr+"3.png",prestr+"3.png",prestr+"4.png",UPDATE_SIZE),delaytime(talktime),repeat(animate(800,prestr+"5.png",prestr+"6.png",prestr+"7.png",prestr+"7.png"),animate(560,prestr+"f1.png",prestr+"f2.png",prestr+"f3.png",prestr+"f4.png",prestr+"f1.png",prestr+"f2.png",prestr+"f3.png",prestr+"f4.png",UPDATE_SIZE),delaytime(100),itexture(prestr+"9.png",UPDATE_SIZE),delaytime(300),itexture(prestr+"4.png",UPDATE_SIZE),delaytime(200),3),delaytime(200),itexture(prestr+"1.png",UPDATE_SIZE)));

                }
            }
            //dragon is grow up
            else if(state>=5){
                prestr = EXTEND_NAME[extendid]+"-";
                if(substate==0){
                    if(health<285){//just talking need more food to train
                        tback=contextNode.get(1).addsprite("talk.png").anchor(50,100).pos(95,15);
                        talktime=2000;
                        tlabel = tback.addlabel(global.getStaticString("nest_talk_sleep"),null,16,FONT_NORMAL,160,0,ALIGN_LEFT).pos(18,8).color(0,0,0,100);
                        tback.addaction(sequence(delaytime(talktime),callfunc(removeself)));
                        contextNode.get(1).subnodes()[0].addaction(sequence(itintto(0,0,0,0),delaytime(2000+talktime),itintto(100,100,100,100)));
                    }
                    else{//I can fly now
                        talktime=3000;
                        tback=contextNode.get(1).addsprite("talk.png").anchor(50,100).pos(95,15);
                        tback.color(0,0,0,0);
                        tlabel = tback.addlabel("",null,16,FONT_NORMAL,160,0,ALIGN_LEFT).pos(18,8).color(0,0,0,100);
                        if(global.context[0].flagfriend==0){
                            trace("train dragon", global.context[0].flagfriend, istrain);
                            if(stime>=6&&stime<10){
                                tlabel.text(global.getStaticString("nest_talk_morning"));
                            }
                            else if(stime>=11&&stime<14){
                                tlabel.text(global.getStaticString("nest_talk_noon"));
                            }
                            else if(stime>=20||stime<6){
                                tlabel.text(global.getStaticString("nest_talk_night"));
                            }
                            else{
                                tlabel.text(global.getStaticString("nest_talk_other"));
                            }
                            if(istrain==1){//after speak 22s then fly
                                to=node();
                                to.addaction(callfunc(train));
                                contextNode.add(to);
                                //to.addaction(sequence(delaytime(22000),callfunc(train)));
                                //contextNode.get(1).subnodes()[0].add(to);
                            }
                        }
                        else if(len(helpfriends)>=7||helpfriends.index(global.papaId)!=-1){
                            tlabel.text(global.getStaticString("nest_talk_feedover"));
                        }
                        else{
                            tlabel.text(global.getStaticString("nest_talk_notfeedover"));
                        }
                        tback.addaction(sequence(stop(),delaytime(1500),itintto(100,100,100,100),delaytime(talktime),callfunc(removeself)));
                        //spriteManager.getPic([prestr+"1-2.png",prestr+"1-3.png",prestr+"1-4.png", prestr+"1-5.png", prestr+"1-6.png", prestr+"1-7.png", prestr+"1-8.png", prestr+"1-9.png", prestr+"1-10.png", prestr+"1-11.png", prestr+"1-12.png", prestr+"1-13.png"]);
                        //spriteManager.getAnimation([prestr+"4-1.png", prestr+"4-2.png", prestr+"4-3.png", prestr+"4-4.png",prestr+"4-5.png",prestr+"4-6.png",prestr+"4-7.png",prestr+"4-8.png",prestr+"4-9.png"]);
                        contextNode.get(1).addaction(sequence(animate(1200,prestr+"1-2.png",prestr+"1-3.png",prestr+"1-4.png",UPDATE_SIZE),delaytime(200),itexture(prestr+"1-5.png",UPDATE_SIZE),
                        delaytime(talktime),spawn(itexture(prestr+"1-6.png",UPDATE_SIZE),imoveby(0,-8)),delaytime(300),spawn(itexture(prestr+"1-7.png",UPDATE_SIZE),imoveby(0,-32)),delaytime(400),itexture(prestr+"1-8.png",UPDATE_SIZE),
                        spawn(repeat(animate(2200,prestr+"1-9.png",prestr+"1-10.png",prestr+"1-11.png",prestr+"1-11.png",prestr+"1-11.png",prestr+"1-10.png",prestr+"1-9.png",prestr+"1-12.png",prestr+"1-13.png",
                        prestr+"1-13.png",prestr+"1-12.png",UPDATE_SIZE),4),sequence(moveby(2200,300,-500),moveby(6600,500,-1500))),spawn(itexture(prestr+"4-1.png",UPDATE_SIZE),imoveby(2200,1900)),spawn(repeat(
                        animate(1200,prestr+"4-2.png",prestr+"4-3.png",prestr+"4-4.png",prestr+"4-3.png",prestr+"4-2.png",prestr+"4-1.png",UPDATE_SIZE),3),moveby(4800,-3000,0)),
                        spawn(animate(1000,prestr+"4-5.png",prestr+"4-6.png",prestr+"4-7.png",prestr+"4-8.png",prestr+"4-9.png",UPDATE_SIZE),moveby(1000,0,100)),spawn(imoveby(0,40),itexture(prestr+"1-5.png")),animate(1000,prestr+"1-4.png",prestr+"1-3.png",prestr+"1-2.png",prestr+"1-1.png",UPDATE_SIZE)));
                        contextNode.get(1).subnodes()[0].addaction(sequence(itintto(0,0,0,0),delaytime(25000),itintto(100,100,100,100)));
                    }
 
                }
            }
        }
    }
    
    var helpfriends;
    
    function train(){
        var ret = global.user.testCost(dict([["mana", Train_Mana]]));
        if(ret == 0)//no Train at all
            return;
        global.http.addrequest(0,"trainDragon",["uid", "gid", "cid"],[global.userid,baseobj.posi[0]*RECTMAX+baseobj.posi[1],global.cityid],self,"trainover"); 
    }
    
    override function sreload(){
        if(sfilter == null){
            sfilter = stateNode.addsprite("nestbuildingfiller.png").size(1,16).pos(2,1);
            slabel = stateNode.addlabel("0/10",null,15).anchor(50,50).pos(52,9).color(100,100,100,100);
        }
        var num=len(helpfriends);
        slabel.text(str(num)+"/10");
        sfilter.size(num*10,16);
    }
    
    override function reloadNode(re){
        if(state==2){
            objid = re;
            state=3;
            health=9;
            attack=PETS_POWER[re]+PETS_UP[re]*9;
            helpfriends = [];
        }
        else if(state==3){
            objid = re;
            attack=PETS_POWER[re]+PETS_UP[re]*health;
        }
        else if(state>=4){
            extendid = re;
            attack=PETS_POWER[objid]+(PETS_UP[objid]+EXTEND_UP[extendid])*health+trainAttack;
        }
        setstate();
    }
    
    override function useaction(p,rc,c){
        if(p=="getup"){
            state=state+1;
            if((state-4) < len(hmax))
                health=hmax[state-4];
            else
                health = hmax[len(hmax)-1]
            global.pushContext(null,new Petstate4(self),NonAutoPop);
            setstate();
        }
        else if(p=="feed"){
            var data=json_loads(c);
            var hadd=1;
            if(global.context[0].flagfriend==1){
                helpfriends.append(global.papaId);
                global.user.changeValueAnimate2(global.context[0].friendnamelabel,"food",-20,-6);
                global.user.changeValueAnimate2(global.context[0].moneyb,"money", FeedMoney,-6);
                if(global.card[18]%10==3){
                    if(global.card[18]/10+1>=100){
                        var flevel = 4;
                        if(global.user.getValue("level")>=40) flevel=5;
                        var bdict = dict();
                        bdict.update("name","getcard");
                        bdict.update("cardid",18);
                        bdict.update("cardlevel",flevel);
                        global.context[0].addcmd(bdict);
                        global.card[18]=flevel;
                    }
                    else{
                        global.card[18]=global.card[18]+10;
                    }
                    global.http.addrequest(0,"changecard",["userid","cardnum","type"],[global.userid,global.card[18],4],self,null);
                }
            }
            else{
                feeded = 1;
                if((state-3) < len(hmaxs))
                    hadd = hmaxs[state-3];
                else
                    hadd = hmaxs[len(hmaxs)-1]
                global.user.changeValueAnimate2(global.context[0].ub,"food",-20*hadd,-6);
            }
            health=health+hadd;
            attack=PETS_POWER[objid]+trainAttack+(PETS_UP[objid]+EXTEND_UP[extendid])*health;
            setstate();
            executeAnimate();
        }
        else if(p=="trainover"){
            if(json_loads(c).get("id")==0){
                global.pushContext(null,new Warningdialog([global.getStaticString(25),null,6]),NonAutoPop);
            }
            else{
                trainnum++;
                trainAttack += 10;
                attack=PETS_POWER[objid]+trainAttack+(PETS_UP[objid]+EXTEND_UP[extendid])*health;
                global.user.changeValueAnimate3(contextNode,"power", Train_Power,0);
                global.user.changeValueAnimate2(contextNode,"mana",-Train_Mana,-1);
            }
        }
    }
    function getAttack()
    {
        attack=PETS_POWER[objid]+trainAttack+(PETS_UP[objid]+EXTEND_UP[extendid])*health;
        trace("getAttack", attack, trainAttack, health);
        return attack;
    }
}
