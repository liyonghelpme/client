class OnekeyController extends ContextObject{
    var tabs;
    var selecttab;
    var element;
    var mode;
    var objid;
    var tabstr;
    var costcae;
    var costs;

    function OnekeyController(m){
        contextname = "dialog-build-onekey";
        contextNode = null;
        element = null;
        mode = m;
        if(m==0){
            tabstr = ["onekey_plant","onekey_harvest"];
        }
        else if(m==1){
            tabstr = ["onekey_product"];
        }
        else if(m==2){
            tabstr = ["onekey_visit_normal","onekey_visit_inc"];
        }
        costcae=1;
    }

    function getelement(){
        if(element==null){
            tabs = new Array(3);
            costs = [0,0,0];
            if(mode == 0 || mode == 1)
            {
                costs[0] = OneKeyMana;
                costs[1] = OneKeyMana;
            }
            else
            {
                costs[0] = GenVisMana;
                costs[1] = AccVisMana;
            }
            element = node();
            element.addsprite("devineback.jpg").anchor(50,0).pos(219,30);
            element.addlabel(global.getStaticString("onekey_title"),null,30).anchor(50,50).pos(219,63).color(0,0,0,100);
            selecttab = -1;
            var tabsize = len(tabstr);
            var i = 0;
            for(i=0;i<tabsize;i++){ 
                tabs[i] = element.addsprite("dialogelement_god_normal.png").pos(162-tabsize*125/2+i*125,110).setevent(EVENT_UNTOUCH,choosetab,i);
                tabs[i].addlabel(global.getStaticString(tabstr[i]),null,20,FONT_NORMAL, 100,0).anchor(50,50).pos(57,60).color(0,0,0,100);
                tabs[i].addsprite("magic_big.png").anchor(50,50).pos(43,130);
                tabs[i].addlabel("x"+str(costs[i]),null,20).anchor(0,50).pos(62,130).color(0,0,0,100);
            }
            tabs[i] = element.addsprite("dialogelement_god_normal.png").pos(162-tabsize*125/2+i*125,110).setevent(EVENT_UNTOUCH,choosetab,i);
            tabs[i].addlabel(global.getStaticString("onekey_gotohelp"),null,20,FONT_NORMAL,80,0,ALIGN_LEFT).anchor(50,0).pos(57,50).color(0,0,0,100);
            choosetab(0,0,0);
        }
        return element;
    }

    function paintNode(){
        var dialog = new Simpledialog(0,self);
        dialog.init(dialog,global);
        contextNode = dialog.getNode();
        dialog.usedefaultbutton(2,[global.getStaticString("devine"),global.getStaticString("cancel")]);
    }

    function choosetab(n,e,p){
        if(selecttab != p){
            if(selecttab>=0)
                tabs[selecttab].texture("dialogelement_god_normal.png");
            tabs[p].texture("dialogelement_god_chosen.png");
            selecttab = p;
            costcae = costs[p];
        }
    }

    function excute(p){
        if(selecttab!=len(tabstr)){
            var cost = dict();
            cost.update("mana",costcae);
            if(global.user.testCost(cost)==0){
                return 0;
            }
        }
        if(mode==0){
            if(selecttab==0){
                var length=len(global.context[0].grounds);
                var isok = 0;
                for(var i=0;i<length;i++){
                    var build = global.context[0].grounds[i];
                    if(build.objectid<5&&build.objectid>0){
                        if(build.objnode.state==2){
                            isok=1;
                        }
                    }
                }
                if(isok==1){
                    global.pushContext(self,new PlantControl(),NonAutoPop);
                }
                else{
                    global.pushContext(null,new Warningdialog([global.getStaticString(15),null,5]),NonAutoPop);
                }
            }
            else if(selecttab==1){
                length=len(global.context[0].grounds);
                isok = 0;
                for(i=0;i<length;i++){
                    build = global.context[0].grounds[i];
                    if(build.objectid<5&&build.objectid>0){
                        if(build.objnode.state==4){
                            isok=1;
                        }
                    }
                }
                if(isok==1){
                    global.http.addrequest(1,"harvestall",["user_id","city_id"],[global.userid,global.cityid],self,"harvestall");
                }
                else{
                    global.pushContext(null,new Warningdialog([global.getStaticString(16),null,5]),NonAutoPop);
                }
            }
            else if(selecttab==2){
                gotohelp(0,0,"allplant");
            }
        }
        else if(mode==1){
            if(selecttab==0){
                length=len(global.context[0].grounds);
                isok = 0;
                for(i=0;i<length;i++){
                    build = global.context[0].grounds[i];
                    if(build.objectid<400&&build.objectid>=300){
                        if(build.objnode.state==4){
                            isok=1;
                        }
                    }
                }
                if(isok==1){
                    global.http.addrequest(1,"productall",["user_id","city_id"],[global.userid,global.cityid],self,"productall");
                }
                else{
                    global.pushContext(null,new Warningdialog([global.getStaticString(19),null,5]),NonAutoPop);
                }
            }
            else if(selecttab==1){
                gotohelp(0,0,"allgettax");
            }
        }
        else if(mode==2){
            if(selecttab<2){
                isok = 0;
                var friends = global.ppyuserdict.values();
                length=len(friends);
                for(i=0;i<length;i++){
                    var friend = friends[i];
                    if(friend.get("visited")==0&&friend.get("level",0)>0){
                        isok++;
                    }
                }
                if(isok>=1){
                    global.http.addrequest(1,"getfriendall",["user_id","friend_num","type"],[global.userid,isok,selecttab],self,"getfriendall");
                }
                else{
                    global.pushContext(null,new Warningdialog([global.getStaticString(24),null,5]),NonAutoPop);
                }
            }
            else if(selecttab==2){
                gotohelp(0,0,"allfriend");
            }
        }
    }
    
    function gotohelp(n,e,p){
        global.pushContext(null,new TestWebControl(p),NonAutoPop);
    }
    
    function reloadNode(re){
        if(mode==0){
            objid=re;
            if(re%3==2){
                var cost = dict();
                cost.update("mana",costcae-PLANT_PRICE[re]);
                if(global.user.testCost(cost)==0){
                    return 0;
                }
            }
            global.http.addrequest(1,"plantingall",["user_id","city_id","object_id"],[global.userid,global.cityid,re],self,"plantingall");
        }
    }
    
    function useaction(p,rc,c){
        if(p=="harvestall"){
            var data = json_loads(c);
            if(data.get("id")==1){
                global.popContext(null);
                global.user.changeValueAnimate2(global.context[0].moneyb,"mana",-costcae,-6);
                var length=len(global.context[0].grounds);
                for(var i=0;i<length;i++){
                    var build = global.context[0].grounds[i];
                    if(build.objectid<5&&build.objectid>0){
                        if(build.objnode.state==4){
                            build.objnode.state4over(0,1,"{'id':1}");
                            var ani=build.contextNode.addsprite().anchor(50,100).pos(build.contextid*34,build.contextid*33);
                            ani.addaction(sequence(animate(2000,"blessing1.png","blessing2.png","blessing3.png","blessing4.png","blessing5.png","blessing6.png","blessing7.png","blessing8.png","blessing9.png"),callfunc(removeself)));
                        }
                    }
                }
            }
        }
        else if(p=="productall"){
            data = json_loads(c);
            if(data.get("id")==1){
                global.popContext(null);
                global.user.changeValueAnimate2(global.context[0].moneyb,"mana",-costcae,-6);
                length=len(global.context[0].grounds);
                for(i=0;i<length;i++){
                    build = global.context[0].grounds[i];
                    if(build.objectid<400&&build.objectid>=300){
                        if(build.objnode.state==4){
                            build.objnode.state4over(0,1,"{'id':1}");
                            ani=build.contextNode.addsprite().anchor(50,100).pos(build.contextid*34,build.contextid*33);
                            ani.addaction(sequence(animate(2000,"blessing1.png","blessing2.png","blessing3.png","blessing4.png","blessing5.png","blessing6.png","blessing7.png","blessing8.png","blessing9.png"),callfunc(removeself)));
                        }
                    }
                }
            }
        }
        else if(p=="plantingall"){
            data = json_loads(c);
            var overlist = data.get("plant");
                global.popContext(null);
                global.user.changeValueAnimate2(global.context[0].moneyb,"mana",-costcae,-6);
                var istask = 0;
                if(global.task.tasktype==0&&global.task.taskreq=="planting")
                {
                    var pair=["object_id",objid,"type",0];
                    istask=1;
                    for(i=0;i<len(global.task.taskpair);i++){
                        if(pair[i]!=global.task.taskpair[i]){
                            istask=0;
                            break;
                        }
                    }
                }
                length=len(global.context[0].grounds);
                var num=0;
                for(i=0;i<length;i++){
                    build = global.context[0].grounds[i];
                    if(overlist.index(build.posi[0]*RECTMAX+build.posi[1])!=-1){
                        num++;
                        build.objnode.objid=objid;
                        build.objnode.state2over(0,1,"{'id':1}");
                            ani=build.contextNode.addsprite().anchor(50,100).pos(build.contextid*34,build.contextid*33);
                            ani.addaction(sequence(animate(2000,"blessing1.png","blessing2.png","blessing3.png","blessing4.png","blessing5.png","blessing6.png","blessing7.png","blessing8.png","blessing9.png"),callfunc(removeself)));
                    }
                }
                if(istask==1){
                    global.task.inctaskstep(num);
                }
            //}
        }
        else if(p=="getfriendall"){
            global.popContext(null);
            data = json_loads(c);
            if(data.get("id")==1){
                var friends = global.ppyuserdict.values();
                num=0;
                length=len(friends);
                for(i=0;i<length;i++){
                    var friend = friends[i];
                    if(friend.get("visited")==0&&friend.get("level",0)>0){
                        friend.update("visited",1);
                        num++;
                    }
                }
                if(global.context[0].friend.flist!=null){
                    global.context[0].friend.refreshflist();
                }
                global.pushContext(null,new Warningdialog([global.getFormatString(26,["[NUM]",str(num),"[MONEY]",str(data.get("cornadd"))]),null,6]),NonAutoPop);
                global.user.changeValueAnimate2(global.context[0].moneyb,"money",data.get("cornadd"),-6);
                global.user.changeValueAnimate2(global.context[0].moneyb,"mana",-costcae,-4);
            }
            else{
                global.pushContext(null,new Warningdialog([data.get("reason"),null,5]),NonAutoPop);
            }
        }
    }
    
    function deleteContext(){
        contextNode.addaction(stop());
        contextNode.removefromparent();
    }
}
