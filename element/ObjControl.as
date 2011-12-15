class ObjControl extends ContextObject{
    var objs;
    var pageposmax;
    var pagepos;
    var lasttime;
    var lastx;
    var buildable;
    var flagmove;
    const objsmax = 56;
    const objlevel = [2, 2, 2, 3, 3, 3, 4, 5, 6, 6, 6, 6, 6, 6, 7, 8, 9, 10, 10, 11, 12, 13, 14, 15, 15, 15, 15, 15, 16, 16, 16, 17, 17, 18, 18, 18, 18, 19, 19, 19, 19, 20, 25, 25, 25, 27, 30, 30, 32, 34, 37, 40, 40, 40, 40, 40];
    const objcontext = [1500, 1501, 1502, 2539, 2540, 2541, 1503, 1504, 1505, 1506, 1507, 1508, 1509, 1510, 1511, 1512, 1513, 1514, 1515, 1520, 1516, 1517, 1518, 1519, 1528, 1529, 1530, 1531, 1521, 1522, 1523, 1542, 1543, 1524, 1525, 1526, 1527, 1532, 1533, 1534, 1538, 2544, 1535, 1536, 1537, 2600, 2601, 1545, 2602, 2603, 2604, 2605, 1546, 1547, 1548, 1549];
    function ObjControl(){
        contextname = "element-build-object";
        contextNode = null;
        objs = new Array(56);
        buildable = new Array(56);
        pageposmax = 1161-objsmax*161;
        if(pageposmax > 400) pageposmax = 400;
        flagmove = 0;
    }

    function paintNode(){
        pagepos = global.lastpage[6];
        contextNode = node().anchor(50,50).pos(pagepos,240).size(800,480);
     
        for(var i=0;i<objsmax;i++){
            objs[i] = null;
        }
        refreshpage();
    }
    
    function getcell(i){
        buildable[i] = dict([["ok",1]]);
        var oi = objcontext[i]%1000;
        if(oi<600){
            oi=oi%100;
            objs[i] = sprite("dialogelement2l.png").pos(DIALOG_BASE_X+i*DIALOG_OFF_X,DIALOG_BASE_Y);
            objs[i].addlabel(global.getname("obj",oi),null,16).anchor(50,0).pos(74,10).color(0,0,0,100);
            var bl=150;
            if(objcontext[i]/1000==2){
                 bl=75;
            }
            else if(oi>41){
                bl=100;
            }
            objs[i].addsprite("object"+str(oi)+".png").anchor(50,50).pos(74,112).scale(bl);
            /*
            if(oi>41){
                objs[i].addsprite("new.png").anchor(100,100).scale(150).pos(137,160);
            }
            */
            if(objlevel[i]>global.user.getValue("level")){
                objs[i].texture("dialogelement_lock2.png");
                objs[i].addlabel(str(objlevel[i]),null,16).anchor(50,50).pos(119,244).color(100,0,0,100);
            }
            else{
                objs[i].setevent(EVENT_TOUCH,beginbuild,i);
                objs[i].setevent(EVENT_MOVE,beginbuild,i);
                objs[i].setevent(EVENT_UNTOUCH,beginbuild,i);

                var cl = 0;
                var price = OBJ_PRICE[oi];
                if(price < 0){
                    price = -price;
                    if(global.user.getValue("caesars")<price){
                        cl=100;
                        buildable[i].update("ok",0);
                        buildable[i].update(global.getStaticString("caesars"),price-global.user.getValue("caesars"));
                    }
                    objs[i].addsprite("caesars_big.png").size(20,20).pos(10,202);
                    objs[i].addlabel(str(price),null,16, FONT_NORMAL, 100, 100).pos(34,202).color(cl,0,0,100);
                }
                else{
                    if(global.user.getValue("money")<price){
                        cl=100;
                        buildable[i].update("ok",0);
                        buildable[i].update(global.getStaticString("coin"),price-global.user.getValue("money"));
                    }
                    objs[i].addsprite("money_big.png").size(20,20).pos(10,202);
                    objs[i].addlabel(str(price),null,16).pos(34,202).color(cl,0,0,100);
                }
                objs[i].addsprite("personlimit.png").size(20,20).pos(10,244);
                objs[i].addlabel(str(OBJ_PERSON[oi]),null,16, FONT_NORMAL, 100, 100).pos(34,244).color(0,0,0,100);
            }
        }
        else if(oi<700){
            oi=oi%100;
            objs[i] = sprite("dialogelement2d2.png").pos(DIALOG_BASE_X+i*DIALOG_OFF_X,DIALOG_BASE_Y);
            objs[i].addlabel(STATUE_NAME[oi],null,16, FONT_NORMAL, 100, 100).anchor(50,0).pos(74,10).color(0,0,0,100);
            if(objcontext[i]/1000==2){
                 bl=75;
            }
            objs[i].addsprite("build"+str(objcontext[i]%1000)+".png").anchor(50,50).pos(74,112).scale(bl);
            if(objlevel[i]>global.user.getValue("level")){
                objs[i].texture("dialogelement_lock2.png");
                objs[i].addlabel(str(objlevel[i]),null,16).anchor(50,50).pos(119,244).color(100,0,0,100);
            }
            else{
                objs[i].setevent(EVENT_TOUCH,beginbuild,i);
                objs[i].setevent(EVENT_MOVE,beginbuild,i);
                objs[i].setevent(EVENT_UNTOUCH,beginbuild,i);

                cl = 0;
                price = STATUE_PRICE[oi];
                if(price < 0){
                    price = -price;
                    if(global.user.getValue("caesars")<price){
                        cl=100;
                        buildable[i].update("ok",0);
                        buildable[i].update(global.getStaticString("caesar"),price-global.user.getValue("caesars"));
                    }
                    objs[i].addsprite("caesars_big.png").size(20,20).pos(10,202);
                    objs[i].addlabel(str(price),null,16).pos(34,202).color(cl,0,0,100);
                }
                else{
                    if(global.user.getValue("money")<price){
                        cl=100;
                        buildable[i].update("ok",0);
                        buildable[i].update(global.getStaticString("coin"),price-global.user.getValue("money"));
                    }
                    objs[i].addsprite("money_big.png").size(20,20).pos(10,202);
                    objs[i].addlabel(str(price),null,16).pos(34,202).color(cl,0,0,100);
                }
                    cl = 0;
                    var nperson = STATUE_PERSON[oi];
                    if(global.user.getValue("person")-global.user.getValue("labor") < nperson){
                        cl=100;
                        buildable[i].update("ok",0);
                        buildable[i].update(global.getStaticString("freePeople"),nperson-global.user.getValue("person")+global.user.getValue("labor"));
                    }
                    objs[i].addsprite("person.png").size(32,30).pos(83,159);
                    objs[i].addlabel(str(nperson),null,16).pos(118,165).color(cl,0,0,100);
                objs[i].addsprite("defence.png").size(20,20).pos(10,244);
                objs[i].addlabel(str(STATUE_DEFENCE[oi]),null,16).pos(34,244).color(0,0,0,100);
            }
        }
    }
    
    function refreshpage(){
        pagepos = contextNode.pos()[0];
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
        pagepos = contextNode.pos()[0];
        if(pagepos > 400) pagepos = 400;
        else if(pagepos < pageposmax) pagepos = pageposmax;
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
        global.lastpage[6] = pagepos;
    }
    //statue no <= 5 first 5 is defence power
    //after that is population
    function beginbuild(n,e,param,x,y){
        var statueNum = 600;
        var oid = objcontext[param]%1000;
        //trace("oid", oid);
        if(global.currentLevel <= 1){
            if(e == EVENT_TOUCH){
                lasttime = time();
                lastx = n.pos()[0]+x+contextNode.pos()[0]-400;
                flagmove = 0;
                global.context[1].nodemove(n,EVENT_HITTEST,0,lastx,240);

                if(oid<statueNum){
                    n.texture("dialogelement2l1.png");
                }
                else{
                    n.texture("dialogelement2d3.png");
                }
                return 1;
            }
            else if(e== EVENT_MOVE){
                if(flagmove == 0){
                    if(x<0 || y<0 || x>n.size()[0] || x>n.size()[1])
                        flagmove =1;
                    else if(time()-lasttime > 1000)
                        flagmove =1;
                    if(flagmove==1){
                        if(oid<statueNum){
                            n.texture("dialogelement2l.png");
                        }
                        else{
                            n.texture("dialogelement2d2.png");
                        }
                    }
                    return 0;
                }
                else{
                    lastx = n.pos()[0]+x+contextNode.pos()[0]-400;
                    global.context[1].nodemove(n,EVENT_MOVE,0,lastx,240);
                }
            }
            else if(e == EVENT_UNTOUCH){
                if(oid<statueNum){
                    n.texture("dialogelement2l.png");
                }
                else{
                    n.texture("dialogelement2d2.png");
                }
                if(flagmove == 0){
                    global.lastpage[0] = 5;
                    if(buildable[param].get("ok")==0){
                        global.pushContext(self,new Warningdialog(buildable[param]),NonAutoPop);
                    }
                    else{
                        if(oid<statueNum){
                            global.popContext(objcontext[param]);
                        }
                        else{
                            global.pushContext(self,new Warningdialog([global.getFormatString("build_defence_format",["[BUILD]",STATUE_NAME[objcontext[param]%100],"[DEFENCE]",str(STATUE_DEFENCE[objcontext[param]%100])]),param,5]),NonAutoPop);
                        }
                    }
                }
                else{
                    choosepage();
                }
            }
        }
    }
    
    function reloadNode(re){
        global.popContext(objcontext[re]);
    }

    function deleteContext(){
        contextNode.addaction(stop());
        contextNode.removefromparent();
    }
}
