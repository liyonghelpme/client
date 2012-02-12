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


