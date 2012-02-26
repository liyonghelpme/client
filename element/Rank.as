class Rank extends ContextObject{
    function Rank(){
        contextname = "dialog-rank";
        contextNode = null;
    }

    function paintNode(){
        contextNode = sprite("foodRank.jpg").anchor(50,50).pos(400,240);
        contextNode.addsprite("builddialogclose.png").anchor(100, 0).pos(740, 35).setevent(EVENT_TOUCH,closedialog);
        global.http.addrequest(0, "getFoodRank", ["uid"], [global.userid], this, "getBack");
        /*
        if(global.foodRankData == null)
        {

        }
        else
        {
            showData(global.foodRankData);
        }
        */
    }
    function useaction(act, rc, c)
    {
        if(act == "getBack")
        {
            var res = json_loads(c);
            if(rc != 0 && res.get("id") != 0)
            {
                global.foodRankData = res;
                showData(global.foodRankData);
            }
        }
    }
    function showData(data)
    {
        trace("rankData", data);
        var top = data.get("top");
        var initX = 294;
        var initY = 135;
        var headInitX = 214-initX;
        var headInitY = 0;

        var difX = 310;
        var difY = 66;

        var curX = initX;
        var curY = initY;
        //otherid food name
        trace("show rank head");
        for(var i = 0; i < len(top) && i < 10; i++)
        {
            if(i/5 == 1)
            {
                curX = initX + difX;
                curY = initY;
            }
            var head = contextNode.addsprite(avatar_url(top[i][0])).anchor(50, 50).pos(curX+headInitX, curY+headInitY);
            head.prepare();
            var oldSize = head.size();
            var s = min(3000/oldSize[0], 3000/oldSize[1]);
            head.scale(s);

            contextNode.addlabel(str(top[i][1]), null, 30).anchor(0, 50).pos(curX, curY).color(0, 0, 0, 100);
            contextNode.addlabel(str(top[i][2]), null, 10).anchor(50, 50).pos(curX+headInitX, curY+headInitY+20).color(0, 0, 0, 100);
            curY += difY;
        }

        //order 
        var myrank = data.get("myrank")[0]+1;
        trace("show rank user", myrank);
        contextNode.addlabel(str(myrank), null, 30).anchor(0, 50).pos(286, 70).color(0, 0, 0, 100);
    }

    function closedialog(node,event,p){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}
