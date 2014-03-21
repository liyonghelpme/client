class PapaNot extends ContextObject{
    function PapaNot(){
        contextname = "dialog-papa";
        contextNode = null;
    }

    function paintNode(){
        contextNode = sprite("dialogback_b.png").anchor(50,50).pos(400,240);
        contextNode.addlabel(global.getStaticString("PapaNot"), null, 20, FONT_NORMAL, 230, 0, ALIGN_LEFT).pos(153, 64).color(0, 0, 0, 100);

        contextNode.addsprite("pic4.jpg").anchor(50, 50).pos(84, 117);
        contextNode.addsprite("boxbutton1.png").pos(126, 228).setevent(EVENT_UNTOUCH, buyPapayas).anchor(50, 50);
        contextNode.addsprite("boxbutton2.png").pos(295, 228).setevent(EVENT_UNTOUCH, closedialog).anchor(50, 50);
        contextNode.addlabel(global.getStaticString("ok"), null, 25).pos(126, 228).anchor(50, 50);
        contextNode.addlabel(global.getStaticString("cancel"), null, 25).pos(295, 228).anchor(50, 50);


        //contextNode.addsprite("love_back.png").anchor(50,50).pos(704, 408).setevent(EVENT_TOUCH,closedialog);
    }
    function buyPapayas()
    {
        global.popContext(null);
        global.pushContext(null, new TestWebControl(4), NonAutoPop);
    }
    
    function closedialog(node,event,p){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}
