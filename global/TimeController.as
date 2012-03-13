class TimeController{
    var base_localtime;
    var base_systime;
    var base_realtime;
    var currenttime;
    var timelist;
    function TimeController(st){
        base_systime=st;
        base_realtime = time();
        base_localtime = base_realtime/1000;
        timelist = new Array(0);
        c_addtimer(1000,timecontrol);
    }
    
    function times2c(t1){
        return t1-base_systime+base_localtime;
    }
    
    function timec2s(t1){
        return t1+base_systime-base_localtime;
    }
    
    function addlistener(endtime,listener){
        timelist.append([endtime,listener]);
    }
    
    function removelistener(listener){
        for(var i=0;i<len(timelist); i++)
        {
            if(timelist[i][1] == listener)
            {
                timelist.pop(i);
                break;
            }
           
        }
    }

    function timecontrol(){
        //trace("timers, node, action, fps", sysinfo(21), sysinfo(24), sysinfo(23), getfps());
        currenttime = (time()-base_realtime)/1000+base_localtime;
        var length= len(timelist);
        for(var i=0;i<length;i++){
            if(timelist[i][1].timeisend==1){
                timelist.pop(i);
                i--;
                length--;
                continue;
            }
            else if(timelist[i][1].timeisend==2){
                timelist[i][1].timeisend=0;
                timelist[i][0] = timelist[i][1].endtime;
                trace("refresh");
            }
            if(timelist[i][0] == -1)
            {
                timelist[i][1].timerefresh();
            }
            else if(timelist[i][0]>currenttime){
                timelist[i][1].timerefresh();
            }
            else{
                timelist[i][1].timeend();
                timelist.pop(i);
                i--;
                length--;
            }
        }
    }
}

