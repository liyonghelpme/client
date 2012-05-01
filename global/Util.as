var TipShow = 0;
function showName(name)
{
    var newName = "";
    /*
    var start = 0;
    var countWord = 0;
    var hanZi = 0;
    for(var i = 0; i < len(name) && countWord < 4; i++)
    {
        if(name[i] & 0x80 != 0)//first char of HanZi
        {
            start = 1;
            hanZi = 1;
        }
        else if(start == 1 && hanZi == 2)//third char of HanZi
        {
            start = 0;
            countWord++;
        }
        else if(start == 1)//read Char
            hanZi++;
        else
            countWord++;
    }
    */
    if(len(name) > 6)
        newName = substring(name, 0, 6)+"..";
    else
        newName = name;
    return newName;
}
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
function setShotScreen()
{
    global.shotscreen.setevent(EVENT_TOUCH|EVENT_UNTOUCH|EVENT_MULTI_TOUCH|EVENT_MULTI_UNTOUCH|EVENT_MOVE, donothing);
}
function clearShotScreen()
{
    global.shotscreen.setevent(EVENT_TOUCH|EVENT_MOVE|EVENT_UNTOUCH|EVENT_MULTI_TOUCH|EVENT_MULTI_UNTOUCH, null);
}


var businessPic =  ["expDisk.png", "disk0.png", "diskback.jpg", "dragonDisk.png", "dragonhead.png", "caeDisk.png", "powDisk.png", "changeDisk.png", "room63.png", "plant_fail.png", "object49.png", "nobi2.png", "object43_l.png", "monster_2_3.png", "opbutton5.png", "plant4_3.png", "room25.png", "room17.png", "room33.png", "plant8_3.png", "object18.png", "camp1.png", "monster_5_2.png", "plant12_3.png", "plant3_4.png", "room7.png", "gift2.png", "room44.png", "plant11_3.png", "soldier3_2.png", "plant9.png", "plant3_3.png", "object58.png", "personfail.png", "room35.png", "room34.png", "monster_1_1.png", "plant4_4.png", "room30.png", "monster_8_2.png", "object14_l.png", "monster_5_1.png", "object54.png", "room29.png", "room27.png", "object16.png", "object42.png", "monster_6_1.png", "object26.png", "object14.png", "room39.png", "monster_2_2.png", "object23.png", "monster_10_2.png", "room22.png", 
];

