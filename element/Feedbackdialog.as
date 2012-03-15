class Feedbackdialog extends ContextObject{
    var element;
    function Feedbackdialog(){
        contextname = "dialog-feedback";
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
            element.addsprite("feedbackelement.jpg").pos(38,11);
            element.addlabel(global.getStaticString("feedback"),null,18).anchor(50,0).pos(202,104).color(0,0,0,100);
            element.addlabel("wonder_empire@163.com",null,18).anchor(50,0).pos(202,124).color(0,0,0,100);
            element.addlabel(global.getStaticString("feedGift"),null,18).anchor(50,0).pos(202,144).color(0,0,0,100);
        }
        return element;
    }
    
    function paintNode(){
        var dialog = new Simpledialog(1,self);
        dialog.init(dialog,global);
        contextNode = dialog.getNode();
        dialog.usedefaultbutton(1,global.getStaticString("ok"));
    }
}
