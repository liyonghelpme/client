class LoginInvite extends ContextObject{
    var showlabel;
    function LoginInvite(){
        contextname = "dialog-loginInvite";
        contextNode = null;
    }

    function paintNode(){
        contextNode = sprite("dialogback_expand.png",ARGB_8888).anchor(50,50).pos(400,300);
        contextNode.addsprite("girl1.png").anchor(50,100).pos(0,310).size(191,409);
        showlabel = contextNode.addlabel(global.getFormatString("inviteNotice", ["[CODE]", str(global.user.inviteCode)]),null,20,FONT_BOLD,308,0,ALIGN_LEFT).anchor(0,50).pos(100,110).color(0,0,0,100);
        var but0 = contextNode.addsprite("boxbutton1.png").anchor(50,50).pos(133,254).setevent(EVENT_UNTOUCH, writeCode);
        but0.addlabel(global.getStaticString("okInvite", []), null, 20).pos(62, 19).anchor(50, 50);
        but0 = contextNode.addsprite("boxbutton2.png").anchor(50,50).pos(322,254).setevent(EVENT_UNTOUCH, closedialog);
        but0.addlabel(global.getStaticString("ok", []), null, 20).pos(62, 19).anchor(50, 50);
    }

    function writeCode()
    {
        global.popContext(null);
        global.pushContext(null, new InviteDialog(), NonAutoPop);
    }
    function closedialog(node,event,p){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}
