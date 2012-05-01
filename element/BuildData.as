class BuildData extends ContextObject{
    var building;
    var timeLabel;
    function BuildData(b){
        contextname = "dialog-buildData";
        contextNode = null;
        building = b;
    }

    //var timeLabel = null;
    var buttons;
    function paintNode(){
        buttons = new Array();
        contextNode = sprite("buildcontrolback2.png").anchor(50,50).pos(400,200);
        var bg = sprite(building.myTexture);
        bg.prepare();
        var bsize = bg.size();
        var bl = min(180*100/bsize[0], 80*100/bsize[1]);
        bl = min(120, max(bl, 40));
        bg.scale(bl).anchor(50, 50).pos(107, 55);
        contextNode.add(bg);

        trace("building Data", building.buildcontextname, building.objectid);
        var nameLabel = contextNode.addlabel(global.getname(building.buildcontextname, building.objectid), null, 20).anchor(50, 50).pos(107, 123).color(0, 0, 0, 100);
        if(building.state == WORKING)
        {
            contextNode.addlabel("Working", null, 20).anchor(0, 50).pos(16, 158).color(70, 1, 1);
            timeLabel = contextNode.addlabel("", null, 20).anchor(100, 50).pos(200, 158).color(0, 0, 0, 100);

            timeLabel.addaction(repeat(callfunc(updateTime), delaytime(1000)));
            buttons.append(ACC_BUTTON);
        }
        for(var i = 0; i < len(buttons); i++)
        {
            var bt = contextNode.addsprite("buttontab0.png").pos(73*i-9, 173); 
            bt.addsprite("opbutton"+str(buttons[i])+".png").anchor(50, 50).pos(46, 46);
            bt.setevent(EVENT_TOUCH, touchBegan, buttons[i]);
            bt.setevent(EVENT_UNTOUCH, touchEnded, buttons[i]);
        }

    }
    function touchBegan(n, e, p, x, y, points)
    {
        n.texture("buttontab1.png");
        if(p == ACC_BUTTON)
        {

        }
    }
    function touchEnded(n, e, p, x, y, points)
    {
        n.texture("buttontab0.png");
        if(p == ACC_BUTTON)
        {
            global.popContext(null);
            global.pushContext(null, new MyQuick(building), NonAutoPop);
        }
    }
    function updateTime()
    {
        var lefttime = building.leftTime;
        timeLabel.text(global.gettimestr(lefttime));
    }

    function closedialog(node,event,p){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}
