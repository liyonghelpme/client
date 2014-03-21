//import element.MonsterController;
//import element.Monsterdialog;
class MapPage extends ContextObject{

    var lastpoint;
    var lastlength;
    var mode;

    var menu;
    var topmenu;
    var leftmenu;
    var leftbutton;
    var rightmenu;
    var rightbutton;
    var friendmenu;

    var flagmulti;
    var flagmove;

    var select;
    var places;
    var pn;
    var baseNode;
    var placedict;
    var userdict;
    var atklist;
    var winlist;
    var won;
    var lost;
    var nobility;
    var level;
    var selfgid;
    var left;
    var Back;
    const mplace=[[963,93],[232,272],[216,704],[1192,825],[1362,676],[1387,316],[805,822],[1000,487],[590,646],[618,153]];
    var initlock;
    var subnobility;
    var monstercontroller;
    var lastclicktime;
    function MapPage(){
        Back = 0;
        lastclicktime = 0;
        contextname = "page-map";
        contextNode = null;
        lastpoint = null;
        flagmulti = 0;
        flagmove = 1;
        mode = 0;
        pn = 0;
        select = 0;
        userdict = dict();
        selfgid = 8;
        initlock = 0;
        leftmenu=null;
        monstercontroller = new MonsterController();
        monstercontroller.self = monstercontroller;
    }

    function paintNode(){
        contextname = "page-map";
        placedict = dict();
        global.system.pushmusic("3.mp3");
        contextNode = sprite("wartexture.png").size(800,480).anchor(50,50).pos(-400,240);
        baseNode = contextNode.addsprite().color(0,0,0,0);
        pn = 2;
        contextNode.add(sprite("warbackright.png",ARGB_8888).anchor(100,0).pos(800,0),1);
        left=global.shotscreen.addsprite("warbackleft.png",ARGB_8888).pos(-67,0);
        contextNode.setevent(EVENT_TOUCH,nodeMoveEvent);
        contextNode.setevent(EVENT_UNTOUCH,nodeMoveEvent);
        contextNode.setevent(EVENT_MULTI_TOUCH,nodeMoveEvent);
        contextNode.setevent(EVENT_MULTI_UNTOUCH,nodeMoveEvent);
        contextNode.setevent(EVENT_MOVE,nodeMoveEvent);
        contextNode.addaction(sequence(moveby(400,67,0),moveby(600,733,0),callfunc(animateover)));
        left.addaction(moveby(400,67,0));
        c_addtimer(500,initover);
        initlock++;
    }
    
    function animateover(){
        initlock--;
        trace("paint unlock",initlock);
        global.screen.visible(0);
        left.removefromparent();
        contextNode.add(left,2);
    }
    
    function initover(timer){
        if(initlock != 0){
            return 0;
        }
        timer.stop();
        contextNode.setevent(EVENT_KEYDOWN,keydownhandle);
        baseNode.addaction(tintto(800,100,100,100,100));
        nodeMove(-400,-240);
        baseNode.addsprite("warback.jpg",ARGB_8888).size(1600,960);
        var em=baseNode.addsprite("mapempirelv1_self.png",ARGB_8888).anchor(50,50).pos(800,480);
        em.setevent(EVENT_UNTOUCH,goback);
                var fly = sprite("mapelement1.png").anchor(50,50).pos(35,0);
                fly.addsprite(avatar_url(global.papaId)).size(38,38).pos(15,11);
                var name = global.user.getValue("cityname");
                if(len(name)>9){
                    name = name[0]+name[1]+name[2]+name[3]+name[4]+name[5]+"..";
                }
                fly.addlabel(name,null,16).anchor(50,0).pos(32,52).color(0,0,0,100);
                fly.color(50,50,50,50);
                em.add(fly,0,2);
                
        var flagn = em.addsprite("flagother.png").anchor(0,100).pos(117,125);
        //spriteManager.getAnimation(["flag1.png","flag2.png","flag3.png","flag4.png","flag5.png","flag6.png"]);
        flagn.addaction(repeat(animate(1000,"flag1.png","flag2.png","flag3.png","flag4.png","flag5.png","flag6.png",UPDATE_SIZE)));

        refreshmonster();
        initialMenu();
        left.add(sprite("backbutton.png").anchor(0,100).pos(0,480).setevent(EVENT_UNTOUCH,goback),0,0);
        initlock--;
    }
    
