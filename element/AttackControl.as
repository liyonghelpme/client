class AttackControl extends ContextObject{
    var slabels;
    var soldiers;
    var soldiermaxs;
    var lastx;
    var eid;
    var atime;
    var btime;
    var slabel;
    var timelabel;
    var AttWithCata = 0;
    const WithCata = -3000;
    const NoCata = -3001;
    function AttackControl(g){
        contextname = "dialog-battle-choosesoldier";
        contextNode = null;
        slabels = new Array(2);
        eid = g;
    }
    function paintNode(){
        soldiermaxs = [global.soldiers[0],global.soldiers[1]];
        soldiers = [0,0];
        contextNode = sprite("dialogback_d.png").anchor(50,50).pos(400,240);
        contextNode.addsprite("attackelement.jpg").pos(11,11);
        contextNode.addlabel(str(soldiermaxs[0]+soldiermaxs[1]),null,20).anchor(0,50).pos(138,99).color(0,0,0,100);
        slabel = contextNode.addlabel(str(0),null,20).anchor(0,50).pos(377,99).color(0,0,0,100);
        var dtime = [[7200,14400,0],[5400,12600,14400],[4680,9000,11520],[3960,6480,8640],[3240,5400,7200],[1800,3240,4680]];
        //if(global.flagnew == 1) dtime = 0;
        var t=dtime[global.user.getValue("nobility")/3];
        var spos = global.context[1].getposbyid(global.context[1].selfgid);
        var epos = global.context[1].getposbyid(eid);
        trace(spos,epos);
        if(spos[0]==epos[0]&&spos[1]==epos[1]){
            atime = t[0];
        }
        else{
            var mw=abs(spos[1]/2-epos[1]/2);
            atime = t[2]*(abs(spos[0]-epos[0])+mw)+t[1]*(abs(spos[1]-epos[1])-mw);
        }
        contextNode.addlabel(global.getStaticString("attack_time")+global.getStaticString(":"),null,20,FONT_BOLD).anchor(100,50).pos(115,371).color(0,0,0,100);
        contextNode.addlabel(global.getStaticString("attacktime_notice"),null,16).pos(230,366).color(0,0,0,100);
        timelabel = contextNode.addlabel(global.gettimestr(atime),null,20).anchor(0,50).pos(119,371).color(0,0,0,100);
        var bt = sprite("boxbutton1.png").anchor(50,50).pos(142,420).setevent(EVENT_UNTOUCH,attack);
        contextNode.add(bt,2,0);
        var empty = global.emptyCitiesInGlo.get(eid, null);
        if(empty != null && empty[1] == global.userid)
        {
            bt.addlabel(global.getStaticString("addsoldier"),null,BUTTONFONTSIZE).anchor(50,50).pos(62,19);
        }
        else
        {
            bt.addlabel(global.getStaticString("attack"),null,BUTTONFONTSIZE).anchor(50,50).pos(62,19);
        }
        contextNode.addsprite("boxbutton2.png").anchor(50,50).pos(416,420).setevent(EVENT_UNTOUCH,closedialog);
        contextNode.addlabel(global.getStaticString("back"),null,BUTTONFONTSIZE).anchor(50,50).pos(416,420);
        var m2b = [2, 2];
        for(var i=1;i>=0;i--){
            var mb = contextNode.addsprite("moveback.png").anchor(0,50).pos(57,175+i*88);
            m2b[i] = mb;
            mb.setevent(EVENT_TOUCH,csnum,i);
            mb.setevent(EVENT_MOVE,csnum,i);
            mb.addlabel(str(0),null,20).anchor(100,50).pos(-4,16).color(0,0,0,100);
            mb.addlabel(str(soldiermaxs[i]),null,20).anchor(0,50).pos(417,16).color(0,0,0,100);
            mb.add(sprite("moveblock.png").anchor(50,50).pos(79,16),1,0);
        }
        slabels[0] = m2b[0].addlabel("0",null,16).anchor(0,50).pos(100,-19).color(0,0,0,100);
        slabels[1] = m2b[1].addlabel("0",null,16).anchor(0,50).pos(100,-23).color(0,0,0,100);
        if(global.flagnew == 0){
            csnum(mb,EVENT_TOUCH,0,70);
        }
        else{
            csnum(mb,EVENT_TOUCH,0,600);
        }
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
        //btime = (soldiers[0]/factor*atime + soldiers[1]/factor*atime/2)/(bz/factor);
        //btime = (soldiers[0]*2/factor+soldiers[1]/factor)*atime/(2*(bz/factor))
        btime = 100*(bz+b1)/(2*bz)*atime/100;
        timelabel.text(global.gettimestr(btime));
    }
    function realAttack(p)
    {
        if(global.timer.times2c(global.user.getValue("nobattletime"))>global.timer.currenttime){
            global.pushContext(null,Warningdialog([global.getStaticString("nobattle_whenattack"),1,1]),NonAutoPop);
            return 0;
        }
        var eu=global.context[1].userdict.get(eid);
        var euid=eu[1];
        if(euid>=0){
            euid=eu[5];
        }
        if(AttWithCata == 1)//attack with catapult
            global.http.addrequest(1,"attack",["uid","enemy_id","timeneed","infantry","cavalry", "catapult"],[global.userid,euid,btime,soldiers[0],soldiers[1], global.user.getValue("catapult")],self,"attackover");
        else //attack without catapult
            global.http.addrequest(1,"attack",["uid","enemy_id","timeneed","infantry","cavalry", "catapult"],[global.userid,euid,btime,soldiers[0],soldiers[1], 0],self,"attackover");
    }
    function attack(){
        if(global.currentLevel == contextLevel){
            //-2000 spriteManager
            //>= 0 what
            //< 0 what
            if(global.user.getValue("catapult") > 0)
                global.pushContext(null, Warningdialog([global.getFormatString("SendCata", ["[NUM]", str(global.user.getValue("catapult"))]), -3000, 1]), NonAutoPop); 
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
                ChangeSoldier(0, -soldiers[0]);
                ChangeSoldier(1, -soldiers[1]);
                if(AttWithCata == 1)
                    global.user.changeValue("catapult", -global.user.getValue("catapult"));
                var empty = global.emptyCitiesInGlo.get(eid);

                global.popContext(null);
                var etime = global.timer.currenttime+btime;
                if(empty != null)
                {
                    global.battlelist.append([etime,"0",1,eid,soldiers[0],soldiers[1],empty[0]]);//cid
                }
                else
                {
                    var eu = global.context[1].userdict.get(eid);
                    global.battlelist.append([etime,eu[0],1,eid,soldiers[0],soldiers[1],eu[1]]);
                }
                global.context[1].setuserflag(eid);
                global.context[1].refreshlist();
                global.user.setValue("nobattletime",0);
                global.pushContext(null,new Attackbegindialog(etime),NonAutoPop);
            }
            else{
                if(data.get("status")==0){
                    global.pushContext(null,new Warningdialog([global.getStaticString("attack_whennobattle"),null,1]),NonAutoPop);
                    global.context[1].userdict.get(eid)[7] = data.get("endtime");
                    global.context[1].setuserflag(eid);
                }
                else if(data.get("status")==1){
                    global.pushContext(null,new Warningdialog([global.getStaticString("attack_whenattacked"),null,1]),NonAutoPop);
                }
                else if(data.get("status")==2){
                    global.pushContext(null,new Warningdialog([global.getStaticString("attack_whenwon"),null,1]),NonAutoPop);
                }
                else if(data.get("status")==3){
                    global.pushContext(null,new Warningdialog([global.getStaticString("attack_whenupdated"),null,1]),NonAutoPop);
                    global.context[1].atklist.remove(global.context[1].userdict.pop(eid));
                    global.context[1].refreshmap(1);
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
            var eu=global.context[1].userdict.get(eid);
            var euid=eu[1];
            if(euid>=0){
                euid=eu[5];
            }
            if(AttWithCata == 0)
                global.http.addrequest(1,"attack",["uid","enemy_id","timeneed","infantry","cavalry", "catapult"],[global.userid,euid,btime,soldiers[0],soldiers[1], 0],self,"attackover");
            else
                global.http.addrequest(1,"attack",["uid","enemy_id","timeneed","infantry","cavalry", "catapult"],[global.userid,euid,btime,soldiers[0],soldiers[1], global.user.getValue("catapult")],self,"attackover");
        }
    }
    
    function deleteContext(){
        contextNode.removefromparent();
        contextNode = null;
    }
}
