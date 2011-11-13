import global.GlobalController;
class ContextObject{
    var global;
    var contextLevel;
    var contextNode;
    var contextname;
    var self;
    function ContextObject(){
        trace("context object init", contextname);
        contextNode = null;
    }
    function getNode(){
        if(contextNode == null){
            trace("getNode paint");
            self.paintNode();
        }
        return contextNode;
    }
    function init(s,g){
        trace("initnode", s, g);
        self = s;
        global = g;
    }
    function response(p){
        trace("response to p", p);
        if(p!=null){
            self.reloadNode(p);
        }
    }
}