    function refreshmonster(){
        if(global.flagnew == 1){
            var monsters = [-1,-1,-1,-1,-1,-1,-1,0,-1,-1];
        }
        else{
            monsters = monstercontroller.monsters;
        }
        for(var k=0;k<len(monsters);k++){
            baseNode.remove(8+k);
            if(monsters[k]!=-1){
                var m = sprite("monster_"+str(monsters[k])+"_1.png").anchor(50,50).pos(mplace[k]);
                //spriteManager.getPic("monster_"+str(monsters[k])+"_1.png", m);
                var mtype = monsters[k]/3;
                var ml=monstercontroller.mbaselevel[k];
                var the4th ="2";
                if(mtype == 4 || mtype == 9){
                    the4th="4";
                }
                //var temp = sprite();
                //spriteManager.getAnimation(["monster_"+str(monsters[k])+"_2.png","monster_"+str(monsters[k])+"_3.png","monster_"+str(monsters[k])+"_"+the4th+".png","monster_"+str(monsters[k])+"_1.png"]);
                m.addaction(sequence(delaytime(rand(8000)),repeat(animate(1000,"monster_"+str(monsters[k])+"_2.png","monster_"+str(monsters[k])+"_3.png","monster_"+str(monsters[k])+"_"+the4th+".png","monster_"+str(monsters[k])+"_1.png"),delaytime(3000))));
                m.setevent(EVENT_UNTOUCH,beatmonster,k);
                m.prepare();
                var ms=m.size();
                var bl=10+ml*2;
                m.size(ms[0]*bl/10,ms[1]*bl/10);
                baseNode.add(m,0,8+k);
            }
        }
    }

    function initialdata(){
        initlock=initlock+2;
        trace("net lock",initlock);
        monstercontroller.self = monstercontroller;
        monstercontroller.global = global;
        initialover(0,0,0);
        //http_request(BASE_URL+"warinfo?userid="+str(global.userid),initialover);
    }

    function useaction(p,rc,c){
        if(p=="refresh"){
            if(rc!=0){
                var data = json_loads(c);
                if(data.get("id")==0){
                    return 0;
                }
                global.mapid = data.get("mapid");
                initialdata();
            }
        }
    }
    
    function keydownhandle(n,e,p,kc){
        if(kc==4){
            nodemovewithgid(selfgid);
        }
    }

    function initialover(r,rc,c){
trace("warinfo",rc,c);
        initlock=initlock-2;
        trace("net unlock",initlock);
    }
    function beatmonster(n,e,p){
        trace("attack monster",p);
        if(global.currentLevel == contextLevel){
            global.pushContext(self,new Monsterdialog(p),NonAutoPop);
        }
    }   
    function objSelected(node,event,p,x,y,ps){
        if(contextLevel >= global.currentLevel){
            if(event == EVENT_HITTEST){
                select = 1;
                var c = node.node2world(x,y);
                c = contextNode.world2node(c[0],c[1]);
                nodeMoveEvent(node,EVENT_TOUCH,p,c[0],c[1],0);
                return 1;
            }
            else if(event==EVENT_MULTI_TOUCH){
                select = 0;
                var p0 = ps.get(0);
                p0 = node.node2world(p0[0],p0[1]);
                p0 = contextNode.world2node(p0[0],p0[1]);
                ps.update(0,p0);
                p0 = ps.get(1);
                p0 = node.node2world(p0[0],p0[1]);
                p0 = contextNode.world2node(p0[0],p0[1]);
                ps.update(1,p0);
                nodeMoveEvent(node,EVENT_MULTI_TOUCH,0,0,0,ps);
                return 1;
            }
            else if(event== EVENT_MULTI_UNTOUCH){
                p0 = ps.get(0);
                p0 = node.node2world(p0[0],p0[1]);
                p0 = contextNode.world2node(p0[0],p0[1]);
                ps.update(0,p0);
                p0 = ps.get(1);
                p0 = node.node2world(p0[0],p0[1]);
                p0 = contextNode.world2node(p0[0],p0[1]);
                ps.update(1,p0);
                nodeMoveEvent(node,EVENT_MULTI_UNTOUCH,0,0,0,ps);
                return 1;
            }
            else if(event == EVENT_MOVE){
                if(select == 1){
                    var coor = node.size();
                    if(x <0 || y <0 || x>coor[0] || y>coor[1])
                        select = 0;
                }
                else{
                    var c2 = node.node2world(x,y);
                    c2 = contextNode.world2node(c2[0],c2[1]);
                    if(ps!=null && len(ps)==3){
                        p0 = ps.get(0);
                        p0 = node.node2world(p0[0],p0[1]);
                        p0 = contextNode.world2node(p0[0],p0[1]);
                        ps.update(0,p0);
                        p0 = ps.get(1);
                        p0 = node.node2world(p0[0],p0[1]);
                        p0 = contextNode.world2node(p0[0],p0[1]);
                        ps.update(1,p0);
                    }
                    nodeMoveEvent(node,EVENT_MOVE,p,c2[0],c2[1],ps);
                }
                return 0;
            }
            else if(event == EVENT_UNTOUCH && select == 0){
                return 0;
            }
            if(p == selfgid && global.flagnew == 0)
                goback();
            /*
            else
                global.pushContext(self,new UserControl(p),AutoPop);
            */
        }
    }

