class EmpireControl extends ContextObject{
    var index;
    var tabs;
    var element;
    var building;
    const EmpireLevel = [20, 30];
    function EmpireControl(b){
        contextname = "dialog-territoryinfo";
        contextNode = null;
        building = b;
    }
    function upgradeEmpire(n, e, p, x, y, pos)
    {
        trace("empireLevel", building.empireLevel);
        if(building.empireLevel >= len(EmpireLevel))
        {
            global.pushContext(null, new Warningdialog([global.getStaticString("EmpireNotOpen"), null, 6]), NonAutoPop);
        }
        else if(global.user.getValue("level") < EmpireLevel[building.empireLevel])
        {
            global.pushContext(null, new Warningdialog([global.getFormatString("LevelNot", ["[LEVEL]", str(EmpireLevel[building.empireLevel]) ] ), null, 6]), NonAutoPop);
        }
        else
        {
            global.pushContext(building, new UpdateControl(), NonAutoPop); 
        }
    }

    function paintNode(){
        contextname = "dialog-territoryinfo";
        index = -1;
        element = sprite();
        tabs = new Array(3);
        contextNode = sprite("dialogback_empire.png").anchor(50,50).pos(400,240);
        contextNode.addlabel(global.user.getValue("cityname"),null,30).anchor(0,50).pos(196,28);
        contextNode.addlabel(str(global.user.getValue("level")),null,16,FONT_BOLD).anchor(50,50).pos(164,36).color(0,0,0,100);
        contextNode.addsprite("builddialogclose.png").anchor(100,0).pos(508,4).setevent(EVENT_UNTOUCH,closedialog);

        tabs[0] = contextNode.addsprite("dialogelement_state3.png").setevent(EVENT_UNTOUCH,choosetab,0);
        trace("empireLevel", building.empireLevel);
        for(var i=0;i<5;i++)
        {
            if(i <= building.empireLevel)
                tabs[0].addsprite("dialogelement_star1.png").anchor(50,50).pos(176+32*i,28);
            else
                tabs[0].addsprite("dialogelement_star0.png").anchor(50,50).pos(176+32*i,28);

        }
        var lev = global.user.getValue("level");
        //if(lev >= 20)
            tabs[0].addsprite("upgrade.png").anchor(0, 0).pos(376, 18).setevent(EVENT_UNTOUCH, upgradeEmpire);
        tabs[1] = contextNode.addsprite("dialogelement_resource0.png").setevent(EVENT_UNTOUCH,choosetab,1);
        tabs[2] = contextNode.addsprite("dialogelement_military0.png").setevent(EVENT_UNTOUCH,choosetab,2);
        choosetab(0,0,0);
    }

    function choosetab(n,e,p){
        if(index!=p){
            var name = ["dialogelement_state","dialogelement_resource","dialogelement_military"];
            for(var i=0;i<3;i++){
                var flag = 0;
                var flag1 = 0;
                //show back
                if(i==p){
                    //dialogelement_military3
                    if(p == 2)
                        flag = 3;
                    //dialogelement_resource1
                    else if(p == 1)
                        flag = 1;
                    //state
                    else
                    {
                        if(global.user.getValue("nobility") < 0)
                            flag = 3;
                        else
                            flag = 4;
                    }
                }
                //head
                else if(i>p) flag1 =1;
                trace("flag", flag); 
                tabs[i].texture(name[i]+str(flag)+".png",UPDATE_SIZE).pos(16,59*(i+1)+flag1*228-3);
            }
            index = p;
            element.removefromparent();
            element = getelement(p);
            tabs[p].add(element);
        }
    }
    
