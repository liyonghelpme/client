class Act extends ContextObject{
    function Act(){
        contextname = "dialog-act";
        contextNode = null;
    }

    function paintNode(){
        contextNode = sprite("actIntro.jpg").anchor(50,50).pos(400,240);
        contextNode.addsprite("builddialogclose.png").anchor(50,50).pos(758, 38).setevent(EVENT_UNTOUCH,closedialog);
        contextNode.addsprite("rewardCup.png").anchor(50, 50).pos(728, 412).setevent(EVENT_UNTOUCH, checkRank);
    }

    function closedialog(node,event,p){
        global.popContext(null);
    }
    function checkRank(n, e, p, x, y, points)
    {
        global.popContext(null);
        global.pushContext(null, new Rank(), NonAutoPop);
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}
