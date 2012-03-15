class Monsterrefresh extends ContextObject{
    var element;
    var maxlevel;
    function Monsterrefresh(m){
        contextname = "dialog-monster-refresh";
        contextNode = null;
        element = null;
        maxlevel =m;
    }
    function deleteContext(){
        contextNode.addaction(stop());
        contextNode.removefromparent();
        contextNode = null;
        element.removefromparent();
        element=null;
    }
    
    function getelement(){
        if(element == null){
            element = node();
            var d=element.addsprite("monsterrefresh.jpg").pos(20,35);
            d.addlabel(global.getFormatString("monster_refresh_format",["[NAME]",global.user.getValue("cityname")]),null,20,FONT_NORMAL,200,0,ALIGN_LEFT).pos(15,17).color(0,0,0,100);
            d.addsprite("dialogelement_help.png").scale(150).pos(190,97).setevent(EVENT_UNTOUCH,gotohelp,"robfood");

            var monpic = element.addsprite("monster_"+str(maxlevel)+"_1.png").pos(280,65).scale(110);
            //spriteManager.getPic("monster_"+str(maxlevel)+"_1.png", monpic);
        }
        return element;
    }
    
    function gotohelp(n,e,p){
        global.pushContext(null,new TestWebControl(p),NonAutoPop);
    }
    
    function paintNode(){
        var dialog = new Simpledialog(1,self);
        dialog.init(dialog,global);
        contextNode = dialog.getNode();
        dialog.usedefaultbutton(1,global.getStaticString("ok"));
    }
}
