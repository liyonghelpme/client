class Calldialog extends ContextObject{
    var info;
    var element;
    var dialog;
    //var goddes=[global.getStaticString("fulfill"),global.getStaticString("population"),global.getStaticString("fortune"), global.getStaticString("war"), global.getStaticString("beast")];
    function Calldialog(i){
        contextname = "dialog-build-callgod";
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
        global.popContext(null);
        if(info<0){
            global.popContext(info);
        }
        else if((info%1000)/100 == DISK){
            global.popContext(info);
        }
        else{
            global.popContext(info+2400);
        }
    }
    
    function getelement(){
        if(element == null){
            element = node();
            element.addsprite("pic0.png").anchor(50,50).pos(80,120);
            if(info<0){
                element.addlabel(global.getStaticString("dragon"),null,20,FONT_NORMAL,220,0,ALIGN_LEFT).anchor(50,50).pos(268,120).color(0,0,0,100);
            }
/*
<<<<<<< HEAD
            else{
                element.addlabel(global.getFormatString("godBless", ["[GOD]", global.getname("god", info), "[GOD]", global.getname("god", info)]),null,20,FONT_NORMAL,220,0,ALIGN_LEFT).anchor(50,50).pos(268,120).color(0,0,0,100);
=======
*/
            else if((info%1000)/100 == DISK){
                element.addlabel(global.getStaticString("PlayDragon"), null,20,FONT_NORMAL,220,0,ALIGN_LEFT).anchor(50,50).pos(268,120).color(0,0,0,100);
            }
            else {
                element.addlabel(global.getFormatString("godBless", ["[GOD]", global.getname("god", info), "[GOD]", global.getname("god", info)]), null,20,FONT_NORMAL,220,0,ALIGN_LEFT).anchor(50,50).pos(268,120).color(0,0,0,100);
            }
        }
        return element;
    }
    
    function paintNode(){
        dialog = new Simpledialog(1,self);
        dialog.init(dialog,global);
        contextNode = dialog.getNode();
        if(info < 0)
            dialog.usedefaultbutton(2,[global.getStaticString("Build"), global.getStaticString("cancel")]);
        else
            dialog.usedefaultbutton(2,[global.getStaticString("call"), global.getStaticString("cancel")]);
    }
}
