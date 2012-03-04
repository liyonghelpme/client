class Levelupdialog extends ContextObject{
    var data;
    function Levelupdialog(d){
        data = d;
        trace("level init");
        contextname = "dialog-reward-levelup";
        contextNode = null;

    }

    function paintNode(){
        trace("level up pop");
        if(global.flagnew == 1){
            global.newcontext.getNode().visible(0);
            global.dark[len(global.dark)-1].visible(1);
        }
        var level = global.user.getValue("level");
        contextNode = sprite("dialogback_normal.png").anchor(50,50).pos(400,235);
        clearTip();
        showTip();
        if(level>3){
            contextNode.addsprite("boxbutton1.png").anchor(50,50).pos(257,400).setevent(EVENT_TOUCH,closedialog,1);
            contextNode.addlabel(global.getStaticString("share"),null,BUTTONFONTSIZE).anchor(50,50).pos(257,400);
            contextNode.addsprite("boxbutton2.png").anchor(50,50).pos(417,400).setevent(EVENT_TOUCH,closedialog,null);
            contextNode.addlabel(global.getStaticString("back"),null,BUTTONFONTSIZE).anchor(50,50).pos(417,400);
        }
        else{
            contextNode.addsprite("boxbutton1.png").anchor(50,50).pos(380,400).setevent(EVENT_TOUCH,closedialog,null);
            contextNode.addlabel(global.getStaticString("ok"),null,BUTTONFONTSIZE).anchor(50,50).pos(380,400);
        }
        var levelback = contextNode.addsprite("dialogback_levup.jpg").pos(163,40);
        levelback.addlabel(str(global.user.getValue("level")),null,36).anchor(0,50).pos(305,65).color(100,0,0,100);
        levelback.addsprite("money_big.png").anchor(50,50).pos(144,137).size(24,24);
        var m = global.user.getValue("level")*200;
        levelback.addlabel(str(m),null,24).anchor(0,50).pos(160,137).color(0,0,0,100);
        
        if(level%10==0){
            levelback.addsprite("caesars_big.png").anchor(50,50).pos(260,137).size(24,24);
            levelback.addlabel(str(level/10),null,24).anchor(0,50).pos(276,137).color(0,0,0,100);
            levelback.addsprite("personlimit.png").anchor(50,50).pos(360,137).size(22,24);
            levelback.addlabel(str(LevUpPop),null,24).anchor(0,50).pos(376,137).color(0,0,0,100);
        }
        var userlevel = global.user.getValue("level");
        var unlockobjs = UNLOCK.get(userlevel, []);
        var rowNum = 4;
        var initX = 136;
        var initY = 212;
        for(var i=0; i<len(unlockobjs) && i<8 ;i++){
            var obj = unlockobjs[i];
            levelback.addsprite("dialogelement_objunlock.png").anchor(50,50).pos(i%rowNum*88+initX,initY+i/rowNum*75);
            var sp = levelback.addsprite(obj).anchor(50,50).pos(i%rowNum*88+initX,initY+i/rowNum*75).scale(int(obj[0]));
            sp.prepare();
            var sx = 100;
            var sy = 100;
            var oldSize = sp.size();
            if(oldSize[0] > 67)
                sx = 67*100/oldSize[0];
            if(oldSize[1] > 67)
                sy = 67*100/oldSize[1];
            sx = min(sx, sy);
            sp.scale(sx);
        }
    }
    
    function closedialog(node,event,p){
        /*
        if(global.flagnew == 0)
        {
            global.user.setValue("money", data.get("coin"));
            global.user.setValue("caesars", data.get("cae"));
            global.user.setValue("personmax", data.get("pop"));
        }
        */
        global.popContext(null);
        var level = global.user.getValue("level");
        global.user.changeValueAnimate2(global.context[0].moneyb,"money",level*200,-8);
        trace("level", LevAddPer, level);
        if(level%10==0){
            global.user.changeValueAnimate2(global.context[0].ub,"personmax", LevAddPer, -6);
            global.user.changeValueAnimate2(global.context[0].moneyb,"caesars",level/10,-6);
        }
        if(p==1){
            global.http.addrequest(0,"share",["uid"],[global.userid],global.context[0],"share");
            ppy_postnewsfeed(global.getFormatString("levelUp", ["[NAME]", ppy_username(), "[LEVEL]", str(global.user.getValue("level"))] ), NewsURL);
        }
    }

    function deleteContext(){
        contextNode.addaction(stop());
        contextNode.removefromparent();
        if(global.flagnew==1){
            global.newcontext.contextNode.visible(1);
        }
    }
}
