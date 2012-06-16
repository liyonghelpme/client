class InviteDialog extends ContextObject{

    var input;
    function InviteDialog(){
        contextname = "InviteDialog";
        contextNode = null;
    }
    
    function paintNode()
    {
        contextNode = sprite("dialogback_b.png").pos(400, 240).anchor(50, 50);
        contextNode.addsprite("builddialogclose.png").anchor(50, 50).pos(383, 16).setevent(EVENT_TOUCH, closedialog);
        contextNode.addlabel("input invite code:", null, 18).pos(55, 39).color(0, 0, 0);
        input = v_create(V_INPUT_VIEW, 198+109, 105+81, 208, 50);
        v_root().addview(input);
        var but0 = contextNode.addsprite("boxbutton1.png").pos(198, 205).anchor(50, 50).size(220, 38).setevent(EVENT_TOUCH, shareMyCode);
        contextNode.addlabel("确定并分享我的邀请码",null, 20).pos(198, 205).anchor(50, 50).color(100, 100, 100);
    }
    function closedialog()
    {
        global.popContext(null);
    }
    function deleteContext()
    {
        contextNode.removefromparent();
        input.removefromparent();
    }
    function shareMyCode()
    {
        global.popContext(null);
        global.http.addrequest(0, "invite/writeInviteCode", ["uid", "code"], [global.userid, input.text()], this, "writeCode");

    }
    function useaction(p, rc, c)
    {
        trace(p, rc, c);
        if(p == "writeCode")
        {
            if(rc != 0)
            {
                if(global.user.inviteCode != null)
                {
                    //c = json_loads(c);
                    ppy_postnewsfeed(global.getFormatString("inviteString", ["[CODE]", str(global.user.inviteCode)]), NewsURL, null);
                }
            }
        }
    }
}
