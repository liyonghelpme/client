class CallbackSoldier extends ContextObject{
    var slabels;
    var soldiers;
    var soldiermaxs;
    var lastx;
    var edata;
    var atime;
    var btime;
    var slabel;
    var timelabel;
    function CallbackSoldier(g){
        contextname = "dialog-battle-choosesoldier";
        contextNode = null;
        slabels = new Array(2);
        edata = g;
    }
    function paintNode(){
        soldiermaxs = [edata[7],edata[8]];
        soldiers = [0,0];
        contextNode = sprite("dialogback_d.png").anchor(50,50).pos(400,240);
        contextNode.addsprite("attackelement.jpg").pos(11,11);
        contextNode.addlabel(str(soldiermaxs[0]+soldiermaxs[1]),null,20).anchor(0,50).pos(120,99).color(0,0,0,100);
        slabel = contextNode.addlabel(str(0),null,20).anchor(0,50).pos(383,99).color(0,0,0,100);
        
        var bt = sprite("boxbutton1.png").anchor(50,50).pos(142,420).setevent(EVENT_UNTOUCH,attack);
        contextNode.add(bt,2,0);
        bt.addlabel(global.getStaticString("minussoldier"),null,BUTTONFONTSIZE).anchor(50,50).pos(62,19);
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
        csnum(mb,EVENT_TOUCH,0,70);
    }
    
    function csnum(n,e,p,x){
        var move = n.get(0);
        if(x>333) x = 333;
        else if(x<79) x = 79;
        var po = move.pos();
        move.pos(x,po[1]);
        soldiers[p] = soldiermaxs[p]*(x-79)/254;
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
    }
    
    function attack(){
        if(global.currentLevel == contextLevel){
            var euid=-edata[1];
            global.http.addrequest(1,"callbackEmpty",["uid","cid","inf","cav"],[global.userid,euid,soldiers[0],soldiers[1]],self,"attackover");
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
            if(data.get("id",1)==1){
                global.soldiers[0] = global.soldiers[0]+soldiers[0];
                global.soldiers[1] = global.soldiers[1]+soldiers[1];
                edata[7]=edata[7]-soldiers[0];
                edata[8]=edata[8]-soldiers[1];
                global.popContext(null);
                if(edata[7]==0&&edata[8]==0){
                    edata[0]="0";
                    global.context[1].setuserflag(edata[3]);
                }
            }
            else{
            }
        }
    }
    
    function closedialog(){
        if(global.currentLevel == contextLevel)
            global.popContext(null);
    }
    
    function deleteContext(){
        contextNode.removefromparent();
        contextNode = null;
    }
}