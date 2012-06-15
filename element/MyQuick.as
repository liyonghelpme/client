class MyQuick extends ContextObject{
    var timelabel;
    var lock;
    var qlabel;
    var qfiller;
    var element;
    var flagquick;
    var moneylabel;
    var moneylabel1;
    var costcae;

    var building;
    function MyQuick(b){
        contextname = "dialog-myquick";
        contextNode = null;
        element = null;
        lock =0;
        flagquick = 0;
        building = b;
    }

    function getelement(){
        if(element == null){
            element = node();
            element.addsprite("objectblock.png").anchor(50,50).pos(109,121);
            var bl=100;
            var build = element.addsprite(building.myTexture).anchor(50,50).pos(109,121);
            build.prepare();
            var bsize = build.size();
            bl = min(150*100/bsize[0], 150*100/bsize[1]);
            build.scale(bl);

            element.addsprite("quickback.jpg").pos(202,58);
            qfiller = element.addsprite("quickfiller.jpg").pos(203,59).size(0,20);
            qlabel = qfiller.addlabel("0%",null,20).color(0,0,0,100).anchor(50,50).pos(82,10);
            timelabel = element.addlabel("",null,18).color(0,0,0,100).pos(207,94);
            global.timer.addlistener(time()/1000+86400, this);
        }
        return element;
    }
    
    function paintNode(){
        var dialog = new Simpledialog(1,self);
        dialog.init(dialog,global);
        contextNode = dialog.getNode();
        dialog.settitle("quicktitle.png");
        dialog.usedefaultbutton(2,[global.getStaticString("acc"),global.getStaticString("cancel")]);
        var cae = sprite("magic_big.png").anchor(50,50).pos(40,228).size(40,40);
        moneylabel1 = cae.addlabel("",null,30,FONT_BOLD).pos(22,13).color(0,0,0,100);
        moneylabel = cae.addlabel("",null,24,FONT_BOLD).pos(25,16).color(0,0,0,100);
        contextNode.add(cae,4);
        timerefresh();
    }

    function excute(p){
        if(lock == 0){
            var cost = dict();
            cost.update("mana",costcae);
            if(global.user.testCost(cost)==0){
                return 0;
            }
            lock = 1;
            contextNode.get(1).setevent(EVENT_UNTOUCH,null);
            global.http.addrequest(1,"shipc/speedup",["uid"],[global.userid], this, "speedbegin");
        }
    }
    
    function useaction(p,rc,c){
        if(p=="speedbegin"){
            speedbegin(0,rc,c);
        }
    }

    function speedbegin(r,rc,c){
trace("speed",rc,c);
        if(rc != 0){
            flagquick = 1;
            timelabel.removefromparent();
            qlabel.removefromparent();
            qfiller.addaction(sizeto(600,165,20));
        }
        else
            lock=0;
    }

    var timeisend=0;
    function timeend(){
        global.popContext(null);
    }
    function timerefresh(){
        if(flagquick == 0){
            var lefttime = building.leftTime;
            costcae = (lefttime+3599)/3600+5;
            moneylabel.text(str(costcae));
            moneylabel1.text(str(costcae));
            timelabel.text(global.getStaticString("leftTime")+global.gettimestr(lefttime));
            var per = building.getTimePass();
            var per1 = per/10;
            var per2 = per%10;
            qlabel.text(str(per1)+"."+str(per2)+"%");
            qfiller.size(per1 * 165/100,20);
        }
        else if(flagquick < 2){
            flagquick++;
        }
        else if(flagquick == 2){
            global.user.changeBuildValue(building, "mana", -costcae,0);
            building.timeNeed = 0;
            global.popContext(null);
            lock = 0;
            timeisend=1;
        }
    }

    function reloadNode(re){
    }

    function deleteContext(){
        timeisend = 1;
        contextNode.addaction(stop());
        contextNode.removefromparent();
    }
}
