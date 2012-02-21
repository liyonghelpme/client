class SpriteManager
{
    var oldEdition;
    var global;
    var downloadNode;
    var self;
    var animate = [];
    var downStartTime;
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
"4.mp3", "0.mp3", "3.mp3",
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
"nobattletab0.png","nobattletab1.png",
"warlostleft.jpg",
"warwinelement.jpg", "warwinelement2.jpg", "warwinleft.jpg",
"warloseelement.jpg", "warloseelement2.jpg",
];
    var DragonPic = [
    "earth-1-10.png", "earth-1-11.png", "earth-1-12.png", "earth-1-13.png",
    "earth-1-1.png", "earth-1-2.png", "earth-1-3.png", "earth-1-4.png", 
    "earth-1-5.png", "earth-1-6.png", "earth-1-7.png", "earth-1-8.png", 
    "earth-1-9.png", "earth-2.png", "earth-3.png", "earth-4-1.png", 
    "earth-4-2.png", "earth-4-3.png", "earth-4-4.png", "earth-4-5.png", 
    "earth-4-6.png", "earth-4-7.png", "earth-4-8.png", "earth-4-9.png", 
    "earth-4.png", "earth-5.png", "earth-6.png", "earth-7.png", 
    "earth-9.png", "earth-f1.png", "earth-f2.png", "earth-f3.png", 
    "earth-f4.png", "egg-1-0.png", "egg-1-1.png", "egg-1-2.png", 
     "egg-1-3.png", "egg-2-0.png", "egg-2-1.png", "egg-2-2.png", 
     "egg-2-3.png", "egg-3-0.png", "egg-3-1.png", "egg-3-2.png", 
     "egg-3-3.png", "egg-3-4.png", "egg-3-5.png", "egg-3-6.png", 
     "egg-3-7.png", "fire-1-10.png", "fire-1-11.png", "fire-1-12.png", 
     "fire-1-13.png", "fire-1-1.png", "fire-1-2.png", "fire-1-3.png", 
     "fire-1-4.png", "fire-1-5.png", "fire-1-6.png", "fire-1-7.png", 
     "fire-1-8.png", "fire-1-9.png", "fire-2.png", "fire-3.png", 
     "fire-4-1.png", "fire-4-2.png", "fire-4-3.png", "fire-4-4.png", 
     "fire-4-5.png", "fire-4-6.png", "fire-4-7.png", "fire-4-8.png", 
     "fire-4-9.png", "fire-4.png", "fire-5.png", "fire-6.png", 
     "fire-7.png", "fire-9.png", "fire-f1.png", "fire-f2.png", 
     "fire-f3.png", "fire-f4.png", "water-1-10.png", "water-1-11.png", 
     "water-1-12.png", "water-1-13.png", "water-1-1.png", 
     "water-1-2.png", "water-1-3.png", "water-1-4.png", "water-1-5.png", 
     "water-1-6.png", "water-1-7.png", "water-1-8.png", "water-1-9.png", 
     "water-2.png", "water-3.png", "water-4-1.png", "water-4-2.png", 
     "water-4-3.png", "water-4-4.png", "water-4-5.png", "water-4-6.png", 
     "water-4-7.png", "water-4-8.png", "water-4-9.png", "water-4.png", "water-5.png", "water-6.png", "water-7.png", "water-9.png", "water-f1.png", "water-f2.png", "water-f3.png", "water-f4.png"];
    
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
        getDownload(arr, warBack, 0);
    }

    var dragonPlace;
    function dragonBack()
    {
        global.pushContext(dragonPlace,new Nestpetdialog(), 0);
    }

    function getDragon(place)
    {
        trace("getDragon");
        dragonPlace = place;
        var arr = DragonPic;
        getDownload(arr, dragonBack, 1);
    }
    var ToDown = [];
    function getDownload(arr, callback, p)
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
                trace("down", arr[i]);
                notdownload = 1;
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
            var warn;
            if(p == 0)//download war picture
            {
                warn = new Warningdialog([global.getStaticString("warNeedDownload"), -2000, 3]);
                global.pushContext(global.context[0],  warn, 0); 
            }
            else if(p == 1)//download dragon picture
            {
                trace("pet downloading", global);
                warn = new Warningdialog([global.getStaticString("petNeedDownload"), -2000, 6]);
                global.pushContext(global.context[0], warn, 0);        
            }
        }
    }
    function DecideToDown()
    {
        if(notdownload == 1)
            return;
        downStartTime = time();//1000*20
        notdownload = 1;
        trace("decide to download");
        mainNode.addaction(request(ToDown[0], 0, finDownload));
        /*
        for(var i = 0; i < len(ToDown); i++)
        {

        }
        */
        timeisend = 0;
        global.timer.addlistener(global.timer.currenttime+99999, self);
        global.context[0].contextNode.parent().add(downloadNode);

    }
    var progress = null;
    var pronumber = null;
    var showWord = 0;
    function showDia(n, e, x, y, pos)
    {
        if(showWord == 0)
        {
            downloadNode.addlabel(global.getStaticString("downloading"), null, 28, FONT_BOLD).pos(0, -40).color(0, 0, 0);
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
        getDownload(animate, monBack, 2);
    }
    function finDownload(name, force, param)
    {
        downloadLen--;
        ToDown.pop(0);
        if(len(ToDown) > 0)
            mainNode.addaction(request(ToDown[0], 0, finDownload));
            
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
        var cur = time();
        if((cur-downStartTime) > 15*1000)
        {
            ToDown = [];
            downloadLen = 0;

            mainNode.stop(); 
            finDownload(null, 0, null);
        }
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
    function getMusic(name)
    {
        if(notdownload == 1)
            return;
        node().addaction(request("4.mp3"));
    }
    function getAnimation(pics)
    {
        var arr = [];
        for(var i = 0; i < len(pics); i++)
        {
            var im = fetch(pics[i]);
            if(im == null)
            {
                arr.append(im);
                //mainNode.addaction(request(pics[i], 0, finAni, null));
            }
        }
        if(len(arr) > 0)
            getDownload(arr, finAni, 2);
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
