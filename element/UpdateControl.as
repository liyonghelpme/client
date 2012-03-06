class UpdateControl extends ContextObject{
    var obj;
    var objname;
    var lock=0;
    var element;
    var costcaesars;
    var costdict;
    var costspec;
    var updatetype;
    var updatebid;
    var buildable;
    const EmpireCoin = [0,100000, 500000];
    const EmpireFood = [0,1000, 5000];
    const EmpirePeople = [0,100, 500];
    const EmpireSpe = ["","150;a,30;b,30;c,30", "200;d,30;e,30;f,30"];
    const EmpirePopUp = [0,100, 500];
    const EmpireMana = [0, 5, 5];

    const objcontextname = ["farm","room","camp","fact","shen", "empire"];
    function UpdateControl(){
        contextname = "dialog-build-update";
        contextNode = null;
        element = null;
        buildable = new Array(2);
        lock=0;
    }

    function paintNode(){
        var dialog = new Simpledialog(2,self);
        dialog.init(dialog,global);
        contextNode = dialog.getNode();
        dialog.settitle("updatetitle.png");
        dialog.setclosebutton();
        dialog.setbutton(1,271,330,global.getStaticString("update_normal"),1);
        dialog.setbutton(4,271,390,global.getStaticString("update_caesars"),0);
    }
    
    function getelement(){
        if(element == null){
            element = node();
            var back=element.addsprite("updateelement.png").anchor(100,0).pos(337,28);
            element.addsprite("caesars_big.png").anchor(50,50).pos(60,390);
            obj = global.request[global.currentLevel];
            var btype;
            var objbid;
            var upbid;
            //empire Level up 
            //trace("obj", obj.bid, obj.empireLevel);
            if(obj.baseobj == null)
            {
                btype = 0;
                objname= "empire";
                objbid = obj.empireLevel;
                upbid = obj.empireLevel+1;
                updatebid = 0;
            }
            else
            {
                btype = obj.baseobj.objectid/100;
                objname = objcontextname[btype];
                updatebid = obj.baseobj.objectid+1;
                objbid = obj.bid;
                upbid = obj.bid+1;
            }
            var bl1=90;
            var bl2=100;
            if(obj.baseobj == null)
            {
                bl1 = 25;
                bl2 = 25;
            }
            else if(obj.baseobj.contextid == 3){
                bl1 = 60;
                bl2 = 67;
            }
            else if(btype == 4){
                bl1 = 47;
                bl2 = 52;
                if(objbid<20){
                    updatebid = obj.baseobj.objectid+4;
                    upbid = obj.bid+4;
                }
            }
            
            trace("empire", objbid, upbid);
            var hou1;
            var hou2;
            if(obj.baseobj == null)
            {
                hou1 = back.addsprite(objname+str(objbid+1)+".png").anchor(50,50).pos(56,70).scale(bl1);
                hou2 = back.addsprite(objname+str(upbid+1)+".png").anchor(50,50).pos(231,65).scale(bl2);
                //spriteManager.getPic(objname+str(objbid+1)+".png", hou1);
                //spriteManager.getPic(objname+str(upbid+1)+".png", hou2);
            }
            else
            {
                hou1 = back.addsprite(objname+str(objbid)+".png").anchor(50,50).pos(56,70).scale(bl1);
                hou2 = back.addsprite(objname+str(upbid)+".png").anchor(50,50).pos(231,65).scale(bl2);
                //spriteManager.getPic(objname+str(objbid)+".png", hou1);
                //spriteManager.getPic(objname+str(upbid)+".png", hou2);
            }
            var i;
            var ok;
            var starnum;
            if(btype == 0)
            {
                starnum = objbid+1;
                for(i=0;i<5;i++){
                    ok=0;
                    if(starnum > i)
                        ok=1;
                    back.addsprite("dialogelement_star"+str(ok)+".png").anchor(50,50).pos(-2+i*29,124);
                }

                for(i=0;i<5;i++){
                    ok=0;
                    if(starnum>=i) ok=1;
                    back.addsprite("dialogelement_star"+str(ok)+".png").anchor(50,50).pos(173+i*29,130);
                }
            }
            else if(btype!=4){
                starnum = objbid%3+1;
                for(i=0;i<3;i++){
                    ok=0;
                    if(starnum > i)
                        ok=1;
                    back.addsprite("dialogelement_star"+str(ok)+".png").anchor(50,50).pos(24+i*32,124);
                }

                for(i=0;i<3;i++){
                    ok=0;
                    if(starnum>=i) ok=1;
                    back.addsprite("dialogelement_star"+str(ok)+".png").anchor(50,50).pos(199+i*32,130);
                }
            }
            else{
                starnum = objbid/4+1;
                if(starnum>4){
                    starnum = (objbid-20)%5+1;
                }
                for(i=0;i<5;i++){
                    ok=0;
                    if(starnum > i)
                        ok=1;
                    back.addsprite("dialogelement_star"+str(ok)+".png").anchor(50,50).pos(-2+i*29,124);
                }

                for(i=0;i<5;i++){
                    ok=0;
                    if(starnum>=i) ok=1;
                    back.addsprite("dialogelement_star"+str(ok)+".png").anchor(50,50).pos(173+i*29,130);
                }
            }
            buildable[0] = dict([["ok",1]]);
            buildable[1] = dict([["ok",1]]);
            var money;
            var food;
            var person;
            var upspec;
            if(btype == 0)
            {
                money = EmpireCoin[upbid];
                food = EmpireFood[upbid];
                person = EmpirePeople[upbid];
                upspec = EmpireSpe[upbid].split(";");
            }
            else if(btype == 1){
                money = ROOM_PRICE[upbid];
                food = ROOM_B_FOOD[upbid];
                upspec=ROOM_UP[upbid].split(";");
                person = 0;
            }
            else if(btype == 3){
                money = FACT_PRICE[upbid];
                food = FACT_FOOD[upbid];
                person = FACT_PERSON[upbid]-FACT_PERSON[objbid];
                upspec=FACT_UP[upbid].split(";");
            }
            else if(btype == 2){
                money = CAMP_PRICE[upbid];
                food = CAMP_FOOD[upbid];
                person = CAMP_PERSON[upbid]-CAMP_PERSON[objbid];
                upspec=CAMP_UP[upbid].split(";");
            }
            else{
                var blevel = upbid/4;
                if(blevel>4){
                    blevel = (upbid-20)%5;
                }
                money = GOD_B_PRICE[blevel];
                upspec=GOD_UP[blevel].split(";");
                food = GOD_FOOD[blevel];
                person = 0;
            }

            costdict= dict();
            var cl = 0;
            if(money > 0){
                if(money > global.user.getValue("money")){
                    buildable[1].update("ok",0);
                    buildable[1].update(global.getStaticString("money"),money-global.user.getValue("money"));
                    cl = 100;
                }
                element.addsprite("money_big.png").anchor(50,50).pos(57,213).size(20,20);
                element.addlabel(str(money),null,16).anchor(0,50).pos(76,213).color(cl,0,0,100);
                costdict.update("money",money);
            }
            cl=0;
            var resname = "food";
            var rescname = global.getStaticString("food");
            if(food < -100000){
                resname = "stone";
                rescname = global.getStaticString("stone");
                food = -100000-food;
            }
            else if(food<0){
                resname = "wood";
                rescname = global.getStaticString("wood");
                food = -food;
            }
            if(food>0){
                if(food>global.user.getValue(resname)){
                    buildable[1].update("ok",0);
                    buildable[1].update(rescname,food-global.user.getValue(resname));
                    cl=100;
                }
                element.addsprite(resname+".png").anchor(50,50).pos(57,242);
                costdict.update(resname,food);
                element.addlabel(str(food),null,16).anchor(0,50).pos(76,242).color(cl,0,0,100);
            }
            cl=0;
            if(person > 0){
                if(person > global.user.getValue("person")-global.user.getValue("labor")){
                    buildable[1].update("ok",0);
                    buildable[1].update(global.getStaticString("labpr"),person-global.user.getValue("person")+global.user.getValue("labor"));
                    buildable[0].update("ok",0);
                    buildable[0].update(global.getStaticString("labor"),person-global.user.getValue("person")+global.user.getValue("labor"));
                    cl=100;
                }
                element.addsprite("person.png").anchor(50,50).size(32,30).pos(57,269);
                costdict.update("labor",-person);
                element.addlabel(str(person),null,16).anchor(0,50).pos(76,269).color(cl,0,0,100);
            }
            costspec = new Array(0);
            for(i=1;i<len(upspec);i++){
                cl=0;
                var specobj = upspec[i].split(",");
                var sp = element.addsprite("specialblock.png").anchor(50,50).pos(113+68*i+(4-len(upspec))*34,227);
                var sid = ord(specobj[0])-97;
                sp.addsprite("gift"+str(sid+1)+".png").anchor(50,50).pos(32,31).scale(60);
                if(int(specobj[1])>global.special[sid]){
                    cl=100;
                    buildable[1].update("ok",-1);
                }
                sp.addlabel(str(global.special[sid])+"/"+specobj[1],null,16).anchor(50,100).pos(32,64).color(cl,0,0,100);
                costspec.append([sid,int(specobj[1])]);
            }
            costcaesars = int(upspec[0]);
            cl=0;
            if(costcaesars>global.user.getValue("caesars")){
                buildable[0].update("ok",0);
                buildable[0].update(global.getStaticString("caesars"),costcaesars-global.user.getValue("caesars"));
                cl=100;
            }
            element.addlabel(upspec[0],null,18).anchor(0,50).pos(82,390).color(cl,0,0,100);
        }
        return element;
    }

    function excute(p){
        global.popContext(null);
        updatetype = p;
        var ok=buildable[p].get("ok");
        if(ok!=1){
            global.pushContext(self,new Warningdialog(buildable[p]),NonAutoPop);
        }
        else{
            if(obj.baseobj == null)
            {
                global.http.addrequest(1,"upgradecastle",["userid","lev", "type"],[global.userid, obj.empireLevel+1, updatetype],self,"updateover");
            }
            else if(obj.state >2){
                global.pushContext(self,new Warningdialog([global.getStaticString("update_warning"),p,4]),NonAutoPop);
            }
            else{
                global.http.addrequest(1,"updatebuilding",["user_id","city_id","ground_id","grid_id","type"],[global.userid,global.cityid,updatebid,obj.baseobj.posi[0]*RECTMAX+obj.baseobj.posi[1],p],self,"updateover");
            }
        }
    }
    function reloadNode(p){
        global.http.addrequest(1,"updatebuilding",["user_id","city_id","ground_id","grid_id","type"],[global.userid,global.cityid,updatebid,obj.baseobj.posi[0]*RECTMAX+obj.baseobj.posi[1],p],self,"updateover");
    }
    
    function useaction(p,rc,c){
        if(p=="updateover"){
            updateover(0,rc,c);
        }
    }
    
    function updateover(r,rc,c){
        if(rc!=0 && json_loads(c).get("id")==1){
            var i;
            if(obj.baseobj == null)
            {
                obj.empireLevel += 1;
                trace("change Value animate1");
                global.user.changeValueAnimate2(global.context[0].moneyb,"boundary", EmpireMana[obj.empireLevel],-4);
                global.user.changeValueAnimate2(global.context[0].moneyb,"personmax", EmpirePopUp[obj.empireLevel],-2);
            }
            else
            {
                obj.bid = updatebid%100;
                obj.baseobj.objectid = updatebid;
            }
            //friend god upgrade change card level 
            trace("global card", global.card);
            if(global.card[18]%10==0 && updatebid==424){
                var flevel=1+10*(len(global.ppyuserdict)-2);
                if(flevel/10>=100){
                    flevel=2;
                }
                var bdict = dict();
                bdict.update("name","getcard");
                bdict.update("cardid",18);
                bdict.update("cardlevel",flevel%10);
                global.context[0].addcmd(bdict);
                global.card[18]=flevel;
                global.http.addrequest(0,"changecard",["userid","cardnum","type"],[global.userid,global.card[18]%10,4],self,null);
            }
            if(obj.baseobj != null)
                obj.beginbuild();
            else
            {
                obj.objnode.texture("empire"+str(obj.empireLevel+1)+".png");
                //Normal Object not empire
                if(global.system.flagnight==0){
                    obj.contextNode.get(1).texture("empire"+str(obj.empireLevel+1)+"_l.png");
                    obj.showYanhua();
                }
            }
            var target;
            //because empire" parent is normalobject
            //but other buildings is buildObject
            //use base obj == null to check which is!
            if(obj.baseobj == null)
            {
                target = obj;
            }
            else
                target = obj.baseobj;
            if(updatetype == 1){
                var k=costdict.keys();
                for(i=0;i<len(k);i++){
                    trace("change Value animate2");
                    global.user.changeValueAnimate(target,k[i],-costdict.get(k[i]),i*2);
                }
                for(i=0;i<len(costspec);i++){
                    global.special[costspec[i][0]] = global.special[costspec[i][0]]-costspec[i][1];
                }
            }
            else{
                global.user.changeValueAnimate(target,"caesars",-costcaesars,0);
                if(costdict.get("labor",0)!=0){
                    global.user.changeValueAnimate(target,"labor",-costdict.get("labor"),2);
                }
            }
        }
trace("update",rc,c);
        lock=0;
    }
    
    function deleteContext(){
        contextNode.addaction(stop());
        contextNode.removefromparent();
    }
}