/*
"object65.png", "room32.png", "gift8.png", "plant12_4.png", "plant7_3.png", "monster_12_1.png", "factfail.png", "room28.png", "medalcard1_2.png", "blessing8.png", "room53.png", "monster_4_3.png", "monster_12_3.png", "medalcard5_1.png", "monster_12_2.png", "object21.png", "room54.png", "plant11.png", "opbutton13.png", "gift4.png", "room68.png", "object51.png", "soldier3_3.png", "fact27.png", "room45.png", "dialogback_warabout.png", "plant9_3.png", "room5.png", "attack.png", "shen25.png", "build602.png", "medalcard0_2.png", "medalcard0_1.png", "camp4.png", "object30.png", "defence_bubble.png", "object62.png", "opbutton15.png", "object11.png", "plant7_4.png", "plant5_over.png", "medalcard1_3.png", "monster_14_1.png", "object13.png", "selclose.png", "monster_4_2.png", "plant10_4.png", "defenceback.jpg", "nobattletab1.png", "object46.png", "object32.png", "monster_1_3.png", "room13.png", "warabout0.png", "room37.png", "watch.png", "zzz1.png", "room16.png", "soldierfail.png", "plant7.png", "monster_14_4.png", "object12_l.png", "blessing1.png", "monster_5_3.png", "moveback.png", "soldier2_2.png", "soldier2_3.png", "plant10_3.png", "fact2.png", "dialogback_attack.png", "shen20.png", "warmenutab0.png", "gift5.png", "object24.png", "object44.png", "plant5_4.png", "monster_6_3.png", "selopen.png", "object13_l.png", "fact18.png", "monster_10_3.png", "petrenamepic.jpg", "room20.png", "room14.png", "blessing3.png", "room40.png", "medalcard2_2.png", "object45_l.png", "warmenulistback.png", "room58.png", "dialogelement_state1.png", "room4.png", "object47_l.png", "room2.png", "monster_13_1.png", "gift6.png", "blessing9.png", "plant_2.png", "plant7_over.png", "room60.png", "object41.png", "object59.png", "plant5_3.png", "object29.png", "room49.png", "room26.png", "monster_13_3.png", "monster_8_1.png", "monster_15_1.png", "object44_l.png", "monster_13_2.png", "camp2.png", "blessing7.png", "nobi1.png", "plant10_over.png", "moveblock.png", "camp9.png", "wood.png", "soldier3_1.png", "plant6_4.png", "object17.png", "object37.png", "room72.png", "loadingbar2.png", "room66.png", "fact15.png", "cataStone.png", "object60.png", "object48.png", "room69.png", "object16_l.png", "object50.png", "build604.png", "personboard.png", "opbutton4.png", "dialogtab_warabout0.png", "warchatbutton1.png", "zzz3.png", "blessing5.png", "object20.png", "object49_l.png", "room56.png", "object47.png", "object28.png", "defence_head.png", "object38.png", "monster_11_2.png", "monster_12_4.png", "room67.png", "plant11_4.png", "room78.png", "room11.png", "object63.png", "monster_3_2.png", "object66.png", "object39.png", "room48.png", "catasel.png", "dialogelement_military2.png", "gift12.png", "dialogelement_military1.png", "medalcard1_1.png", "plant10.png", "monster_3_3.png", "gift7.png", "medalcard5_3.png", "fact12.png", "room8.png", "room75.png", "spytab1.png", "nobattletab0.png", "monster_14_3.png", "monster_11_3.png", "plant9_4.png", "monster_15_2.png", "blessing2.png", "object46_l.png", "blessing4.png", "room59.png", "plant9_over.png", "dialogelement_state2.png", "room55.png", "plant8_over.png", "monster_4_1.png", "monster_11_1.png", "object12.png", "object33.png", "room38.png", "monster_8_3.png", "room24.png", "gift10.png", "camp11.png", "cataunsel.png", "new2.png", "nobi0.png", "build603.png", "0.mp3", "plant6_over.png", "warlostleft.jpg", "medalcard0_3.png", "warmenutab1.png", "monster_1_2.png", "plant8.png", "object36.png", "dialogtab_warabout1.png", "object56.png", "monster_2_1.png", "warchatbutton.png", "object25.png", "fact21.png", "object64.png", "room42.png", "plant3_over.png", "room31.png", "fact24.png", "object19.png", "fact1.png", "plant12.png", "object53.png", "monster_14_2.png", "avatar_caesar.png", "build605.png", "gift1.png", "room43.png", "room46.png", "room47.png", "medalcard5_2.png", "monster_9_2.png", "room19.png", "gift3.png", "plant8_4.png", "object48_l.png", "monster_10_1.png", "pic0.png", "title.png", "log.png", "warchatbutton4.png", "train.png", "monster_6_2.png", "camp5.png", "room41.png", "camp8.png", "fact5.png", "monster_9_3.png", "object43.png", "object40.png", "room36.png", "object42_l.png", "object45.png", "object55.png", "fact4.png", "plant4_over.png", "room10.png", "monster_9_1.png", "monster_7_2.png", "zzz2.png", "addCatapult.png", "object34.png", "camp7.png", "soldier2_1.png", "warchatbutton2.png", "monster_7_3.png", "room57.png", "monster_3_1.png", "devineback.jpg", "room51.png", "room50.png", "medalcard2_1.png", "medalcard2_3.png", "monster_13_4.png", "object27.png", "object22.png", "object31.png", "gift9.png", "warabout1.png", "room1.png", "room23.png", "warloseelement.jpg", "object52.png", "plant12_over.png", "plant11_over.png", "camp10.png", "blessing6.png", "warchatbutton3.png", "monster_7_1.png", "gift11.png", "plant6_3.png", "build601.png", "room52.png", "object35.png", "warloseelement2.jpg", "fact22.png", "rain6.png", "monster_20_2.png", "opbutton25.png", "monster_21_1.png", "shen28.png", "wood1.png", "wrbutton0.png", "shen21.png", "opbutton19.png", "room61.png", "stone2.png", "monster_29_dead.png", "monster_20_3.png", "monster_18_dead.png", "opbutton21.png", "monster_31_3.png", "shen26.png", "monster14.png", "yan11.png", "yan10.png", "monster_26_1.png", "shen5.png", "rain1.png", "medalcard1_4.png", "monster_19_2.png", "shen16.png", "monster23.png", "shen15.png", "fact32.png", "opbutton17.png", "opbutton18.png", "shen11.png", "yan17.png", "monster_31_1.png", "yan13.png", "rain2.png", "monster_16_1.png", "room74.png", "medalcard5_5.png", "monster_23_dead.png", "fact31.png", "monster_33_1.png", "yan1.png", "monster_28_2.png", "wood3.png", "fact29.png", "medalcard1_5.png", "monster22.png", "room64.png", "yan7.png", "monster_25_3.png", "monster_34_dead.png", "monster_19_dead.png", "monster_28_4.png", "monster_18_2.png", "monster_18_3.png", "shen23.png", "monster12.png", "room70.png", "room71.png", "monster_24_3.png", "shen24.png", "shen14.png", "shen18.png", "monster_20_1.png", "monster_18_1.png", "monster_20_dead.png", "monster_29_2.png", "monster_17_3.png", "monster_22_2.png", "wrbutton1.png", "yan12.png", "monster_30_3.png", "rain3.png", "medalcard5_4.png", "monster21.png", "monster_31_dead.png", "monster_28_dead.png", "room73.png", "monster_33_2.png", "monster_34_1.png", "fact8.png", "monster_32_dead.png", "monster_28_3.png", "wood2.png", "monster_30_2.png", "monster_22_dead.png", "fact14.png", "monster_34_3.png", "monster_26_dead.png", "fact17.png", "monster_25_2.png", "fact25.png", "monster_33_3.png", "monster_24_dead.png", "monster_21_3.png", "monster_29_4.png", "medalcard0_4.png", "monster_35_3.png", "monster_23_3.png", "monster_27_4.png", "medalcard2_5.png", "medalcard2_4.png", "room65.png", "opbutton12.png", "fact23.png", "yan4.png", "stone4.png", "woodover.png", "monster_32_2.png", "yan14.png", "monster02.png", "monster_29_1.png", "wood5.png", "monster_35_dead.png", "monster_24_1.png", "fact28.png", "shen10.png", "monster_23_1.png", "monster_27_2.png", "monster_27_3.png", "yan9.png", "room79.png", "yan6.png", "opbutton10.png", "room80.png", "yan2.png", "opbutton14.png", "empire3_l.png", "monster11.png", "monster_17_1.png", "monster13.png", "monster_26_2.png", "monster_29_3.png", "monster_16_3.png", "stone3.png", "monster_27_1.png", "stone.png", "empire3.png", "monster_27_dead.png", "monster_24_2.png", "monster_28_1.png", "monster_21_2.png", "monster_34_2.png", "medalcard0_5.png", 
];
*/


