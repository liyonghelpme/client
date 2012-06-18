const MAP_WIDTH = 600;
const MAP_HEIGHT = 360;
var TipShow = 0;
function checkNightBuild(bid)
{
    return bid>=512&&bid<=516 || bid>=542&&bid<=549 || bid >= 567 && bid <= 569;
}
function showTip()
{
    var level = global.user.getValue("level");

    var fp = c_file_open("tipShowYet"+str(ppy_userid()), 1);
    var con = "[0]";
    if(c_file_exist(fp) != 0)
    {
        con = c_file_op(C_FILE_READ, fp);
    }
    var res = json_loads(con);
    if(res == null)
    {
        res = [0];
    }
    var tip = Tips.get(level);

    trace("showTip", level, tip);
    if(tip != null && res[0] == 0 && TipShow == 0)
    {
        TipShow = 1;
        global.castalPage.menu.add(global.castalPage.tipButton);
    }
}
function clearTip()
{
    var fp = c_file_open("tipShowYet"+str(ppy_userid()), 1);
    c_file_op(C_FILE_WRITE, fp, "[0]");
}
function removeTip()
{
    if(TipShow == 1)
    {
        global.castalPage.tipButton.removefromparent();
        var fp = c_file_open("tipShowYet"+str(ppy_userid()), 1);
        c_file_op(C_FILE_WRITE, fp, "[1]");
        TipShow = 0;
    }
}
function CheckSoldiers()
{
    for(var i = 0; i < len(global.soldiers); i++)
    {
        if(global.soldiers[i] < 0 || global.soldiers[i] > MAX_INT/10)
            global.soldiers[i] = MAX_INT/10;
    }
}
function ChangeSoldier(c, value)
{
    global.soldiers[c] += value;
    if(global.soldiers[c] < 0 || global.soldiers[c] > MAX_INT/10)
        global.soldiers[c] = MAX_INT/10;
}
function SetSoldier(c, value)
{
    global.soldiers[c] = value;
    if(global.soldiers[c] < 0 || global.soldiers[c] > MAX_INT/10)
        global.soldiers[c] = MAX_INT/10;
}
function setShotScreen()
{
    global.shotscreen.setevent(EVENT_TOUCH|EVENT_UNTOUCH|EVENT_MULTI_TOUCH|EVENT_MULTI_UNTOUCH|EVENT_MOVE, donothing);
}
function clearShotScreen()
{
    global.shotscreen.setevent(EVENT_TOUCH|EVENT_MOVE|EVENT_UNTOUCH|EVENT_MULTI_TOUCH|EVENT_MULTI_UNTOUCH, null);
}

/*
var CostName = dict([["money", 0], ["personmax", 0]]);
function checkCost(baseObj, cost)
{
    var items = cost.items();
    for(var i = 0; i < len(items); i++)
    {
        if(CostName.get(items[i][0], null) != null)
        {
            global.user.changeValueAnimate(baseObj, items[i][0], -items[i][1], 0);
        }
    }
}
*/

var businessPic = [];

var warpic = [];

