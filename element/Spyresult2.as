class Spyresult2 extends ContextObject{
    var data;
    var dialog;
    var element;
    var eid;
    var mode;
    function Spyresult2(d,g,m){
        contextname = "dialog-battle-spy-result2";
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
            element.addsprite("spyresultback2.jpg").anchor(50,0).pos(219,10);
            element.addlabel(global.getFormatString("spy_result_format",["[NUM]",str(data.get("dead",0)),"[WHO]",global.context[0].warpage.userdict.get(eid)[4]]),null,24,FONT_NORMAL,393,0,ALIGN_LEFT).pos(23,25).color(0,0,0,100);
            element.addlabel(global.getStaticString("defence_power")+str(data.get("inf")+data.get("cav")),null,18).anchor(50,0).pos(219,121).color(0,0,0,100);
            if(mode==0){
                element.addlabel(global.getStaticString("spy_unknown"),null,18).anchor(50,0).pos(219,212).color(30,30,30,100);
            }
            else{
                var alist=data.get("attack");
                var length = len(alist);
                if(length==0){
                    element.addlabel(global.getStaticString("spy_result2_noenemy"),null,18).anchor(50,0).pos(219,212).color(0,0,0,100);
                }
                else{
                    var mintime=alist[0][1]+alist[0][2];
                    for(var i=1;i<length;i++){
                        var tmptime = alist[i][1]+alist[i][2];
                        if(global.timer.times2c(tmptime)<global.timer.currenttime){
                            alist.pop(i);
                            i--;
                            length--;
                            continue;
                        }
                        if(mintime>tmptime){
                            mintime=tmptime;
                        }
                    }
                    var ll=element.addlabel(global.getFormatString("spy_result2_format",["[NUM]",str(length),"[TIME]",global.gettimestr(global.timer.times2c(mintime)-global.timer.currenttime)]),null,18,FONT_NORMAL,378,0,ALIGN_LEFT).anchor(50,0).pos(219,212).color(0,0,0,100);
                    ll.prepare();
                    if(mode==3){
                        mintime=0;
                        for(i=0;i<length;i++){
                            mintime=mintime+alist[i][3];
                        }
                        element.addlabel(global.getFormatString("spy_result2_mode3_format",["[NUM]",str(mintime)]),null,18,FONT_NORMAL,378,0,ALIGN_LEFT).anchor(50,0).pos(219,215+ll.size()[1]).color(0,0,0,100);
                    }
                }
            }
            //else if(mode==2){
            //}
            //else if(mode==3){
            //}
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
