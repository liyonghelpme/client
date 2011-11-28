import element.CallbackSoldier;
class ResourceControl extends ContextObject{
    var slabels;
    var soldiers;
    var soldiermaxs;
    var lastx;
    var rdata;
    var atime;
    var btime;
    var slabel;
    var timelabel;
    const RESOUCE_PRODUCT=[[1000,10,1,1],[3000,30,3,3],[5000,50,5,5],[10000,100,10,10],[50000,500,50,50],[100000,1000,100,100]];
    function ResourceControl(g){
        contextname = "dialog-battle-choosesoldier";
        contextNode = null;
        rdata = g;
        trace("resource data", rdata);
    }
    function paintNode(){
        contextNode = sprite("dialogback_d.png").anchor(50,50).pos(400,240);
        contextNode.addsprite("resourceelement.jpg").pos(11,11);
        contextNode.addlabel(ENAME[rdata[2]]+global.getStaticString(":")+rdata[4],null,30,FONT_BOLD).anchor(50,0).pos(279,40).color(0,0,0,100);
        contextNode.addlabel(global.getStaticString("infpower")+global.getStaticString(":")+str(rdata[7]),null,18).pos(44,124).color(0,0,0,100);
        contextNode.addlabel(global.getStaticString("cavpower")+global.getStaticString(":")+str(rdata[8]),null,18).pos(277,124).color(0,0,0,100);
        contextNode.addsprite("builddialogclose.png").pos(493,14).setevent(EVENT_UNTOUCH,closedialog);
        var time=global.timer.currenttime-global.timer.times2c(rdata[9]);
        var tc = time/3600;
        var rc=RESOUCE_PRODUCT[rdata[2]];
        contextNode.addlabel(global.getStaticString("money")+global.getStaticString(":")+str(rc[0]*tc),null,18).pos(44,207).color(0,0,0,100);
        contextNode.addlabel(global.getStaticString("food")+global.getStaticString(":")+str(rc[1]*tc),null,18).pos(164,207).color(0,0,0,100);
        contextNode.addlabel(global.getStaticString("wood")+global.getStaticString(":")+str(rc[2]*tc),null,18).pos(274,207).color(0,0,0,100);
        contextNode.addlabel(global.getStaticString("stone")+global.getStaticString(":")+str(rc[3]*tc),null,18).pos(404,207).color(0,0,0,100);
        contextNode.addlabel(global.getFormatString("resource_get_format",["[MONEY]",str(rc[0]),"[FOOD]",str(rc[1]),"[WOOD]",str(rc[2]),"[STONE]",str(rc[3]),"[TIME]",global.gettimestr((tc+1)*3600+global.timer.times2c(rdata[9])-global.timer.currenttime)]),null,18,FONT_NORMAL,504,0,ALIGN_LEFT).pos(27,276).color(0,0,0,100);
        //contextNode.addlabel(global.getFormatString("resource_get_format",["[MONEY]",str(rc[0]),"[FOOD]",str(rc[1]),"[WOOD]",str(rc[2]),"[STONE]",str(rc[3]),"[TIME]",global.gettimestr((tc+1)*3600+rdata[9]-global.timer.currenttime)]),null,18,FONT_NORMAL,504,0,ALIGN_LEFT).pos(27,276).color(0,0,0,100);
        contextNode.addlabel("注：驻扎在要塞的士兵，其战斗力将获得加成", null, 18).pos(28,348).color(0,0,0,100);
        contextNode.addsprite("help2.png").pos(489,342).setevent(EVENT_UNTOUCH,gotohelp,"fortress");
        var button;
        var ebindex=-1;
        for(var i=0;i<len(global.battlelist);i++){
            if(global.battlelist[i][2]==1&&global.battlelist[i][3] == rdata[3]){
                ebindex = i;
                break;
            }
        }
        if(ebindex==-1){
            button=contextNode.addsprite("boxbutton1.png").pos(47,409).setevent(EVENT_UNTOUCH,sendsoldier);
            button.addlabel(global.getStaticString("addsoldier"),null,BUTTONFONTSIZE).anchor(50,50).pos(62,19);
        }
        else{
            button=contextNode.addsprite("boxbutton1.png").pos(47,409).setevent(EVENT_UNTOUCH, quicksoldier,global.battlelist[ebindex]);//battle
            button.addlabel(global.getStaticString("quickSendArmy"),null,BUTTONFONTSIZE).anchor(50,50).pos(62,19);
        }
        button=contextNode.addsprite("boxbutton1.png").pos(210,409).setevent(EVENT_UNTOUCH,callbacksoldier,rdata);
        button.addlabel(global.getStaticString("minussoldier"),null,BUTTONFONTSIZE).anchor(50,50).pos(62,19);
        if(rc[0]*tc > 0)
            button=contextNode.addsprite("boxbutton1.png").pos(381,409).setevent(EVENT_UNTOUCH,callbackresource);
        else
            button=contextNode.addsprite("boxbutton1.png", GRAY).pos(381,409);
        button.addlabel(global.getStaticString("getresource"),null,BUTTONFONTSIZE).anchor(50,50).pos(62,19);
    }
    
    function sendsoldier(n,e,p){
        global.popContext(null);
        global.pushContext(null,new AttackControl(rdata[3]),NonAutoPop);
    }
    
    function quicksoldier(n,e,p){
        global.popContext(null);
        global.pushContext(null,new SpeedattackControl(p),NonAutoPop);
    }
    
    function callbacksoldier(n,e,p){
        global.popContext(null);
        global.pushContext(null,new CallbackSoldier(p),NonAutoPop);
    }
    
    function callbackresource(n,e,p){
        global.http.addrequest(1,"harvestEmpty",["uid","cid"],[global.userid,-rdata[1]],self,"getresource");
    }
    
    function useaction(p,rc,c){
        if(p=="getresource"){
            var rrdata=json_loads(c);
            if(rrdata.get("id")!=0){
                global.user.changeValue("money",rrdata.get("coinGen"));
                global.user.changeValue("food",rrdata.get("foodGen"));
                global.user.changeValue("wood",rrdata.get("woodGen"));
                global.user.changeValue("stone",rrdata.get("stoneGen"));
                rdata[9] = rrdata.get("lastTime");
            }
            global.popContext(null);
            global.pushContext(null,self,NonAutoPop);
        }
    }
    
    function gotohelp(n,e,p,x,y){
        if(x>0&&y>0&&x<n.size()[0]&&y<n.size()[1]){
            global.pushContext(null,new TestWebControl(p),NonAutoPop);
        }
    }
    
    function closedialog(n,e,p){
        global.popContext(null);
    }
    
    function deleteContext(){
        contextNode.removefromparent();
        contextNode = null;
    }
}
