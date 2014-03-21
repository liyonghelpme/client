class BuyMagic extends ContextObject{
    var tabs;
    var selecttab;

    const buystr = ["3+0+1","7+0+2","11+0+3","15+0+4","50+0+13"];
    //const buystr = ["3+0+300","10+2+1000","25+7+2500","50+20+5000","100+50+10000"];

    function BuyControl(){
        contextname = "dialog-caesars";
        contextNode = null;
        tabs = new Array(5);
    }

    function paintNode(){
        contextNode = sprite("dialogback_buy.png").anchor(50,50).pos(400,240);
        selecttab = -1;
        for(var i=0;i<5;i++){
            var num = buystr[i].split("+");
            tabs[i] = contextNode.addsprite("buyelement20.png").pos(29+i*133,105).setevent(EVENT_UNTOUCH,choosetab,i);
            tabs[i].addlabel(num[0],null,25).anchor(50,50).pos(79,31).color(0,0,0,100);
            tabs[i].addlabel(num[2],null,18).anchor(50,50).pos(35,175).color(0,0,0,100);
        }
        choosetab(0,0,0);
        ppy_query("papayas",null,setpapayas);
        var w=sprite("wait1.png").anchor(50,50).pos(605,59);
        w.addaction(waitaction1);
        contextNode.add(w,1,10);
        contextNode.addsprite("boxbutton1.png").anchor(50,50).pos(261,349).setevent(EVENT_UNTOUCH,buycaesars).size(119,43);
        contextNode.addlabel(global.getStaticString("Buy"),null,BUTTONFONTSIZE).anchor(50,50).pos(261,349);
        contextNode.addsprite("boxbutton2.png").anchor(50,50).pos(457,349).setevent(EVENT_UNTOUCH,closedialog).size(119,43);
        contextNode.addlabel(global.getStaticString("cancel"),null,BUTTONFONTSIZE).anchor(50,50).pos(457,349);
        contextNode.setevent(EVENT_KEYDOWN,dialogkeydown);
    }
    function dialogkeydown(n,e,p,kc){
        if(kc == 4){
            closedialog(0,0);
        }
    }
    function setpapayas(r,rc,c){
        if(rc != 0){
            contextNode.get(10).addaction(stop());
            contextNode.remove(10);
            contextNode.addlabel(str(global.user.getValue("caesars")),null,18).anchor(0,50).pos(555,46).color(5,5,64,100);
            contextNode.addlabel(str(c.get("papayas")),null,18).anchor(0,50).pos(555,72).color(5,5,64,100);
            contextNode.addsprite("addpapayas.png").anchor(0,50).pos(610,72).setevent(EVENT_UNTOUCH,buypapayas);
        }
    }
    
    function buypapayas(n,e){
        global.pushContext(null,new TestWebControl(4),NonAutoPop);
    }
    
    function buycaesars(n,e){
        global.popContext(null);
        var num = buystr[selecttab].split("+");
        global.pushContext(self, new Warningdialog(global.getFormatString("sureBuyMana", ["[NUM]", str(num[0])])), NonAutoPop);
    }
    
    function buycaesars2(pid, ret, tid, receipt, param){
        if(ret==1){
            var num = buystr[selecttab].split("+");
            global.http.addrequest(0,"completepay",["uid","tid","papapas","signature"],[global.userid,tid,int(num[2]),receipt],self,"buyover");
        }
    }
    
    function useaction(p,rc,c){
        if(p=="buyover"){
            buyover(0,rc,c);
        }
    }
    
    function buyover(r,rc,c){
        if(json_loads(c).get("id")==1){
            var num=buystr[selecttab].split("+");
            global.user.changeValueAnimate2(global.context[0].moneyb,"caesars",int(num[0])+int(num[1]),-6);
        }
    }

    function choosetab(n,e,p){
        if(selecttab != p){
            var t = 2;
            if(selecttab>=0)
                tabs[selecttab].texture("buyelement"+str(t)+"0.png");
            tabs[p].texture("buyelement"+str(t)+"1.png");
            selecttab = p;
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
