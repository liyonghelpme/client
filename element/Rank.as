/*
显示打怪数量的排名

getFoodRank: 返回 top 10 和 自身排名 以及当前杀死的怪兽数目
top  otherid food num 
myRank rank num

服务器： 1小时更新 删除旧的数据 去掉旧的数据更新
杀死一个怪兽 增加一个得分

heartRank:
返回用户当前的排名heart 数据 
访问好友 rankYet
没有rankYet 则加1
*/
class Rank extends ContextObject{
    var nameNode;
    function Rank(){
        contextname = "dialog-rank";
        contextNode = null;
    }

    function paintNode(){
        contextNode = sprite("MonRank.jpg").anchor(50,50).pos(400,240);
        contextNode.addsprite("builddialogclose.png").anchor(50, 50).pos(762, 30).setevent(EVENT_TOUCH,closedialog);
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
    var pos = 
    [
    300, 122, 300, 200, 300, 298, 300, 398, 
    613, 122, 613, 200, 613, 298, 613, 398];

    function showData(data)
    {
        nameNode.removefromparent();
        nameNode = contextNode.addnode();
        trace("rankData", data);
        var top = data.get("top");
        var initX = 293;
        var initY = 121;
        var headInitX = 200 - initX;
        var headInitY = 116 - initY;

        var nameInitX = 200 - initX;
        var nameInitY = 153 - initY;


        var difX = 608 - initX;
        var difY = 220 - initY;

        var curX = initX;
        var curY = initY;
        //otherid food name
        trace("show rank head");
        var colNum = 4;
        for(var i = 0; i < len(top) && i < 2*colNum; i++)
        {
            if(i == colNum)
            {
                curX = initX + difX;
                curY = initY;
            }
            var head = nameNode.addsprite(avatar_url(top[i][0])).anchor(50, 50).pos(curX+headInitX, curY+headInitY);
            head.prepare();
            var oldSize = head.size();
            var s = min(5000/oldSize[0], 5000/oldSize[1]);
            head.scale(s);

            nameNode.addlabel(str(top[i][1]), null, 20).anchor(0, 50).pos(curX, curY).color(0, 0, 0, 100);
            //nameNode.addlabel(str(top[i][1]), null, 20).anchor(0, 50).pos(pos[i*2], pos[i*2+1]).color(0, 0, 0, 100);
            nameNode.addlabel(showName(top[i][2]), null, 15).anchor(50, 50).pos(curX+nameInitX, curY+nameInitY).color(0, 0, 0, 100);

            curY += difY;
        }

        //order food 
        var myrank = data.get("myrank")[0]+1;
        var food = data.get("myrank")[1];
        trace("show rank user", myrank);
        if(myrank >= 1000)
            nameNode.addlabel("999+", null, 30).anchor(0, 50).pos(260, 56).color(0, 0, 0, 100);
        else
            nameNode.addlabel(str(myrank), null, 30).anchor(0, 50).pos(260, 56).color(0, 0, 0, 100);
        nameNode.addlabel(str(food), null, 30).anchor(0, 50).pos(635, 56).color(0, 0, 0, 100);
    }

    function closedialog(node,event,p){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}
