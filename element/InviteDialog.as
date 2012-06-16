class InviteDialog extends ContextObject{

    var input;
    function InviteDialog(){
        contextname = "InviteDialog";
        contextNode = null;
    }
    
    var showWarn = null;
    function paintNode()
    {
        contextNode = sprite("dialogback_b.png").pos(400, 240).anchor(50, 50);
        contextNode.addsprite("builddialogclose.png").anchor(50, 50).pos(383, 16).setevent(EVENT_TOUCH, closedialog);
        contextNode.addlabel("Input your friend's invite code and he\she will get 10 free caesars!", null, 18, FONT_NORMAL, 285, 161, ALIGN_LEFT).pos(70, 39).color(0, 0, 0);
        input = v_create(V_INPUT_VIEW, 198+70, 105+124, 208, 50);
        v_root().addview(input);
        var WIDTH = 260;
        var HEIGHT = 40;
        var but0 = contextNode.addsprite("boxbutton1.png").pos(198, 265).anchor(50, 50).size(WIDTH, HEIGHT).setevent(EVENT_TOUCH, shareMyCode);
        but0.addlabel("Ok and share my invite code",null, 20).pos(WIDTH/2, HEIGHT/2).anchor(50, 50).color(100, 100, 100);


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
        if(input.text() == "")
        {
            if(showWarn == null)
                showWarn = contextNode.addlabel("invite code can't be empty", null, 22).pos(70, 175).color(100, 0, 0);
        }
        else
        {
            global.popContext(null);
            global.http.addrequest(0, "invite/writeInviteCode", ["uid", "code"], [global.userid, input.text()], this, "writeCode");
        }

    }
    function warnFinish()
    {
        ppy_postnewsfeed(global.getFormatString("inviteString", ["[CODE]", str(global.user.inviteCode)]), NewsURL, null);
    }
    function useaction(p, rc, c)
    {
        trace(p, rc, c);
        if(p == "writeCode")
        {
            if(rc != 0)
            {
                c = json_loads(c);
                if(c.get("id") == 0)
                {
                    var status = c.get("status", 0);
                    var words;
                    if(status == 0)
                        words = "Invite code error!";
                    else if(status == 1)
                        words = "Invite code is yours!";
                    else if(status == 2)
                        words = "This invite code used too much times!";
                    else if(status == 3)
                        words = "You used this invite code yet!";
                    else
                        words = "Invite code error!";
                    global.pushContext(null, new MyWarnDialog(warnFinish, 1, words));
                }
                else
                    global.pushContext(null, new MyWarnDialog(warnFinish, 1, "Send successfully!"));
                    
                /*
                if(global.user.inviteCode != null)
                {
                    //c = json_loads(c);
                    ppy_postnewsfeed(global.getFormatString("inviteString", ["[CODE]", str(global.user.inviteCode)]), NewsURL, null);
                }
                else 
                {
                    global.user.prepareCode(this);
                }
                */
            }
        }
        else if(p == "getCode")
        {
            if(rc != 0)
            {
                c = json_loads(c);
                global.user.inviteCode = c.get("code");
                ppy_postnewsfeed(global.getFormatString("inviteString", ["[CODE]", str(global.user.inviteCode)]), NewsURL, null);
            }

        }
    }
}