/*
"rain5.png", "room62.png", "fact11.png", "shen17.png", "monster_25_1.png", "monster_26_3.png", "monster_19_3.png", "monster_15_3.png", "shen22.png", "shen8.png", "monster_21_dead.png", "nobi3.png", "monster_22_3.png", "monster_31_2.png", 
"monster03.png", "empire2.png", "wood4.png", "fact13.png", "shen13.png", "fact20.png", "stone6.png", "nobi4.png", "fact7.png", "shen29.png", "monster_25_dead.png", "monster_16_2.png", "monster_30_dead.png", "room76.png", "stone5.png", "fact26.png", "monster_32_3.png", "yan15.png", "yan5.png", "shen6.png", "shen7.png", "fact10.png", "shen12.png", "shen19.png", "room77.png", "fact19.png", "resourcefail.png", "shen27.png", "shen9.png", "monster_32_1.png", "monster_17_2.png", "monster_23_2.png", "shen4.png", "stoneover.png", "empire2_l.png", "monster_30_1.png", "rain4.png", "fact16.png", "monster_19_1.png", "yan3.png", "monster_35_2.png", "yan16.png", "yan8.png", "monster_33_dead.png", "stone1.png", "monster01.png", "monster_22_1.png", "wood6.png", "monster_35_1.png"] ;
*/

