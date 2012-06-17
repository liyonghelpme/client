class MonsterAttack extends ContextObject{
    var slabels;
    var soldiers;
    var soldiermaxs;
    var slabel;
    var AttWithCata = 0;
    const WithCata = -3000;
    const NoCata = -3001;

    var monster;
    function MonsterAttack(m){
        monster = m;
        contextname = "dialog-monsterattack";
        contextNode = null;
        slabels = new Array(2);
    }
    function paintNode(){
        soldiermaxs = [global.soldiers[0],global.soldiers[1]];
        soldiers = [0,0];
        contextNode = sprite("dialogback_d.png").anchor(50,50).pos(400,240);
        contextNode.addsprite("attackelement.jpg").pos(11,11);
        contextNode.addlabel(str(soldiermaxs[0]+soldiermaxs[1]),null,20).anchor(0,50).pos(120,99).color(0,0,0,100);
        slabel = contextNode.addlabel(str(0),null,20).anchor(0,50).pos(383,99).color(0,0,0,100);
        var dtime = [[7200,14400,0],[5400,12600,14400],[4680,9000,11520],[3960,6480,8640],[3240,5400,7200],[1800,3240,4680]];
        //if(global.flagnew == 1) dtime = 0;
        var t=dtime[global.user.getValue("nobility")/3];
        var spos = global.context[1].getposbyid(global.context[1].selfgid);
        var bt = sprite("boxbutton1.png").anchor(50,50).pos(142,420).setevent(EVENT_UNTOUCH,attack);
        contextNode.add(bt,2,0);
        bt.addlabel(global.getStaticString("attack"),null,BUTTONFONTSIZE).anchor(50,50).pos(62,19);
        contextNode.addsprite("boxbutton2.png").anchor(50,50).pos(416,420).setevent(EVENT_UNTOUCH,closedialog);
        contextNode.addlabel(global.getStaticString("back"),null,BUTTONFONTSIZE).anchor(50,50).pos(416,420);
        for(var i=1;i>=0;i--){
            var mb = contextNode.addsprite("moveback.png").anchor(0,50).pos(57,175+i*88);
            mb.setevent(EVENT_TOUCH,csnum,i);
            mb.setevent(EVENT_MOVE,csnum,i);
            mb.addlabel(str(0),null,20).anchor(100,50).pos(-4,16).color(0,0,0,100);
            mb.addlabel(str(soldiermaxs[i]),null,20).anchor(0,50).pos(417,16).color(0,0,0,100);
            mb.add(sprite("moveblock.png").anchor(50,50).pos(79,16),1,0);
            slabels[i] = mb.addlabel("0",null,16).anchor(0,50).pos(59,-21).color(0,0,0,100);
        }
        /*
        if(global.flagnew == 0){
            csnum(mb,EVENT_TOUCH,0,70);
        }
        else{
            csnum(mb,EVENT_TOUCH,0,600);
        }
        */
    }
    
    function csnum(n,e,p,x){
        var move = n.get(0);
        if(x>333) x = 333;
        else if(x<79) x = 79;
        var po = move.pos();
        move.pos(x,po[1]);
        if(soldiermaxs[p] < 25400)
            soldiers[p] = soldiermaxs[p]*(x-79)/254;
        else
            soldiers[p] = soldiermaxs[p]/254*(x-79);
        slabels[p].text(str(soldiers[p]));
        var tnum = soldiers[0]+soldiers[1];
        slabel.text(str(tnum));
        if(tnum == 0){
            contextNode.get(0).texture("boxbutton2.png");
            contextNode.get(0).setevent(EVENT_UNTOUCH,null);
        }
        else{
            contextNode.get(0).texture("boxbutton1.png");
            contextNode.get(0).setevent(EVENT_UNTOUCH,attack);
        }
        var bz = tnum;
        var b1 = soldiers[0];
        if(bz == 0){
            bz = 1;
            b1 = 1;
        }
        var factor = 1;
        var bound = [100000, 1000000, 10000000];
        var fac = [1000, 10000, 100000];
        for(var i = len(bound)-1 ; i >= 0; i--)
            if(soldiers[0] > bound[i] || soldiers[1] > bound[i])
                factor = fac[i];
    }
    function realAttack(p)
    {
        if(global.timer.times2c(global.user.getValue("nobattletime"))>global.timer.currenttime){
            global.pushContext(null,Warningdialog([global.getStaticString("nobattle_whenattack"),1,1]),NonAutoPop);
            return 0;
        }
        var cataNum = global.user.getValue("catapult");
        if(AttWithCata == 0)
            cataNum = 0;

        global.http.addrequest(1, "monsterc/attackMonster", ["uid", "monsterId", "inf", "cav", "cata"], [global.userid, monster.id, soldiers[0], soldiers[1], cataNum], this, "attackover");
    }
    function attack(){
        if(global.currentLevel == contextLevel){
            //-2000 spriteManager
            //>= 0 what
            //< 0 what
            if(global.user.getValue("catapult") > 0)
                global.pushContext(null, Warningdialog(["是否派出你的"+str(global.user.getValue("catapult"))+"投石车？", -3000, 1]), NonAutoPop); 
            else
                realAttack(0);
        }
    }
    
    function useaction(p,rc,c){
        if(p=="attackover"){
            attackover(0,rc,c);
        }
    }
    
    function attackover(r,rc,c){
        if(rc!=0){
            var data = json_loads(c);
            if(data.get("id",1)==1){//add battlelist
                ChangeSoldier(0, -data.get("lostInf"));
                ChangeSoldier(1, -data.get("lostCav"));
                global.user.changeValue("catapult", -data.get("lostCata"));

                global.popContext(null);
                var words = global.getFormatString("monKill", ["[INF]", str(data.get("lostInf")), "[CAV]", str(data.get("lostCav")), "[CATA]", str(data.get("lostCata")), "[LEFTPOWER]", str(data.get("leftPower"))]);
                global.pushContext(null, new MyWarnDialog(null, 1, words), NonAutoPop);
                monster.setLeftPower(data.get("leftPower"));
            }
            else{
                if(data.get("status")==0){
                    global.pushContext(null,new Warningdialog([global.getStaticString("monsterDisappear"),null,1]),NonAutoPop);
                }
                else if(data.get("status")==1){
                    global.pushContext(null,new Warningdialog([global.getStaticString("soldierNot"),null,1]),NonAutoPop);
                }
            }
        }
    }
    
    function closedialog(){
        if(global.currentLevel == contextLevel)
            global.popContext(null);
    }
    
    function reloadNode(re){
        if(re == -3000 || re == -3001)//attack without catapult
        {
            if(re == -3000)
                AttWithCata = 1;
            else
                AttWithCata = 0;
            realAttack(re);
        }
        else if(re==1){
            var cataNum = global.user.getValue("catapult");
            if(AttWithCata == 0)
                cataNum = 0;

            global.http.addrequest(1, "monsterc/attackMonster", ["uid", "monsterId", "inf", "cav", "cata"], [global.userid, monster.id, soldiers[0], soldiers[1], cataNum], this, "attackover");

        }
    }
    
    function deleteContext(){
        contextNode.removefromparent();
        contextNode = null;
    }
}
