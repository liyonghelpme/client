class DailyDialog extends ContextObject{
    var bonus;
    function DailyDialog(b){
        contextname = "dialog-reward-daily";
        contextNode = null;
        bonus = b;
    }

    function paintNode(){
        contextNode = sprite("dialogback_normal.png").anchor(50,50).pos(400,240);
        contextNode.addsprite("boxbutton1.png").anchor(50,50).pos(257,400).setevent(EVENT_TOUCH,closedialog,1);
        contextNode.addlabel(global.getStaticString("share"),null,BUTTONFONTSIZE).anchor(50,50).pos(257,400);
        contextNode.addsprite("boxbutton2.png").anchor(50,50).pos(417,400).setevent(EVENT_TOUCH,closedialog,null);
        contextNode.addlabel(global.getStaticString("back"),null,BUTTONFONTSIZE).anchor(50,50).pos(417,400);
        var dailyback = contextNode.addsprite("dialogback_daily.jpg").pos(163,40);
        var s = [3000,5000,8000,12000,-2];
        for(var i=0;i<5;i++)
            if(s[i] == bonus)
                break;
        var nb = s[(i+1)%5];
        if(bonus>0){
            dailyback.addsprite("money_big.png").anchor(50,50).pos(178,155).size(30,30);
            dailyback.addlabel("x "+str(bonus),null,30).anchor(0,50).pos(200,155).color(96,54,4,100);
        }
        else{
            dailyback.addsprite("caesars_big.png").anchor(50,50).pos(178,155).size(30,30);
            dailyback.addlabel("x "+str(-bonus),null,30).anchor(0,50).pos(200,155).color(96,54,4,100);
        }
        if(nb>0){
            dailyback.addsprite("money_big.png").anchor(50,50).pos(178,280).size(30,30);
            dailyback.addlabel("x "+str(nb),null,30).anchor(0,50).pos(200,280).color(96,54,4,100);
        }
        else{
            dailyback.addsprite("caesars_big.png").anchor(50,50).pos(178,280).size(30,30);
            dailyback.addlabel("x "+str(-nb),null,30).anchor(0,50).pos(200,280).color(96,54,4,100);
        }
    }

    function closedialog(node,event,p){
        if(p==1){
            global.http.addrequest(0,"share",["uid"],[global.userid],global.context[0],"share");
            ppy_postnewsfeed(global.getFormatString("loginBonus", "[NAME]", ppy_username()),"http://getmugua.com");
        }
        if(bonus>0){
            global.user.changeValueAnimate3(global.context[0].moneyb,"money",bonus,-6);
        }
        else{
            global.user.changeValueAnimate3(global.context[0].moneyb,"caesars",-bonus,-6);
        }
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.addaction(stop());
        contextNode.removefromparent();
    }
}
