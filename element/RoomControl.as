class RoomControl extends ContextObject{
    var objs;
    var left;
    var right;
    var pagetext;
    var pageposmax;
    var pagepos;
    var lasttime;
    var lastx;
    var flagmove;

    var objsmax = 26;
    //新民居 会影响新手任务箭头的问题 需要 在这里设定
    //400 是居中位置
    //设置方法， 可以根据编号动态设定
    const objlevel = [
    3, 3,
    1,1,1,1,
    5,5,5,5,
    7,
    8,8,8,8,
    10,10,10,10,
    12, 13,
    15,15,15,15,
    18,
    20,20,20,20,
    22,
    ];
    const objcontext = [
    2187, 2190,
    2100,2103,2106,2109, 
    2112,2115,2118,2121,
    2181, 
    2160,2163,2166,2169,
    2124,2127,2130,2133,
    3172, 2184,
    3136,3139,3142,3145,
    3175,
    3148,3151,3154,3157,
    2178,
    ];
    var buildable;
    function RoomControl(){
        contextname = "element-build-room";
        contextNode = null;
        objs = range(0, len(objcontext));
        buildable = range(0, len(objcontext));
        objsmax = len(objcontext);

        pageposmax = 1161-objsmax*161;
        if(pageposmax > 400) pageposmax = 400;
        flagmove = 0;
    }

    function getcell(i){
            buildable[i] = dict([["ok",1]]);
            var sc = 100;
            if(objcontext[i]>=3000) sc = 66;
            var obji = objcontext[i]%100;
            objs[i] = sprite("dialogelement2p.png").pos(DIALOG_BASE_X+i*DIALOG_OFF_X,DIALOG_BASE_Y).size(148,276);
            objs[i].addlabel(global.getname("room1",obji),null,16).anchor(50,0).pos(74,10).color(0,0,0,100);

            var hou = objs[i].addsprite("room"+str(obji)+".png").anchor(50,100).pos(74,160).scale(sc);
            //spriteManager.getPic("room"+str(obji)+".png", hou);
            
            if(i<2){
                objs[i].addsprite("new.png").anchor(100,100).scale(150).pos(137,160);
            }
            if(objlevel[i] > global.user.getValue("level")){
                objs[i].texture("dialogelement_lock2.png");
                objs[i].addlabel(str(objlevel[i]),null,16).anchor(50,50).pos(119,244).color(100,0,0,100);
            }
            else{
                objs[i].setevent(EVENT_TOUCH,beginbuild,i);
                objs[i].setevent(EVENT_MOVE,beginbuild,i);
                objs[i].setevent(EVENT_UNTOUCH,beginbuild,i);
                var cl = 0;
                var price = ROOM_PRICE[obji];
                if(price < 0){
                    price = -price;
                    if(global.user.getValue("caesars")<price){
                        cl=100;
                        buildable[i].update("ok",0);
                        buildable[i].update("caesars", price);
                    }
                    objs[i].addsprite("caesars_big.png").size(20,20).pos(10,202);
                    objs[i].addlabel(str(price),null,16).pos(34,202).color(cl,0,0,100);
                }
                else{
                    if(global.user.getValue("money")<price){
                        cl=100;
                        buildable[i].update("ok",0);
                        buildable[i].update("money", price);
                    }
                    objs[i].addsprite("money_big.png").size(20,20).pos(10,202);
                    objs[i].addlabel(str(price),null,16).pos(34,202).color(cl,0,0,100);
                }
                var food = ROOM_B_FOOD[obji];
                if(food > 0){
                    cl = 0;
                    if(global.user.getValue("food") < food){
                        cl=100;
                        buildable[i].update("ok",0);
                        buildable[i].update("food", food);
                    }
                    objs[i].addsprite("food.png").size(29,33).pos(80,195);
                    objs[i].addlabel(str(food),null,16).pos(113,202).color(cl,0,0,100);
                }
                var t = ROOM_TIME[obji]/60;
                var timestr;
                if(t<60)
                    timestr = str(t)+"min";
                else{
                    t = t/6;
                    if(t%10 == 0)
                        timestr = str(t/10)+"h";
                    else
                        timestr = str(t/10)+"."+str(t%10)+"h";
                }
                objs[i].addsprite("personmax.png").size(28,23).pos(10,244);
                objs[i].addlabel(str(ROOM_PERSON[obji])+" per "+timestr,null,16).pos(40,246).color(0,0,0,100);
            }
            return objs[i];
    }

    function paintNode(){
        pagepos = global.lastpage[1];
        contextNode = node().anchor(50,50).pos(pagepos,240).size(800,480);
        for(var i=0;i<objsmax;i++){
            objs[i]=null;
        }
        refreshpage();
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
        global.lastpage[1] = pagepos;
    }

    function beginbuild(n,e,param,x,y){
        if(global.currentLevel <= 1){
            if(e == EVENT_TOUCH){
                lasttime = time();
                lastx = n.pos()[0]+x+contextNode.pos()[0]-400;
                flagmove = 0;
                global.context[1].nodemove(n,EVENT_HITTEST,0,lastx,240);
                n.texture("dialogelement2p1.png");
                return 1;
            }
            else if(e== EVENT_MOVE){
                if(flagmove == 0){
                    if(x<0 || y<0 || x>n.size()[0] || y>n.size()[1])
                        flagmove =1;
                    else if(time()-lasttime > 1000)
                        flagmove =1;
                    if(flagmove==1){
                        n.texture("dialogelement2p.png");
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
                    global.lastpage[0] = 0;
                    var ret = global.user.testCost(buildable[param]);
                    if(ret == 0)
                    {
                        //global.pushContext(self,new Warningdialog(buildable[param]),NonAutoPop);
                    }
                    else
                        global.popContext(objcontext[param]);
                }
                else{
                    choosepage();
                }
            }
        }
    }

    function reloadNode(){
    }

    function deleteContext(){
        contextNode.addaction(stop());
        contextNode.removefromparent();
    }
}
