class ContextObject{
    var contextLevel;
    var contextNode = null;
    var contextname;
    var self;
    function ContextObject(){
        //trace("context object init", contextname);
        //contextname = "not init";
        //contextNode = null;
        self = this;
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
    }
    function response(p){
        //trace("response to p", p);
        if(p!=null){
            self.reloadNode(p);
        }
    }
}
