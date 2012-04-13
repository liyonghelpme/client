class TestInputControl extends ContextObject{
    var lock;
    var web;
    var warning;
    var element;
    var dialog;

    function TestInputControl(){
        contextname = "dialog-rename";
        contextNode = null;
        element = null;
        lock =0;
    }
    
    function getelement(){
        if(element == null){
            element = node();
            element.addsprite("renamepic.jpg").pos(17,42);
            element.addlabel(global.getStaticString("text_empirename"),null,20).pos(136,85).color(0,0,0,100);
            //element.addsprite("renameelement.jpg").pos(136,110);
            web = v_create(V_INPUT_VIEW,333,222,236,60);
            v_root().addview(web);
            web.text(global.user.getValue("cityname"));
            
            warning = element.addlabel("",null,16).pos(136,160).color(100,0,0,100);
        }
        return element;
    }

    function paintNode(){
        dialog = new Simpledialog(1,self);
        dialog.init(dialog,global);
        contextNode = dialog.getNode();
        dialog.settitle("renametitle.png");
        dialog.usedefaultbutton(2,[global.getStaticString("change"),global.getStaticString("cancel")]);
        if(global.flagnew == 1){
            contextNode.get(1).setevent(EVENT_UNTOUCH,null);
        }
    }
    

    function excute(p){
        if(lock == 0){
            lock = 1;
            var t = web.text();
            var l = len(t);
            var st = uri_encode(t);
            var ul = len(st);
            l = l-(ul - l)/6;
            if(l>14){
                warning.text(global.getFormatString("text_wordlimit_format",["[NUM]","14"]));
                lock=0;
                return 0;
            }
            if(t==""|| t == DEFAULT_NAME || t==global.user.getValue("cityname")){
                warning.text(global.getStaticString("text_cannotset"));
                lock = 0;
                return 0;
            }
            web.visible(0);
            contextNode.visible(0);
            global.http.addrequest(1,"changename",["userid","newname"],[global.userid,t],self,"renameover");
        }
    }
    
    function useaction(p,rc,c){
        if(p=="renameover"){
            renameover(0,rc,c);
        }
    }
    
    function renameover(r,rc,c){
        contextNode.visible(1);
        web.visible(1);
        if(rc != 0 && json_loads(c).get("id") == 1){
            var t = web.text();
            global.user.setValue("cityname",t);
            global.popContext(null);
            if(global.flagnew == 1){
                global.newcontext.getNode().visible(1);
                global.newcontext.nextstate(0,0);
                global.user.changeValueAnimate2(global.context[0].ub,"exp",5,-6);
            }
        }
        else{
            warning.text(global.getStaticString("text_nettimeout"));
        }
        lock = 0;
    }

    function closedialog(node,event){
        if(global.flagnew == 0)
            global.popContext(null);
    }

    function deleteContext(){
        contextNode.removefromparent();
        web.removefromparent();
    }
}
