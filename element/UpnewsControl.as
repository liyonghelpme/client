class UpnewsControl extends ContextObject{
    var items;
    var left;
    var right;
    var pagetext;
    var pagemax;
    var pagenum;
    var length;
    var newspage;
    var lock;
    const PAGEITEMS = 1;
    function UpnewsControl(){
        contextname = "dialog-new";
        contextNode = null;
        pagenum = 1;
        lock=0;
        items = ["2011/11/2 奇迹帝国2.3版本上线啦！+大家可以去电子市场（Android market）或其他任何渠道下载更新。新版本增加了如下功能：+1. 支付宝充值功能；+2. 优化了访问好友速度，修复了访问好友死机的bug；+3. 增加了战争聊天室，增加了夜景和灯光效果。",
        "2011/10/30 战争聊天室上线啦！+1. 战争页面点击红色箭头就可以看到战争聊天室罗！+2. 预告：“要塞”即将上线！伯爵以上地图会出现怪兽占领的要塞，大家可以争夺要塞，要塞每小时会生产资源，占领越多的要塞会不停地获得更多的资源哦！敬请期待！+3. 给凯撒留言：由于木瓜社区置顶帖功能要过段时间才能恢复，所以大家有啥建议都可以给凯撒留言，熊哥我会及时看并回复的！",
        "2011/10/29 宠物训练&一键访问好友上线啦！+1. 训练宠物增加战斗力：点击宠物-》点击最右侧训练图标-》“完整”训练动画结束【注意是完整的动画结束哦！】-》宠物增加1点战斗力（每天最多只能加100点战斗力） +2. 一键访问好友：一键访问好友会领取所有未访问好友奖励，详细请查看帮助文档。+3. 圈子升级：这个是木瓜社区控制的，有好的建议可以反馈给木瓜社区哦！+4. 怪兽第一次出现后没有被立即消灭才会抢粮，大家要及时杀怪呀！"];
    }

    function paintNode(){
        contextNode =node();
        contextNode.addsprite("pagenumback.png").anchor(50,50).pos(290,407);
        pagetext = contextNode.addlabel("1/1",null,20).anchor(50,50).pos(290,407).color(0,0,0,100);
        left = contextNode.addsprite("warabout_left.png").anchor(100,50).pos(248,407).setevent(EVENT_UNTOUCH,choosePage,-1);
        right= contextNode.addsprite("warabout_right.png").anchor(0,50).pos(332,407).setevent(EVENT_UNTOUCH,choosePage,1);
        newspage = contextNode.addlabel("正在载入……",null,30).anchor(50,50).pos(290,227).color(0,0,0,100);
        pagemax = 1;
        length = len(items);
        pagemax = (length-1)/PAGEITEMS+1;
        choosePage(0,0,0);
    }
    
    function choosePage(n,e,po){
        if(global.context[0].reqlock==1 ||lock==1 || pagenum == 1 && po == -1 || pagenum == pagemax && po == 1)
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
        pagenum = p;
        pagetext.text(str(pagenum)+"/"+str(pagemax));
        var fpage = pagenum+10;
        if(fpage>pagemax){
            fpage=pagemax;
        }
        if(len(items) < fpage*PAGEITEMS && len(items)<length){
            //if(lock==0){
            //    lock = 1;
            //global.http.addrequest(0,"getgift",["uid","off","num"],[ppy_userid(),0,length],self,"addnewsitems");
            //}
        }
        else{
            newspage.removefromparent();
            newspage = contextNode.addnode();
            if(length>0){
                for(var i=(pagenum-1)*PAGEITEMS;i<pagenum*PAGEITEMS;i++){
                    if(i>=length){
                        break;
                    }
                    var item = items[i].split("+");
                    newspage.addlabel(item[0],null,24,FONT_BOLD).pos(40,96).color(0,0,0,100);
                    var off=130;
                    for(var j=1;j<len(item);j++){
                        var la=newspage.addlabel(item[j],null,20,FONT_NORMAL,480,0,ALIGN_LEFT).pos(50,off).color(0,0,0,100);
                        la.prepare();
                        off = off+la.size()[1]+3;
                    }
                }
            }
            else{
                newspage.addlabel("还没有任何更新哦！",null,30).anchor(50,50).pos(290,227).color(0,0,0,100);
            }
        }
    }
    
    function receivegift(n,e,p){
        //
        //
        var index = p;
        var refuse = 0;
        if(index<0){
            index=-index-1;
            refuse = 1;
        }
        var item = items[index];
        var id=item[0];
        item[0]=-1;
        if(refuse==1){
            var ag=2;
        }
        else{
            ag = item[3];
            if(ag==0){
                global.special[item[2]]++;
            }
        }
        global.user.changeValue("newgift",-1);
        var rdict = dict();
        rdict.update("name","receivegift");
        rdict.update("giftstr",item[1]+","+str(item[2])+","+str(ag)+","+str(id));
        global.context[0].reqlist.append(rdict);
        choosePage(0,0,0);
    }
    
    function useaction(p,rc,c){
        if(p=="addnewsitems"){
            addnewsitems(0,rc,c);
        }
    }
    
    function addnewsitems(r,rc,c){
        trace("getnews",rc,c);
        lock=0;
        if(rc!=0){
            var data = json_loads(c);
            if(data==null||data.get("id",1)==0){
                return 0;
            }
            var giftlist = data.get("gift");
            for(var i=0;i<len(giftlist);i++){
                items.append(giftlist[i]);
            }
            choosePage(0,0,0);
        }
    }

    function closedialog(node,event){
        global.popContext(null);
    }

    function deleteContext(){
        if(contextNode!=null){
            contextNode.addaction(stop());
            contextNode.removefromparent();
            for(var i=len(items)-1;i>=0;i--){
                if(items[i][0]==-1){
                    items.pop(i);
                }
            }
            global.user.setValue("buffgift",items);
        }
    }
}