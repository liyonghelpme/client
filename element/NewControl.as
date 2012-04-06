class NewControl extends ContextObject{
    var newstr;
    var newstate;
    var cp;
    var cz;
    var tp;
    var mp;
    var gtype;
    var posi;
    var cmd;
    var param;
    var checktype;
    var checkvalue;
    var strnum;
    var circle;
    var point;
    var girl;
    var notice;
    var noticetext;
    var opobj;
    var lock;
    function NewControl(n){
        contextNode = null;
        opobj = null;
        posi = [0,0];
        var strstate = [0,9,18,25];
        lock=0;
        newstate = n;
        strnum = strstate[n];
        newstr = newstrs[strnum];
        //trace("newstr", newstr);
        contextname = "control-newuser";
    }
    
    function loadstr(){
        var newdata = json_loads(newstr);
        trace("new data", newdata);
        cp = newdata.get("cp",[-400,-240]);
        cz = newdata.get("cz",[160,160]);
        gtype = newdata.get("gtype");
        var nposi = newdata.get("posi");
        cmd = newdata.get("cmd","hit");
        param = newdata.get("param",null);
        tp = newdata.get("tp",[-400,-240]);
        mp = newdata.get("mp",[400,300]);
        noticetext=newdata.get("text","sb");
        if(strnum<20 || strnum>=23){
            if(opobj == null||nposi[0]!=posi[0]||nposi[1]!=posi[1]){
                posi = [nposi[0],nposi[1]];
                opobj = global.context[0].getobjectby(nposi[0],nposi[1]);
            }
        }
        //trace(cmd,param);
    }
    function keydownevent(n,e,p,kc){
        if(kc == 4)
        {
            if(global.Quit == 0)
            {
                global.Quit = 1;
                var quit = new Quitdialog();
                quit.self = quit;
                global.shotscreen.add(quit.getNode());
                //global.pushContext(self, new Quitdialog(), NewQuit);
            }
        }
        return 0;
    }
    
    function paintNode(){
        loadstr();
        contextNode = sprite();
        contextNode.setevent(EVENT_KEYDOWN,keydownevent);
        circle =contextNode.addsprite("circle.png").anchor(50,50);
        circle.setevent(EVENT_UNTOUCH,ctest);

        point = contextNode.addsprite("point1.png").anchor(50,100);
        point.addaction(repeat(animate(700,"point1.png","point2.png","point3.png","point4.png","point5.png")));
        girl = sprite();
        contextNode.add(girl,2);
        notice = contextNode.addsprite().anchor(50,50);
        loadnode();
        if(newstate == 0){
            var back = sprite("storyback.png").setevent(EVENT_UNTOUCH,donothing);
            contextNode.add(back,3);
            var content = back.addsprite("storytext.png",ARGB_8888).anchor(50,0).pos(400,480);
            back.addsprite("storybacktop.png",ARGB_8888);
            back.addsprite("storybackbottom.png",ARGB_8888).anchor(0,100).pos(0,480);
            back.addsprite("skip3.png").anchor(100,100).pos(790,470).setevent(EVENT_UNTOUCH,rm);
            content.addaction(sequence(moveby(15000,0,-1000),callfunc(rm)));
        }
        function donothing(n,e){
            return 1;
        }
        function rm(x){
            x.parent().removefromparent();
        }
        //trace("newcontrol initover");
    }
    
    function loadnode(){
        var sizeid = 2;
        if(strnum<20 || strnum>=23){
            if(opobj != null) sizeid = opobj.baseobj.contextid;
            var mx = PBX+posi[0]*(-34)+posi[1]*30+sizeid*2;
            var my = PBY-1+posi[0]*17+posi[1]*16-(33*sizeid+1)/2;
            var p = global.context[0].contextNode.node2world(mx,my);
            //trace(p);
            global.context[0].nodeMove(mp[0]-p[0],mp[1]-p[1]);
        }
        else{
            var ep = global.context[1].mplace[7];
            p = global.context[1].baseNode.node2world(ep[0],ep[1]);
            //trace(p);
            global.context[1].nodeMove(mp[0]-p[0],mp[1]-p[1]);
        }
        circle.pos(cp).scale(cz[0]*5/2,cz[1]*5/2);
        point.pos(cp[0],cp[1]-cz[1]/2);
        var flag = 1;
        if(gtype==0){
            girl.texture("girl1.png").anchor(0,100).pos(40,480).size(191,409).scale(100,100);
        }
        else if(gtype==1){
            girl.texture("girl1.png").anchor(0,100).pos(760,480).size(191,409).scale(-100,100);
        }
        else if(gtype ==2){
            flag = 2;
            girl.texture("girl1.png").anchor(0,100).pos(40,480).size(191,409).scale(100,100);
        }
        else if(gtype==4){
            girl.texture("boy1.png").anchor(0,100).pos(40,480).size(351,413).scale(100,100);
        }
        else if(gtype==5){
            girl.texture("boy1.png").anchor(0,100).pos(760,480).size(351,413).scale(-100,100);
        }
        else if(gtype==6){
            girl.texture("boy1.png").anchor(0,100).pos(40,480).size(351,413).scale(100,100);
            flag =2;
        }
        setnotice(flag);
    }
        
    function setnotice(flag){
        var strs = noticetext.split("+");
        //trace("strs", strs);
        notice.removefromparent();
        notice = contextNode.addsprite("dialogback_new"+str(flag)+".png").anchor(50,50).pos(tp);
        if(flag == 1){
            for(var i=0;i<len(strs);i++){
                //trace(" i strs", i, strs[i]);
                if(strs[i].rfind("[")==-1){
                    notice.addlabel(strs[i],null,20, FONT_NORMAL, 300, 200, ALIGN_LEFT).pos(40,30+24*i).color(0,0,0,100);
                }
                else{
                    var li = colorWords(strs[i], 300, 10);
                    //trace("lines ", li);
                    for(var j = 0; j < len(li); j++)
                    {
                        //trace("newline", li[j]);
                        if(li[j].rfind("[") == -1)
                        {
                            notice.addlabel(li[j],null,20, FONT_NORMAL, 300, 200, ALIGN_LEFT).pos(40,30+24*j).color(0,0,0,100);
                        }
                        else
                        {
                            var end = li[j].split("]");
                            var begin = end[0].split("[");
                            var lenb = len(begin[0]);
                            //trace("begin end", begin, end);
                            var pre = notice.addlabel(begin[0],null,20).pos(40,30+24*j).color(0,0,0,100);
                            var mid = notice.addlabel("["+begin[1]+"]",null,20).pos(40+len(begin[0])/1*8, 30+24*j).color(100,0,0,100);
                            notice.addlabel(end[1],null,20).pos(40+(len(end[0]))/1*10,30+24*j).color(0,0,0,100);

                        }
                    }
                }
            }
        }
        else{
            notice.addlabel(strs[0],null,30).anchor(50,50).pos(221,45).color(1,14,56,100);
            if(int(strs[1])!=0){
                notice.addsprite("money_big.png").anchor(50,50).size(32,32).pos(61,164);
                notice.addlabel(strs[1],null,20).anchor(0,50).pos(80,164).color(0,0,0,100);
                notice.addsprite("caesars_big.png").anchor(50,50).size(32,32).pos(171,164);
                notice.addlabel(strs[2],null,20).anchor(0,50).pos(190,164).color(0,0,0,100);
                notice.addsprite("exp.png").anchor(50,50).pos(297,164);
                notice.addlabel(strs[3],null,20).anchor(0,50).pos(335,164).color(0,0,0,100);
            }
            else{
                notice.addsprite("exp.png").anchor(50,50).pos(171,164);
                notice.addlabel(strs[3],null,20).anchor(0,50).pos(209,164).color(0,0,0,100);
            }
            notice.addsprite("boxbutton4.png").anchor(50,50).pos(221,230).setevent(EVENT_UNTOUCH,nextstate);
            notice.addlabel(strs[4],null,20).anchor(50,50).pos(221,230).color(0,0,0,100);
            for(i=5;i<len(strs);i++){
                notice.addlabel(strs[i],null,20, FONT_NORMAL, 300, 200, ALIGN_LEFT).pos(60,24*i-50).color(0,0,0,100);
            }
        }
    }
    
    var changing = 0;
    function nextstate(n,e){
    	if(n!=0 && lock == 0){
    	    lock=1;
    	    var strs = noticetext.split("+");
            global.user.changeValueAnimate2(global.context[0].moneyb,"money",int(strs[1]),-6);
            global.user.changeValueAnimate2(global.context[0].moneyb,"caesars",int(strs[2]),-4);
            global.user.changeValueAnimate2(global.context[0].ub,"exp",int(strs[3]),-4);
    	}
        if(changing == 0)
        {
            changing = 1;
            strnum++;
            contextNode.color(0,0,0,0);
            c_addtimer(1000,checkfinish,null,1000,1);
        }
    }
    
    function ctest(n,e,p,x,y){
        if(global.Quit == 1)
            return;
        var dtime = 0;
        var offx = x-400;
        var offy = y-240;
        if(offx*offx<=1600 && offy*offy<=900 && lock==0){
            lock=1;
            if(cmd == "select"){
                opobj.select = 1;
                opobj.objSelected(sprite(),EVENT_UNTOUCH,param,0,0,null);
            }
            else if(cmd == "btclick"){
                global.context[global.currentLevel].buttonclicked(sprite(),EVENT_UNTOUCH,param);
            }
            else if(cmd == "state2over"){
                dtime = 1000;
                global.popContext(null);
                opobj.objid = param;
                opobj.state2over(0,1,"{'id':1}");
            }
            else if(cmd == "speed"){
                dtime = 2000;
                global.context[global.currentLevel].speedbegin(0,1,"{'id':1}");
            }
            else if(cmd == "state4over"){
                dtime = 1000;
                opobj.state4over(0,1,"{'id':1}");
            }
            else if(cmd == "mclick"){
                dtime = 400;
                global.context[0].menubuttonclicked(sprite(),EVENT_UNTOUCH,param);
            }
            else if(cmd == "pop"){
                dtime=500;
                global.popContext(param);
                if(param!=null && param>=0)
                    opobj = global.context[0].changes.objnode;
                else
                    opobj =null;
            }
            else if(cmd == "build"){
                dtime = 1000;
                opobj.baseobj.statenode.removefromparent();
                global.context[0].buildovertrue(0,1,"{'id':1}");
            }
            else if(cmd == "attack"){
                global.context[2].excute(1);
                dtime = 5000;
            }
            else if(cmd == "monster"){
                dtime = 0;
                global.pushContext(null,new Monsterdialog(7),NonAutoPop);
            }
            else if(cmd == "goback"){
                dtime= 2000;
                global.context[1].goback();
            }
            else if(cmd == "rename"){
                contextNode.visible(0);
                global.context[0].openinputview(0,0);
                return 0;
            }
            strnum++;
            contextNode.color(0,0,0,0);
            if(newstate == 2 && cmd == "mclick" && param == 2)
                c_addtimer(1000,checkinit);
            else
                c_addtimer(1000,checkfinish,null,dtime,1);
        }
        return 1;
    }
    
    function useaction(p,rc,c){
        if(p=="newcomplete"){
            newcomplete(0,rc,c);
        }
    }
    
    function newcomplete(r,rc,c){
        //trace("newcomplete",rc,c);
        contextNode.visible(1);
        newstate++;
        global.context[0].newstate = newstate;
        strnum++;
        checkfinish();
    }
    
    function checkfinish(){
        contextNode.color(100,100,100,100);
        if(strnum == len(newstrs)){
            global.popContext(NewPop);
            global.context[0].warmap.monstercontroller.initdata(null,global.timer.base_systime+1800+time()/1000-global.timer.base_localtime);
            global.task.inittask(0,0);
            global.wartask.initwartask(0,0);
            var cm = dict([["name","daily"],["bonus",3000]]);
            global.context[0].addcmd(cm);
            //global.context[0].actButton.visible(1);
            global.lastpage[1]=400;
            global.user.changeValue("money",3000);
            spriteManager.addDownIcon();
            return 0;
        }
        else if(newstrs[strnum]== ""){
            contextNode.visible(0);
            global.http.addrequest(1,"newcomplete",["uid","level"],[global.userid,newstate+1],self,"newcomplete");
            return 0;
        }
        newstr = newstrs[strnum];
        loadstr();
        loadnode();
        lock=0;
        changing = 0;
    }
    
    function checkinit(timer){
        if(global.Quit == 1)
            return;
        if(global.context[1].initlock != -1){
            return 0;
        }
        timer.stop();
        checkfinish();
    }
    
    function deleteContext(){
        contextNode.removefromparent();
        contextNode.addaction(stop());
        contextNode = null;
        clearShotScreen();
    }
}