    function reloadNode(re){
        if(re == -1){
            var m = placedict.get(selfgid/8).get(selfgid%8);
            m.texture("mapempirelv"+str((nobility*3+subnobility+4)/3)+"_self.png");
            m.get(2).visible(1);
        }
    }
    
    var powerlabel;
    function initialMenu(){
        var RIGHTOFF=40;

        rightmenu = sprite("warmenuback.png",ARGB_8888).anchor(100,0).pos(985,0).setevent(EVENT_TOUCH,wartabvisible);
        contextNode.add(rightmenu,3);
        
        rightmenu.addsprite("warmenutop.png").anchor(100,0).pos(252,0);
        var mbutton = sprite("warmenubutton.png").anchor(50,50).pos(RIGHTOFF,240);
        rightmenu.add(mbutton,1,1);
        rightmenu.addsprite("wartabuser.png").pos(30+RIGHTOFF,12);
        rightmenu.addsprite(avatar_url(global.papaId)).pos(33+RIGHTOFF,15).size(50,50);
        
        rightmenu.addlabel(global.getfriend(global.papaId).get("name"),null,20).anchor(0,50).pos(88+RIGHTOFF,25).color(0,0,0,100);
        rightmenu.addsprite("power.png").pos(88+RIGHTOFF,40);
        powerlabel = rightmenu.addlabel(str(global.soldiers[0]+global.soldiers[1]),null,20).color(0,0,0,100).pos(115+RIGHTOFF,40);
        rightmenu.addsprite("warhelp.png").pos(33+RIGHTOFF,75).setevent(EVENT_UNTOUCH,gotohelp,"war");
    }
    
    function gotohelp(n,e,p){
        global.pushContext(null,new TestWebControl(p),NonAutoPop);
    }
    function goback(){
        if(Back == 1)
            return;
        Back = 1;
        contextNode.add(node().size(800,480).setevent(EVENT_HITTEST,donothing));
        if(rightmenu.pos()[0]==800){
            wartabvisible(0,0,0,0,0);
        }
        baseNode.addaction(sequence(tintto(600,0,0,0,0),callfunc(releasenode)));
        contextNode.addaction(sequence(delaytime(600),moveby(600,-733,0),moveby(400,-67,0)));
        left.addaction(sequence(delaytime(1200),moveby(400,-67,0),callfunc(releasecontext)));
    }
    
    function releasecontext(){
        global.popContext(null);
    }
    
    function releasenode(){
        baseNode.removefromparent();
        rightmenu.removefromparent();
        left.get(0).removefromparent();
        left.removefromparent();
        global.shotscreen.add(left);
        global.screen.visible(1);
    }
    
    function buttonclicked(n,e,p){
        if(e == EVENT_TOUCH){
            n.texture("warbutton"+str(p)+"1.png");
        }
        else{
            n.texture("warbutton"+str(p)+"0.png");
            if(p==0){
                nodemovewithgid(selfgid);
            }
            else if(p==1){
                //global.pushContext(self,new Waraboutinfo(0),NonAutoPop);
            }
            else if(p==2){
                //global.pushContext(self,new Waraboutinfo(1),NonAutoPop);
            }
        }   
    }

    function nodemovewithgidevent(n,e,p){
        nodemovewithgid(p);
    }

