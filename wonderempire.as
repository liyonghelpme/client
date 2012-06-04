import global.INCLUDE;

var myid;
/*
if(ppy_connected()!=1){
    ppy_login();
}
*/
//global.papaId = ppy_userid();
trace("papayaid", global.papaId);
if(global.papaId == 0 ||  global.papaId == null)
    ppy_login();

global.self = global;
global.user = new UserController();

global.system = new MenuControl();
global.system.initwithconfig();
global.system.pushmusic("0.mp3");
global.http = new HttpController();
global.http.init(global.http,global);
//initial task
global.task = new TaskController();
global.task.init(global.task,global);
global.wartask = new WarTaskController();
global.wartask.init(global.wartask,global);
global.image = new ImageController();

trace("init over");
v_scale(800,480);
var ispause = 0;
export("onpause",onpausefunc);
export("onresume",onresumefunc);
    function onpausefunc(){
        /*
        if(global.currentLevel>=0&&global.system.flagmusic == 1)
            global.system.music.pause();
        */
        if(global.context[0].initlock==-1){
            //global.context[0].pause();
            ispause=1;
        }
    }

    function onresumefunc(){
        /*
        if(global.currentLevel>=0&&global.system.flagmusic == 1)
            global.system.music.play(-1);
        */
        if(ispause==1){
            ispause = 0;
            //global.context[0].resume();
        }
    }

var castle = new CastlePage();
global.pushContext(null,castle,NonAutoPop);
castle.initialMenu();
global.screen.visible(0);

var flaglogin = 0;
var flaglastimage = 0;

var percent =0;
var backNode = node().size(800, 480).setevent(EVENT_TOUCH,donothing, "backNode");
var black = backNode.addsprite("dark.png").size(800, 480);
var tar = backNode.addsprite().anchor(50, 50).pos(400, 240);
var src = backNode.addsprite().anchor(50,50).pos(400,240);
var next = sprite("skip4.png").anchor(50, 50).pos(713, 436);

//var page = sprite().setevent(EVENT_TOUCH,donothing).anchor(50,50).pos(400,240);
var lpng = "loading_new.jpg";
var lback = fetch(lpng);
var loadingstr = "";
if(lback==null){
    src.texture("loadingback.jpg");
    node().addaction(request(lpng,1,null));
}
else{
    src.texture(lpng);
}

global.dialogscreen.add(backNode,0);
backNode.add(label(loadingstr+"0%",null,25).anchor(50,100).pos(400,440),0,1);
var loadbar = fetch("loadingbar.png")
if(loadbar == null)
{
    loadbar = sprite("loadingbar.png").pos(0,450).size(1,12);
    backNode.add(loadbar,0,2);
    node().addaction(request("loadingbar.png", 1, null));
}
else
{   
    backNode.add(sprite("loadingbar.png").pos(0,450).size(1,12),0,2);
}
c_invoke(beginLoading,1000,null);

function beginLoading(){
    c_addtimer(500,loading);
    global.image.begindownload(1);
    castle.initialFactorys(backNode);
    //fetch 1000 pictures 
    spriteManager.getAllPic();
}

function setlogin(){
    flaglogin=0;
}

var curTime = 0;
var allTex = ["1.jpg", "2.jpg", "4.jpg", "3.jpg", "5.jpg"];
for(var t = 0; t < len(allTex); t++)
{
    if(fetch(allTex[t]) == null)
    {
        node().addaction(request(allTex[t],1,null));
    }
}


