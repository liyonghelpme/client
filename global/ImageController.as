    //"downStart.png", "actPlant.png", "actIntro.jpg", "foodRank.jpg", "rewardCup.png", 
    //"heart.png", "heartPlus.png", "rankHeart.jpg",
class ImageController{
    /*
    const images1 = [
        "buyIn.png", "close.png", "coinTradeSel.png", "coinTradeUn.png", 
        "dockGoods.png", "foodTradeSel.png", "foodTradeUn.png", "empire4_ln.png", 
        "sel.png", "sellOut.png", "ship0.png", "ship1.png", "ship2.png", "shipHouse.png",
        "shipTip.png", "trade.png",
        "skip4.png",
        "MonRank.png", "MonAct.png",
        //"foodAct.png", "foodRank.jpg",
    ];
    */
    const images1 = ["buyIn.png"];
    /*
    "disk0.png",  "build606.png", "build607.png", "room81.png", "room82.png","room83.png","room84.png",
    "room85.png","room86.png",
    "fact33.png", "fact34.png", "fact35.png", "fact36.png", "fact37.png",
    "fact38.png",
    "warback.png", "loadingwarback.jpg",
    "cross.png", "mail.png", "MonAct.png", "MonRank.jpg", "expDisk.png", "drum2.png"
    ];
    */
    //"disk0.png", "diskback.jpg", "dragonDisk.png", "dragonhead.png", "opbutton27.png", "opbutton28.png", "drum.png", "caeDisk.png", "powDisk.png", "changeDisk.png", "object67.png", "object67_l.png", "object68.png", "object68_l.png", "object69.png", "object69_l.png"];
    const images2 = ["help.png"];
    var images;
    var imageindex;
    var imagemax;
    var flagtime;
    var needloading;
    function ImageController(){
        needloading=-1;
        node().addaction(request("build600.png",1,null));
        node().addaction(request("build601.png",1,null));
    }
    function begindownload(i){
        if(i==1){
            images=images1;
        }
        else if(i==2){
            images=images2;
        }
        needloading=0;
        imagemax = len(images);
        imageindex = 0;
        flagtime=0;
        checkimages(0,0,0);
    }
    function checkimages(s,f,p){
        while(imageindex<imagemax&&checkimage(images[imageindex])==1){
            imageindex++;
            flagtime=0;
        }
    }
    
    function checkimage(str){
        var im=fetch(str);
        if(im!=null){
            im=null;
            return 1;
        }
        else{
            node().addaction(request(str,1,checkimages));
            needloading=1;
            imageindex++;
            return 0;
        }
    }
    
    function isdownloadfinish(){
        if(needloading==-1 || imageindex==imagemax){
            return 1;
        }
        return 0;
    }
}
