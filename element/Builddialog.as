import element.RoomControl;
import element.FactControl;
import element.CampControl;
import element.FarmsControl;
import element.GodControl;
import element.Calldialog;
import element.ObjControl;
import element.ExpandControl;
class Builddialog extends ContextObject{
    var pageindex;
    var buildpages;
    var buildtabs;
    var movenode;
    var flagmove;
    var lastx;
    var left;
    var right;
    function Builddialog(){
        contextname = "dialog-build";
        contextNode = null;
        buildpages = new Array(0);
        buildtabs = new Array(0);
        pageindex = -1;
        flagmove= 0;
        lastx=0;
    }

    function paintNode(){
        contextNode = sprite("dialogback_build.png").anchor(50,50).pos(400,240);
        contextNode.addsprite("builddialogclose.png").anchor(100,0).pos(796,4).size(48,50).setevent(EVENT_TOUCH,closedialog);
        contextNode.setevent(EVENT_HITTEST,nodemove);
        contextNode.setevent(EVENT_MOVE,nodemove);
        contextNode.setevent(EVENT_UNTOUCH,nodemove);
        if(global.flagnew==1){
            global.lastpage[1] = -60;
        }
        buildpages = new Array(new RoomControl(),new FactControl(),new FarmsControl(),new CampControl(),new GodControl(),new ObjControl(),new ExpandControl());
        var tabname = BUILD_TAB_NAME;
        for(var i=0;i<len(buildpages);i++){
            var tab = contextNode.addsprite("dialogtab_build_normal.png").anchor(0,0).pos(i*101+51,43).setevent(EVENT_UNTOUCH,changePage,i);
            tab.add(sprite("tabpic"+str(i)+".png").anchor(50,50).pos(48,27),1,1);
            tab.add(label(tabname[i],null,20).anchor(50,0).pos(48,63).color(100,0,0,100).visible(0),2,2);
            buildpages[i].self = buildpages[i];
            buildpages[i].global = global;
            buildtabs.append(tab);
        }
        buildtabs[1].add(sprite("new.png").anchor(50,40).pos(30,0),3,3);
        buildtabs[0].add(sprite("new.png").anchor(50,40).pos(30,0),3,3);
        buildtabs[3].add(sprite("new.png").anchor(50,40).pos(30,0),3,3);
        //buildtabs[5].add(sprite("new.png").anchor(50,40).pos(30,0),3,3);
        //buildtabs[4].add(sprite("new.png").anchor(50,40).pos(30,0),3,3);
        buildtabs[5].add(sprite("new.png").anchor(50,40).pos(30,0),3,3);
        buildtabs[6].add(sprite("mail.png").anchor(50,40).pos(30,0),3,3);
        contextNode.add(sprite("dialogback_left.png",ARGB_8888).pos(0,97),1);
        contextNode.add(sprite("dialogback_right.png",ARGB_8888).anchor(100,0).pos(800,97),1);
        changePage(0,0,global.lastpage[0]);
        left = sprite("buildLeftUn.png", ARGB_8888);
        left.anchor(0, 50);
        left.pos(4, 240);
        contextNode.add(left, 1);
        left.setevent(EVENT_TOUCH, onLeftTou);
        left.setevent(EVENT_UNTOUCH, onLeftUn);
        right = sprite("buildLeftUn.png", ARGB_8888);
        right.anchor(100, 50).pos(740, 240);
        contextNode.add(right, 1);
        right.setevent(EVENT_TOUCH, onRightTou);
        right.setevent(EVENT_UNTOUCH, onRightUn);
        right.scale(-100, 100);
    }
    function onLeftTou(n, event, param, x, y)
    {
        left.texture("buildLeftTou.png");
    }
    function onLeftUn(n, event, param, x, y)
    {
        left.texture("buildLeftUn.png");
        movePage(1);
    }
    function onRightTou(n, event, param, x, y)
    {
        right.texture("buildLeftTou.png");
    }
    function onRightUn(n, event, param, x, y)
    {
        right.texture("buildLeftUn.png");
        movePage(-1);
    }
    function movePage(dir)
    {
        buildpages[pageindex].getNode().addaction(imoveby(800*dir,0));
        buildpages[pageindex].refreshpage();
        //0 which otheris position
        trace("pageindex", pageindex);
        global.lastpage[pageindex+1] = buildpages[pageindex].getNode().pos()[0];
    }
    function nodemove(n,e,param,x,y){
        if(contextLevel >= global.currentLevel){
            if(e == EVENT_HITTEST){
                if(y<66){
                    flagmove=0;
                    return 0;
                }
                flagmove= 1;
                lastx = x;
                return 1;
            }
            else if(e == EVENT_MOVE){
                if(flagmove == 0)
                    return 0;
                buildpages[pageindex].getNode().addaction(imoveby(x-lastx,0));
                buildpages[pageindex].refreshpage();
                lastx = x;
            }
            else if(e== EVENT_UNTOUCH){
                if(flagmove == 0)
                    return 0;
                buildpages[pageindex].choosepage();
            }
        }
        return 1;
    }

    //page lastpage 0
    //position lastpage 1
    function changePage(n,e,i){
        if(pageindex >= 0 && pageindex != i){
            buildpages[pageindex].getNode().removefromparent();
            buildtabs[pageindex].texture("dialogtab_build_normal.png");
            buildtabs[pageindex].get(1).scale(100);
            buildtabs[pageindex].get(2).visible(0);
        }
        if(pageindex != i){
            contextNode.add(buildpages[i].getNode());
            buildtabs[i].texture("dialogtab_build_chosen.png");
            pageindex = i;
            buildtabs[i].get(1).scale(120);
            buildtabs[i].get(2).visible(1);
        }
        global.lastpage[0] = i;
    }

    function closedialog(node,event){
        global.popContext(null);
    }

    function deleteContext(){
        contextNode.addaction(stop());
        contextNode.removefromparent();
    }
}
