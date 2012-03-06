class TooManyUser extends ContextObject{
    function TooManyUser(){
        contextname = "dialog-toomany";
        contextNode = null;
    }

    function paintNode(){
        contextNode = sprite("dialogback_expand.png",ARGB_8888).anchor(50,50).pos(400,300);
        contextNode.addsprite("girl1.png").anchor(50,100).pos(0,310).size(191,409);

        contextNode.addlabel("During Beta Testing we are limiting the number of users who can register. Everyday we will open up 100 more registrations. Please try again tomorrow, thanks", null, 25,FONT_BOLD,308,0,ALIGN_LEFT).anchor(0,50).pos(100,120).color(0,0,0,100);
        contextNode.addsprite("boxbutton1.png").anchor(50,50).pos(225,250).setevent(EVENT_UNTOUCH,closedialog);
        contextNode.addlabel("OK", null, 25).anchor(50, 50).pos(225, 250);
        
    }
    function closedialog()
    {
        quitgame();
    }

    function deleteContext(){
        contextNode.removefromparent();
    }
}
