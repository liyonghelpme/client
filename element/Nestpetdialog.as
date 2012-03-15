 class Nestpetdialog extends ContextObject{
    var objs;
    var left;
    var right;
    var pagemax;
    var pagenum;
    var objmax;
    var titlename;
    var objpath;
    var buildable;
    const PAGEITEMS = 6;
    var objlevel;
    function Nestpetdialog(){
        contextname = "dialog-object-pets";
        contextNode = null;
        objs = new Array(0);
        buildable = new Array(0);
        initdata();
        contextLevel=1;
    }
    
    function initdata(){
        pagemax = 1;
        objmax = 6;
        titlename = global.getStaticString("choosePet");
        objpath="pet";
    }
    
    function getcell(i){
        var cell = sprite("nesttab0.png");
        cell.addlabel(PETS_NAME[i],null,20).anchor(50,50).pos(94,12).color(0,0,0,100);
        var eggpic = cell.addsprite().anchor(0,0).pos(59,38);
        spriteManager.getPic("egg-1.png", eggpic);


            cell.setevent(EVENT_TOUCH,beginPlant,i);
            var price=PETS_PRICE[i];
            if(price<0){
                var cl=0;
                price = -price;
                if(global.user.getValue("caesars") < price){
                    cl=100;
                    buildable[i].update("ok",0);
                    buildable[i].update(global.getStaticString("caesar"),price-global.user.getValue("caesars"));
                }
                cell.addsprite("caesars_big.png").size(20,20).anchor(0,50).pos(17,155);
                cell.addlabel(str(price),null,20).anchor(0,50).pos(39,155).color(cl,0,0,100);
            }
            else{
                cl = 0;
                if(global.user.getValue("money") < price){
                    cl=100;
                    buildable[i].update("ok",0);
                    buildable[i].update(global.getStaticString("coin"),price-global.user.getValue("money"));
                }
                cell.addsprite("money_big.png").size(20,20).anchor(0,50).pos(17,155);
                cell.addlabel(str(price),null,20).anchor(0,50).pos(39,155).color(cl,0,0,100);
            }
            cell.addsprite("exp.png").size(42,21).anchor(0,50).pos(110,155);
            cell.addlabel(str(30),null,20).anchor(0,50).pos(154,155).color(0,0,0,100);
        return cell;
    }

    function paintNode(){
        pagenum = 1;
        contextNode = sprite("dialogback_plant.png").anchor(50,50).pos(400,240);
        contextNode.addsprite("builddialogclose.png").anchor(100,0).pos(650,5).setevent(EVENT_UNTOUCH,closedialog);
        contextNode.addlabel(titlename,null,40).anchor(50,50).pos(332,31);
        if(objmax > PAGEITEMS){
            left = contextNode.addsprite("left.png").anchor(25,50).pos(0,247).setevent(EVENT_TOUCH,choosePage,-1);
            right = contextNode.addsprite("right.png").anchor(75,50).pos(665,247).setevent(EVENT_TOUCH,choosePage,1);
        }
        else{
            left=null;
        }
        for(var i=0;i<objmax;i++){
            buildable.append(dict([["ok",1]]));
            objs.append(getcell(i).pos(46+i%3*192,76+i/3%2*180));
        }
        choosePage(0,0,0);
    }

    function choosePage(n,e,po){
        if(pagenum == 1 && po == -1 || pagenum == pagemax && po == 1)
            return 0;
        var p = pagenum+po;
        for(var i = 0;i<objmax;i++){
            if(i/6+1==pagenum)
                objs[i].removefromparent();
            if(i/6+1 == p)
                contextNode.add(objs[i]);
        }
        pagenum = p;
        if(left!=null){
            if(p == 1)
                left.color(40,40,40,100);
            else
                left.color(100,100,100,100);
            if(p == pagemax)
                right.color(40,40,40,100);
            else
                right.color(100,100,100,100);
        }
    }

    function beginPlant(node,event,param){
        if(buildable[param].get("ok")==1){
            global.pushContext(self,new Warningdialog([global.getFormatString("callDragonDia", ["[NAME]", PETS_NAME[param], "[POWER]", str(PETS_POWER[param]), "[ADD]",  str(PETS_UP[param])]),param+CallDragon,6]),NonAutoPop);
        }
        else{
            global.pushContext(self,new Warningdialog(buildable[param]),NonAutoPop);
        }
    }
    var objid;
    function reloadNode(re){
        var bd=global.request[contextLevel].baseobj;
        objid=re;
        global.http.addrequest(1,"buyEgg",["uid", "cid", "gid", "kind"],[global.userid,global.cityid,bd.posi[0]*RECTMAX+bd.posi[1],re],self,"buyegg");
    }
    
    function useaction(p,rc,c){
        if(p=="buyegg"){
            global.user.changeValueAnimate2(global.context[0].ub,"exp",30,-6);
            if(PETS_PRICE[objid]>0){
                global.user.changeValueAnimate2(global.context[0].moneyb,"money",-PETS_PRICE[objid],-6);
            }
            else{
                global.user.changeValueAnimate2(global.context[0].moneyb,"caesars",PETS_PRICE[objid],-6);
            }
            global.popContext(objid);
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
