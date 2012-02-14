class Love extends ContextObject{
    function Love(){
        contextname = "dialog-love";
        contextNode = null;
    }

    function paintNode(){
        contextNode = sprite("lover.png").anchor(50,50).pos(400,240);
        contextNode.addsprite("love_back.png").anchor(50,50).pos(704, 408).setevent(EVENT_TOUCH,closedialog);
    }

    function closedialog(node,event,p){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}
