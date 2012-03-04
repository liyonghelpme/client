class DragonDisk extends BuildObject{
    function DragonDisk(b){
        contextname = "object-build-disk";
        buildname ="disk";
        buildindex = DISK_INDEX;
        initwithbase(b);
        //if(global.context[0].flagfriend == 0)
        //    global.user.setValue("hasDisk", 1);
    }

    override function objectinterface(s,p){
        if(s == FINISH_WORKING){
            //global.http.addrequest(0,"product",["user_id","city_id","grid_id"],[global.userid,global.cityid,baseobj.posi[0]*RECTMAX+baseobj.posi[1]],self,"state4over");
        }
    }

    function state4over(r,rc,c){
trace("product",rc,c);
        if(rc != 0){
            state = 3;
            global.user.changeValueAnimate(baseobj,"exp",FACT_EXP[bid],0);
            if(time()/1000-begintime<3*86400){
                var bl=10;
                if(global.user.getValue("godtime")[2]>0){
                    bl = global.user.getValue("godlevel")[2]*2+12;
                }
                global.user.changeValueAnimate(baseobj,"money",FACT_GAIN[bid]*bl/10,2);
            }
            begintime = time()/1000;
            lefttime = 1;
            state2=0;
        }
        lock = 0;
        setstate();
    }

    override function beginbuild(){
        global.user.changeValueAnimate(baseobj,"money", -DISK_MONEY[bid], 2);
        global.user.changeValueAnimate(baseobj,"personmax", DISK_PERSON[bid], 0);
        global.user.setValue("hasDisk", 1);

        state = BUILDING;
        begintime = time()/1000;
        lefttime = DISK_TIME[bid];
        super.beginbuild();
    }

    override function objectsetstate(){
        if(state == FINISH_WORKING){
            /*
            if(time()/1000-begintime<3*86400){
                stateNode.texture("factSuccess.png",UPDATE_SIZE).pos(baseobj.contextid*33+1,baseobj.contextid*33-contextNode.size()[1]*2/3);
            }
            else{
                stateNode.texture("factfail.png",UPDATE_SIZE).pos(baseobj.contextid*33+1,baseobj.contextid*33-contextNode.size()[1]*2/3);
            }
            */
        }
        else{
            if(state == FINISH_BUILDING){
                //state = WORKING;
                //begintime = time()/1000;
                //lefttime = 1;
            }
            else if(state == BUILDING)
            {
                
            }

            //state2 Negtive State
            stateNode.texture();
            flagquick = 0;
        }
    }

    override function objectgettime(){
        if(state == BUILDING) return DISK_TIME[bid];
        else return 0;
    }
}