var warpic = [];
/*
["loadingwarback.jpg", "warback.png", "mapempirelv7.png", "battle2.png", "animate_enemy_left_0_4.png", "warinfotab10.png", "monsteravatar1.jpg", "monsteravatar6.jpg", "nobi7.png", "animate_enemy_left_2_2.png", "warrecordcell.png", "animate_enemy_left_1_3.png", "mapobj3lv3.png", "animate_enemy_1_2.png", "animate_enemy_left_0_5.png", "animate_self_left_0_11.png", "animate_enemy_left_0_6.png", "animate_self_left_2_1.png", "animate_enemy_1_1.png", "warbutton01.png", "animate_self_2_2.png", "battle5.png", "animate_self_left_0_10.png", "animate_self_left_0_13.png", "animate_self_left_2_2.png", "spytab0.png", "nobi16.png", "status.png", "3.mp3", "animate_self_left_0_4.png", "mapempirelv7_self.png", "animate_enemy_left_1_4.png", "mapobj3lv2.png", "battle6.png", "attackelement.jpg", "warinfotab11.png", "move2-2.png", "warbutton11.png", "android.png", "warwinelement.jpg", "spyelement1.png", "warbutton20.png", "move3-4.png", "battle4.png", "throw2-2.png", "animate_enemy_left_2_4.png", "animate_enemy_left_0_13.png", "animate_enemy_left_0_12.png", "animate_self_left_0_3.png", "mapempirelv6.png", "animate_enemy_left_0_10.png", "warinfotab00.png", "warinfotab01.png", "animate_self_left_2_3.png", "mapobj1lv3.png", "mapelement4-1.png", "battle9.png", "nobi6.png", "4.mp3", "monsteravatar3.jpg", "animate_enemy_left_0_11.png", "wartabperson_b.png", "spyresultback2.jpg", "attackbeginelement.png", "battle7.png", "animate_self_2_1.png", "move1-1.png", "animate_self_left_0_12.png", "nobi15.png", "mapelement4-3.png", "warchatback.png", "wartabperson_r.png", "mapelement2.png", "selfandroid.jpg", "warbutton21.png", "mapobj2lv2.png", "mapobj2lv3.png", "animate_enemy_left_1_2.png", "mapempirelv2_self.png", "battle1.png", "spyback.jpg", "mapobj1lv1.png", "mapobj1lv2.png", "monsteravatar2.jpg", "animate_enemy_left_2_1.png", "animate_enemy_left_1_1.png", "mapempirelv5_self.png", "spyresultback.jpg", "battleuserback1.png", "mapempirelv5.png", "warrecordcell1.jpg", "throw3-1.png", "mapelement5.png", "move3-1.png", "animate_self_left_0_1.png", "mapobj3lv1.png", "mapempirelv3.png", "mapempirelv2.png", "warinfotab02.png", "throw1-1.png", "nobi10.png", "throw3-2.png", "move2-3.png", "attack_head.png", "animate_self_left_0_6.png", "animate_self_left_0_2.png", "mapelement3.png", "animate_enemy_left_0_3.png", "animate_enemy_left_0_2.png", "move2-4.png", "mapelement4-2.png", "animate_self_left_0_8.png", "flagother.png", "mapobj4lv2.png", "battle3.png", "mapobj0lv2.png", "warwinleft.jpg", "mapobj0lv1.png", "mapempirelv6_self.png", "selfwon.png", "warwinelement2.jpg", "animate_self_left_2_4.png", "mapempirelv4_self.png", "move1-2.png", "spyelement0.png", "move3-3.png", "nobilityback.png", "mapobj0lv3.png", "animate_enemy_left_0_9.png", "mapempirelv3_self.png", "battleresultback.jpg", "nobi5.png", "mapelement4.png", "move1-4.png", "spyelement2.png", "monsteravatar0.jpg", "mapobj4lv3.png", "nobi12.png", "warrecordcell0.jpg", "mapempirelv1.png", "move2-1.png", "warchatbottom.png", "mapelement0.png", "animate_self_left_0_5.png", "animate_enemy_left_0_1.png", "animate_enemy_2_1.png", "throw1-2.png", "flagempty.png", "nobi14.png", "mapempirelv4.png", "nobi11.png", "animate_enemy_left_0_8.png", "wartabperson.png", "animate_self_left_0_9.png", "mapobj2lv1.png", "move3-2.png", "warrecord.png", "warbutton00.png", "animate_enemy_2_2.png", "nobi18.png", "warinfotab12.png", "monsteravatar5.jpg", "nobi8.png", "nobi17.png", "battle8.png", "nobi13.png", "warbutton10.png", "animate_enemy_left_2_3.png", "spyelement3.png", "throw2-1.png", "move1-3.png", "nobi9.png", "battleuserback0.png", "mapobj4lv1.png"] ;
*/
var DragonPic =  ["fire-1-2.png", "earth-4-7.png", "earth-3.png", "water-1-7.png", "egg-1-0.png", "egg-2-3.png", "egg-2-2.png", "fire-1-11.png", "fire-2.png", "fire-9.png", "earth-2.png", "earth-1.png", "egg-3-7.png", "earth-f1.png", "egg-3-5.png", "fire-1-10.png", "fire-3.png", "egg-3.png", "fire-4-3.png", "earth-1-13.png", "fire-1-6.png", "fire-1-9.png", "earth-1-2.png", "water-4-9.png", "earth-9.png", "water-1-6.png", "egg-1-3.png", "fire-1-3.png", "water-f1.png", "egg-2.png", "earth-4-4.png", "earth-4-5.png", "water-1-12.png", "water-1-5.png", "water-4-3.png", "water-4-2.png", "earth-1-9.png", "water-4-7.png", "egg-2-0.png", "earth-f2.png", "earth-4-9.png", "water-1-13.png", "earth-4-2.png", "earth-4-6.png", "earth-f4.png", "fire-4-2.png", "water-4-5.png", "earth-4-8.png", "fire-1-8.png", "water-5.png", "egg-3-2.png", "egg-3-3.png", "egg-1.png", "earth-f3.png", "fire-1-4.png", "water-2.png", "water-3.png", "earth-1-1.png", "egg-3-0.png", "earth-1-12.png", "earth-1-8.png", "water-4-6.png", "fire-6.png", "water-f3.png", "fire-f1.png", "water-4.png", "water-1-10.png", "fire-4-8.png", "earth-1-7.png", "earth-1-6.png", "fire-1-12.png", "fire-1-13.png", "fire-1.png", "water-f4.png", "fire-4-9.png", "water-1-4.png", "fire-4-1.png", "fire-4-4.png", "egg-2-1.png", "earth-1-5.png", "water-f2.png", "egg-3-1.png", 
];


