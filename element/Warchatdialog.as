class Warchatdialog{
    var selfname;
    var items;
    var pid;
    var cid;
    var uid;
    var name;
    var chatnode;
    var lasttime;
    var posy;
    var lasty;
    var contextNode;
    var web;
    var exportbutton;
    function Warchatdialog(userid,n,mapid){
        uid=userid;
        name=n;
        cid=mapid;
        lasttime=0;
        items = 0;
        posy=70;
        web=null;
        chatnode=null;
        contextNode=null;
        exportbutton=null;
    } 
    function getNode(){
        contextNode = sprite("warchatback.png").pos(-580,0);
        contextNode.add(sprite("warchattop.png").pos(13,0),1);
        contextNode.add(sprite("warchatbottom.png").anchor(0,100).pos(13,480),1);
        contextNode.setevent(EVENT_UNTOUCH,donothing);
        var tmp=contextNode.addnode().size(580,480).pos(10,60);
        
            tmp.setevent(EVENT_TOUCH,chatmove);
            tmp.setevent(EVENT_MOVE,chatmove);
            tmp.setevent(EVENT_UNTOUCH,chatmove);
        refreshlist();
        contextNode.add(sprite("warchatsend.png").pos(468,12).setevent(EVENT_UNTOUCH,send),2);
            web = v_create(V_INPUT_VIEW,13,10,446,55);
            v_root().addview(web);
            web.visible(0);
        //web = v_create(V_INPUT_VIEW,13,14,446,40);
        //v_root().addview(web);
        pid=http_request("http://223.4.85.114:8003/recv?uid="+str(uid)+"&cid="+str(cid)+"&since="+str(lasttime),additems);
        return contextNode;
    }
    
    function send(){
        var t = web.text();
        var l = len(t);
        var st = uri_encode(t);
        var ul = len(st);
        l = l-(ul - l)/6;
        if(t==""){
            items.append([0,"系统","内容为空，无法发送！",0]);
            
            if(contextNode!=null){
                refreshlist();
            }
        }
        else if(l>60){
            items.append([0,"系统","字数超过30个汉字，无法发送！",0]);
            if(contextNode!=null){
                refreshlist();
            }
        }
        else{
            web.text("");
            http_request("http://223.4.85.114:8003/send?uid="+str(uid)+"&name="+uri_encode(name)+"&cid="+str(cid)+"&text="+st,sendover);
        }
    }
    
    function sendover(r,rc,c){
        if(rc==0){
            items.append([0,"系统","超时了，你的消息发送失败",0]);
            if(contextNode!=null){
                refreshlist();
            }
        }
    }
    
    function appear(){
        contextNode.addaction(sineout(moveto(800,0,0)));
        c_invoke(appearover,800,null);
    }
    function appearover(){
            web.visible(1);
        //web = v_create(V_INPUT_VIEW,13,14,446,40);
        //v_root().addview(web);
    }
    function disappear(){
        web.visible(0);
        contextNode.addaction(sinein(moveto(800,-580,0)));
        c_invoke(deleteContext,800,null);
    }
    
    function refreshlist(){
        if(chatnode!=null){
            destroynode(chatnode);
        }
        if(items==0){
            items=[];
            chatnode = contextNode.addsprite().anchor(50,50).pos(272,274).addaction(waitaction1);
        }
        else{
            while(len(items)>100){
                items.pop(0);
            }
            chatnode = contextNode.addsprite().pos(19,70);
            var off=0;
            for(var i=len(items)-1;i>=0;i--){
                var cl=[0,0,0];
                if(items[i][0]==0){
                    cl=[66,28,0];
                }
                else if(items[i][0]==uid){
                    cl=[5,14,52];
                }
                var lb=label(items[i][1]+":"+items[i][2],null,18,FONT_NORMAL,486,0,ALIGN_LEFT).pos(0,off).color(cl[0],cl[1],cl[2],100);
                lb.prepare();
                off = off+lb.size()[1]+3;
                chatnode.add(lb,1,i);
                if(off>410){
                    break;
                }
            }
        }
    }
    
    function chatmove(n,e,p,x,y){
        var cy = chatnode.pos()[1];
        if(e==EVENT_TOUCH){
            posy = y;
        }
        else if(e==EVENT_MOVE){
            chatnode.addaction(imoveby(0,y-posy));
            posy=y;
            cy=cy+y-posy;
        }
        else if(e==EVENT_UNTOUCH){
            var fy=y-posy+cy;
            if(chatnode.get(0)!=null && fy<160-chatnode.get(0).pos()[1]){
                fy=160-chatnode.get(0).pos()[1];
            }
            if(fy>70){
                fy=70;
            }
            chatnode.addaction(imoveby(0,fy-cy));
            cy=fy;
        }
        var off=0;
        var skip=0;
        for(var i=len(items)-1;i>=0;i--){
            var cn = chatnode.get(i);
            if(cn!=null){
                //cn.node2world(0,cn.size()[1])[1]<0||
                if(cn.pos()[1]+cy>480){
                    chatnode.remove(i);
                    skip=1;
                }
                off=cn.pos()[1]+cn.size()[1]+3;
            }
            else{
                if(skip!=1){
                    var cl=[0,0,0];
                    if(items[i][0]==0){
                        cl=[66,28,0];
                    }
                    else if(items[i][0]==uid){
                        cl=[5,14,52];
                    }
                    var lb=label(items[i][1]+":"+items[i][2],null,18,FONT_NORMAL,486,0,ALIGN_LEFT).pos(0,off).color(cl[0],cl[1],cl[2],100);
                    lb.prepare();
                    off = off+lb.size()[1]+3;
                    chatnode.add(lb,1,i);
                    if(cy+off>480){
                        break;
                    }
                }
                else{
                    break;
                }
            }
        }
    }
    
    function additems(r,rc,c){
        if(pid!=r){
            return;
        }
        if(rc==0){
            pid=http_request("http://223.4.85.114:8003/recv?uid="+str(uid)+"&cid="+str(cid)+"&since="+str(lasttime),additems);
        }
        else{
            var data = json_loads(c);
            var ms = data.get("messages");
           // trace(ms);
            if(len(ms)>0){
                items.extend(ms);
                lasttime=ms[len(ms)-1][3];
                if(contextNode!=null){
                    refreshlist();
                }
                else{
                    exportbutton.addaction(repeat(animate(1200,"warchatbutton2.png","warchatbutton3.png","warchatbutton4.png","warchatbutton3.png","warchatbutton2.png","warchatbutton1.png",ARGB_8888)));
                }
            }
            pid=http_request("http://223.4.85.114:8003/recv?uid="+str(uid)+"&cid="+str(cid)+"&since="+str(lasttime),additems);
        }
    }
    
    function deleteContext(){
        destroynode(contextNode);
        contextNode=null;
        web.removefromparent();
        web=null;
        //http_cancel(pid);
    }
}
