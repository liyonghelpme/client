class TextHandle{
    var tlabel;
    function TextHandle(t){
        tlabel = t;
    }
    function update(v){
        if(type(v)==1){
            v=str(v);
        }
        tlabel.text(v);
        return null;
    }
}

class MultiTextHandle{
    var tnode;
    function MultiTextHandle(t){
        tnode = t;
    }
    function update(v){
        if(v==0){
            tnode.remove(0);
            tnode.remove(1);
            tnode.remove(2);
            tnode.remove(3);
        }
        else{
            if(tnode.get(0)==null){
                tnode.add(label("",null,25).anchor(100,100).pos(-2,0).color(0,0,0,100),0,0);
                tnode.add(label("",null,25).anchor(100,100).pos(1,-1).color(0,0,0,100),0,1);
                tnode.add(label("",null,25).anchor(100,100).pos(1,1).color(0,0,0,100),0,2);
                tnode.add(label("",null,25).anchor(100,100).pos(0,0).color(100,0,0,100),0,3);
            }
            tnode.get(0).text(str(v));
            tnode.get(1).text(str(v));
            tnode.get(2).text(str(v));
            tnode.get(3).text(str(v));
       }
        return null;
    }
}
class ExpHandle{
    var expmax;
    var exp;
    var explabel;
    var expfiller
    var user;
    function ExpHandle(el,ef){
        explabel = el;
        expfiller = ef;
    }
    function initdata(u,m){
        user = u;
        expmax = m;
    }
    const MAXLEVEL = 30;
    function update(v){
        exp = v;
        var level = user.getValue("level");
        var flag=0;
        while(exp >= expmax[level]){
            level++;
            flag=1;
            if(level >=30){
                expmax.append((expmax[level-1]-expmax[level-2])*11/10+expmax[level-1]);
            }
        }
            
        explabel.text(str(exp-expmax[level-1])+"/"+str(expmax[level]-expmax[level-1]));
        expfiller.size((exp-expmax[level-1])*FILLER_W/(expmax[level]-expmax[level-1]),FILLER_H);
        if(flag==1){
            user.setValue("level",level);
        }
        return null;
    }
}
class LevelHandle{
    var llabel;
    var flaginit;
    function LevelHandle(l){
        llabel = l;
    }
    function update(v){
        llabel.text("Level "+str(v));
        var cmd = dict();
        cmd.update("name","levup");
        return cmd;
    }
}
class MagicHandle
{
    var bar;
    var lab;
    function MagicHandle()
    {
        
    }
    function update(v)
    {
        var mana = global.user.getValue("mana");
        var boundary = global.user.getValue("boundary");
        if(boundary > 0)
            bar.size(mana*92/boundary, 19);
        lab.text(str(mana)+"/"+str(boundary));
    }
}
class PersonHandle
{
    var label;
    function PersonHandle()
    {
    }
    function update(v)
    {   
        var labor = global.user.getValue("labor");
        var person = global.user.getValue("person");
        var idle = person - labor;
        label.text(str(idle));
    }
}
class PairHandle{
    var plabel;
    var pairname;
    var user;
    function PairHandle(pl,name1,name2){
        plabel = pl;
        pairname = [name1,name2];
    }
    function initdata(u){
        user = u;
    }
    function update(v){
        plabel.text(str(user.getValue(pairname[0]))+"/"+str(user.getValue(pairname[1])));
        return null;
    }
}

class UserController{
    var userinfo;
    var flaginit;
    var handledict;
    var inviteCode = null;
    function prepareCode(obj)
    {
        global.http.addrequest(0, "invite/getInviteCode", ["uid"], [global.userid], obj, "getCode");
    }
    
    function UserController(){
        userinfo = dict();
        handledict = dict();
        flaginit = 1;
        //setValue("hasDisk", 0);
    }
    
    function initText(name,l){
        handledict.update(name,new TextHandle(l));
    }
    
    function initMultiText(name,l){
        var t=new MultiTextHandle(l);
        handledict.update(name,t);
        t.update(getValue(name));
    }
    function initExp(el,ef,ll,user,em){
        var lh = new LevelHandle(ll);
        handledict.update("level",lh);
        var eh = new ExpHandle(el,ef);
        handledict.update("exp",eh);
        eh.initdata(user,em);
    }
    function initMagic(l, bar)
    {
        var mh = new MagicHandle();
        handledict.update("mana", mh);
        handledict.update("boundary", mh);
        mh.bar = bar;
        mh.lab = l;
        //mh.update(null);
    }
    function initPerson(l,user){
        var ph = new PersonHandle();
        ph.label = l;
        handledict.update("labor",ph);
        handledict.update("person",ph);
    }
    