    function wartabvisible(n,e,pa,x,y){
        if(x< 67){
            var p = rightmenu.pos();
            if(p[0] == 985){
                rightmenu.addaction(moveto(200,800,0));
                rightmenu.get(1).addaction(sequence(delaytime(200),scaleto(200,-100,100)));
            }
            else{
                rightmenu.addaction(moveto(200,985,0));
                rightmenu.get(1).addaction(sequence(delaytime(200),scaleto(200,100,100)));
            }
        }
    }

    function nodemovewithgid(gid){
        var p = baseNode.node2world(800,480);
        nodeMove(400-p[0],240-p[1]);
    }

    function sizeWithMode(){
        var p=baseNode.world2node(400,240);
        baseNode.scale(100+mode);
        var p2 = baseNode.node2world(p[0],p[1]);
        nodeMove(400-p2[0],240-p2[1]);
    }

    function sizeModeftAnimate(){
        if(mode<=20){
            sizeModeft(mode,50);
        }
        else{
            sizeModeft(mode,0);
        }
    }

    function nodeMoveEvent(node,event,param,x,y,points){
        if(contextLevel >= global.currentLevel){
            if(event == EVENT_TOUCH){
                lastpoint = contextNode.node2world(x,y);
            }
            else if(event == EVENT_MULTI_TOUCH){
                var p0 = points.get(0);
                var p1 = points.get(1);
                lastlength = sqrt((p0[0]-p1[0])*(p0[0]-p1[0])+(p0[1]-p1[1])*(p0[1]-p1[1]));
                lastpoint = contextNode.node2world((p0[0]+p1[0])/2,(p0[1]+p1[1])/2);
            }
            else if(event == EVENT_MULTI_UNTOUCH){
                if(len(points)==3){
                    var flg = 1-points.get(-1);
                    var pl = points.get(flg);
                    lastpoint = contextNode.node2world(pl[0],pl[1]);
                }
            }
            else if(event == EVENT_UNTOUCH){
                if(lastclicktime!=0 && time()-lastclicktime<400){
                    lastclicktime=0;
                    sizeModeftAnimate();
                }
                else{
                    lastclicktime = time();
                }
            }
            else if(event == EVENT_MOVE){
                if(points==null || len(points) != 3){
                    var point = contextNode.node2world(x,y);
                    var i = point[0]-lastpoint[0];
                    var j = point[1]-lastpoint[1];
         
                    nodeMove(i,j);
                    lastpoint = point;
                }
                else{
                    p0 = points.get(0);
                    p1 = points.get(1);
                    point = contextNode.node2world((p0[0]+p1[0])/2,(p0[1]+p1[1])/2);
                    nodeMove(point[0]-lastpoint[0],point[1]-lastpoint[1]);
                    lastpoint = point;
                    var length = sqrt((p0[0]-p1[0])*(p0[0]-p1[0])+(p0[1]-p1[1])*(p0[1]-p1[1]));
                    
                    var pm = length*(100+mode)/lastlength;
                    lastlength = length;
                    sizeModeft(mode,pm-100);
                }
            }
        }
    }

    function getposbyid(id){
        var blockid = id/8;
        return [blockid/pn,blockid%pn*2+id%8/4];
    }

    function nodeMove(x,y){
        var c1 = baseNode.node2world(0,0);
        var c2 = baseNode.node2world(1600,960);
        if(c2[0]+x<800)
            x = 800-c2[0];
        if(c2[1]+y<480)
            y = 480-c2[1];
        if(c1[0]+x>0) x= -c1[0];
        if(c1[1]+y>0) y= -c1[1];
        baseNode.addaction(imoveby(x,y));
        //refreshmap(0);
    }
    
    function sizeModeft(from,to){
        if((from == MS_MIN && to <= MS_MIN) || (from == MS_MAX && to>=MS_MAX))
            return 0;
        if(to <= MS_MIN){
            to=MS_MIN;
        }
        else if(to>=MS_MAX){
            to = MS_MAX;
        }
        mode = to;
        sizeWithMode();
    }

    function deleteContext(){
        contextNode.removefromparent();
        contextNode = null;
        baseNode.removefromparent();
        baseNode = null;
        global.system.popmusic();
        /*
        for(var i=0;i<pn*pn;i++){
            if(placedict.get(i)!=null){
                removeplace(i/pn,i%pn);
            }
        }
        */
        global.screen.visible(1);
        left.removefromparent();
        monstercontroller.close();
        initlock=0;
        mode= 0;
        Back = 0;
    }
}
