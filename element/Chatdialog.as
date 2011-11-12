class Chatdialog extends ContextObject{
    var lock;
    var web;
    var warning;
    var element;
    var dialog;
    var nest;

    function Chatdialog(n){
        contextname = "dialog-rename";
        contextNode = null;
        element = null;
        lock =0;
        nest = n;
    }
    
    function getelement(){
        if(element == null){
            element = node();
            element.addsprite("renamepic.jpg").pos(17,42);
            element.add(label(global.getStaticString("text_message_send"),null,20).pos(136,65).color(0,0,0,100),1,10);
            //element.addsprite("renameelement.jpg").pos(136,110);
            web = v_create(V_INPUT_VIEW,333,193,236,120);
            v_root().addview(web);
            
        }
        return element;
    }

    function paintNode(){
        dialog = new Simpledialog(1,self);
        dialog.init(dialog,global);
        contextNode = dialog.getNode();
        dialog.usedefaultbutton(2,[global.getStaticString("send"),global.getStaticString("cancel")]);
    }
    

    function excute(p){
        if(lock == 0){
            lock = 1;
            var t = web.text();
            var l = len(t);
            var st = uri_encode(t);
            var ul = len(st);
            l = l-(ul - l)/6;
            if(l>120){
                element.get(10).text(global.getFormatString("text_wordlimit_format",["[NUM]","60"])).color(100,0,0,100);
                lock=0;
                return 0;
            }
            else if(l==0){
                element.get(10).text(global.getStaticString("text_empty")).color(100,0,0,100);
                lock=0;
                return 0;
            }
            web.visible(0);
            contextNode.visible(0);
            global.http.addrequest(1,"sendMsg",["uid", "fid", "msg"],[global.userid,nest,t],self,"renameover");
        }
    }
    
    function useaction(p,rc,c){
        if(p=="renameover"){
            renameover(0,rc,c);
        }
    }
    
    function renameover(r,rc,c){
        global.popContext(null);
        if(rc != 0 && json_loads(c).get("id") == 1){
            global.pushContext(null,new Warningdialog([global.getStaticString("message_send_success"),null,6]),NonAutoPop);
        }
        else{
            global.pushContext(null,new Warningdialog([global.getStaticString("text_chat_nettimeout"),null,6]),NonAutoPop);
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