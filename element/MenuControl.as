class MenuControl extends ContextObject{
    var music;
    var flagmusic;
    var flagrob;
    var musicbutton;
    var flagnotice;
    var flagnight;
    var noticebutton;
    var refreshbutton;
    var screenbutton;
    var quitbutton;
    var lock=0;
    var musiclist;
    var bigbutton;
    var smallbutton;

    function MenuControl(){
        contextname = "dialog-system";
        contextNode = null;
        lock=0;
        musiclist=new Array(0);
        flagrob = 0;
        flagnight=0;
    }

    //config: flagmusic,flagnotice
    function initwithconfig(){
        var fp = c_file_open("config"+str(ppy_userid()),1);
        var configstr = "11";
        if(c_file_exist(fp) != 0){
            configstr = c_file_op(C_FILE_READ,fp);
            if(len(configstr)!=2){
                configstr = "11";
            }
        }
        flagmusic = int(configstr[0]);
        flagnotice = int(configstr[1]);
        fp = null;
        rewriteconfig();
        music = null;
    }
    
    function rewriteconfig(){
        var fp = c_file_open("config"+str(ppy_userid()),1);
        c_file_op(C_FILE_WRITE,fp,str(flagmusic)+str(flagnotice));
    }
    
    function pushmusic(name){
        if(music != null && flagmusic==1){
            music.stop();
        }
        musiclist.append(name);
        if(flagmusic == 1){
            music = createaudio(name);
            music.play(-1);
        }
    }
    
    function popmusic(){
        if(music != null && flagmusic == 1){
            music.stop();
        }
        musiclist.pop();
        if(flagmusic == 1 && len(musiclist)>0){
            music = createaudio(musiclist[len(musiclist)-1]);
            music.play(-1);
        }
    }

    function paintNode(){
        contextNode = sprite("dialogback_menu.png").anchor(50,50).pos(400,240).size(439,383);
        contextNode.addsprite("builddialogclose.png").anchor(100,0).pos(423,13).setevent(EVENT_UNTOUCH,closedialog);
        //refreshbutton = contextNode.addsprite("refreshbutton.png").pos(17,76).setevent(EVENT_UNTOUCH,refreshuser);
        contextNode.addsprite("nightbutton"+str(flagnight)+".png").pos(17,76).setevent(EVENT_UNTOUCH,changenight);
        musicbutton = contextNode.addsprite("musicbutton"+str(flagmusic)+".png").pos(154,76).setevent(EVENT_UNTOUCH,switchmusic);
        noticebutton = contextNode.addsprite("noticebutton"+str(flagnotice)+".png").pos(291,76).setevent(EVENT_UNTOUCH,switchnotice);
        screenbutton = contextNode.addsprite("screenbutton.png").pos(17,213).setevent(EVENT_UNTOUCH,screenshot);
        contextNode.addsprite("helpbutton.png").pos(154,213).setevent(EVENT_UNTOUCH,help);
        contextNode.addsprite("invitebutton.png").pos(291,213).setevent(EVENT_UNTOUCH,invite);
    }
    
    function invite(){
        global.popContext(null);
        if(sysinfo(21)!=null&&int(sysinfo(21))>=4){
            invite_friends(INVITE_STR[0],INVITE_STR[1],INVITE_STR[2]);
        }
        else{
            global.pushContext(null,new TestWebControl(1),NonAutoPop);
        }
    }
    
    function entermedal(){
        global.popContext(null);
        global.pushContext(null,new Medaldialog(global.card),NonAutoPop);
    }
    
    function changenight(n){
        flagnight=1-flagnight;
        n.texture("nightbutton"+str(flagnight)+".png");
        var grounds = global.context[0].grounds;
        if(flagnight==0){
            global.context[0].contextNode.texture("800480night.jpg");
            global.context[0].menu.color(50,50,60,100);
            global.context[0].contextNode.get(1).color(50,50,60,100);
            global.context[0].contextNode.add(sprite("dark.png").color(6,6,12,60).size(PAGE_W,PAGE_H),0,0);
            for(var i=0;i<len(grounds);i++){
                if(grounds[i].objectid >0 && grounds[i].objectid<500 ||grounds[i].objectid>=600){
                    grounds[i].objnode.setstate();
                }
                else{
                    grounds[i].objnode.color(50,50,60,100);
                    if(grounds[i].objectid>=512&&grounds[i].objectid<=516 ||grounds[i].objectid>=542&&grounds[i].objectid<=544 ||grounds[i].objectid>=545&&grounds[i].objectid<=546){
                        trace("draw light", grounds[i].objectid);
                        var lightpng = sprite("", ARGB_8888).anchor(0,100).pos(0,33*grounds[i].contextid+1);
                        grounds[i].contextNode.add(lightpng,1,1);
                        spriteManager.getPic("object"+str(grounds[i].objectid-500)+"_l.png", lightpng);
                    }
                    else if(grounds[i].objectid==0){
                        grounds[i].contextNode.add(sprite("empire"+str(grounds[i].empireLevel)+"_l.png").anchor(50,100).pos(269,283).size(524,398),1,1);
                    }
                }
            }
        }
        else{
            global.context[0].contextNode.texture("800480.jpg");
            global.context[0].menu.color(100,100,100,100);
            global.context[0].contextNode.get(1).color(100,100,100,100);
            global.context[0].contextNode.remove(0);
            for(i=0;i<len(grounds);i++){
                if(grounds[i].objectid >0 && grounds[i].objectid<500 ||grounds[i].objectid>=600){
                    grounds[i].objnode.setstate();
                }
                else{
                    grounds[i].objnode.color(100,100,100,100);
                    if(grounds[i].objectid>=512&&grounds[i].objectid<=516 ||grounds[i].objectid>=542&&grounds[i].objectid<=544||grounds[i].objectid==0){
                        grounds[i].contextNode.remove(1);
                    }
                }
            }
        }
    }
    
    function help(){
        global.popContext(null);
        global.pushContext(null,new TestWebControl(""),NonAutoPop);
    }

    function sizechange(n,e,p){
        var mode = global.context[0].mode;
        var tmode = mode+p;
        trace(mode,tmode);
        if(mode == PS_MAX && p<0){
            bigbutton.color(100,100,100,100);
        }
        else if(mode == PS_MIN && p>0){
            smallbutton.color(100,100,100,100);
        }
        if(tmode >= PS_MAX){
            bigbutton.color(40,40,40,100);
        }
        else if(tmode <= PS_MIN){
            smallbutton.color(40,40,40,100);
        }
        global.context[0].sizeModeft(mode,tmode);
    }

    function refreshuser(n,e){
        global.popContext(null);
    }

    function screenshot(n,e){
        if(global.currentLevel == contextLevel){
            global.popContext(null);
            //global.dialogscreen.visible(0);
            global.context[0].menu.visible(0);
            global.shotscreen.bitmap(shotover,1);
        }
    }

    function shotover(n,b,p){
        trace("shotover",p);
        ppy_postnewsfeed(global.getFormatString(33,["[NAME]",ppy_username()]),global.getStaticString(35),b.bitmap2bytes("png"));
        global.context[0].menu.visible(1);
        if(global.task.tasktype==5){
            global.task.inctaskstep(1);
        }
    }

    function quit(n,e){
        if(global.currentLevel == contextLevel){
            global.popContext(null);
            global.pushContext(null,new Quitdialog(),NonAutoPop);
        }
    }
    function switchmusic(n,e){
        if(global.currentLevel == contextLevel){
            flagmusic = 1-flagmusic;
            musicbutton.texture("musicbutton"+str(flagmusic)+".png");
            rewriteconfig();
            if(flagmusic == 1){
                music = createaudio(musiclist[len(musiclist)-1]);
                music.play(-1);
            }
            else{
                music.stop();
            }
        }
    }

    function switchnotice(n,e){
        if(global.currentLevel == contextLevel){
            flagnotice = 1-flagnotice;
            noticebutton.texture("noticebutton"+str(flagnotice)+".png");
            rewriteconfig();
            var grounds = global.context[0].grounds;
            if(flagnotice == 1){
                for(var i=0;i<len(grounds);i++){
                    if(grounds[i].contextid == 2 || grounds[i].contextid == 3)
                        grounds[i].objnode.stateNode.visible(1);
                }
            }
            else{
                for(i=0;i<len(grounds);i++){
                    if(grounds[i].contextid == 2 || grounds[i].contextid == 3)
                        grounds[i].objnode.stateNode.visible(0);
                }
            }
        }
    }

    function reloadNode(re){
    }

    function closedialog(node,event){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.addaction(stop());
        contextNode.removefromparent();
        contextNode = null;
    }
}
