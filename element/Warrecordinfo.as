class Warrecordinfo extends ContextObject{
    function Warrecordinfo(){
        contextNode = null;
        data = null;
    }
    var data;

    const offx=275;
    const offy=77;
    function paintNode(){
        contextNode = node();
        contextNode.addsprite("warrecord.png").pos(offx,offy);
        if(data!=null){
            var aw = data.get("woninmap");
            var dw = data.get("dewoninmap");
            var al = data.get("lostinmap");
            var dl = data.get("delostinmap");
            contextNode.addlabel(str(data.get("won")+data.get("dewon"))+"/"+str(data.get("attack")+data.get("defence")),null,20).anchor(0,50).pos(offx+273,offy+65).color(0,0,0,100);
            contextNode.addlabel(str(aw)+"/"+str(aw+al),null,20).anchor(0,50).pos(offx+177,offy+168).color(0,0,0,100);

            contextNode.addlabel(str(dw)+"/"+str(dw+dl),null,20).anchor(0,50).pos(offx+329,offy+209).color(0,0,0,100);
            contextNode.addlabel(NOBNAME[global.user.getValue("nobility")],null,14).anchor(0,50).pos(offx+163,offy+250).color(0,0,0,100);
            contextNode.addlabel(str(global.card[12]/100),null,20).anchor(50,50).pos(offx+138,offy+285).color(0,0,0,100);
        }
    }
    
    function setinfo(info){
        data = info;
        if(contextNode!=null && contextNode.parent() != null){
            var p = contextNode.parent();
            contextNode.removefromparent();
            paintNode();
            trace("parent son", p, contextNode);
            p.add(contextNode);
        }
    }

    function closedialog(node,event){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.addaction(stop());
        contextNode.removefromparent();
    }
}
