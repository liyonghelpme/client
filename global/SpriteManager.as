class SpriteManager
{
    var oldEdition;
    var global;
    var downloadNode;
    var self;
    var animate = [];
    
    var mainNode = node();
    var notdownload = 0;
    var downbar;

    var askToDown;
    var downLoadType = NotDownload;

    function SpriteManager(g)
    {
        global = g;
        oldEdition = -1;
        askToDown = sprite("downStart.png").pos(710, 240);
        downloadNode = sprite("small_downback.png").pos(700, 240);
        downbar = downloadNode.addsprite("small_downbar.png").pos(13, 33).size(0, 30);
    }

    var totalLen;
    function warBack()
    {
        global.inWarMap = 1;
        global.pushContext(global.context[0],global.context[0].warpage,0);
        global.context[0].warpage.initialdata();
    }
    function doNothing()
    {
        
    }
    function downMusic()
    {
        musicControl.changeMusic();
    }
    var Music = ["0.mp3", "3.mp3", "4.mp3"];
    var musicControl;
    function getMusic(mc)
    {
        musicControl = mc;
        var down = [] + Music;
        getDownload(down, downMusic, DownMusic);
    }
    function check(arr)
    {
        for(var i = 0; i < len(arr); i++)
        {
            var im = fetch(arr[i]);
            if(im == null)
                return 0;
        }
        return 1;
    }
    function getAllPic()
    {
        var arr = [] + businessPic + warpic + DragonPic;
        getDownload(arr, doNothing, DownAllPic);
    }
    function getWar()
    {
        var arr = [] + warpic;
        getDownload(arr, warBack, DownWarPic);
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
        var arr = [] + DragonPic;
        getDownload(arr, dragonBack, DownPetPic);
    }
    var ToDown = [];
    function getDownload(arr, callback, p)
    {
        if(notdownload == 1)
        {
            if(global.flagnew == 0 && (p == DownMusic || p == DownWarPic || p == DownPetPic))
            {
                if(showDown == 0)
                {
                    if(p == DownWarPic)//download war picture
                    {
                        global.pushContext(global.context[0], new Warningdialog(["开启战争模式需要下载相关图片，是否下载？", ShowDownYet, 3]), 0); 
                    }
                    else if(p == DownPetPic)//download dragon picture
                    {
                        global.pushContext(global.context[0], new Warningdialog(["召唤宠物需要下载相关图片，是否下载？", ShowDownYet, 6]), 0);        
                    }
                    else if(p == DownMusic)
                    {
                        global.pushContext(global.context[0], new Warningdialog([global.getStaticString("downMusic"), ShowDownYet, 6]), 0);
                    }
                }
                else
                    global.pushContext(null, new Warningdialog([global.getStaticString("downloading"), null, 6]), 0);
            }
            return;
        }
        if(global.inWarMap == 1)//not in war Map
        {
            return;
        }
        ToDown = [];
        trace("get download");
        totalLen = len(arr);
        var i;
        
        var needToDown = 0;
        var pass = 0;
        for(i = 0; i < len(arr); )
        {
            var im = fetch(arr[0]);
            if(im != null)
            {
                arr.pop(0);
                //pass++;
                //if(pass == len(businessPic))//for get business
                //    break;
            }
            else
            {
                trace("down", arr[0]);
                needToDown = 1;
                ToDown = arr;
                break;
            }
        }   

        if(needToDown == 0)
        {
            trace("no need download");
            callback();
        }
        else
        {
            downLoadType = p;
            //SpriteManager warning !
            trace("warning dialog");
            if(p == DownWarPic)//download war picture
            {
                global.pushContext(global.context[0], new Warningdialog(["开启战争模式需要下载相关图片，是否下载？", DownWarn, 3]), 0); 
            }
            else if(p == DownPetPic)//download dragon picture
            {
                global.pushContext(global.context[0], new Warningdialog(["召唤宠物需要下载相关图片，是否下载？", DownWarn, 6]), 0);        
            }
            //when it's safe to download ?
            /*
            else if(p == DownAllPic)
            {
                downloadAllPic();
            }
            */
            else if(p == DownAniPic)
            {
                DecideToDown();
            }
            else if(p == DownMusic)
            {
                global.pushContext(global.context[0], new Warningdialog([global.getStaticString("downMusic"), DownWarn, 6]), 0);
            }
        }
    }
    //When need to download All
    function downloadAllPic()
    {
        trace("download All Pic", len(ToDown));
        DecideToDown(); 
    }
    function clearDownload()
    {
        Downloading = 0;
    }
    var Downloading = 0; 
    function DecideToDown()
    {
        if(notdownload == 1)
            return;
        notdownload = 1;
        trace("decide to download");

        Downloading = 1;
        mainNode.addaction(request(ToDown[0], 0, clearDownload));
        timeisend = 0;
        global.timer.addlistener(global.timer.currenttime+99999, self);
        //where to show
        global.castalPage.menu.add(askToDown);
        askToDown.setevent(EVENT_UNTOUCH, showToDown)
        //global.castalPage.menu.add(downloadNode);
    }
    function showDownNow()
    {
        showDown = 1;
        global.castalPage.menu.add(downloadNode);
        askToDown.removefromparent();
    }
    var showDown = 0;
    function showToDown(n, e, p, x, y, points)
    {
        if(showDown == 0)
        {
            global.pushContext(global.context[0], new Warningdialog([global.getStaticString("showDownNow"), ShowDownYet, 6]), 0);
        }
    }
    var progress = null;
    var pronumber = null;
    var showWord = 0;
    /*
    function showDia(n, e, x, y, pos)
    {
        if(showWord == 0)
        {
            downloadNode.addlabel("正在下载图片...", null, 28, FONT_BOLD).pos(0, -40).color(0, 0, 0);
            showWord = 10;
        }
        //global.pushContext(null, new Download(), 0)
    }
    */
    function monBack()
    {
        global.pushContext(null,global.context[0].warmap,0);//NonAutoPop
    }
    function getMonster()
    {
        getDownload(animate, monBack, 2);
    }
    var lastTime = 0;
    var curTime = 0;
    var BlockTime = 700;

    function finDownload(name, force, param)
    {
        ToDown.pop(0);
        while(len(ToDown) > 0)
        {
            var exi = fetch(ToDown[0]);
            if(exi == null)
            {
                trace("download", ToDown[0]);
                Downloading = 1;
                mainNode.addaction(request(ToDown[0], 0, clearDownload));
                break;
            }
            else
            {
                ToDown.pop(0);
            }
        }   
        if(len(ToDown) <= 0)//close download
        {
            notdownload = 0;
            timeisend = 1;
            if(showDown == 0)
                askToDown.removefromparent();
            else
                downloadNode.removefromparent();
            showDown = 0;
            ToDown = [];
            Downloading = 0;
        }
    }
    var timeisend = 0;
    function timerefresh()
    {
        var rate = (totalLen-len(ToDown))*48/totalLen;
        downbar.size(rate, 30);
        showWord -= 1;
        if(showWord < 0 )
            showWord = 0;
        curTime = time();
        if((curTime - lastTime) > BlockTime && Downloading == 0)
        {
            lastTime = curTime;
            Downloading = 1;
            finDownload(null, null, null);
        }
    }
    function update(name, force, param)
    {
    }
    function getPic(name, sp)
    {
        if(notdownload == 1)
            return;
        notdownload = 1;
        var im = fetch(name);
        if(im != null)
        {
            sp.texture(im);
            notdownload = 0;
        }
        else
        {
            mainNode.addaction(request(name, 0, getImage, sp));
        }
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
            }
        }
        if(len(arr) > 0)
            getDownload(arr, finAni, DownAniPic);
    }
    function finAni(n, f, p)
    {
    }
    function getImage(name, force, sp)
    {
        sp.texture(name);
        notdownload = 0;
    }
}
