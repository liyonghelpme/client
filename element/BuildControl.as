/*
import element.OnekeyController;
import element.Devinedialog;
import element.QuickControl;
import element.PlantControl;
import element.UpdateControl;
import element.SoldierControl;
//import element.Warningdialog;
import element.Saledialog;
import element.Nestpetchange;
import element.Nestpetchange2;
import element.Nestpetdialog;
import element.WoodControl;
import element.StoneControl;
import element.ProCatapult;
import element.Catapult;
import element.DiskExplain;
import element.Disk;
*/
class BuildControl extends ContextObject{
    var place;
    var placeObj;
    var mode;
    var timelabel;
    var buttons;
    function BuildControl(m,f){
        contextname = "control-build";
        mode = m;
        contextNode = null;
        place = f;
        trace("control index", mode);
        if(mode >= 0) placeObj = place.baseobj;
        else placeObj = place;
        timelabel = null;
    }

    function paintNode(){
        buttons = new Array(0);
        contextNode = sprite().pos(400,240);
        
        var beginx;
        trace("mode", mode);
        //not decorator
        if(placeObj.buildcontextname != "obj"){
            var back = sprite("buildcontrolback2.png").anchor(50,100).pos(0,9);
            contextNode.add(back,0,111);
            var bl=90;

            // size == 3 
            if(placeObj.contextid == 3){
                bl = 60;
                if(mode == FARM_INDEX && place.state==WORKING){
                    bl=100;
                }
                if(placeObj.objectid>171 && placeObj.objectid<200){
                    bl=50;
                }
            }
            else if(placeObj.buildcontextname == "god"){
                bl = 35;
                if(place.bid>=20){
                    bl=40;
                }
            }
            else if(mode == STATUE_INDEX){
                bl=50;
            }
            if(placeObj.buildcontextname!="nest"){
                back.addsprite(place.gettexture()).anchor(50,50).pos(107,55).scale(bl);
                var namelabel = back.addlabel(global.getname(placeObj.buildcontextname,placeObj.objectid%100),null,20).anchor(50,50).pos(107,123).color(0,0,0,100);
                if(place.state == BUILDING || place.state == WORKING){
                    if((mode != GOD_INDEX && mode != STATUE_INDEX) || place.state != WORKING ){
                        buttons.append(ACC_BUTTON);
                    }
                    timelabel = back.addlabel("",null,20).anchor(100,50).pos(197,158).color(0,0,0,100);
                    timelabel.addaction(repeat(callfunc(updatetime),delaytime(1000)));
                    var labelstr = "建筑中";
                    if(place.state == WORKING){
                        if(mode == ROOM_INDEX) labelstr = "招募中";
                        else if(mode == FACT_INDEX) labelstr = "生产中";
                        else if(mode == CAMP_INDEX) labelstr = "训练中";
                        else if(mode == FARM_INDEX){
                            if(place.bid<5){
                                labelstr = "种植中";
                                namelabel.text(global.getname("plant",place.objid));
                            }
                            else if(place.bid == 5){
                                labelstr = "砍伐中";
                                namelabel.text(global.getname("wood",place.objid));
                            }
                            else{
                                labelstr = "开采中";
                                namelabel.text(global.getname("stone",place.objid));
                            }
                        }
                        else if(mode == STATUE_INDEX){
                            labelstr = "生产城防中";
                        }
                        else if(mode == GOD_INDEX){
                            labelstr = "祝福中";
                            buttons.append(-BLESS_BUTTON);
                        }
                    }
                    back.addlabel(labelstr,null,20).anchor(0,50).pos(18,158).color(56,1,1);
                }
                else{
                    //trace("mode, bid", mode, place.bid);
                    if(mode== ROOM_INDEX){
                        buttons.append(CALL_BUTTON);
                    }
                    else if(mode == CAMP_INDEX){
                        if(place.bid/3 < 3)//other camp
                            buttons.append(place.bid/3+7);
                        else//catapult stone
                            buttons.append(CATA_BUTTON);
                    }
                    else if(mode == FARM_INDEX){
                        if(place.bid<5){
                            buttons.append(PLANT_BUTTON);
                        }
                        else if(place.bid==5){
                            buttons.append(WOOD_BUTTON);
                        }
                        else if(place.bid==6){
                            buttons.append(ROCK_BUTTON);
                        }
                    }
                    else if(mode == GOD_INDEX){
                        buttons.append(BLESS_BUTTON);
                    }
                    else if(mode == DISK_INDEX)
                    {
                        trace("add Two button");
                        buttons.append(DISK_BUTTON);
                        buttons.append(INFO_BUTTON);
                    }
                    back.addlabel("空闲中",null,20).anchor(0,50).pos(18,158).color(1,17,56);
                }
                if(place.state>= FINISH_BUILDING && mode != DISK_INDEX && mode != FARM_INDEX && mode != STATUE_INDEX && ((mode!=GOD_INDEX &&place.bid%3!=2) ||(mode==GOD_INDEX && (place.bid<16||place.bid>=20&&place.bid%5!=4)))){
                    buttons.append(UP_BUTTON);
                }
                else if(mode == GOD_INDEX &&place.state >= FINISH_BUILDING && (place.bid==16||place.bid==18||place.bid==24)){
                    buttons.append(ONE_STEP_BUTTON);
                }
                beginx = -119;
            }
            else{
                namelabel = back.addlabel(global.data.getbuild(place.bid).get("name"),null,20).anchor(50,50).pos(107,123).color(0,0,0,100);
                if(place.state >= EGG_STATE){
                    var max;
                    if((place.state - EGG_STATE) < len(hmax))
                        max = hmax[place.state-EGG_STATE];
                    else
                        max = hmax[len(hmax)-1];
                    //var hmax;
                    var add;
                    if((place.state-EGG_STATE) < len(hmaxs))
                        add = hmaxs[place.state-EGG_STATE];
                    else
                        add = hmaxs[len(hmaxs)-1];
                    var stt = place.health/(max/3);
                    if(stt>2) stt=2;
                    if(place.state==3){
                        var eggpic = sprite("egg-"+str(stt+1)+".png").anchor(50,0).pos(107,7);
                        //spriteManager.getPic("egg-"+str(stt+1)+".png", eggpic);
                        back.add(eggpic,1,111);

                        back.addlabel("孵化中",null,18).anchor(100,50).pos(197,123).color(1,17,56);
                    }
                    else if(place.state==4){
                        var pstr = EXTEND_NAME[place.extendid]+"-";
                        var dragonpic = sprite(pstr+"7.png").anchor(50,0).pos(107,7).scale(70);
                        //spriteManager.getPic(pstr+"7.png", dragonpic);
                        back.add(dragonpic,1,111);
                        back.addlabel("成长中",null,18).anchor(100,50).pos(197,123).color(1,17,56);
                    }
                    else if(place.state >= 5){
                        pstr = EXTEND_NAME[place.extendid]+"-";
                        dragonpic = sprite(pstr+"1-1.png").anchor(50,50).pos(107,57).scale(70);
                        //spriteManager.getPic(pstr+"1-1.png", dragonpic);
                        back.add(dragonpic,1,111);
                        back.addlabel("成长中",null,18).anchor(100,50).pos(197,123).color(1,17,56);
                    }
                    var l=back.addlabel(str(place.getAttack()),null,20).anchor(100,50).pos(197,94).color(0,0,0,100);
                    l.prepare();
                    back.addsprite("power.png").anchor(100,50).pos(195-l.size()[0],94);
                    namelabel.anchor(0,50).pos(18,123).text(place.petname).scale(90);
                    buttons.append(23);
                    if(global.context[0].flagfriend == 1){
                        if(place.health>=max||len(place.helpfriends)>=add||place.helpfriends.index(ppy_userid())!=-1||global.user.getValue("food")<20){
                            buttons[0] = -23;
                        }
                    }
                    else{
                        if(place.feeded==1 || global.user.getValue("food")<20*add){
                            buttons[0] = -23;
                        }
                        if(place.state==5&&place.health<285){
                            buttons.append(-21);
                        }
                        else{
                            buttons.append(21);
                        }
                    }
                    buttons.append(19);
                    if(place.health>=max){
                        back.addsprite("nestpetfiller2.png",ARGB_8888).pos(11,146).size(190,24);
                        timelabel = back.addlabel("MAX",null,20).anchor(50,50).pos(107,158).color(0,0,0,100);
                    }
                    else{
                        back.addsprite("nestpetfiller"+str(stt)+".png",ARGB_8888).pos(11,146).size(190*place.health/max,24);
                        timelabel = back.addlabel(str(place.health)+"/"+str(max),null,20).anchor(50,50).pos(107,158).color(0,0,0,100);
                    }
                }
                else{
                    back.addsprite(place.gettexture()).anchor(50,50).pos(107,55).scale(bl);
                    buttons.append(25);
                    back.addlabel("空闲中",null,20).anchor(0,50).pos(18,158).color(1,17,56);
                }
                beginx = -119;
            }
        }
        else{
            back = contextNode.addsprite("buildcontrolback1.png").anchor(50,100).pos(0,9);
            back.addlabel(global.getname("obj",placeObj.objectid-500),null,20).anchor(50,50).pos(71,123).color(0,0,0,100);
            bl=100;
            if(placeObj.objectid==541){
                bl=50;
            }
            else if(placeObj.contextid==2){
                bl=75;
            }
            back.addsprite("object"+str(placeObj.objectid-500)+".png").anchor(50,50).pos(71,55).scale(bl);
            beginx = -83;
        }
        if(placeObj.objectid < DRAGON_ID && mode != GOD_INDEX && mode != DISK_INDEX)
            buttons.append(SELL_BUTTON);
        for(var k=0;k<len(buttons);k++){
            var filter = NORMAL;
            var buttonid = buttons[k];
            if(buttonid > GRAY_ACC && buttonid%2 == 0 && buttonid < CATA_BUTTON){//not catabutton
                //trace("wrong buttonid",buttonid);
                buttons[k]=1-buttonid;
                buttonid = buttons[k];
            }
            if(buttonid<0){
                buttonid=-buttonid;
                filter = GRAY;
            }
            //trace("buttonid", buttonid);
            var bt = contextNode.addsprite("buttontab0.png",filter).pos(73*k+beginx,0);
            bt.addsprite("opbutton"+str(buttonid)+".png",filter).anchor(50,50).pos(46,46);
            bt.setevent(EVENT_TOUCH,buttonclicked,k);
            bt.setevent(EVENT_UNTOUCH,buttonclicked,k);
        }
    }
    
