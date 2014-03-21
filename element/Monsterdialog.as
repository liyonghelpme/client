import element.Refreshdialog;
class Monsterdialog extends ContextObject{
    var mid;
    var mtype;
    var mpower;
    var element;
    var flagdefeatable;
    const DefeatMon_Cae = -1;
    function Monsterdialog(m){
        contextname = "dialog-battle-monster";
        contextNode = null;
        mid = m;
        element = null;
    }
    
    function deleteContext(){
        contextNode.addaction(stop());
        contextNode.removefromparent();
        contextNode = null;
        element.removefromparent();
        element=null;
    }
    
    function getelement(){
        if(element == null){
            element = node();
            flagdefeatable=1;
            
            element.addsprite("monsterelement.png").anchor(50,50).pos(219,160);
            mtype = global.context[1].monstercontroller.monsters[mid];
            if(global.flagnew ==1){
                mtype = 0;
            }
            mpower = MONSTER_POWER[mtype];
            if(global.context[1].monstercontroller.mlevel>=60){
                mpower = mpower+global.context[1].monstercontroller.mlevel-59;
            }
            element.addlabel(MONSTERNAME[mtype],null,20).anchor(50,50).pos(219,78).color(0,0,0,100);
            var monpic = element.addsprite("monster_"+str(mtype)+"_1.png").anchor(50,50).pos(219,160).scale(150);
            //spriteManager.getPic("monster_"+str(mtype)+"_1.png", monpic);
            element.addlabel(global.getStaticString("attackIs")+str(mpower),null,20).anchor(50,50).pos(219,242).color(0,0,0,100);

            var warning=element.addlabel("",null,20).anchor(50,50).pos(219,285).color(100,0,0,100);
        
            var totalPower = global.soldiers[0]+global.soldiers[1];
            if(totalPower < 0)
                totalPower = MAX_INT;
            if(totalPower<mpower){
                warning.text(global.getStaticString("powerlack"));
                flagdefeatable = 0;
            }
        }
        return element;
    }
    
    function paintNode(){
        var dialog = new Simpledialog(0,self);
        dialog.init(dialog,global);
        contextNode = dialog.getNode();
        dialog.usedefaultbutton(2,[global.getStaticString("attack"), global.getStaticString("back")]);
        if(flagdefeatable == 0){
            contextNode.get(0).addsprite("caesars_big.png").pos(0, 20).anchor(50, 50);
            contextNode.get(0).addlabel(str(-DefeatMon_Cae), null, 24, FONT_BOLD).color(100, 100, 100, 100).pos(10, 15);
            //var cost = dict([["caesars", -DefeatMon_Cae]]);
            //var ret = global.user.testCost(cost);
            if(global.user.getValue("caesars") < abs(DefeatMon_Cae))
            {
                contextNode.get(0).texture("boxbutton2.png");
                contextNode.get(0).setevent(EVENT_UNTOUCH,null);
            }
        }
    }
    
