//import global.ContextObject;

class PlantControl extends ContextObject{
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
    function PlantControl(){
        contextname = "dialog-object-plant";
        contextNode = null;
        objs = new Array(0);
        buildable = new Array(0);
        initdata();
    }
    
    function initdata(){
        pagemax = 2;
        objmax = 12;
        objlevel = [1,3,5,7,9,10,13,16,20,23,26,25];
        titlename = "选择农作物";
        objpath="plant";
    }
    
    function getcell(i){
        var cell = sprite("dialogelement1.png");
        cell.addlabel(global.getname(objpath,i),null,20).anchor(50,50).pos(94,12).color(0,0,0,100);
        cell.addsprite(objpath+str(i+1)+".png").anchor(50,50).pos(94,66).size(67,67);
        if(objlevel[i] > global.user.getValue("level")){
            cell.texture("dialogelement_lock1.png");
            cell.addlabel(str(objlevel[i]),null,20).anchor(50,50).pos(133,153).color(100,0,0,100);
        }
        else{
            cell.setevent(EVENT_TOUCH,beginPlant,i);
            var price=PLANT_PRICE[i];
            if(price<0){
                var cl=0;
                price = -price;
                if(global.user.getValue("caesars") < price){
                    cl=100;
                    buildable[i].update("ok",0);
                    buildable[i].update("caesars", price);
                }
                cell.addsprite("caesars_big.png").size(20,20).anchor(0,50).pos(17,125);
                cell.addlabel(str(price),null,20).anchor(0,50).pos(39,125).color(cl,0,0,100);
            }
            else{
                cell.addsprite("money_big.png").size(20,20).anchor(0,50).pos(17,125);
                cl = 0;
                if(global.user.getValue("money") < price){
                    cl=100;
                    buildable[i].update("ok",0);
                    buildable[i].update("money", price);
                }
                cell.addlabel(str(price),null,20).anchor(0,50).pos(39,125).color(cl,0,0,100);
            }
            cell.addlabel(global.gettimestr(PLANT_TIME[i]),null,20).anchor(100,50).pos(171,125).color(0,0,0,100);
            cell.addsprite("food.png").size(29,33).anchor(0,50).pos(13,155);
            cell.addlabel(str(PLANT_FOOD[i]),null,20).anchor(0,50).pos(44,155).color(0,0,0,100);
            cell.addsprite("exp.png").size(42,21).anchor(0,50).pos(110,155);
            cell.addlabel(str(PLANT_EXP[i]),null,20).anchor(0,50).pos(154,155).color(0,0,0,100);
        }
        return cell;
    }

    function paintNode(){
        pagenum = global.user.getValue("plantpage");
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
    
    function reloadNode(re){
        global.popContext(re);
    }

    function beginPlant(node,event,param){
        if(buildable[param].get("ok")==1){
            global.user.setValue("plantpage",pagenum);
            if(PLANT_PRICE[param]<0){
                global.pushContext(self,new Warningdialog(["确定购买"+global.getname(objpath,param)+"？",param,6]),NonAutoPop);
            }
            else{
                global.popContext(param);
            }
        }
        else{
            global.user.testCost(buildable[param]);
            //global.pushContext(self,new Warningdialog(buildable[param]),NonAutoPop);
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
