class Devinedialog extends ContextObject{
    var tabs;
    var selecttab;
    var element;
    var buildid;
    function Devinedialog(){
        contextname = "dialog-build-devine";
        contextNode = null;
        element = null;
    }

    function getelement(){
        if(element==null){
            tabs = new Array(3);
            buildid = global.request[global.currentLevel].bid;
            element = node();
            element.addsprite("devineback.jpg").anchor(50,0).pos(219,10);
            element.addlabel(global.getStaticString("godShow"),null,30).anchor(50,50).pos(219,43).color(0,0,0,100);
            element.addlabel(godstr[buildid],null,16).anchor(50,50).pos(219,75).color(0,0,0,100);
            selecttab = -1;
            
            var level = [10, 12, 14, 16, 20];
            var blevel = buildid/4;
            var btype = buildid%4;
            if(blevel>=5)
            {
                blevel = (buildid-20)%5;
                btype = buildid/5;
            }

            for(var i=0;i<3;i++){
                tabs[i] = element.addsprite("dialogelement_god_normal.png").pos(37+i*125,110).setevent(EVENT_UNTOUCH,choosetab,i);
                tabs[i].addlabel(timestr[i],null,20).anchor(50,50).pos(57,60).color(0,0,0,100);
                tabs[i].addsprite("magic_big.png").anchor(50,50).pos(33,130);

                tabs[i].addlabel("x"+str(BLESS_CAESARS[i+blevel*3]),null,20).anchor(0,50).pos(52,130).color(0,0,0,100);
            }
            choosetab(0,0,0);
        }
        return element;
    }

    function paintNode(){
        var dialog = new Simpledialog(0,self);
        dialog.init(dialog,global);
        contextNode = dialog.getNode();
        dialog.usedefaultbutton(2,[global.getStaticString("show"), global.getStaticString("cancel")]);
    }

    function choosetab(n,e,p){
        if(selecttab != p){
            if(selecttab>=0)
                tabs[selecttab].texture("dialogelement_god_normal.png");
            tabs[p].texture("dialogelement_god_chosen.png");
            selecttab = p;
        }
    }

    function excute(p){
        global.popContext(selecttab);
    }
    
    function deleteContext(){
        contextNode.addaction(stop());
        contextNode.removefromparent();
    }
}