    function excute(p){
        global.popContext(null);
        if(global.flagnew == 1){//new user 
            defeatmonster(0,1,"{'id':1,'infantrypower':30,'powerlost':0}");
        }
        else{
            if(flagdefeatable == 0)//caesar
                global.http.addrequest(1,"defeatmonster",["uid","gridid", "kind"],[global.userid,mid, 0],self,"defeatmonster");
            else//coin
                global.http.addrequest(1,"defeatmonster",["uid","gridid", "kind"],[global.userid,mid, 1],self,"defeatmonster");
        }
    }
    //finish Action 
    function useaction(p,rc,c){
        if(p == "defeatmonster"){
            defeatmonster(p,rc,c);
        }
        else if(p=="datarefresh"){
            datarefresh(json_loads(c));
        }
    }
    //defeat by Caesars or by Soldier 
    function defeatmonster(r,rc,c){
        if(rc!=0){
            var data = json_loads(c);
            if(data.get("id",1)!=0){
                var m = global.context[1].baseNode.get(mid+8);//MapPage back monster 
                trace("monster is", m);
                var sid = "1";
                if(mpower >= 70){
                    sid="2";
                }
                //Monster remove 
                m.setevent(EVENT_UNTOUCH,null);
                var s = m.addsprite("animate_self_left_"+sid+"_2.png").anchor(100,100).pos(-40,m.size()[1]).color(0,0,0,0);
                s.addaction(sequence(tintto(1000,100,100,100,100),
                spawn(moveby(1000,60,0),repeat(animate(500,"animate_self_left_"+sid+"_1.png","animate_self_left_"+sid+"_2.png"),2)),
                repeat(animate(250,"animate_self_left_"+sid+"_3.png","animate_self_left_"+sid+"_2.png"),4),delaytime(500),
                spawn(repeat(animate(500,"animate_self_"+sid+"_1.png","animate_self_"+sid+"_2.png"),4),sequence(delaytime(1000),tintto(1000,0,0,0,0))),
                callfunc(removeself)));
                if(mtype<18){
                    m.addaction(sequence(stop(),delaytime(3500),animate(3000,"01.png","02.png","03.png","04.png","05.png","06.png","07.png","08.png","09.png","10.png","11.png","12.png","13.png","14.png","15.png"),itexture(""),delaytime(2000),callfunc(removeself)));
                }
                else{
                    //var temp = sprite("monster_"+str(mtype)+"_dead.png");
                    //spriteManager.getPic("monster_"+str(mtype)+"_dead.png", temp)
                    m.addaction(sequence(stop(),delaytime(3500),itexture("monster_"+str(mtype)+"_dead.png"),delaytime(1000),animate(2500,"01.png","02.png","03.png","04.png","05.png","06.png","07.png","08.png","09.png","10.png","11.png","12.png","13.png","14.png","15.png"),itexture(""),delaytime(2000),callfunc(removeself)));
                }
                //Add specialgoods or lost 
                trace("defeat data", data);
                c_addtimer(1000,defeatover,[m,data.get("powerlost",0), data.get("specialgoods",""), data.get("goods")],3500,1);

                SetSoldier(0, data.get("infantrypower",0));
                SetSoldier(1, data.get("cavalrypower",0));
                global.context[1].powerlabel.text(str(global.soldiers[0]+global.soldiers[1]));
                global.card[mtype/3]++;
                var cl = cardlevelnum.index(global.card[mtype/3]);
                if(cl!=-1){
                    var cdict = dict();
                    cdict.update("name","getcard");
                    cdict.update("cardid",mtype/3);
                    cdict.update("cardlevel",cl+1);
                    global.context[0].addcmd(cdict);
                }
                global.context[0].warmap.monstercontroller.defeatmonster(mid);
                if(global.context[0].warmap.monstercontroller.monsternum == 0){
                    cdict =dict();
                    cdict.update("name","monstercomplete");
                    cdict.update("power",mpower);
                    global.context[0].addcmd(cdict);
                }
            }
            else{
                global.pushContext(self,new Refreshdialog(),NonAutoPop);
            }
        }
    }
    function datarefresh(data){
        if(data.get("id")==0){
            global.pushContext(self,new Refreshdialog(),NonAutoPop);
            return 0;
        }
                //global.soldiers[0] = data.get("infantrypower",0);
                //global.soldiers[1] = data.get("cavalrypower",0);
                SetSoldier(0, data.get("infantrypower",0));
                SetSoldier(1, data.get("cavalrypower",0));
                global.user.setValue("money",data.get("corn"));
                global.user.setValue("exp",data.get("exp"));
                global.user.setValue("power",global.soldiers[0]+global.soldiers[1]);
            var cardstr = data.get("monsterdefeat","0;0;0;0;0;0;0;0;0;0;0;0");
            var cards = cardstr.split(";");
            for(var k=0;k<12&&k<len(cards);k++){
                global.card[k]=int(cards[k]);
            }
        var mstr = data.get("monsterstr");
        var monsternum = 0;
        var monsters = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
        if(mstr!=null && mstr!=""){
            var mstr_objs = mstr.split(";");
            for(var i=0;i<len(mstr_objs);i++){
                var mstr_obj = mstr_objs[i].split(",");
                var mi =int(mstr_obj[0]);
                if(int(mstr_obj[1])>=10){
                    continue;
                }
                monsters[int(mstr_obj[1])] = mi;
                if(mi>-1){
                    monsternum++;
                }
            }
        }
        global.context[0].warmap.monstercontroller.monsters=monsters;
        global.context[0].warmap.monstercontroller.monsternum=monsternum;
        
                var cl = cardlevelnum.index(global.card[mtype/3]);
                if(cl!=-1){
                    var cdict = dict();
                    cdict.update("name","getcard");
                    cdict.update("cardid",mtype/3);
                    cdict.update("cardlevel",cl+1);
                    global.context[0].addcmd(cdict);
                }
                global.context[0].warmap.monstercontroller.defeatmonster(mid);
                if(global.context[0].warmap.monstercontroller.monsternum == 0){
                    cdict =dict();
                    cdict.update("name","monstercomplete");
                    cdict.update("power",mpower);
                    global.context[0].addcmd(cdict);
                }
    }
    //monster, powerlost, specialgoods, goods
    function defeatover(timer,tick,m){//parameter powerlost == 0
        trace("defeatover", timer, tick, m);
        if(m[1] == 0){//X Y POsition add Exp or change Value no power lost 
            if(flagdefeatable == 0)
                global.user.changeValueAnimate2(m[0], "caesars", DefeatMon_Cae, -4);
            global.user.changeValueAnimate2(m[0],"exp",10,0);//why animate 10
        }
        else{
            if(flagdefeatable == 1)
                global.user.changeValueAnimate2(m[0],"power",-m[1],-4);
            else
                global.user.changeValueAnimate2(m[0], "caesars", DefeatMon_Cae, -4);
            var exp;
            var money;
            var l = global.user.getValue("level");
            if(l<9){
                exp = (mpower+3)/4;
                money=(mpower+1)/2*5;
            }
            else if(l<15){
                exp = (mpower*2+4)/5;
                money=(mpower*3+4)/5*5;
            }
            else{
                exp = (mpower+1)/2;
                money=(mpower*13+19)/20*5;
            }
            global.user.changeValueAnimate2(m[0],"exp",exp,0);
            global.user.changeValueAnimate2(m[0],"money",money,-2);

            var specs = m[2].split("!");
            var le = len(specs);
            var si = m[0].size();
            var i = 0;
            if(m[2] != ""){
                for(i=0; i<le; i++){
                    global.special[int(specs[i])]++;
                    var s=sprite("gift"+str(int(specs[i])+1)+".png").anchor(50,100).scale(50).color(0,0,0,0);
                    m[0].add(s.pos(-15*le+i*50+si[0]/2,si[1]),-1);
                    s.addaction(sequence(tintto(500,100,100,100,100),delaytime(3000),tintto(1000,0,0,0,0)));
                }
            }

            var goods = m[3];
            trace("goods", goods);
            if(goods == 1)
            {
                global.user.changeValue("dragonStone", 1);
                goods = sprite("opbutton27.png").anchor(50, 100).scale(60).color(0, 0, 0, 0);
                m[0].add(goods.pos(-15*le+i*50+si[0]/2,si[1]),-1);
                goods.addaction(sequence(tintto(500,100,100,100,100),delaytime(3000),tintto(1000,0,0,0,0)));
            }
        }
    }
}
