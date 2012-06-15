class Invite extends ContextObject{
    var showLabel;
    function Invite(){
        contextname = "dialog-invite";
        contextNode = null;
    }

    function paintNode(){
        contextNode = sprite("dialogback_expand.png", ARGB_8888).anchor(50,50).pos(400,300);
        contextNode.addsprite("girl1.png").anchor(50, 100).pos(0, 310).size(191, 409);


        contextNode.addsprite("boxbutton1.png").anchor(50,50).pos(225-140/2, 234).setevent(EVENT_UNTOUCH, checkFAQ);
        contextNode.addlabel("Invite", null, 25).anchor(50, 50).pos(225-140/2, 234);

        contextNode.addsprite("boxbutton2.png").anchor(50,50).pos(225+140/2, 234).setevent(EVENT_UNTOUCH,closedialog);
        contextNode.addlabel("Cancel", null, 25).anchor(50, 50).pos(225+140/2, 234);



        //var level = global.user.getValue("level");
        //var str = Tips.get(level, "");
        showLabel = contextNode.addlabel("Hi, invite friends to get caesars! You have some Papaya friends didn't play Miracle Empire, invite them to play with you:)", null, 20, FONT_NORMAL, 309, 0, ALIGN_LEFT).anchor(0, 50).pos(100, 110).color(0, 0, 0, 100);
    }
    function checkFAQ()
    {
        global.popContext(null);
        //global.lock();
        global.context[0].friend.inviteAll();
        //global.unlock();
        global.http.addrequest(0, "inviteAll", ["uid"], [global.userid], this, "inviteAll");
        //global.pushContext(null, new TestWebControl("faq"), NonAutoPop);
    }
    function useaction(p, rc, c)
    {
        if(p == "inviteAll")
        {
            trace("invite suc");
            //global.user.changeValueAminate2(global.context[0].moneyb, "caesars", 2, -2);
            global.user.changeValueAnimate2(global.context[0].moneyb, "caesars", 2, -2);
        }
    }
    function closedialog(node,event,p){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}