var DragonPic = 
["fire-1-2.png", "earth-4-7.png", "earth-3.png", "water-1-7.png", "egg-1-0.png", "egg-2-3.png", "egg-2-2.png", "fire-1-11.png", "fire-2.png", "fire-9.png", "earth-2.png", "earth-1.png", "egg-3-7.png", "earth-f1.png", "egg-3-5.png", "fire-1-10.png", "fire-3.png", "egg-3.png", "fire-4-3.png", "earth-1-13.png", "fire-1-6.png", "fire-1-9.png", "earth-1-2.png", "water-4-9.png", "earth-9.png", "water-1-6.png", "egg-1-3.png", "fire-1-3.png", "water-f1.png", "egg-2.png", "earth-4-4.png", "earth-4-5.png", "water-1-12.png", "water-1-5.png", "water-4-3.png", "water-4-2.png", "earth-1-9.png", "water-4-7.png", "egg-2-0.png", "earth-f2.png", "earth-4-9.png", "water-1-13.png", "earth-4-2.png", "earth-4-6.png", "earth-f4.png", "fire-4-2.png", "water-4-5.png", "earth-4-8.png", "fire-1-8.png", "water-5.png", "egg-3-2.png", "egg-3-3.png", "egg-1.png", "earth-f3.png", "fire-1-4.png", "water-2.png", "water-3.png", "earth-1-1.png", "egg-3-0.png", "earth-1-12.png", "earth-1-8.png", "water-4-6.png", "fire-6.png", "water-f3.png", "fire-f1.png", "water-4.png", "water-1-10.png", "fire-4-8.png", "earth-1-7.png", "earth-1-6.png", "fire-1-12.png", "fire-1-13.png", "fire-1.png", "water-f4.png", "fire-4-9.png", "water-1-4.png", "fire-4-1.png", "fire-4-4.png", "egg-2-1.png", "earth-1-5.png", "water-f2.png", "egg-3-1.png", "earth-5.png", "earth-4.png",
];

const RightMenuAlign = 780;
const MenuY = 140; 
const LeftMenuAlign = 20;
const MenuDifY = 70;

const CASTAL = 0; 
const FARM = 0;
const ROOM = 1;
const CAMP = 2;
const FACT = 3;
const GOD = 4;
const DECORATION = 5;
const STATUE = 6;
const DISK = 7;

const DRAGON = 10;
const EXPAND_ID = 900;
const WARABOUT = 800;


const DRAGON_ID = 1000;
const DISK_ID = 700;


const FINISH_BUILDING = 2;
const BUILDING = 1;
const WORKING = 3;
const FINISH_WORKING = 4;

const ACC_TIME = 1;

const CAMP_INDEX = 2;
const FACT_INDEX = 1;
const FARM_INDEX = 3;
const GOD_INDEX = 4;
const NEST_INDEX = 5;
const ROOM_INDEX = 0;
const STATUE_INDEX = 6;
const DISK_INDEX = 7;

const DECORATION_ID = 500;
const STATUE_ID = 600;


const ACC_BUTTON = 0;
const BLESS_BUTTON = 10;
const CALL_BUTTON = 6;
const CATA_BUTTON = 26;
const PLANT_BUTTON = 3;
const WOOD_BUTTON = 4;
const ROCK_BUTTON = 5;
const DISK_BUTTON = 27;
const INFO_BUTTON = 28;
const UP_BUTTON = 1;
const ONE_STEP_BUTTON = 17;
const SELL_BUTTON = 2;
const GRAY_ACC = 16;
const FEED_BUTTON = 23;
const TRAIN_BUTTON = 19;
const CHANGE_BUTTON = 21;

const EGG_STATE = 3;
const DRAGON_STATE = 4;

//1 1 20 30 20 10 5 5 8
var DiskRewards = [
    [
    dict([["boundary", 1]]), //1
    dict([["caesars", 9]]),//1
    dict([["food", 99]]), //20
    dict([["spe", 1]]), //30
    dict([["money", 999]]), //20
    dict([["dragonStone", 1]]),//10
    dict([["food", 999]]),//5
    dict([["caesars", 1]]),//5
    dict([["money", 9999]]),//8
    ],

    [
    dict([["money", 99]]),
    dict([["food", 999]]),
    dict([["power", 999]]),
    dict([["money", 9]]),
    dict([["food", 99]]),
    dict([["power", 9]]),
    dict([["money", 999]]),
    dict([["food", 9]]),
    dict([["power", 99]]),
    ],
    [
    dict([["money", 99]]),
    dict([["food", 999]]),
    dict([["caesars", 9]]),
    dict([["money", 9999]]),
    dict([["food", 99]]),
    dict([["caesars", 1]]),
    dict([["money", 999]]),
    dict([["food", 9]]),
    dict([["caesars", 99]]),
    ],

];