    function buttonclicked(n,e,p){
        var filter = NORMAL;
        if(buttons[p] > GRAY_ACC && buttons[p]%2==0 && buttons[p] < CATA_BUTTON){
            filter = GRAY;
        }
        if(global.currentLevel == contextLevel){
            if(e==EVENT_TOUCH)
                n.texture("buttontab1.png",filter);
            else{
                n.texture("buttontab0.png",filter);
                if(buttons[p] != CALL_BUTTON)
                    global.popContext(null);
                if(buttons[p] == ACC_BUTTON)
                    global.pushContext(place,new QuickControl(),NonAutoPop);
                else if(buttons[p] == UP_BUTTON){
                    global.pushContext(place,new UpdateControl(),NonAutoPop);
                }
                else if(buttons[p] == SELL_BUTTON)
                    global.pushContext(self,new Saledialog(placeObj),NonAutoPop);
                else if(buttons[p] == PLANT_BUTTON)
                    global.pushContext(place,new PlantControl(),NonAutoPop);
                else if(buttons[p] == WOOD_BUTTON)
                    global.pushContext(place,new WoodControl(),NonAutoPop);
                else if(buttons[p] == ROCK_BUTTON)
                    global.pushContext(place,new StoneControl(),NonAutoPop);
                else if(buttons[p] == CALL_BUTTON)
                    global.popContext(1);
                else if(buttons[p] == BLESS_BUTTON)
                    global.pushContext(place,new Devinedialog(),NonAutoPop);
                else if(buttons[p] == -BLESS_BUTTON){
                    global.pushContext(place,new Warningdialog([global.getStaticString("god_bless_over"),null,5]),NonAutoPop);
                }
                else if(buttons[p] == ONE_STEP_BUTTON){
                    var tmp=[0,0,1,0,2];
                    var btype = place.bid%4;
                    if(place.bid>=20){
                        btype=place.bid/5;
                    }
                    global.pushContext(null,new OnekeyController(tmp[btype]),NonAutoPop);
                }
                else if(buttons[p] == -ONE_STEP_BUTTON){
                    global.pushContext(null,new Warningdialog([global.getStaticString(14),null,4]),NonAutoPop);
                }
                else if(buttons[p] == FEED_BUTTON){
                    global.http.addrequest(1,"feed",["uid","gid","cid"],[global.userid,placeObj.posi[0]*RECTMAX+placeObj.posi[1],global.context[0].ccid],place,"feed");
                }
                else if(buttons[p] == -FEED_BUTTON){
                    var maxs=[51,201,831];
                    var hmaxs=[3,5,7];
                    var max = maxs[place.state-3];
                    var hmax= hmaxs[place.state-3];
                    if(global.context[0].flagfriend == 1){
                        if(len(place.helpfriends)>=hmax){
                            global.pushContext(null,new Warningdialog([global.getFormatString(39,["[NAME]",global.getfriend(global.context[0].cpid).get("name"),"[NUM]",str(hmax)]),null,5]),NonAutoPop);
                        }
                        else if(place.helpfriends.index(ppy_userid())!=-1){
                            global.pushContext(null,new Warningdialog([global.getStaticString(38),null,5]),NonAutoPop);
                        }
                        else if(place.health>=max){
                            global.pushContext(null,new Warningdialog([global.getStaticString(37),null,5]),NonAutoPop);
                        }
                        else{
                            global.user.testCost(dict([["food",20]]));
                        }
                    }
                    else{
                        if(place.feeded==1){
                            global.pushContext(null,new Warningdialog([global.getStaticString(36),null,5]),NonAutoPop);
                        }
                        else{
                            global.user.testCost(dict([["food",hmax*20]]));
                        }
                    }
                }
                else if(buttons[p] == TRAIN_BUTTON){//train dragon do animation
                    //trace("train dragon", place.istrain);
                    place.istrain=1;
                    place.executeAnimate();//lock not train again
                    place.istrain=0;
                }
                else if(buttons[p] == -CHANGE_BUTTON){
                    global.pushContext(null,new Warningdialog([global.getStaticString("nest_style_cannotchange"),null,5]),NonAutoPop);
                }
                else if(buttons[p] == CHANGE_BUTTON){
                    if(place.state==EGG_STATE){
                        global.pushContext(place,new Nestpetchange(place),NonAutoPop);
                    }
                    else if(place.state>=DRAGON_STATE){
                        global.pushContext(place,new Nestpetchange2(place),NonAutoPop);
                    }
                }
                else if(buttons[p] == 25){//first time buy egg get dragon pictures
                    spriteManager.getDragon(place);
                    //global.pushContext(place,new Nestpetdialog(),NonAutoPop);
                }
                else if(buttons[p] == DISK_BUTTON)
                {
                   global.pushContext(place, new Disk(), NonAutoPop); 
                }
                else if(buttons[p] == INFO_BUTTON)
                {
                    global.pushContext(place, new DiskExplain(), NonAutoPop);
                }
                else//ip = 26
                {
                    //build object 
                    //normal object
                    if((place.bid%100)/3 < 3)//normal camp
                    {
                        global.pushContext(place,new SoldierControl(buttons[p]-7,place.bid%3),NonAutoPop);
                    }
                    else//car and weapon
                    {
                        global.pushContext(place,new Catapult(),NonAutoPop);
                    }
                }
            }
        }
    }

    function updatetime(){
        var lefttime = place.lefttime;
        timelabel.text(global.gettimestr(lefttime));
        if(lefttime == 0){
            global.popContext(null);
        }
    }

    function reloadNode(re){
        if(re==1){
            placeObj.reloadNode(1);
        }
    }


    function deleteContext(){
        contextNode.addaction(stop());
        contextNode.removefromparent();
        if(timelabel!=null){
            timelabel.addaction(stop());
            timelabel.removefromparent();
        }
    }
}
