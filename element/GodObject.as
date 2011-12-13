class GodObject extends BuildObject{
    function GodObject(b){
        contextname = "object-build-god";
        buildname = "shen";
        buildindex = 4;
        initwithbase(b);
        mstate = 10;
    }

    override function beginbuild(){
        var blevel = bid/4;
        var btype = bid%4;
        if(blevel>=5){
            blevel = (bid-20)%5;
            btype = bid/5;
        }
        if(blevel==0){
            global.user.changeValueAnimate(baseobj,"money", -GOD_B_PRICE[0],2); 
            global.user.changeValueAnimate(baseobj,"food", -GOD_FOOD[0],0);
            global.user.changeValueAnimate(baseobj,"personmax",GOD_PERSON_MAX[0],-2);
        }
        else{
            global.user.changeValueAnimate(baseobj,"personmax",GOD_PERSON_MAX[blevel]-GOD_PERSON_MAX[blevel-1],-2);
        }
        global.user.changeValueAnimate(baseobj,"exp",GOD_EXP[blevel],-4);
        state = 1;
        begintime = time()/1000;
        lefttime = 100;
        global.user.setValueInArray("godtime",btype,0);
        global.user.setValueInArray("godlevel",btype,blevel);
        super.beginbuild();
    }
    
    override function objectinterface(s,p){
        if(s==2 && p!=null){
            objid = p;
            var blevel = bid/4;
            var btype = bid%4;
            if(blevel>=5){
                blevel = (bid-20)%5;
                btype = bid/5;
            }
            var cost = dict();
            var level = [10, 12, 14, 16, 20];
            cost.update("mana",BLESS_CAESARS[p]*level[blevel]/10);
            trace("god bless", p, blevel, BLESS_CAESARS[p]*level[blevel]/10);
            if(global.user.testCost(cost)==0){
                lock=0;
                setstate();
                return 0;
            }

            global.http.addrequest(0,"godbless",["uid","godtype","caetype"],[global.userid,btype,p],self,"state2over");
        }
    }
    
    function state2over(r,rc,c){
        if(rc>0 && json_loads(c).get("id")==1){
            var blevel = bid/4;
            var btype = bid%4;
            var level = [10, 12, 14, 16, 20];

            if(blevel>=5){
                blevel = (bid-20)%5;
                btype = bid/5;
            }
            global.user.changeValueAnimate(baseobj,"mana",-BLESS_CAESARS[objid]*level[blevel]/10,4);
            state=3;
            var gtime = [3600,21600,86400];
            begintime = time()/1000;
            global.user.setValueInArray("godtime",btype,gtime[objid]);
            var ttime = [3,5,10];
            if(btype<4){
                var tin = [0,1,3,2];
                var tid = tin[btype];
                var g = global.context[0].grounds;
                var l = len(g);
                for(var i=0;i<l;i++){
                    if((g[i].contextid==2 || g[i].contextid==3) && g[i].objectid/100 == tid){
                        var ps = g[i].contextNode.size();
                        var ani = g[i].contextNode.addsprite("01.png").anchor(50,100).pos(ps[0]/2,g[i].contextid*33-ps[1]/2);
                        ani.addaction(sequence(repeat(animate(1000,"rain1.png","rain2.png","rain3.png","rain4.png","rain5.png","rain6.png"),ttime[objid]),callfunc(removeself)));
                    }
                }
            }
            //else{
                ps = contextNode.size();
                ani = contextNode.addsprite("01.png").anchor(50,100).pos(ps[0]/2,-66+ps[1]);
                ani.addaction(sequence(repeat(animate(1000,"rain1.png","rain2.png","rain3.png","rain4.png","rain5.png","rain6.png"),ttime[objid]),callfunc(removeself)));
            //}
            //0harvest 1population 2war 3fortune 4friendship 5 monster 
            if(btype == 5)
            {
                var grounds = global.context[0].grounds;
                for(i = 0; i < len(grounds); i++)
                {
                    if(grounds[i].objectid >= 600 && grounds[i].objectid <= 700 && grounds[i].objnode.state == 2)
                    {
                        grounds[i].objnode.begintime = global.timer.currenttime;
                        grounds[i].objnode.objid = objid;
                        grounds[i].objnode.state = 3;
                        grounds[i].objnode.setstate();
                        ps = grounds[i].contextNode.size();
                        trace("add action to statue", ps);
                        ani = grounds[i].contextNode.addsprite("01.png").anchor(50, 100).pos(ps[0]/2, grounds[i].contextid*33-ps[1]/2);
                        ani.addaction(sequence(repeat(animate(1000, "rain1.png", "rain2.png", "rain3.png", "rain4.png", "rain5.png", "rain6.png"), ttime[objid]), callfunc(removeself)));
                    }
                }
            }
        }
        lock = 0;
        setstate();
    }
    
    override function objectsetstate(){
        if(state == 4){
            state =2;
        }
        stateNode.texture();
    }

    override function objectgettime(){
        var blevel = bid/4;
        var btype = bid%4;
        if(blevel>=5){
            blevel = (bid-20)%5;
            btype = bid/5;
        }
        if(state == 1) return GOD_B_TIME[blevel];
        else if(state == 3) return global.user.getValue("godtime")[btype];
        else return 0;
    }
}
