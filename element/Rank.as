class Rank extends ContextObject{
    var nameNode;
    function Rank(){
        contextname = "dialog-rank";
        contextNode = null;
    }

    function paintNode(){
        contextNode = sprite("foodRank.jpg").anchor(50,50).pos(400,240);
        contextNode.addsprite("builddialogclose.png").anchor(100, 0).pos(740, 35).setevent(EVENT_TOUCH,closedialog);
        nameNode = contextNode.addnode();

        if(global.foodRankData != null)
        {
            showData(global.foodRankData);
        }
        global.http.addrequest(0, "getFoodRank", ["uid"], [global.userid], this, "getBack");
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
        nameNode.removefromparent();
        nameNode = contextNode.addnode();
        trace("rankData", data);
        var top = data.get("top");
        var initX = 294;
        var initY = 135;
        var headInitX = 216 - initX;
        var headInitY = 129 - initY;

        var nameInitX = 213 - initX;
        var nameInitY = 150 - initY;


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
            var head = nameNode.addsprite(avatar_url(top[i][0])).anchor(50, 50).pos(curX+headInitX, curY+headInitY);
            head.prepare();
            var oldSize = head.size();
            var s = min(3000/oldSize[0], 3000/oldSize[1]);
            head.scale(s);

            nameNode.addlabel(str(top[i][1]), null, 30).anchor(0, 50).pos(curX, curY).color(0, 0, 0, 100);
            nameNode.addlabel(str(top[i][2]), null, 10).anchor(50, 50).pos(curX+nameInitX, curY+nameInitY).color(0, 0, 0, 100);
            curY += difY;
        }

        //order 
        var myrank = data.get("myrank")[0]+1;
        trace("show rank user", myrank);
        nameNode.addlabel(str(myrank), null, 30).anchor(0, 50).pos(286, 70).color(0, 0, 0, 100);
    }

    function closedialog(node,event,p){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}
