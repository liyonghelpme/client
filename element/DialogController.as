class DialogController
{
    var monsterResult = [];
    function DialogController()
    {
        global.timer.addlistener(time()/1000+86400, this);
    }
    function addMonResult(res)
    {
        monsterResult += res;
        trace("addMonResult", monsterResult);
    }
    var timeisend = 0;
    function timerefresh(timer, tick, param)
    {
        if(len(monsterResult) > 0)
        {
            var data = monsterResult.pop(0);
            var words = global.getFormatString("monsterResult", ["[NUM]", str(data.get("dragonNum"))]); 
            global.pushContext(null, new MyWarnDialog(null, 1, words), NonAutoPop); 
            global.user.changeValue("dragonStone", data.get("dragonNum"));
        }
    }
}
