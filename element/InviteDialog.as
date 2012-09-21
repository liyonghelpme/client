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
        contextNode.addlabel("输入你好友的邀请码，他\她 将获得10个凯撒币", null, 18, FONT_NORMAL, 285, 161, ALIGN_LEFT).pos(70, 39).color(0, 0, 0);
        input = v_create(V_INPUT_VIEW, 198+70, 105+124, 208, 50);
        v_root().addview(input);
        var WIDTH = 220;
        var HEIGHT = 40;
        var but0 = contextNode.addsprite("boxbutton1.png").pos(198, 265).anchor(50, 50).size(WIDTH, HEIGHT).setevent(EVENT_TOUCH, shareMyCode);
        but0.addlabel("确定并分享我的邀请码",null, 20).pos(WIDTH/2, HEIGHT/2).anchor(50, 50).color(100, 100, 100);


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
                showWarn = contextNode.addlabel("邀请码不能为空", null, 22).pos(70, 175).color(100, 0, 0);
        }
        else
        {
            global.popContext(null);
            global.http.addrequest(0, "invite/writeInviteCode", ["uid", "code"], [global.userid, input.text()], this, "writeCode");
        }

    }
    function warnFinish()
    {
        ppy_postnewsfeed(global.getFormatString("inviteString", ["[CODE]", str(global.user.inviteCode)]), ShareURL, null);
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
                        words = "错误的邀请码!";
                    else if(status == 1)
                        words = "这是你自己的邀请码!";
                    else if(status == 2)
                        words = "邀请码已经使用多次!";
                    else if(status == 3)
                        words = "你已经使用过这个邀请码!";
                    else
                        words = "错误的邀请码!";
                    global.pushContext(null, new MyWarnDialog(warnFinish, 1, words));
                }
                else
                    global.pushContext(null, new MyWarnDialog(warnFinish, 1, "发送成功!"));
                    
                /*
                if(global.user.inviteCode != null)
                {
                    //c = json_loads(c);
                    ppy_postnewsfeed(global.getFormatString("inviteString", ["[CODE]", str(global.user.inviteCode)]), ShareURL, null);
                }
                else 
                {
                    //global.user.prepareCode(this);
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
                ppy_postnewsfeed(global.getFormatString("inviteString", ["[CODE]", str(global.user.inviteCode)]), ShareURL, null);
            }

        }
    }
}
