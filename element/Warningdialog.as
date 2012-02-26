class Warningdialog extends ContextObject{
    var info;
    var element;
    var dialog;
    function Warningdialog(i){
        contextname = "dialog-warning";
        contextNode = null;
        element = null;
        info = i;
    }
    function deleteContext(){
        contextNode.addaction(stop());
        contextNode.removefromparent();
        contextNode = null;
        element.removefromparent();
        element=null;
    }
    
    function excute(p){
        if(p == 100)//attack with catapult
            global.popContext(-3000);
        else if(p == 101)//attack without catapult
            global.popContext(-3001);
        else
            global.popContext(info[1]);
    }
    
    function gotohelp(n,e,p){
        global.pushContext(null,new TestWebControl(p),NonAutoPop);
    }
    
    //info[1] array
    //== 1 attackcontrol
      //no need to return
    //null inprotect attack
    //null inattacking attack
    //null wonyet attack
    //null user upgrade attack 
        //==param used for return for callback function catapult product/dragon
        //==param dragon select egg
    
    //-2000 spritemanager
    //-3000 attack whether use catapult 

    //info dict
    function getelement(){
        if(element == null){
            element = node();
            //dragon info[1]+1000
            if(type(info)==2){
                element.addsprite("pic"+str(info[2])+".jpg").anchor(50,50).pos(80,120);
                if(info[1] >= 1000)
                {
                    info[1] -= 1000;
                    element.addlabel(info[0],null,24,FONT_NORMAL,240,0,ALIGN_LEFT).anchor(50,50).pos(268,105).color(0,0,0,100);
                    dialog.usedefaultbutton(2,[global.getStaticString("call"),global.getStaticString("cancel")]);
                }
                else if(info[1] == -3000)
                {
                    element.addlabel(info[0],null,24,FONT_NORMAL,240,0,ALIGN_LEFT).anchor(50,50).pos(268,105).color(0,0,0,100);
                    dialog.AttackUseCata([global.getStaticString("sendCatapult"), global.getStaticString("notSendCata")]);
                }
                else if(info[1]>=0){
                    element.addlabel(info[0],null,24,FONT_NORMAL,240,0,ALIGN_LEFT).anchor(50,50).pos(268,105).color(0,0,0,100);
                    dialog.usedefaultbutton(2,[global.getStaticString("ok"),global.getStaticString("cancel")]);
                }
                else if(info[1]==-1){
                    element.addlabel(info[0],null,24,FONT_NORMAL,216,0,ALIGN_LEFT).anchor(0,50).pos(148,105).color(0,0,0,100);
                    //element.addsprite("dialogelement_help.png").anchor(0,0).pos(248,118).scale(150).setevent(EVENT_UNTOUCH,gotohelp,"gift");
                    dialog.usedefaultbutton(1,global.getStaticString("ok"));
                }
                else if(info[1]==null){
                    element.addlabel(info[0],null,24,FONT_NORMAL,240,0,ALIGN_LEFT).anchor(50,50).pos(268,105).color(0,0,0,100);
                    dialog.usedefaultbutton(1,global.getStaticString("ok"));
                }
                else if(info[1] == DownWarn || info[1] == ShowDownYet)//spriteManager 
                {
                    element.addlabel(info[0],null,24,FONT_NORMAL,240,0,ALIGN_LEFT).anchor(50,50).pos(268,105).color(0,0,0,100);
                    dialog.usedefaultbutton(2,[global.getStaticString("ok"),global.getStaticString("cancel")]);
                }
            }
            else if(info.get("ok")==0){
                element.addsprite("pic6.jpg").anchor(50,50).pos(80,120);
                var infos = info.keys();
                infos.remove("ok");
                var basey = 53+(3-len(infos))*14;
                element.addlabel(global.getStaticString("youNeed"),null,24).pos(148,basey).color(0,0,0,100);
                for(var i=0;i<len(infos);i++){
                    element.addlabel(str(info.get(infos[i]))+" "+infos[i],null,24).pos(148,basey+28*i+25).color(100,0,0,100);
                }
                if(infos.index(global.getStaticString("personmax"))!=-1){
                    element.addsprite("dialogelement_help.png").pos(365,basey+28*i).scale(150).setevent(EVENT_UNTOUCH,gotohelp,"personmax");
                }
                dialog.usedefaultbutton(1,global.getStaticString("ok"));
            }
            else if(info.get("ok")==-1){
                element.addsprite("pic4.jpg").anchor(50,50).pos(80,120);
                element.addlabel(global.getStaticString("speNeed") ,null,24,FONT_NORMAL,240,0,ALIGN_LEFT).anchor(0,50).pos(148,105).color(0,0,0,100);
                element.addsprite("dialogelement_help.png").anchor(50,50).pos(365,115).scale(150).setevent(EVENT_UNTOUCH,gotohelp,"special");
                dialog.usedefaultbutton(1,global.getStaticString("ok"));
            }
        }
        return element;
    }
    
    function paintNode(){
        dialog = new Simpledialog(1,self);
        dialog.init(dialog,global);
        contextNode = dialog.getNode();
    }
}