var curTex = 0;
var oneceMax = 0;
var NewPicTime = 2000;
var SwitchTime = 4;
var TotalTime = 10;
var touchYet = 0;
function touchBegan(n, e, p, x, y, points)
{
    trace("touch", next);
    //touchYet = 1;
    src.texture(allTex[curTex]);
    tar.texture(allTex[(curTex+1)%len(allTex)]);
    src.addaction(fadeout(NewPicTime));
    tar.addaction(fadein(NewPicTime));
    curTex += 1;
    if(curTex >= (len(allTex)))
    {
        next.setevent(EVENT_TOUCH, null);
        curTex = len(allTex)-1;
        oneceMax = 1;
        //timer.stop();
        //global.context[0].initialControls();
        //backNode.removefromparent();
        tar = null;
        src = null;
        next.setevent(EVENT_TOUCH, null);
        next.removefromparent();
        next = null;
    }
    else
    {
        var temp = src;
        src = tar;
        tar = temp;
    }
}
var setNext = 0;
var percentmax = 0;
    function loading(timer){
        if(percent == 100){
            //trace("next Button", next, src, tar, oneceMax);
            //完成加载之后， 设置用户当前的新手状态
            /*
            if(backNode.get() < 3 && touchYet == 1)
            {
                touchYet = 0;
                //curTime += 1;
                src.texture(allTex[curTex]);
                tar.texture(allTex[(curTex+1)%len(allTex)]);
                //curTime == SwitchTime &&
                if(oneceMax == 0 && curTex < (len(allTex)-1))
                {
                    src.addaction(fadeout(NewPicTime));
                    tar.addaction(fadein(NewPicTime));
                }
                //if(curTime >= TotalTime)
                {
                    //curTime = 0;
                    curTex += 1;
                    if(curTex == (len(allTex)-1))
                        oneceMax = 1;
                    if(curTex >= len(allTex))
                    {
                        curTex = len(allTex)-1;
                        oneceMax = 1;
                    }
                    else
                    {
                        var temp = src;
                        src = tar;
                        tar = temp;
                    }
                }
            }
            */
            if(backNode.get() < 3)
            {

                if(oneceMax == 1)
                {
                    trace("finish Show");
                    //next.setevent(EVENT_TOUCH, null);
                    //next.removefromparent();
                    timer.stop();
                    global.context[0].initialControls();
                    backNode.removefromparent();
                }
                else if(setNext == 0)
                {
                    setNext = 1;
                    backNode.remove(1); 
                    backNode.remove(2);
                    //next.visible(1);
                    next.setevent(EVENT_TOUCH, touchBegan);
                    src.texture(allTex[curTex]);
                    //touchBegan(null, null, null, null, null, null);
                    getscene().add(next, 10000);
                    //backNode.setevent(EVENT_TOUCH, null);
                }
            }
            else
            {
                timer.stop();
                global.context[0].initialControls();
                backNode.removefromparent();
            }
        }

        if(castle.initlock == 0 && flaglogin==0 && global.image.isdownloadfinish()==1){
            if(percentmax<81){
                if(global.user.getValue("nobility")>=0){
                    global.image.begindownload(2);
                }
                percentmax=81;
                global.screen.visible(1);
            }
            else{
                flaglogin=1;
                percentmax = 100;
            }
        }
        if(percent < 100 && global.http.flag_netstate==0){
            percent = percent+5+rand(5);
            var tmp=percentmax;
            if(percentmax<80){
                percentmax=(global.image.imageindex)*80/global.image.imagemax;
            }
            else if(percentmax>=81&&percentmax<100){
                percentmax=81+(global.image.imageindex)*18/global.image.imagemax;
            }
            if(global.image.needloading==1){
                if(percentmax>tmp){
                    loadingstr="loading...";
                }
                global.image.flagtime++;
                if(global.image.flagtime==27){
                    global.image.checkimages(0,0,0);
                    loadingstr = "if progressbar blocked, press back to restart game...";
                }
            }
        }
        else if(global.http.flag_netstate!=0){
            percent = percent;
        }
        if(percent>percentmax){
            percent = percentmax;
        }
        if(backNode.get(1) != null)
        {
            backNode.get(1).text(loadingstr+str(percent)+"%");
            backNode.get(2).size(8*percent,12);
        }
    }
