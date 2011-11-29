class Saledialog extends ContextObject{
    var info;
    var element;
    function Saledialog(i){
        contextNode = null;
        contextname = "dialog-build-sale";
        info = i;
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
            element.addsprite("pic6.jpg").anchor(50,50).pos(80,120);
            element.addlabel(global.getStaticString("sureTosell")+global.getname(info.buildcontextname,info.objectid%100)+"？",null,24,FONT_NORMAL,240,0,ALIGN_LEFT).anchor(50,50).pos(264,124).color(0,0,0,100);
        }
        return element;
    }
    
    function paintNode(){
        var dialog = new Simpledialog(1,self);
        dialog.init(dialog,global);
        contextNode = dialog.getNode();
        dialog.usedefaultbutton(2,[global.getStaticString("sell"), global.getStaticString("cancel")]);
    }
    
    function excute(){
        global.popContext(1);
    }
}
