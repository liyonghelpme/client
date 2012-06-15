class OldUser extends ContextObject{
    function OldUser(){
        contextname = "dialog-love";
        contextNode = null;
    }

    function paintNode(){
        contextNode = sprite("dialogback_expand.png",ARGB_8888).anchor(50,50).pos(400,300);
        contextNode.addsprite("girl1.png").anchor(50,100).pos(0,310).size(191,409);
        contextNode.addlabel("Thanks for helping us test the beta version of Miracle Empire. You get 10 FREE Caesar coins as reward. This version has added new quests, items, functions and changed some data. Enjoy it:)",null,20,FONT_NORMAL,308,0,ALIGN_LEFT).anchor(0,50).pos(100,110).color(0,0,0,100);
        contextNode.addsprite("boxbutton1.png").anchor(50,50).pos(225,234).setevent(EVENT_UNTOUCH, closedialog);
        contextNode.addlabel("OK",null,BUTTONFONTSIZE).anchor(50,50).pos(225,234);
        global.user.changeValue("caesars", -10);
    }

    function closedialog(node,event,p){
        global.popContext(null);
        global.user.changeValueAnimate2(global.context[0].moneyb, "caesars", 10, -2);
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}
