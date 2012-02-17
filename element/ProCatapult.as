class ProCatapult extends ContextObject{
    var element;
    var costtype;
    var CataType;
    var Building;
    var CampBuild;
    function ProCatapult(c, b){
        CataType = c;
        Building = b.baseobj;
        CampBuild = b;
        contextname = "dialog-catapult";
        contextNode = null;
        element = null;
    }

    function paintNode(){
        var dialog = new Simpledialog(0,self);
        dialog.init(dialog,global);
        contextNode = dialog.getNode();
        dialog.settitle("addCatapult.png");
        dialog.setclosebutton();
        dialog.setbutton(1,336,256, global.getStaticString("Produce"),0);
        dialog.setbutton(4,336,331, global.getStaticString("Fast"),1);
    }
    
    var defencenum;
    var defencenumlabel;
    var defencemax;
    var cmlabel;
    var cflabel;
    var cclabel;
    function getelement(){
        if(element == null){
            element = node();
            var tmp=element.addlabel(global.getFormatString("CataExplain", ["[NAME]", CATA_NAME[CataType], "[ATK]", str(CATA_ATTACK[CataType])]) ,null,20, FONT_NORMAL, 350, 0, ALIGN_LEFT).pos(50,53).color(0,0,0,100);
            var maxlist=[100,300,500,700,1000,3000,5000];
            defencemax=maxlist[global.user.getValue("nobility")/3];
            defencenum = 0;
            element.addsprite("adddefenceboard.jpg").pos(21,168);
            element.addsprite("money_big.png").pos(60,204);
            var m = global.user.getValue("money");
            if(m < CATA_PRICE[CataType])
                cmlabel = element.addlabel(str(CATA_PRICE[CataType]),null,18).pos(100,212).color(100,0,0,100);
            else
                cmlabel = element.addlabel(str(CATA_PRICE[CataType]),null,18).pos(100,212).color(0,0,0,100);

            var spe = CATA_SPECIAL[CataType].split(";");
            trace(spe);
            var stone = int(spe[0]);
            if(stone < 0)
            {
                element.addsprite("stone.png").pos(60, 240);
                var s = global.user.getValue("stone");
                if(s < -stone)
                    element.addlabel(str(-stone), null, 18).pos(100, 240).color(100, 0, 0, 100);
                else
                    element.addlabel(str(-stone), null, 18).pos(100, 240).color(0, 0, 0, 100);
            }
            else
            {
                element.addsprite("wood.png").pos(60, 240);
                var w = global.user.getValue("wood");
                if(w < stone)
                    element.addlabel(str(stone), null, 18).pos(100, 240).color(100, 0, 0, 100);
                else
                    element.addlabel(str(stone), null, 18).pos(100, 240).color(0, 0, 0, 100);
            }
            for(var i = 1; i < len(spe); i++)
            {
                var obj = spe[i].split(",");
                var sid = ord(obj[0])-97;
                var num = int(obj[1]);
                element.addsprite("gift"+str(sid+1)+".png").size(29, 25).pos(180, 212+(i-1)*25);
                var sp = global.special[sid];
                if(sp < num)
                    element.addlabel(str(num), null, 18).pos(220, 212+(i-1)*25).color(100, 0, 0, 100);
                else
                    element.addlabel(str(num), null, 18).pos(220, 212+(i-1)*25).color(0, 0, 0, 100);
            }
            element.addsprite("caesars_big.png").pos(60,317);
            cclabel = element.addlabel(str(CATA_CAE[CataType]),null,18).pos(100,324).color(0,0,0,100);
        }
        return element;
    }

    function csnum(n,e,p,x){
        var move = n.get(0);
        if(x>295) x = 295;
        else if(x<60) x = 60;
        var po = move.pos();
        move.pos(x,po[1]);
        defencenum = defencemax*(x-60)/235;
        defencenumlabel.text(str(defencenum));
        cmlabel.text(str(defencenum*100));
        cflabel.text(str(defencenum*5));
        cclabel.text(str((defencenum+99)/100));
        if(defencenum == 0){
            contextNode.get(0).texture("boxbutton2.png");
            contextNode.get(1).texture("boxbutton2.png");
        }
        else{
            contextNode.get(0).texture("boxbutton1.png");
            contextNode.get(1).texture("boxbutton4.png");
        }
    }
    var cost;
    var speCost;
    function excute(p){
        costtype = p;
        cost = dict();
        speCost = dict();
        if(p==0){
            cost.update("money",CATA_PRICE[CataType]);
            var spe = CATA_SPECIAL[CataType].split(";");
            var stone = int(spe[0]);
            if(stone < 0)
                cost.update("stone", -stone);
            else
                cost.update("wood", stone);
            for(var i = 1; i < len(spe); i++)
            {
                var obj = spe[i].split(",");
                var sid = ord(obj[0])-97;
                speCost.update([[sid, int(obj[1])]]);
            }
            cost.update([["special", speCost]]);
        }
        else{
            cost.update("caesars", CATA_CAE[CataType]);
        }
        if(global.user.testCost(cost)!=0){
            global.popContext(null);
            global.http.addrequest(1,"producecatapult",["user_id","city_id","grid_id", "cata_id", "type"],[global.userid, global.cityid, Building.posi[0]*RECTMAX+Building.posi[1], CataType, costtype],self,"adddefence");
        }
    }
    
    function useaction(p,rc,c){
        if(p=="adddefence"){
            if(json_loads(c).get("id",1)!=0){
                var items = cost.items();
                var k = 0;
                for(var i = 0; i < len(items); i++)
                {
                    var key = items[i][0];
                    var val = items[i][1];
                    if(key == "special")
                    {
                        var speItems = val.items();
                        for(var j = 0; j < len(speItems); j++)
                        {
                            global.special[speItems[j][0]] -= speItems[j][1];
                        }
                    }
                    else
                    {
                        //normal object
                        global.user.changeValueAnimate(Building, key, -val, k*2);
                        k++;
                    }
                }
                /*
                if(costtype==0){
                    global.user.changeValueAnimate2(global.context[0].moneyb,"money",-CATA_PRICE[CataType],-6);
                }
                else{
                    global.user.changeValueAnimate2(global.context[0].moneyb,"caesars",-CATA_CAE[CataType],-6);
                }
                */
                CampBuild.objid = CataType;
                CampBuild.state2over(p, rc, c);
          }
        }
    }

    function deleteContext(){
        contextNode.addaction(stop());
        contextNode.removefromparent();
    }
}
