class Download extends ContextObject{
    var lock;
    var qlabel;
    var qfiller;
    var element;
    var flagquick;
    var moneylabel;
    var moneylabel1;
    var costcae;
    function Download(){
        contextname = "dialog-charge-magic";
        contextNode = null;
        element = null;
        lock =0;
        flagquick = 0;
    }

    function getelement(){
        if(element == null){
            element = node();
            element.addlabel(global.getStaticString("Download"), null, 24, FONT_BOLD).color(0, 0, 0, 100).anchor(50, 0).pos(202, 58);
            var qback = element.addsprite("download_back.png").anchor(50, 0).pos(202,106);
            qfiller = element.addsprite("download_bar_bar.png").anchor(0, 0).pos(130,109).size(0,18);

            qlabel = qfiller.addlabel("0",null,20).color(0,0,0,100).anchor(50,50).pos(75,12);
            global.timer.addlistener(global.timer.currenttime+999999,self);
        }
        return element;
    }
    
    function paintNode(){
        var dialog = new Simpledialog(1,self);
        dialog.init(dialog,global);
        contextNode = dialog.getNode();
        dialog.usedefaultbutton(1,[global.getStaticString("cancel"),global.getStaticString("cancel")]);
        timerefresh();
    }

    function excute(p){
        if(lock == 0){
            global.popContext(null);
        }
    }
    
    var timeisend=0;
    function timeend(){
        global.popContext(null);
    }
    function timerefresh(){
        qlabel.text(str(spriteManager.totalLen-spriteManager.downloadLen)+"/"+str()spriteManager.totalLen,);
        qfiller.size((spriteManager.totalLen-spriteManager.downloadLen) * 144/spriteManager.totalLen,18);
    }

    function reloadNode(re){
    }

    function deleteContext(){
        timeisend = 1;
        contextNode.addaction(stop());
        contextNode.removefromparent();
    }
}
