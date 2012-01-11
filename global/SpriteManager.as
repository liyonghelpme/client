class SpriteManager
{
    var oldEdition;
    var global;
    var downloadNode;
    var self;
    var animate = [];
    /*
    var animate = [
"animate_self_left_2_4.png","animate_enemy_1_1.png","dialogback_attack.png",
"animate_enemy_1_2.png","animate_enemy_2_1.png","animate_enemy_2_2.png","animate_enemy_left_0_1.png","animate_enemy_left_0_2.png","animate_enemy_left_0_3.png",
"animate_enemy_left_0_4.png","animate_enemy_left_0_5.png","animate_enemy_left_0_6.png","animate_enemy_left_0_8.png","animate_enemy_left_0_9.png","animate_enemy_left_0_10.png",
"animate_enemy_left_0_11.png","animate_enemy_left_0_12.png","animate_enemy_left_0_13.png","animate_enemy_left_1_1.png","animate_enemy_left_1_2.png","animate_enemy_left_1_3.png",
"animate_enemy_left_1_4.png","animate_enemy_left_2_1.png","animate_enemy_left_2_2.png","animate_enemy_left_2_3.png","animate_enemy_left_2_4.png","animate_self_left_0_1.png",
"animate_self_left_0_2.png","animate_self_left_0_3.png","animate_self_left_0_4.png","animate_self_left_0_5.png","animate_self_left_0_6.png","animate_self_left_0_8.png",
"animate_self_left_0_9.png","animate_self_left_0_10.png","animate_self_left_0_11.png","animate_self_left_0_12.png","animate_self_left_0_13.png","animate_self_left_1_4.png"];
    */
    var warpic = [
"wartabperson.png", "wartabperson_b.png", "wartabperson_r.png", 
"attack_head.png","attackbeginelement.png", 
"battle1.png","battle2.png","battle3.png","battle4.png","battle5.png","battle6.png","battle7.png","battle8.png","battle9.png",
"defence_head.png","defenceback.jpg",
"dialogback_warabout.png","dialogtab_warabout0.png", "dialogtab_warabout1.png", 
"flagother.png", "flagempty.png", 
"mapelement0.png","mapelement1.png","mapelement2.png","mapelement3.png",
"mapempirelv1.png", "mapempirelv1_self.png", 
"mapempirelv2.png", "mapempirelv2_self.png",
"mapempirelv3.png","mapempirelv3_self.png",
"mapempirelv4.png","mapempirelv4_self.png",
"mapempirelv5.png","mapempirelv5_self.png",
"mapempirelv6.png","mapempirelv6_self.png",
"mapempirelv7.png","mapempirelv7_self.png",
"mapobj0lv1.png","mapobj0lv2.png","mapobj0lv3.png",
"mapobj1lv1.png","mapobj1lv2.png","mapobj1lv3.png",
"mapobj2lv1.png","mapobj2lv2.png","mapobj2lv3.png",
"mapobj3lv1.png","mapobj3lv2.png","mapobj3lv3.png",
"mapobj4lv1.png","mapobj4lv2.png","mapobj4lv3.png",
"moveback.png","moveblock.png",
"nobi0.png","nobi1.png","nobi2.png","nobi3.png","nobi4.png","nobi5.png","nobi6.png","nobi7.png","nobi8.png","nobi9.png","nobi10.png","nobi11.png","nobi12.png","nobi13.png","nobi14.png","nobi15.png","nobi16.png","nobi17.png","nobi18.png",
"opbutton12.png","opbutton13.png","opbutton14.png","opbutton15.png",
"spyback.jpg",
"spyelement0.png","spyelement1.png","spyelement2.png","spyelement3.png",
"spyresultback.jpg","spytab0.png","spytab1.png",
"warabout0.png","warabout1.png", 
"warbutton00.png","warbutton01.png",
"warbutton10.png","warbutton11.png",
"warbutton20.png","warbutton21.png",
"warinfotab00.png","warinfotab01.png", "warinfotab02.png",
"warinfotab10.png","warinfotab11.png", "warinfotab12.png",
"warmenulistback.png","warmenutab0.png","warmenutab1.png",
"warrecord.png","warrecordcell.png", "warrecordcell0.jpg", "warrecordcell1.jpg", 
"4.mp3", 
"nobattletab0.png","nobattletab1.png",
"warlostleft.jpg",
"warwinelement.jpg", "warwinelement2.jpg", "warwinleft.jpg",
"warloseelement.jpg", "warloseelement2.jpg",
];
    var mainNode = node();
    var notdownload = 0;
    var downbar;
    function SpriteManager(g)
    {
        global = g;
        oldEdition = -1;

        downloadNode = sprite("small_downback.png").pos(700, 240);
        downbar = downloadNode.addsprite("small_downbar.png").pos(13, 33).size(0, 30);

        var vf = c_res_file("version");
        if(vf == null)
        {
            node().addaction(request("version", 1, getNewVersion));
        }
        else
        {
            //version code != new version code
            var ver = c_file_open(C_FILE_READ, c_res_file("version"));
            ver = json_loads(ver);
            if(ver != null)
            {
                oldEdition = ver.get("id");
            }
        }
    }
    var downloadLen;
    var totalLen;
    function warBack()
    {
        global.pushContext(global.context[0],global.context[0].warpage,0);
        global.context[0].warpage.initialdata();
    }
    function getWar()
    {
        var arr = animate + warpic;
        getDownload(arr, warBack);
    }
    var ToDown = [];
    function getDownload(arr, callback)
    {
        if(notdownload == 1)
            return;
        ToDown = [];
        trace("get download");
        downloadLen = len(arr);
        totalLen = downloadLen;
        var i;
        for(i = 0; i < len(arr); i++)
        {
            var im = fetch(arr[i]);
            if(im != null)
            {
                downloadLen--;
            }
            else
            {
                //trace("down", arr[i]);
                /*
                if(notdownload == 0)
                {
                    timeisend = 0;
                    global.timer.addlistener(global.timer.currenttime+99999, self);
                    global.context[0].contextNode.parent().add(downloadNode);
                    //downloadNode.addlabel("正在下载图片", null, 15, FONT_BOLD).pos(0, -20).color(0, 0, 0);

                    //downloadNode.setevent(EVENT_UNTOUCH, showDia);
                }
                */
                notdownload = 1;
                //mainNode.addaction(request(arr[i], 0, finDownload));    
                ToDown.append(arr[i]);
            }
        }   

        if(notdownload == 0)
        {
            trace("no need download");
            callback();
        }
        else
        {
            //SpriteManager warning !
            trace("warning dialog");
           notdownload = 0;
           global.pushContext(global.context[0], Warningdialog(["开启战争模式需要下载1M相关图片，是否下载？", -2000, 3]), 0); 

        }
        /*
        else
        {
            trace("start downloading", downloadLen);
            timeisend = 0;
            global.timer.addlistener(global.timer.currenttime+99999, self);
            global.context[0].contextNode.parent().add(downloadNode);
            downloadNode.setevent(EVENT_UNTOUCH, showDia);
        }
        */
    }
    function DecideToDown()
    {
        if(notdownload == 1)
            return;
        notdownload = 1;
        trace("decide to download");
        for(var i = 0; i < len(ToDown); i++)
        {
            mainNode.addaction(request(ToDown[i], 0, finDownload));
        }

        timeisend = 0;
        global.timer.addlistener(global.timer.currenttime+99999, self);
        global.context[0].contextNode.parent().add(downloadNode);
        //downloadNode.addlabel("正在下载图片", null, 15, FONT_BOLD).pos(0, -20).color(0, 0, 0);

    }
    var progress = null;
    var pronumber = null;
    var showWord = 0;
    function showDia(n, e, x, y, pos)
    {
        if(showWord == 0)
        {
            downloadNode.addlabel("正在下载图片...", null, 28, FONT_BOLD).pos(0, -40).color(0, 0, 0);
            showWord = 10;
        }
        //global.pushContext(null, new Download(), 0)
    }
    function monBack()
    {
        global.pushContext(null,global.context[0].warmap,0);//NonAutoPop
    }
    function getMonster()
    {
        getDownload(animate, monBack);
    }
    function finDownload(name, force, param)
    {
        downloadLen--;
        if(downloadLen <= 0)//close download
        {
            notdownload = 0;
            timeisend = 1;
            downloadNode.removefromparent();
            ToDown = [];
        }
    }
    var timeisend = 0;
    function timerefresh()
    {
        var rate = (totalLen-downloadLen)*48/totalLen;
        downbar.size(rate, 30);
        showWord -= 1;
        if(showWord < 0 )
            showWord = 0;
        /*
        if(progress != null)
        {
            progress.size((totalLen-downloadLen)*144/totalLen, 18);
            pronumber.text(str(totalLen-downloadLen)+"/"+str(totalLen));
        }
        */
    }
    function getNewVersion(name, force, param)
    {
        /*
        var ver = c_file_open(C_FILE_READ, c_res_file("version"));
        if(ver == null)
            return;

        ver = json_loads(ver);
        var newEdition = ver.get("id");
        trace("getNew version old, new", oldEdition, newEdition);
        if(oldEdition != newEdition)
        {
            var files = ver.get("files");
            for(var i = 0; i < len(files); i++)
            {
                node().addaction(request(files[i], 1, update))
            }
        }
        */
    }
    function update(name, force, param)
    {
    }
    function getPic(name, sp)
    {
        var im = fetch(name);
        if(im != null)
        {
            sp.texture(im);
        }
        else
        {
            mainNode.addaction(request(name, 0, getImage, sp));
        }
    }
    function getAnimation(pics)
    {
        for(var i = 0; i < len(pics); i++)
        {
            var im = fetch(pics[i]);
            if(im == null)
            {
                mainNode.addaction(request(pics[i], 0, finAni, null));
            }
        }
    }
    function finAni(n, f, p)
    {
    }
    function getImage(name, force, sp)
    {
        //sp.stop();
        sp.texture(name);
    }
}
