class Attacklistpage extends ContextObject{
    var items;
    var datas;
    var left;
    var right;
    var pagetext;
    var powertext;
    var pagemax;
    var pagenum;
    var length;
    const PAGEITEMS = 5;
    function Attacklistpage(){
        contextname = "element-warinfo-attacklist";
        contextNode = null;
        items = new Array(0);
        datas = new Array(0);
        pagenum = 1;
        length = 0;
        pagemax = 1;
    }

    function paintNode(){
        contextNode = node();
        var outnum = 0;
        for(var i=0;i<len(global.battlelist);i++){
            if(global.battlelist[i][2]==1){
                datas.append(global.battlelist[i]);
                items.append(null);
                outnum = outnum+global.battlelist[i][4]+global.battlelist[i][5];
                length++;
            }
        }
        contextNode.addsprite("attack_head.png").pos(275,77);
        var power = global.soldiers[0]+global.soldiers[1];
        if(power < 0)
            power = MAX_INT;
        powertext = contextNode.addlabel(str(outnum)+"/"+str(power+outnum),null,20).anchor(0,50).pos(550,87).color(0,0,0,100);
        pagemax = max((length+PAGEITEMS-1)/PAGEITEMS, 1);
        pagetext = contextNode.addlabel("1/1",null,20).anchor(50,50).pos(512,412).color(0,0,0,100);
        left = contextNode.addsprite("warabout_left.png").anchor(100,50).pos(463,414).setevent(EVENT_UNTOUCH,choosePage,-1);
        right= contextNode.addsprite("warabout_right.png").anchor(0,50).pos(547,414).setevent(EVENT_UNTOUCH,choosePage,1);
        choosePage(0,0,0);
    }

    function choosePage(n,e,po){
        if(pagenum == 1 && po == -1 || pagenum >= pagemax && po == 1)
            return 0;
        var p = pagenum+po;
        if(p>1)
            left.texture("warabout_left.png",NORMAL);
        else
            left.texture("warabout_left.png",GRAY);
        if(p < pagemax)
            right.texture("warabout_right.png",NORMAL);
        else
            right.texture("warabout_right.png",GRAY);
        for(var i = 0;i<length;i++){
            if(i/PAGEITEMS+1!=p && items[i]!=null){
                items[i].removefromparent();
                items[i] = null;
            }
            else if(i/PAGEITEMS+1 == p&&items[i]==null){
                contextNode.add(getitem(i));
            }
        }
        pagenum = p;
        pagetext.text(str(pagenum)+"/"+str(pagemax));
    }
    
    function getitem(index){
        items[index] = sprite("warrecordcell.png").pos(300,160+index%PAGEITEMS*45);
        items[index].addsprite(avatar_url(int(datas[index][1]))).size(35,35).pos(14,4);
        items[index].addlabel(global.gettimestr(datas[index][0]-global.timer.currenttime),null,24).anchor(50,50).pos(205,21).color(0,0,0,100);
        items[index].addlabel(str(datas[index][4]+datas[index][5]),null,24).anchor(100,50).pos(396,21).color(0,0,0,100);
        return items[index];
    }

    function closedialog(node,event){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.addaction(stop());
        contextNode.removefromparent();
    }
}
