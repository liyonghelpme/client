function CheckSoldiers()
{
    for(var i = 0; i < len(global.soldiers); i++)
    {
        if(global.soldiers[i] < 0)
            global.soldiers[i] = MAX_INT;
    }
}
function ChangeSoldier(c, value)
{
    global.soldiers[c] += value;
    if(global.soldiers[c] < 0)
        global.soldiers[c] = MAX_INT;
}
function SetSoldier(c, value)
{
    global.soldiers[c] = value;
    if(global.soldiers[c] < 0)
        global.soldiers[c] = MAX_INT;
}

function colorWords(str, width, ew)
{
    var words = str.split(" ");
    var lines = [];
    var sum = 0;
    var l = "";
    for(var i = 0; i < len(words); i++)
    {
        sum = len(l) + len(words[i])+1;
        if(sum*ew > width)
        {
            lines.append(l);
            l = words[i];
            sum = 0;
        }
        else
        {
            l += " "+words[i]; 
        }
    }
    lines.append(l);
    return lines;
}
var Wordtex = null;
function showWord(text)
{
    if(global.currentLevel == InCastalPage && Wordtex == null)
    {
        Wordtex = global.dialogscreen.addlabel(text, null, 30).pos(screenWidth/2, screenHeight/2).anchor(50, 50).color(100, 0, 100, 100);
        Wordtex.addaction(sequence(fadeout(3000), callfunc(rm)));
    }
    function rm()
    {
        Wordtex.removefromparent();
        Wordtex = null;
    }
}
