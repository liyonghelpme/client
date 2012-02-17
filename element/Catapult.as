 class Catapult extends ContextObject{
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
    var Building;
    function Catapult(){
        contextname = "dialog-object-catapult";
        contextNode = null;
        objs = new Array(0);
        buildable = new Array(0);
        initdata();
        contextLevel=1;
    }
    
    function initdata(){
        pagemax = 1;
        objmax = 3;
        titlename = global.getStaticString("ChooseCata");
        objpath="pet";
    }
    
    function getcell(i){
        var bd=global.request[contextLevel];
        var cell = sprite("cataunsel.png");
        cell.addlabel(CATA_NAME[i],null,20).anchor(50,50).pos(94,12).color(0,0,0,100);
        //trace("catapult", bd.bid%3, i);
        if(bd.bid%3 < i)
        {
            var eggpic = cell.addsprite("move"+str(i+1)+"-1.png", GRAY).anchor(50,50).pos(94,87);
            var lock = cell.addsprite("dialogelement_lock3.png").anchor(50, 50).pos(93, 109).size(180, 86);
            buildable[i].update("ok",0);
        }
        else
        {
            eggpic = cell.addsprite("move"+str(i+1)+"-1.png").anchor(50,50).pos(94,87);
            cell.setevent(EVENT_TOUCH|EVENT_UNTOUCH,beginPlant,i);
            buildable[i].update("ok",1);
        }   
        spriteManager.getPic("move"+str(i+1)+"-1.png", eggpic);
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
        if(event == EVENT_TOUCH)
        {
            node.texture("catasel.png");
        }
        else if(buildable[param].get("ok")==1 && event == EVENT_UNTOUCH){
            node.texture("cataunsel.png");
            //camp building
            var bd=global.request[contextLevel];
            global.popContext(null);
            global.pushContext(null, new ProCatapult(param, bd), NonAutoPop);
        }
        else{
            global.pushContext(self,new Warningdialog(buildable[param]),NonAutoPop);
        }
    }
    var objid;
    function reloadNode(re){
        var bd=global.request[contextLevel].baseobj;
        objid=re;
        global.http.addrequest(1,"producecatapult",["user_id", "city_id", "gid_id", "cata_id", "type"],[global.userid, global.cityid, bd.posi[0]*RECTMAX+bd.posi[1], re],self,"buyegg");
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
