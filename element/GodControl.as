class GodControl extends ContextObject{
    var objs;
    var pageposmax;
    var pagepos;
    var lasttime;
    var lastx;
    var flagmove;
    var buildable;
    var objsmax = 7;
    var objlevel = [3, 8, 15, 12,16,20,25,31];
    var objcontext = [3700, 0, -1000, 1,3,2,20,25];//buildId
    function GodControl(){
        contextname = "element-build-god";
        contextNode = null;
        objsmax = len(objlevel);
        objs = [];
        buildable = [];
        for(var i = 0; i < objsmax; i++)
        {
            objs.append(0);
            buildable.append(0);
        }
        pageposmax = 1161-objsmax*161;
        if(pageposmax > 400) pageposmax = 400;
        flagmove = 0;
    }

    function paintNode(){
        pagepos = global.lastpage[5];
        contextNode = node().anchor(50,50).pos(pagepos,240).size(800,480);
     
        for(var i=0;i<objsmax;i++){
            objs[i]=null;
        }
        refreshpage();
    }
    
    function getcell(i){//a column
        buildable[i] = dict([["ok",1]]);
        objs[i] = sprite("dialogelement2l.png").pos(DIALOG_BASE_X+i*DIALOG_OFF_X,DIALOG_BASE_Y).size(148,276);
        var obji = objcontext[i];
        var index = (obji%1000)/100;
        trace("index", index, obji);
        if(index == DISK)
        {

            var disk = objs[i].addsprite("disk0.png").anchor(50,100).pos(74,160);
            disk.prepare();
            var oldSize = disk.size();
            var sx = min(120*100/oldSize[0], 140*100/oldSize[1]);
            disk.scale(sx);
            objs[i].addlabel(DISK_NAME[0],null,16).pos(74,10).anchor(50,0).color(0,0,0,100);
            trace("index", index, obji);
            if(DISK_LEV[0] > global.user.getValue("level"))
            {
                objs[i].texture("dialogelement_lock2.png");
                objs[i].addlabel(str(DISK_LEV[0]),null,16).anchor(50,50).pos(119,244).color(100,0,0,100);
            }
            else
            {
                if(global.user.getValue("hasDisk", 0) == 0)
                    objs[i].setevent(EVENT_TOUCH | EVENT_MOVE | EVENT_UNTOUCH, beginbuild, i);
                else
                {
                    objs[i].color(60,60,60,100);
                    objs[i].setevent(EVENT_TOUCH | EVENT_MOVE | EVENT_UNTOUCH, null, i);
                }
                trace("index", index, obji);
                    
                var color = 0;
                if(global.user.getValue("money") < DISK_MONEY[0])
                {
                    buildable[i].update("ok", 0);
                    buildable[i].update("money", DISK_MONEY[0]);
                    color = 100;
                }
                trace("index", index, obji);
                objs[i].addsprite("money_big.png").size(20,20).pos(10,202);

                objs[i].addlabel(str(DISK_MONEY[0]),null,16).pos(34,202).color(color,0,0,100);
                objs[i].addsprite("personlimit.png").size(20,20).pos(10,244);
                objs[i].addlabel(str(DISK_PERSON[0]),null,16).pos(34,244).color(0,0,0,100);
            }
            //objs[i].addsprite("new.png").anchor(100,100).scale(150).pos(137,160);
            
        }
        else if(obji>=0){
            var god = objs[i].addsprite("shen"+str(obji)+".png").scale(65).anchor(50,100).pos(74,195);
            objs[i].addlabel(global.getname("god1",obji),null,16).pos(74,10).anchor(50,0).color(0,0,0,100);
            /*
            if(obji>4){
                objs[i].addsprite("new.png").anchor(100,100).scale(150).pos(137,160);
            }
            */
            if(objlevel[i] > global.user.getValue("level")){
                objs[i].texture("dialogelement_lock2.png");
                objs[i].addlabel(str(objlevel[i]),null,16).anchor(50,50).pos(119,244).color(100,0,0,100);
            }
            else{
                objs[i].setevent(EVENT_TOUCH,beginbuild,i);
                objs[i].setevent(EVENT_MOVE,beginbuild,i);
                objs[i].setevent(EVENT_UNTOUCH,beginbuild,i);

                var cl = 0;
                if(global.user.getValue("money")<GOD_B_PRICE[0]){
                    cl=100;
                    buildable[i].update("ok",0);
                    buildable[i].update("money", GOD_B_PRICE[0]);
                }
                objs[i].addsprite("money_big.png").size(20,20).pos(10,202);
                objs[i].addlabel(str(GOD_B_PRICE[0]),null,16).pos(34,202).color(cl,0,0,100);

                cl = 0;
                if(global.user.getValue("food") < GOD_FOOD[0]){
                    cl=100;
                    buildable[i].update("ok",0);
                    buildable[i].update("food", GOD_FOOD[0]);
                }
                objs[i].addsprite("food.png").size(29,33).pos(80,195);
                objs[i].addlabel(str(GOD_FOOD[0]),null,16).pos(113,202).color(cl,0,0,100);
                objs[i].addsprite("personlimit.png").size(20,20).pos(10,244);
                objs[i].addlabel(str(GOD_PERSON_MAX[0]),null,16).pos(34,244).color(0,0,0,100);
                if(obji<4&&global.user.getValue("godtime")[obji]>-1||obji>=4&&global.user.getValue("godtime")[obji/5]>-1){
                    objs[i].color(60,60,60,100);
                    objs[i].setevent(EVENT_TOUCH,null);
                    objs[i].setevent(EVENT_MOVE,null);
                    objs[i].setevent(EVENT_UNTOUCH,null);
                }
            }
        }
        else{
            var data=global.data.getbuild(obji);
            objs[i].addlabel(data.get("name"),null,16).pos(74,10).anchor(50,0).color(0,0,0,100);
            var sc=100;
            if(data.get("size")==3) sc=66;
            objs[i].addsprite("build"+str(-obji)+".png").anchor(50,100).pos(74,160).scale(sc);
            //objs[i].addsprite("new.png").anchor(100,100).scale(150).pos(137,160);
            if(data.get("level") > global.user.getValue("level")){
                objs[i].texture("dialogelement_lock2.png");
                objs[i].addlabel(str(data.get("level")),null,16).anchor(50,50).pos(119,244).color(100,0,0,100);
            }
            else{
                objs[i].setevent(EVENT_TOUCH,beginbuild,i);
                objs[i].setevent(EVENT_MOVE,beginbuild,i);
                objs[i].setevent(EVENT_UNTOUCH,beginbuild,i);

                cl = 0;
                if(global.user.getValue("money")<data.get("price")){
                    cl=100;
                    buildable[i].update("ok",0);
                    buildable[i].update("money", data.get("price"));
                }
                objs[i].addsprite("money_big.png").size(20,20).pos(10,202);
                objs[i].addlabel(str(data.get("price")),null,16).pos(30,202).color(cl,0,0,100);

                cl = 0;
                if(global.user.getValue("food") <data.get("food")){
                    cl=100;
                    buildable[i].update("ok",0);
                    buildable[i].update("food", data.get("food"));
                }
                objs[i].addsprite("food.png").size(29,33).pos(80,195);
                objs[i].addlabel(str(data.get("food")),null,16).pos(103,202).color(cl,0,0,100);
                objs[i].addsprite("personlimit.png").size(20,20).pos(10,244);
                objs[i].addlabel(str(data.get("personmax")),null,16).pos(34,244).color(0,0,0,100);
                if(global.user.getValue("build"+str(-obji))>0){
                    objs[i].color(60,60,60,100);
                    objs[i].setevent(EVENT_TOUCH,null);
                    objs[i].setevent(EVENT_MOVE,null);
                    objs[i].setevent(EVENT_UNTOUCH,null);
                }
            }
        }
    }

    function refreshpage(){
        var curpos = contextNode.pos(); 
        pagepos = contextNode.pos()[0];
        if(pagepos > 400) pagepos = 400;
        else if(pagepos < pageposmax) pagepos = pageposmax;
        
        contextNode.pos(pagepos, curpos[1]);
        var index = (400-pagepos)/DIALOG_OFF_X;
        for(var i=0;i<objsmax;i++){
            if(i<index||i>index+6){
                if(objs[i]!=null){
                    objs[i].removefromparent();
                    objs[i] = null;
                }
            }
            else if(objs[i]==null){
                getcell(i);
                contextNode.add(objs[i]);
            }
        }
    }
    function choosepage(){
        var curpos = contextNode.pos(); 
        pagepos = contextNode.pos()[0];
        if(pagepos > 400) pagepos = 400;
        else if(pagepos < pageposmax) pagepos = pageposmax;
        
        contextNode.pos(pagepos, curpos[1]);
        var index = (400-pagepos)/DIALOG_OFF_X;
        for(var i=0;i<objsmax;i++){
            if(i<index||i>index+6){
                if(objs[i]!=null){
                    objs[i].removefromparent();
                    objs[i] = null;
                }
            }
            else if(objs[i]==null){
                getcell(i);
                contextNode.add(objs[i]);
            }
        }
        contextNode.addaction(moveto(300,pagepos,240));
        global.lastpage[4] = pagepos;
    }

    function beginbuild(n,e,param,x,y){
        if(global.currentLevel <= 1){
            if(e == EVENT_TOUCH){
                lasttime = time();
                lastx = n.pos()[0]+x+contextNode.pos()[0]-400;
                flagmove = 0;
                global.context[1].nodemove(n,EVENT_HITTEST,0,lastx,240);
                n.texture("dialogelement2l1.png");
                return 1;
            }
            else if(e== EVENT_MOVE){
                if(flagmove == 0){
                    if(x<0 || y<0 || x>n.size()[0] || x>n.size()[1])
                        flagmove =1;
                    else if(time()-lasttime > 1000)
                        flagmove =1;
                    if(flagmove==1){
                        n.texture("dialogelement2l.png");
                    }
                    return 0;
                }
                else{
                    lastx = n.pos()[0]+x+contextNode.pos()[0]-400;
                    global.context[1].nodemove(n,EVENT_MOVE,0,lastx,240);
                }
            }
            else if(e == EVENT_UNTOUCH){
                if(flagmove == 0){
                    n.texture("dialogelement2l.png");
                    global.lastpage[0] = 4;
                    var ret = global.user.testCost(buildable[param]);
                    if(ret == 0){
                        //global.pushContext(self,new Warningdialog(buildable[param]),NonAutoPop);
                    }
                    else{
                        var oid = objcontext[param];
                        if((oid%1000)/100 == DISK)
                        {
                            global.pushContext(self,new Calldialog(objcontext[param]),NonAutoPop);
                            //global.popContext(oid); 
                        }
                        else
                            global.pushContext(self,new Calldialog(objcontext[param]),NonAutoPop);
                    }
                }
                else{
                    choosepage();
                }
            }
        }
    }

    function deleteContext(){
        contextNode.addaction(stop());
        contextNode.removefromparent();
    }
}