/*
"earth-5.png", "earth-4.png", "earth-4-3.png", "water-1.png", "fire-4-6.png", "earth-7.png", "water-1-3.png", "water-1-11.png", "water-4-4.png", "fire-4.png", "fire-1-5.png", "egg-1-1.png", "water-4-8.png", "egg-3-4.png", "earth-1-4.png", "water-1-8.png", "fire-4-7.png", "earth-1-3.png", "fire-1-7.png", "earth-1-10.png", "fire-4-5.png", "egg-3-6.png", "water-4-1.png", "water-7.png", "fire-5.png", "fire-7.png", "fire-f4.png", "earth-1-11.png", "earth-6.png", "fire-1-1.png", "water-9.png", "fire-f3.png", "fire-f2.png", "earth-4-1.png", "water-6.png", "water-1-2.png", "water-1-1.png", "egg-1-2.png", "water-1-9.png"] ;
*/

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
const SHIP_WAITING = 5;

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
    [
    dict([["exp", 19]]),
    dict([["exp", 119]]),
    dict([["exp", 1119]]),
    dict([["exp", 49]]),
    dict([["exp", 499]]),
    dict([["exp", 9]]),
    dict([["exp", 99]]),
    dict([["exp", 9999]]),
    dict([["exp", 999]]),
    ],

];
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