    function adddefence(n,e,p,x,y){
        var ns = n.size();
        if(x>0&&x<ns[0]&&y>0&&y<ns[1]){
            global.pushContext(null,new Adddefencedialog(),NonAutoPop);
        }
    }
    function addMagic(node, event, param, x, y, points)
    {
       global.pushContext(null, new ChargeMagic(), NonAutoPop); 
    }
    function checkTime(node, event, param, x, y, points)
    {
        global.pushContext(null, new CheckTime(), NonAutoPop);
    }
    var rate;
    var manabar;
    var manalab;
    function getelement(p){
        element = node();
        if(p==0){
            var offy = 74;
            if(global.user.getValue("nobility")<0){
                offy=56;
            }
            else{
                var cdl=element.addlabel(str(global.user.getValue("citydefence")),null,20).anchor(0,50).pos(220,offy).color(0,0,0,100);
                global.user.initText("citydefence",cdl);
                element.addsprite("adddefence2.png").pos(312,offy-15).setevent(EVENT_UNTOUCH,adddefence);
            }
            element.addlabel(str(len(global.ppyuserdict)-2),null,20).anchor(0,50).pos(230,offy+36).color(0,0,0,100);
            element.addlabel(str(global.rect)+"x"+str(global.rect),null,20).anchor(0,50).pos(252,offy+72).color(0,0,0,100);
            element.addlabel(str(global.user.getValue("personmax")),null,20).anchor(0,50).pos(271,offy+107).color(0,0,0,100);
            element.addlabel(str(global.user.getValue("labor"))+"/"+str(global.user.getValue("person")),null,20).anchor(0,50).pos(340,offy+142).color(0,0,0,100);
            //element.addlabel(str(global.user.getValue("person")-global.user.getValue("labor")),null,20).anchor(0,50).pos(200,offy+175).color(0,0,0,100);

            rate = global.user.getValue("mana")*140/global.user.getValue("boundary");
            if(global.user.getValue("nobility")>=0){

                manabar = element.addsprite("magic_bar.png").anchor(0, 0).pos(220, 242).size(rate, 18);
                manalab = element.addlabel(str(global.user.getValue("mana"))+"/"+str(global.user.getValue("boundary")), null, 14, FONT_BOLD).anchor(0, 0).pos(268, 242).color(100, 100, 100);
                element.addsprite("adddefence2.png").pos(420, 235).setevent(EVENT_UNTOUCH,addMagic);
                element.addsprite("timeLeft.png").pos(367, 235).setevent(EVENT_UNTOUCH, checkTime);
            }
            else
            {
                manabar = element.addsprite("magic_bar.png").anchor(0, 0).pos(220, 223).size(rate, 18);
                manalab = element.addlabel(str(global.user.getValue("mana"))+"/"+str(global.user.getValue("boundary")), null, 14, FONT_BOLD).anchor(0, 0).pos(268, 223).color(100, 100, 100);
                element.addsprite("adddefence2.png").pos(420, 217).setevent(EVENT_UNTOUCH,addMagic);
                element.addsprite("timeLeft.png").pos(367, 217).setevent(EVENT_UNTOUCH, checkTime);
            }
        }
        else if(p==1){
            element.addsprite("food.png").anchor(50,50).pos(42,77).size(29,32);
            element.addlabel(str(global.user.getValue("food")),null,20).anchor(0,50).pos(60,77).color(0,0,0,100);
            element.addsprite("wood.png").anchor(50,50).pos(190,77).size(29,25);
            element.addlabel(str(global.user.getValue("wood")),null,20).anchor(0,50).pos(208,77).color(0,0,0,100);
            element.addsprite("stone.png").anchor(50,50).pos(338,77).size(33,24);
            element.addlabel(str(global.user.getValue("stone")),null,20).anchor(0,50).pos(356,77).color(0,0,0,100);
            for(var i=0;i<12;i++){
                element.addsprite("gift"+str(i+1)+".png").anchor(50,50).pos(47+113*(i%4),135+50*(i/4)).scale(50);
                element.addlabel(str(global.special[i]),null,20).anchor(0,50).pos(71+113*(i%4),135+50*(i/4)).color(0,0,0,100);
            }
        }
        else if(p==2){
            element.addlabel(str(global.soldiers[0]+global.soldiers[1]),null,20).anchor(0,50).pos(133,113).color(0,0,0,100);
            //scout 
            element.addlabel(str(global.soldiers[0]),null,20).anchor(0,50).pos(89,161).color(0,0,0,100);
            element.addlabel(str(global.soldiers[1]),null,20).anchor(0,50).pos(223,161).color(0,0,0,100);
            element.addlabel(str(global.user.getValue("catapult")),null,20).anchor(0,50).pos(379,161).color(0,0,0,100);
            for(i=2;i<5;i++){
                element.addlabel(str(global.soldiers[i]),null,20).anchor(0,50).pos(150*i-227,236).color(0,0,0,100);
            }
        }
        global.timer.addlistener(global.timer.currenttime+999999, self);
        return element;
    }
    var timeisend = 0;
    function timeend()
    {
    }
    function timerefresh()
    {
        rate = global.user.getValue("mana")*140/global.user.getValue("boundary");
        manabar.size(rate, 18);
        manalab.text(str(global.user.getValue("mana"))+"/"+str(global.user.getValue("boundary")));
    }
    function closedialog(n,e){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.removefromparent();
        timeisend = 1;
    }
}
