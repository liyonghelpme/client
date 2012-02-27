import global.INCLUDE;

var myid;
if(ppy_connected()!=1){
    ppy_login();
}
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
        if(global.currentLevel>=0&&global.system.flagmusic == 1)
            global.system.music.pause();
        if(global.context[0].initlock==-1){
            global.context[0].pause();
            ispause=1;
        }
    }

    function onresumefunc(){
        if(global.currentLevel>=0&&global.system.flagmusic == 1)
            global.system.music.play(-1);
        if(ispause==1){
            ispause = 0;
            global.context[0].resume();
        }
    }

var castle = new CastlePage();
global.pushContext(null,castle,NonAutoPop);
castle.initialMenu();
global.screen.visible(0);

var flaglogin = 0;
var flaglastimage = 0;

var percent =0;
var backNode = node().size(800, 480).setevent(EVENT_TOUCH,donothing);
var black = backNode.addsprite("dark.png").size(800, 480);
var tar = backNode.addsprite().anchor(50, 50).pos(400, 240);
var src = backNode.addsprite().anchor(50,50).pos(400,240);

//var page = sprite().setevent(EVENT_TOUCH,donothing).anchor(50,50).pos(400,240);
var lpng = "loadingback.jpg";
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
var allTex = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"];
for(var t = 0; t < len(allTex); t++)
{
    if(fetch(allTex[t]) == null)
    {
        node().addaction(request(allTex[t],1,null));
    }
}


var curTex = 0;
var oneceMax = 0;
var percentmax = 0;
    function loading(timer){
        if(percent == 100){
            if(backNode.get() < 3)
            {
                curTime += 1;
                src.texture(allTex[curTex]);
                tar.texture(allTex[(curTex+1)%len(allTex)]);
                if(curTime == 4 && oneceMax == 0 && curTex < (len(allTex)-1))
                {
                    src.addaction(fadeout(2000));
                    tar.addaction(fadein(2000));
                }
                if(curTime >= 8)
                {
                    curTime = 0;
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
            if(backNode.get() < 3)
            {
                backNode.remove(1); 
                backNode.remove(2);
                if(oneceMax == 1)
                {
                    timer.stop();
                    global.context[0].initialControls();
                    backNode.removefromparent();
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
