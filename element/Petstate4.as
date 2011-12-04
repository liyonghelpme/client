class Petstate4 extends ContextObject{
    var build;
    function Petstate4(b){
        build=b;
        contextname = "dialog-pet-state4";
        contextNode = null;
    }

    function paintNode(){
        contextNode = sprite("dialogback_expand.png",ARGB_8888).anchor(50,50).pos(400,300);
        contextNode.addsprite("girl1.png").anchor(50,100).pos(0,310).size(191,409);
        if(build.state==4){
            contextNode.addlabel(global.getFormatString("nest_getup_format",["[NAME]",build.petname,"[DESCRIBE]",global.getStaticString("nest_getup_1"),"[HEALTH]","51","[PROPERTY]",str(PETS_UP[build.objid]),"[ATTACK]",str(build.attack)]),null,26,FONT_BOLD,308,0,ALIGN_LEFT).anchor(0,50).pos(100,114).color(0,0,0,100);
        }
        else if(build.state==5){
            contextNode.addlabel(global.getFormatString("nest_getup_format",["[NAME]",build.petname,"[DESCRIBE]",global.getStaticString("nest_getup_2"),"[HEALTH]","201","[PROPERTY]",str(PETS_UP[build.objid]+EXTEND_UP[build.extendid]),"[ATTACK]",str(build.attack)]),null,26,FONT_BOLD,308,0,ALIGN_LEFT).anchor(0,50).pos(100,114).color(0,0,0,100);
        }
        //contextNode.addsprite("dialogelement_help.png").scale(150).pos(334,166).setevent(EVENT_UNTOUCH,gotohelp,"colony");
        contextNode.addsprite("boxbutton1.png").anchor(50,50).pos(150,234).setevent(EVENT_UNTOUCH,closedialog,1);
        contextNode.addlabel(global.getStaticString("share"),null,BUTTONFONTSIZE).anchor(50,50).pos(150,234);
        contextNode.addsprite("boxbutton2.png").anchor(50,50).pos(300,234).setevent(EVENT_UNTOUCH,closedialog,null);
        contextNode.addlabel(global.getStaticString("back"),null,BUTTONFONTSIZE).anchor(50,50).pos(300,234);
    }
    
    function gotohelp(n,e,p,x,y){
        if(x>0&&y>0&&x<n.size()[0]&&y<n.size()[1]){
            global.pushContext(null,new TestWebControl(p),NonAutoPop);
        }
    }
    
    function closedialog(n,e,p){
        global.popContext(null);
        if(p!=null){
            global.http.addrequest(0,"share",["uid"],[global.userid],global.context[0],"share");
            if(build.state==4){
                ppy_postnewsfeed(global.getFormatString("share_format",["[NAME]",ppy_username(),"[DESCRIBE]",global.getStaticString("share_getup_1")]),SHARE_URL);
            }
            else{
                ppy_postnewsfeed(global.getFormatString("share_format",["[NAME]",ppy_username(),"[DESCRIBE]",global.getStaticString("share_getup_2")]),SHARE_URL);
            }
        }
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}