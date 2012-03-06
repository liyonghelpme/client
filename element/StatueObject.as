class StatueObject extends BuildObject{
    function StatueObject(b){
        contextname = "object-build-statue";
        buildname = "build";
        buildindex = 6;
        initwithbase(b);
    }

    override function beginbuild(){
        //trace("build statue");
        var data = global.data.getbuild(bid);
        if(STATUE_PRICE[bid%100]<0){
            global.user.changeValueAnimate(baseobj,"caesars", STATUE_PRICE[bid%100],2); 
        }
        else{
            global.user.changeValueAnimate(baseobj,"money", -STATUE_PRICE[bid%100],2); 
        }
        global.user.changeValueAnimate(baseobj,"citydefence", STATUE_DEFENCE[bid%100],0);
        global.user.changeValueAnimate(baseobj,"labor",STATUE_PERSON[bid%100],-2);
        state = 1;
        begintime = global.timer.currenttime;
        lefttime = 7200;
        super.beginbuild();
    }

    override function objectgettime(){
        var GOD_TIME = [3600, 6*3600, 24*3600];
        if(state == 1) return STATUE_TIME[bid%100];
        else if(state == 3) return GOD_TIME[objid];
        else return 0;
    }
    override function objectsetstate(){
        if(state == 4){
            //spriteManager.getAnimation(["defence_bubble.png"]);
            stateNode.texture("defence_bubble.png",UPDATE_SIZE).pos(baseobj.contextid*33+1,baseobj.contextid*33-contextNode.size()[1]*2/3);

        }
        else{
            stateNode.texture();
            flagquick = 0;
        }
    }
    override function objectinterface(s,p){
        if(s == 4){
         //   trace("harvest defence");
            global.http.addrequest(0,"getdefence",["user_id","city_id","grid_id"],[global.userid,global.cityid,baseobj.posi[0]*RECTMAX+baseobj.posi[1]],self,"state4over");
        }
    }

    function state4over(r,rc,c){
       // trace("getdefence",rc,c);
        if(rc != 0){
            state = 2;
            var res = json_loads(c);
            global.user.changeValueAnimate(baseobj, "citydefence", res.get("defenceadd"), 0);
            //trace("set animate ");
        }
        lock = 0;
        setstate();
    }
}
