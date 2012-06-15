class MyWarnDialog extends ContextObject{
    var callback;
    var pop;
    var words;
    function MyWarnDialog(c, p, s){
        contextname = "dialog-MyWarnDialog";
        contextNode = null;
        callback = c;
        pop = p;
        words = s;
    }

    function paintNode(){
        contextNode = sprite("dialogback_b.png").anchor(50,50).pos(400,240);
        contextNode.prepare();
        var dSize = contextNode.size();
        contextNode.addsprite("pic5.jpg").anchor(50,50).pos(80, 120);
        contextNode.addsprite("boxbutton1.png").anchor(50, 50).pos(dSize[0]/2, 232).setevent(EVENT_UNTOUCH, clicked, 0);
        //contextNode.addsprite("boxbutton2.png").anchor(50, 50).pos(288, 232).setevent(EVENT_UNTOUCH, clicked, 1);
        contextNode.addlabel("OK", null, 25).pos(dSize[0]/2, 232).anchor(50, 50).color(100, 100, 100, 100);
        //contextNode.addlabel("Cancel", null, 25).pos(288, 232).anchor(50, 50).color(0, 0, 0, 100);
        contextNode.addlabel(words, null, 25, FONT_NORMAL, 240, 0, ALIGN_LEFT).anchor(50, 50).pos(268, 105).color(0, 0, 0, 100);
    }
    function clicked(n, e, p, x, y, points)
    {
        if(p == 1)
        {
            global.popContext(null);
        }
        else{
            if(pop == 1)
                global.popContext(null);
            if(callback != null)
            {
                callback();
            }
        }
    }
    function closedialog(node,event,p){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}
