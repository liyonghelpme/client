//import global.GlobalController;
import global.INCLUDE;
class ContextObject{
    var global;
    var contextLevel;
    var contextNode = null;
    var contextname;
    var self;
    function ContextObject(){
        //trace("context object init", contextname);
        //contextname = "not init";
        //contextNode = null;
        //trace("main context ", contextname);
    }
    function getNode(){
        if(contextNode == null){
            self.paintNode();
        }
        return contextNode;
    }
    function init(s,g){
        //trace("initnode", s, g);
        self = s;
        global = g;
    }
    function response(p){
        //trace("response to p", p);
        if(p!=null){
            self.reloadNode(p);
        }
    }
}
