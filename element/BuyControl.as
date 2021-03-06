class BuyControl extends ContextObject{
    var tabs;
    var selecttab;

    const buystr = ["3+0+300","10+1+1000","25+5+2500","50+10+5000","100+20+10000"];

    const newValue = [4, 13, 30, 60, 120];
    const TOTAL_CAE = [4, 14, 35, 70, 140];
    //const newValue = [3, 10, 25, 50, 100];
    //const buystr = ["3+0+300","10+1+1000","25+5+2500","50+10+5000","100+20+10000"];

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
            tabs[i] = contextNode.addsprite("buyelement10.png").pos(29+i*133,105).setevent(EVENT_UNTOUCH,choosetab,i);
            tabs[i].addlabel(num[0],null,25).anchor(50,50).pos(79,31).color(0,0,0,100);

            tabs[i].addlabel("X"+str(newValue[i]), null, 25).anchor(0, 50).pos(79, 35).color(100, 0, 0);
            if(num[1]!="0"){
                tabs[i].addlabel(num[1],null,20).anchor(50,50).pos(90,73).color(0,0,0,100);
                //tabs[i].addsprite("temp"+str(i)+".png").pos(73,61);
            }
            tabs[i].addlabel(num[2],null,18).anchor(50,50).pos(25,175).color(0,0,0,100);
        }
        choosetab(0,0,0);
        //ppy_query("papayas",null,setpapayas);
        global.user.getPapaya(setpapayas);
        var w=sprite("wait1.png").anchor(50,50).pos(605,59);
        w.addaction(waitaction1);
        contextNode.add(w,1,10);
        contextNode.addsprite("boxbutton1.png").anchor(50,50).pos(261,349).setevent(EVENT_UNTOUCH,buycaesars).size(119,43);
        contextNode.addlabel(global.getStaticString("shopping"),null,BUTTONFONTSIZE).anchor(50,50).pos(261,349);
        contextNode.addsprite("boxbutton2.png").anchor(50,50).pos(457,349).setevent(EVENT_UNTOUCH,closedialog).size(119,43);
        contextNode.addlabel(global.getStaticString("cancel"),null,BUTTONFONTSIZE).anchor(50,50).pos(457,349);
        contextNode.setevent(EVENT_KEYDOWN,dialogkeydown);
    }
    function dialogkeydown(n,e,p,kc){
        if(kc == 4){
            closedialog(0,0);
        }
    }
    var userPapaya = 0;
    var getPapaFin = 0;
    var caeLabel = null;
    var papaLabel = null;
    function setpapayas(r,rc,c){
        if(rc != 0){
            if(contextNode.get(10) != null)
            {
                contextNode.get(10).addaction(stop());
                contextNode.remove(10);
            }
            if(caeLabel == null)
                caeLabel = contextNode.addlabel(str(global.user.getValue("caesars")),null,18).anchor(0,50).pos(555,46).color(5,5,64,100);
            else
                caeLabel.text(str(global.user.getValue("caesars")));
            userPapaya = c.get("papayas");
            if(papaLabel == null)
            {
                papaLabel = contextNode.addlabel(str(c.get("papayas")),null,18).anchor(0,50).pos(555,72).color(5,5,64,100);
                //contextNode.addsprite("addpapayas.png").anchor(0,50).pos(610,72).setevent(EVENT_UNTOUCH,buypapayas);
            }
            else
            {
                papaLabel.text(str(c.get("papayas")));
            }
            getPapaFin = 1;
        }
    }
    
    function buypapayas(n,e){
        //global.pushContext(null,new TestWebControl(4),NonAutoPop);
    }
    
    function buycaesars(n,e){
        if(getPapaFin == 0)
            return;
        var num = buystr[selecttab].split("+");
        //var caeNum = int(num[0])+int(num[1]);//newValue[selecttab];
        //var caeNum = newValue[selecttab];
        var caeNum = TOTAL_CAE[selecttab];

        global.http.addrequest(0, "buyCae", ["uid", "cae", "pap"], [global.userid, int(num[0]), int(num[2])+10000*userPapaya], this, "buyCae");
        trace("start_payment", num);
        global.popContext(null);
        start_payment(global.getStaticString("buyCaesar"), global.getStaticString("buyCaesar")+str(caeNum),"",int(num[2]),buycaesars2);
    }
    
    function buycaesars2(pid, ret, tid, receipt, param){
        trace("buy caesars", ret, pid, tid);
        if(ret==1){
            var num = buystr[selecttab].split("+");
            trace("buy caesars", tid, receipt, num[2]);
            global.http.addrequest(0,"completepay",["uid","tid","papapas","signature"],[global.userid,tid,int(num[2]),receipt],self,"buyover");
        }
        /*
        else {
            global.pushContext(null, new PapaNot(), NonAutoPop);
        }
        */
        //global.pushContext(null, new PapaNot(), NonAutoPop);    
    }
    
    function useaction(p,rc,c){
        if(p=="buyover"){
            buyover(0,rc,c);
        }
    }
    
    function buyover(r,rc,c){
        if(json_loads(c).get("id")==1){
            var num=buystr[selecttab].split("+");
            //var caeNum = int(num[0])+int(num[1]);
            //var caeNum = newValue[selecttab];
            var caeNum = TOTAL_CAE[selecttab];
            global.user.changeValueAnimate2(global.context[0].moneyb,"caesars", caeNum,-6);
        }
    }

    function choosetab(n,e,p){
        if(selecttab != p){
            var t = 1;
            if(selecttab == 0) t=0;
            if(selecttab>=0)
                tabs[selecttab].texture("buyelement"+str(t)+"0.png");
            t=1;
            if(p== 0) t=0;
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