    function getValue(name){
        return userinfo.get(name,0);
    }
    function setValue(name,value){
        if((value==0||value!=getValue(name)) && handledict.get(name)!=null){
            userinfo.update(name,value);
            var ret=handledict.get(name).update(value);
            if(ret!=null && flaginit==0){
                if(name=="level" &&value>3){
                    global.http.addrequest(0,"levup",["uid","lev"],[global.userid,value],global.context[0],"levelup");
                }
                else{
                    global.context[0].addcmd(ret);
                }
            }
        }
        else{
            userinfo.update(name,value);
        }
        var cardindex = -1;
        if(name=="food"){
            cardindex=0;
        }
        else if(name=="money"){
            cardindex=1;
        }
        else if(name=="level"){
            cardindex=4;
        }
        if(cardindex>=0){
            var cnum = allcardlevelnum[cardindex+1];
            var i=0;
            if(cardindex==4){
                if(global.card[18]==4&&value>=40){
                    i=5;
                }
            }
            else{
                for(i=0;i<5;i++){
                    if(value<cnum[i]){
                        break;
                    }
                }
            }
            trace("clevel",i);
            trace("nclevel",global.card[14+cardindex]%10);
            if(i>global.card[14+cardindex]%10){
                global.http.addrequest(0,"changecard",["userid","cardnum","type"],[global.userid,i,cardindex],global.context[0],null);
                var bdict = dict();
                bdict.update("name","getcard");
                bdict.update("cardid",14+cardindex);
                bdict.update("cardlevel",i);
                global.context[0].addcmd(bdict);
                global.card[14+cardindex] = i;
            }
        }
    }
    function setValueInArray(name,index,value){
        trace("SET VA",name,index,value);
        getValue(name)[index] = value;
    }
    function changeValue(name,value){
        var v = getValue(name)+value;
        if(v < 0)
            v = MAX_INT;
        setValue(name,v);
        trace("LOG",name+" changed:"+str(value));
    }
    function changeValueAnimate(ne,key,value,hi){
        if(value==0){
            return 0;
        }
        if(global.task.tasktype==1){
            if(key==global.task.taskreq && value>0){
                var ok=1;
                if(len(global.task.taskpair)!=0){
                    if(global.task.taskpair[0]=="bid" && global.task.taskpair[1]!=ne.objnode.bid){
                        ok=0;
                    }
                    else if(global.task.taskpair[0]=="objid" && global.task.taskpair[1]!=ne.objnode.objid){
                        ok=0;
                    }
                }
                if(ok==1){
                    global.task.inctaskstep(value);
                }
            }
        }
        changeValue(key,value);
        if(ne.contextNode!=null){
            var ps = ne.contextNode.pos();
            trace("changeValueAnimate", ps, ne.contextid);
            var x = ps[0]+ne.contextid*2;
            var y = ps[1]-ne.contextid*17-hi*17;
            var n = node().pos(x,y);
            if(key=="citydefence"){
                n.add(sprite("defence.png").anchor(100,50).pos(-25,0));
            }
            else{
                n.add(sprite("fly"+key+".png").anchor(100,50).pos(-5,0));
            }
            var ns = str(value);
            var f = 0;
            if(value > 0){
                ns = "+"+ns;
                f = 1;
            }
            n.addlabel(ns,null,40).color(100,f*100,0,100).anchor(0,50).pos(5,0);
            n.addaction(sequence(moveby(1000,0,-80),tintto(1000,0,0,0,0),callfunc(removeself)));
            global.context[0].contextNode.add(n.scale(80),20000);
        }
    }
    function changeValueAnimate2(ne,key,value,hi){
        if(value==0){
            return 0;
        }
        changeValue(key,value);
        if(ne==null){
            return 0;
        }
        changeValueAnimate3(ne,key,value,hi);
    }
    function changeValueAnimate3(ne,key,value,hi){
        var ps = ne.node2world(0,0);
        var bn = ne.parent();
        ps = bn.world2node(ps[0],ps[1]);
        var x = ps[0]+ne.size()[0]/2;
        var y = ps[1]-hi*17+ne.size()[1]/2;
        var n = node().pos(x,y);
        n.add(sprite("fly"+key+".png").anchor(100,50).pos(-5,0));
        var ns = str(value);
        var f = 0;
        if(value > 0){
            ns = "+"+ns;
            f = 1;
        }
        //changeValue(key, value);
        n.addlabel(ns,null,40).color(100,f*100,0,100).anchor(0,50).pos(5,0);
        n.addaction(sequence(moveby(1000,0,-80),tintto(1000,0,0,0,0),callfunc(removeself)));
        bn.add(n.scale(80),20000);
    }
    
    function testCost(cost){
        var items = cost.items();
        var buildable = dict([["ok",1]]);
        for(var i=0;i<len(items);i++){
            var key = items[i][0];
            var value = items[i][1];
            var cmpvalue = 0;
            if(key == "ok")
                continue;
            if(key == "special")
            {
                var speItems = value.items();
                for(var j = 0; j < len(speItems); j++)
                {
                    if(global.special[speItems[j][0]] < speItems[j][1])
                    {
                        buildable.update("ok", 0);
                        buildable.update(GIFTNAME[speItems[j][0]], speItems[j][1]-global.special[speItems[j][0]]);
                    }
                }
            }
            else
            {
                if(key == "friend")
                {
                    if(len(global.ppyuserdict) - 2- value < cmpvalue)
                    {
                        buildable.update("ok", 0);
                        buildable.update("好友", value+cmpvalue-len(global.ppyuserdict)+2);
                    }
                }
                else {
                    if(key=="labor" || key=="person"){
                        key = "person";
                        cmpvalue = getValue("labor");
                    }
                    if(getValue(key)-value<cmpvalue){
                        buildable.update("ok",0);
                        buildable.update(global.getStaticString(items[i][0]),value+cmpvalue-getValue(key));
                    }
                }
            }
        }
        trace("buildable", buildable);
        if(buildable.get("ok")==1){
            return 1;
        }
        else if(cost.get("mana") != null){
            global.pushContext(null, new MagicWarning(), NonAutoPop);

            return 0;
        }
        else if(cost.get("caesars") != null)
        {
            global.pushContext(null, new CaeWarning(), NonAutoPop);
            return 0;
        }
        else
        {
            global.pushContext(null,new Warningdialog(buildable),NonAutoPop);
            return 0;
        }
    }
}
