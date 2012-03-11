class WarTaskController extends ContextObject{
    var wartasktype;
    var wartaskreq;
    var wartaskpair;
    var wartaskdes;
    var wartaskreward;
    var wartasknum;
    var wartaskstep;
    var wartaskid;
    var enternode;
    var wartasklib;
    function WarTaskController(){
        contextNode = null;
        contextname = "dialog-wartask";
        enternode = sprite("wtask3.png").anchor(50,50).scale(90);
        enternode.setevent(EVENT_UNTOUCH,enterwartask);
        wartasktype =-1;
        wartasklib = dict();
        var wartaskfile = c_res_file("wartask.txt");
        if(wartaskfile == null)
            return;
        var wartask = WarTasks;
        trace("wartask");
        for(var i=0;i<len(wartask);i++){
            var taskobj = wartask[i];//json_loads(wartask[i]);
            //trace("taskobj", taskobj);
            if(taskobj == null)
            {
                trace("wartask error", i);
                continue;
            }
            wartasklib.update(i, taskobj);
        }
    }
    
    function initwartask(p,s){
        if(p==null || p==-1){
            wartasktype = -1;
            wartaskid = -1;
            enternode.visible(0);
        }
        else{
            loadwartask(p,s);
            if(wartaskid<0){
                wartasktype = -1;
                enternode.visible(0);
            }
            else{
                enternode.visible(1);
            }
        }
    }
    
    function enterwartask(){
        global.pushContext(null,self,NonAutoPop);
        enternode.addaction(sequence(stop(),itexture("wtask3.png")));
        var tmp=enternode.get(1);
        if(tmp!=null){
            tmp.addaction(stop());
            tmp.removefromparent();
        }
    }
    
    function loadwartask(id,step){
        if(wartasklib.get(id)==null){
            wartaskid = -1;
            wartasktype = -1;
            return 0;
        }
        var wartask=wartasklib.get(id);
        wartasktype = wartask.get("type");
        wartaskid = wartask.get("id");
        wartaskreq = wartask.get("req");
        wartaskpair = wartask.get("pair");
        wartaskdes=wartask.get("des");
        wartaskreward=wartask.get("reward");
        wartasknum=wartask.get("checknum");
        trace(step);
        if(type(step) == type("")){
            step = int(step);
        }
        wartaskstep=step;
        if(wartaskstep>=wartasknum){
            enternode.addaction(sequence(stop(),itexture("wtask3.png")));
            var tmp = sprite("taskover0.png").pos(33,47);
            tmp.addaction(repeat(animate(1200,"taskover0.png","taskover2.png","taskover3.png","taskover4.png","taskover5.png","taskover7.png"),delaytime(800)));
            enternode.add(tmp,1,1);
        }
        else{
            tmp=enternode.get(1);
            if(tmp!=null){
                tmp.addaction(stop());
                tmp.removefromparent();
            }
            enternode.addaction(repeat(animate(1200,"wtask4.png","wtask3.png","wtask2.png","wtask1.png","wtask2.png","wtask3.png",ARGB_8888)));
        }
    }
    function incwartaskstep(i){
        wartaskstep=wartaskstep+i;
        global.http.addrequest(0,"wartaskstep",["uid","taskstring"],[global.userid,wartaskstep],self,"wartaskstep");
        if(wartaskstep>=wartasknum){
            enternode.addaction(sequence(stop(),itexture("wtask3.png")));
            var tmp = sprite("taskover0.png").pos(33,47);
            tmp.addaction(repeat(animate(1200,"taskover0.png","taskover2.png","taskover3.png","taskover4.png","taskover5.png","taskover7.png"),delaytime(800)));
            enternode.add(tmp,1,1);
        }
    }
    function setbutton(bt,x,y,n){
        var button = contextNode.addsprite("boxbutton"+str(bt)+".png").anchor(50,50).pos(x,y);
        button.addlabel(n,null,BUTTONFONTSIZE).anchor(50,50).pos(62,19);
        return button;
    }
    function paintNode(){
        contextNode = sprite("taskback2.png").anchor(50,50).pos(373,240);
        contextNode.addlabel(wartaskdes[0],null,40,FONT_BOLD).anchor(50,50).pos(334,60).color(0,0,0,100);
        if(wartaskstep >= wartasknum){
            contextNode.addlabel(global.getStaticString("taskShare"),null,20,FONT_NORMAL,120,0,ALIGN_LEFT).pos(171,110).color(27,21,9,100);
            contextNode.addlabel(global.getStaticString("shareReward"),null,20,FONT_NORMAL,120,0,ALIGN_LEFT).pos(171,200).color(12,72,80,100);
            var element = contextNode.addsprite("taskover.png").pos(310,96);
            element.addsprite("money_big.png").anchor(50,50).pos(30,172).size(32,32);
            element.addlabel(str(wartaskreward[0]),null,30).anchor(0,50).pos(50,172).color(0,0,0,100);
            element.addsprite("exp.png").anchor(50,50).pos(158,172);
            element.addlabel(str(wartaskreward[1]),null,30).anchor(0,50).pos(200,172).color(0,0,0,100);
            setbutton(4,356,407,global.getStaticString("share")).setevent(EVENT_UNTOUCH,wartaskcomplete,1);
            setbutton(1,498,407,global.getStaticString("complete")).setevent(EVENT_UNTOUCH,wartaskcomplete,null);
        }
        else{
            contextNode.addlabel(wartaskdes[1],null,20,FONT_NORMAL,120,0,ALIGN_LEFT).pos(171,110).color(27,21,9,100);
            element = contextNode.addsprite("task.png").pos(314,96);
            if(len(wartaskdes)==4){
                element.addlabel(wartaskdes[3],null,18,FONT_NORMAL,234,0,ALIGN_LEFT).anchor(100,100).color(43,75,0,100).pos(240,185);
            }
            element.addlabel(wartaskdes[2]+"  "+str(wartaskstep)+"/"+str(wartasknum),null,20,FONT_NORMAL,240,0,ALIGN_LEFT).pos(13,30).color(0,0,0,100);
            element.addsprite("money_big.png").anchor(50,50).pos(30,247).size(32,32);
            element.addlabel(str(wartaskreward[0]),null,30).anchor(0,50).pos(50,247).color(0,0,0,100);
            element.addsprite("exp.png").anchor(50,50).pos(158,247);
            element.addlabel(str(wartaskreward[1]),null,30).anchor(0,50).pos(200,247).color(0,0,0,100);
            setbutton(1,356,407,global.getStaticString("ok")).setevent(EVENT_UNTOUCH,closedialog);
            setbutton(2,498,407,global.getStaticString("giveup")).setevent(EVENT_UNTOUCH,wartaskgiveup);
        }
        contextNode.setevent(EVENT_KEYDOWN,keydown);
    }
    function keydown(n,e,p,kc){
        if(kc==4){
            closedialog(0,0);
        }
    }
    
    function reloadNode(re){
        if(re==1){
            global.http.addrequest(1,"wartaskgivenup",["uid"],[global.userid],self,"wartaskgivenup");
        }
    }
    
    function wartaskgiveup(){
        global.pushContext(self,new Warningdialog([global.getStaticString("giveupwarn"),1,5]),NonAutoPop);
    }
    
    function wartaskcomplete(n,e,p){
        global.popContext(null);
        enternode.visible(0);
        if(p==1){
            global.http.addrequest(0,"share",["uid"],[global.userid],global.context[0],"share");
            ppy_postnewsfeed(ppy_username()+global.getStaticString("complete")+wartaskdes[0]+", " + global.getStaticString("playWithme"), NewsURL, null);
        }
        global.http.addrequest(0,"wartaskaccomplished",["uid"],[global.userid],self,"wartaskaccomplished");
    }
    
    function useaction(p,rc,c){
        if(p=="wartaskstep"){
            wartaskstepover(0,rc,c);
        }
        else if(p=="wartaskgivenup"){
            trace("wartaskgiveup",rc,c);
            wartaskgivenup(0,rc,c);
        }
        else if(p=="wartaskaccomplished"){
            trace("wartaskcomplete",rc,c);
            wartaskaccomplished(0,rc,c);
        }
    }

    function wartaskstepover(r,rc,c){
        trace("step",rc,c);
    }
    
    function wartaskgivenup(r,rc,c){
        if(rc>0&&json_loads(c).get("id",1)!=0){
            global.popContext(null);
            initwartask(json_loads(c).get("task",-1),0);
        }
    }
    
    function wartaskaccomplished(r,rc,c){
        if(rc>0&&json_loads(c).get("id",1)!=0){
            global.user.changeValueAnimate2(global.context[0].moneyb,"money",wartaskreward[0],-6);
            global.user.changeValueAnimate2(global.context[0].ub,"exp",wartaskreward[1],-6);
            initwartask(json_loads(c).get("task",-1),0);
            if(wartaskid==1) enterwartask();
        }
    }
        
    function deleteContext(){
        contextNode.removefromparent();
        contextNode = null;
    }
    
    function closedialog(n,e){
        global.popContext(null);
        if(wartaskid==1){
            global.pushContext(null,new TestWebControl("war"),NonAutoPop);
        }
    }
}
