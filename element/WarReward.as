class WarReward extends ContextObject{
    var num;
    var kind;
    function WarReward(n, k){
        num = n;
        kind = k;
        contextname = "dialog-warreward";
        contextNode = null;
    }

    function paintNode(){
        contextNode = sprite("dialogback_b.png").anchor(50,50).pos(400,240);
        contextNode.addlabel("战斗期间点击战鼓会有额外奖励！本次战斗你共点击"+str(num)+"次，获得"+str(num*kind)+"银币奖励！", null, 25, FONT_NORMAL, 300, 0, ALIGN_LEFT).pos(58, 61).color(0, 0, 0, 100);
        contextNode.addsprite("boxbutton1.png").pos(103, 224).anchor(50, 50).setevent(EVENT_UNTOUCH, share);
        contextNode.addsprite("boxbutton2.png").pos(278, 224).anchor(50, 50).setevent(EVENT_UNTOUCH, close);
        contextNode.addlabel("分享", null, 25).pos(103, 224).anchor(50, 50);
        contextNode.addlabel("确定", null, 25).pos(278, 224).anchor(50, 50);

    }
    function share()
    {
        global.popContext();
        ppy_postnewsfeed(ppy_username()+"战斗期间敲打了"+str(num)+"次战鼓，获得了"+str(num*kind)+"银币！赶快加入奇迹帝国与Ta一起战斗吧!", ShareURL, null);
    }
    function close()
    {
        global.popContext();
    }
    function closedialog(node,event,p){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}
