class Spyresult extends ContextObject{
    var data;
    var dialog;
    var element;
    var eid;
    var mode;
    const textpos=[[129,121],[318,121],[141,212],[141,241],[334,212]];
    function Spyresult(d,g,m){
        contextname = "dialog-battle-spy-result";
        contextNode = null;
        data = d;
        element = null;
        eid = g;
        mode = m;
    }
    
    function deleteContext(){
        contextNode.addaction(stop());
        contextNode.removefromparent();
        contextNode = null;
        element.removefromparent();
        element=null;
        if(mode<3){
            global.soldiers[2+mode]=global.soldiers[2+mode]-data.get("dead");
        }
    }
    
    function getelement(){
        if(element == null){
            element = node();
            element.addsprite("spyresultback.jpg").anchor(50,0).pos(219,10);
            element.addlabel(global.getFormatString("spy_result_format",["[NUM]",str(data.get("dead",0)),"[WHO]",global.context[0].warpage.userdict.get(eid)[4]]),null,24,FONT_NORMAL,393,0,ALIGN_LEFT).pos(23,25).color(0,0,0,100);
            var spyres = [data.get("won", 0),data.get("total", 0),data.get("power", 0),data.get("allynum", 0),data.get("citydefence", 0)];
            var spyitems = SPYITEMS;
            var spypos=[[33,123],[223,123],[33,214],[33,245],[223,214]];
            for(var i=0;i<5;i++){
                var tl=element.addlabel(spyitems[i],null,18).pos(spypos[i]).color(0,0,0,100);
                tl.prepare();
                var value = spyres[i];
                if(value!=null){
                    element.addlabel(str(value),null,18).pos(spypos[i][0]+tl.size()[0],spypos[i][1]).color(0,0,0,100);
                }
                else{
                    element.addlabel(global.getStaticString("spy_unknown"),null,18).pos(spypos[i][0]+tl.size()[0],spypos[i][1]).color(30,30,30,100);
                }
            }
        }
        return element;
    }
    
    function paintNode(){
        dialog = new Simpledialog(0,self);
        dialog.init(dialog,global);
        contextNode = dialog.getNode();
        dialog.usedefaultbutton(2,[global.getStaticString("attack"),global.getStaticString("back")]);
    }
    
    function excute(p){
        global.popContext(null);
        global.pushContext(null,new AttackControl(eid),NonAutoPop);
    }
}
