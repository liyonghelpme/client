class Battleresultdialog extends ContextObject{
    var dialog;
    var element;
    function Battleresultdialog(){
        contextNode = null;
        element = null;
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
            var backpic = element.addsprite("battleresultback.jpg").anchor(50,0).pos(219,10);
            //spriteManager.getPic("battleresultback.jpg", backpic);

            element.addlabel("",null,30).anchor(50,50).pos(219,55);
            element.addlabel(global.getStaticString("youWin"),null,30).anchor(50,50).pos(219,67);
        }
        return element;
    }
    
    function paintNode(){
        dialog = new Simpledialog(0,self);
        dialog.self = dialog;
        dialog.global = global;
        dialog.setconfig(0,2, global.getStaticString("attackIt"));
        contextNode = dialog.getNode();
    }
    
    function excute(){
    }
}
