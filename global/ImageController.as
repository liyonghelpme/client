    //"downStart.png", "actPlant.png", "actIntro.jpg", "foodRank.jpg", "rewardCup.png", 
class ImageController{
    const images1 = [
    "disk0.png", "diskback.jpg", "dragonDisk.png", "dragonhead.png", "opbutton27.png", "opbutton28.png"];
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
