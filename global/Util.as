var TipShow = 0;
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

    trace("showTip", level);
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

var businessPic = 
["mapempirelv7.png", "room63.png", "rain6.png", "object28.png", "gift10.png", "room33.png", "object18.png", "camp1.png", "opbutton25.png", "monster_5_2.png", "warrecordcell.png", "shen24.png", "shen21.png", "soldier3_2.png", "room61.png", "room35.png", "plant4_4.png", "monster_8_2.png", "shen5.png", "object42.png", "object26.png", "object23.png", "monster_17_3.png", "factfail.png", "mapempirelv7_self.png", "yan13.png", "rain2.png", "object21.png", "fact27.png", "mapobj1lv3.png", "medalcard1_5.png", "opbutton15.png", "monster_28_4.png", "monster_18_2.png", "shen23.png", "monster_3_2.png", "wartabperson.png", "shen18.png", "soldierfail.png", "warrecord.png", "monster_14_4.png", "4.mp3", "room57.png", "wrbutton1.png", "warmenutab0.png", "gift5.png", "monster_6_3.png", "medalcard5_4.png", "fact18.png", "fact30.png", "room20.png", "room49.png", "monster_28_3.png", "room58.png", "object47_l.png", "fact17.png", "room26.png", "monster_13_3.png", "empire2.png", "fact25.png", "object44_l.png", "monster_33_3.png", "blessing7.png", "fact5.png", "mapobj2lv1.png", "monster_35_3.png", "object17.png", "object37.png", "mapempirelv5.png", "fact15.png", "object60.png", "yan5.png", "object16_l.png", "blessing5.png", "monster_29_1.png", "loading_spring.jpg", "monster_19_dead.png", "monster_31_dead.png", "monster_20_1.png", "monster_27_2.png", "mapempirelv2_self.png", "plant11_4.png", "room79.png", "room11.png", "object66.png", "monster13.png", "gift7.png", "room76.png", "room36.png", "monster_22_dead.png", "object46_l.png", "monster_21_2.png", "fact14.png", "mapobj4lv2.png", "monster_4_1.png", "fact11.png", "room38.png", "monster_15_3.png", "dialogback_d.png", "plant6_over.png", "rankcell1.jpg", "monster03.png", "medalcard0_3.png", "wood4.png", "plant8.png", "object36.png", "dialogtab_warabout1.png", "monster_2_1.png", "object15_l.png", "fact24.png", "mapempirelv3_self.png", "monster_14_2.png", "avatar_caesar.png", "gift1.png", "room43.png", "room46.png", "mapobj1lv1.png", "medalbutton3.png", "dialogback_b.png", "fact22.png", "fact26.png", "camp5.png", "camp8.png", "soldier3_1.png", "monster_9_2.png", "object55.png", "fact19.png", "room19.png", "shen9.png", "camp7.png", "shen4.png", "monster_24_2.png", "medalcard2_1.png", "monster_11_3.png", "plant2_3.png", "plant12_4.png", "mapempirelv5_self.png", "yan3.png", "object53.png", "plant12_over.png", "stone1.png", "monster_35_1.png", "object43_l.png", "room25.png", "room17.png", "plant11.png", "shen28.png", "room44.png", "room73.png", "stone2.png", "room30.png", "monster_20_3.png", "yan11.png", "monster_26_1.png", "object16.png", "object25.png", "shen16.png", "monster23.png", "opbutton17.png", "room22.png", "object65.png", "room32.png", "infotab0.png", "gift9.png", "medalcard5_1.png", "yan17.png", "room53.png", "shen11.png", "room74.png", "medalcard5_5.png", "monster_23_dead.png", "room68.png", "fact31.png", "object51.png", "yan1.png", "object38.png", "dialogback_warabout.png", "monster_28_2.png", "object15.png", "build603.png", "object43.png", "monster_25_3.png", "monster_34_dead.png", "gift3.png", "monster_4_2.png", "room71.png", "monster_24_3.png", "plant4_3.png", "monster_18_1.png", "blessing1.png", "monster_20_dead.png", "soldier2_2.png", "plant5_4.png", "monster21.png", "room52.png", "petrenamepic.jpg", "monster_33_2.png", "blessing3.png", "fact8.png", "monster_11_2.png", "room4.png", "mapobj2lv3.png", "gift6.png", "room67.png", "monstercomplete.jpg", "plant5_3.png", "0.mp3", "monster_8_1.png", "monster_13_2.png", "mapempirelv1_self.png", "plant10_over.png", "monster_21_3.png", "monster_29_4.png", "room1.png", "plant6_4.png", "monster_32_1.png", "monster_23_3.png", "monster_27_4.png", "rankcell5self.jpg", "room66.png", "medalcard2_4.png", "object48.png", "room69.png", "stone4.png", "object50.png", "woodover.png", "rankcell4self.jpg", "mapobj3lv1.png", "monster_30_2.png", "fact28.png", "medalcard2_2.png", "object20.png", "mapempirelv2.png", "yan6.png", "monster_10_2.png", "object63.png", "yan2.png", "room51.png", "room5.png", "gift12.png", "object12.png", "mapempirelv4.png", "mapobj0lv3.png", "monster_27_1.png", "stone.png", "monster_27_dead.png", "monster_15_2.png", "room59.png", "medalcard0_5.png", "plant8_over.png", "monster_11_1.png", "object27.png", "object33.png", "monster_8_3.png", "monster_19_3.png", "shen8.png", "fact7.png", "monster_22_3.png", "monster_31_2.png", "camp2.png", "fact13.png", "rankcell2.jpg", "fact20.png", "object19.png", "mapempirelv6_self.png", "loadingwarback.jpg", "build604.png", "medalcard5_2.png", "ranktab0_1.png", "object22.png", "monster_30_dead.png", "yan8.png", "title.png", "object61.png", "empire3_l.png", "shen6.png", "build602.png", "object40.png", "plant2_over.png", "room77.png", "object45.png", "object29.png", "dialogtab_info0.png", "moveblock.png", "monster_7_2.png", "monster_3_1.png", "blessing9.png", "monster_30_1.png", "object47.png", "object31.png", "camp10.png", "room23.png", "object44.png", "harvest.png", "gift11.png", "monster_22_1.png", "build601.png", "monster_35_2.png", "monster_2_3.png", "opbutton5.png", "monster_20_2.png", "plant8_3.png", "monster_21_1.png", "plant12_3.png", "room7.png", "wrbutton0.png", "mapobj3lv3.png", "shen20.png", "opbutton19.png", "room34.png", "monster_29_dead.png", "monster_18_dead.png", "object14_l.png", "camp4.png", "room29.png", "shen26.png", "shen27.png", "monster14.png", "monster_6_1.png", "monster_12_4.png", "shen15.png", "fact32.png", "3.mp3", "mapobj0lv1.png", "monster_14_3.png", "dialogtab_info1.png", "blessing8.png", "monster_12_3.png", "monster_16_1.png", "opbutton13.png", "defence_bubble.png", "room40.png", "attack.png", "shen25.png", "medalcard0_2.png", "soldier3_3.png", "room64.png", "object30.png", "object11.png", "monster_18_3.png", "plant7_4.png", "plant5_over.png", "monster12.png", "plant10_4.png", "mapempirelv6.png", "object32.png", "room13.png", "room37.png", "plant7.png", "fact2.png", "monster_5_3.png", "moveback.png", "wood.png", "monster_22_2.png", "gift4.png", "wartabperson_b.png", "object24.png", "monster_30_3.png", "object13_l.png", "object12_l.png", "monster_10_3.png", "wartabperson_r.png", "monster_32_dead.png", "medalcard1_1.png", "warrecordcell1.jpg", "wood2.png", "gift2.png", "rain5.png", "object56.png", "mapobj1lv2.png", "medalcard0_4.png", "room65.png", "opbutton12.png", "fact23.png", "yan4.png", "personboard.png", "monster02.png", "new.png", "wood5.png", "shen10.png", "monster_27_3.png", "monster_35_dead.png", "yan16.png", "room78.png", "opbutton10.png", "room80.png", "opbutton14.png", "room55.png", "monster_26_3.png", "shen22.png", "monster_3_3.png", "medalcard5_3.png", "map.png", "shen19.png", "plant9_4.png", "blessing2.png", "plant9_over.png", "medalcard0_1.png", "mapobj0lv2.png", "shen17.png", "rankcell4.jpg", "monster_1_2.png", "fact4.png", "blessing4.png", "plant3_3.png", "dialogtab_warabout0.png", "monster_5_1.png", "shen13.png", "room31.png", "stone6.png", "plant12.png", "monster_21_dead.png", "shen29.png", "plant3_over.png", "mapobj4lv3.png", "room47.png", "shen12.png", "warrecordcell0.jpg", "dialogback_c.png", "monster_10_1.png", "object64.png", "monster_32_3.png", "room41.png", "room8.png", "monster_9_3.png", "monster_16_2.png", "room10.png", "resourcefail.png", "soldier2_1.png", "plant8_4.png", "pic0.png", "rankcell3.jpg", "devineback.jpg", "room50.png", "empire2_l.png", "monster_13_4.png", "monster_34_2.png", "fact16.png", "monster_19_1.png", "object52.png", "plant11_over.png", "plant7_3.png", "monster_7_1.png", "room56.png", "plant6_3.png", "mapobj4lv1.png", "room42.png", "monster_1_3.png", "object54.png", "monster01.png", "plant3_4.png", "wood1.png", "object14.png", "rankcell5.jpg", "plant9.png", "opbutton18.png", "personfail.png", "monster_1_1.png", "mapobj3lv2.png", "opbutton21.png", "monster_31_3.png", "plant7_over.png", "yan10.png", "rain1.png", "monster_6_2.png", "room39.png", "monster_2_2.png", "gift8.png", "yan15.png", "monster_14_1.png", "room28.png", "medalcard1_2.png", "monster_4_3.png", "monster_23_2.png", "monster_12_2.png", "room54.png", "monster_33_1.png", "object39.png", "monster_25_1.png", "wood3.png", "object42_l.png", "fact29.png", "monster22.png", "monster_32_2.png", "yan7.png", "object62.png", "object13.png", "plant11_3.png", "monster_9_1.png", "object46.png", "log.png", "zzz1.png", "room16.png", "plant10.png", "soldier2_3.png", "plant10_3.png", "monster_31_1.png", "room45.png", "yan12.png", "dialogback_buy.png", "rain3.png", "shen14.png", "stone3.png", "monster_28_dead.png", "room14.png", "object45_l.png", "warmenulistback.png", "mapobj2lv2.png", "zzz2.png", "plant_2.png", "room60.png", "object41.png", "object59.png", "monster_34_3.png", "monster_26_dead.png", "ranktab0_0.png", "friend_objback1s.png", "monster_25_2.png", "monster_15_1.png", "monster_24_dead.png", "monster_13_1.png", "camp9.png", "medalcard2_5.png", "cataStone.png", "monster_34_1.png", "monster_19_2.png", "object49_l.png", "yan14.png", "monster_29_2.png", "monster_24_1.png", "monster_23_1.png", "mapempirelv3.png", "yan9.png", "dialogback_a.png", "zzz3.png", "room48.png", "friend.png", "monster_17_1.png", "monster_26_2.png", "monster_29_3.png", "room70.png", "fact12.png", "room75.png", "empire3.png", "medalcard2_3.png", "monster_28_1.png", "room62.png", "room72.png", "medalcard1_3.png", "plant9_3.png", "mapempirelv4_self.png", "train.png", "warmenutab1.png", "room2.png", "plant2_4.png", "object35.png", "monster_12_1.png", "fact21.png", "fact1.png", "monster_25_dead.png", "build605.png", "object34.png", "medalcard1_4.png", "mapempirelv1.png", "object49.png", "stone5.png", "shen7.png", "fact10.png", "rankcell0.jpg", "opbutton4.png", "plant4_over.png", "nobattletab1.png", "monster_16_3.png", "infotab1.png", "stoneover.png", "monster_17_2.png", "monster_7_3.png", "monster11.png", "nobattletab0.png", "rain4.png", "camp11.png", "wood6.png", "object48_l.png", "plant_fail.png", "monster_33_dead.png", "blessing6.png"];



var warpic =
["battle2.png", "animate_enemy_left_0_4.png", "warinfotab10.png", "monsteravatar1.jpg", "monsteravatar6.jpg", "nobi7.png", "animate_enemy_left_2_2.png", "animate_enemy_left_1_3.png", "animate_enemy_1_2.png", "animate_enemy_left_0_5.png", "animate_self_left_0_11.png", "animate_enemy_left_0_6.png", "animate_self_left_2_1.png", "flag5.png", "animate_enemy_1_1.png", "warbutton01.png", "animate_self_2_2.png", "battle5.png", "animate_self_left_0_10.png", "animate_self_left_0_13.png", "animate_self_left_2_2.png", "spytab0.png", "nobi16.png", "status.png", "animate_self_left_0_4.png", "spyelement3.png", "animate_enemy_left_1_4.png", "animate_enemy_left_0_11.png", "battle6.png", "attackelement.jpg", "warinfotab11.png", "move2-2.png", "selclose.png", "warbutton11.png", "android.png", "warwinelement.jpg", "spyelement1.png", "warbutton20.png", "move3-4.png", "battle4.png", "throw2-2.png", "animate_enemy_left_2_4.png", "animate_enemy_left_0_13.png", "animate_enemy_left_0_12.png", "animate_self_left_0_3.png", "defenceback.jpg", "animate_enemy_left_0_10.png", "warinfotab00.png", "warinfotab01.png", "animate_self_left_2_3.png", "flagempty.png", "mapelement4-1.png", "battle9.png", "nobi6.png", "monsteravatar3.jpg", "dialogback_attack.png", "spyresultback2.jpg", "attackbeginelement.png", "battle7.png", "animate_self_2_1.png", "move1-1.png", "animate_self_left_0_12.png", "nobi15.png", "mapelement4-3.png", "warchatback.png", "mapelement2.png", "selfandroid.jpg", "warbutton21.png", "defence_head.png", "animate_enemy_left_1_2.png", "battle1.png", "spyback.jpg", "throw2-1.png", "monsteravatar2.jpg", "nobi1.png", "animate_enemy_left_2_1.png", "animate_enemy_left_1_1.png", "flag6.png", "nobi8.png", "flag2.png", "battleuserback1.png", "throw3-1.png", "mapelement5.png", "move3-1.png", "selopen.png", "animate_self_left_0_1.png", "warinfotab02.png", "throw1-1.png", "nobi10.png", "throw3-2.png", "move2-3.png", "attack_head.png", "animate_self_left_0_6.png", "animate_self_left_0_2.png", "mapelement3.png", "animate_enemy_left_0_3.png", "animate_enemy_left_0_2.png", "move2-4.png", "mapelement4-2.png", "animate_self_left_0_8.png", "nobi2.png", "flagother.png", "flag3.png", "warwinleft.jpg", "nobi5.png", "selfwon.png", "warwinelement2.jpg", "animate_self_left_2_4.png", "warback.png", "nobi0.png", "move1-2.png", "spyelement0.png", "nobi3.png", "move3-3.png", "warlostleft.jpg", "nobilityback.png", "nobi17.png", "warchatbutton.png", "animate_enemy_left_0_9.png", "battleresultback.jpg", "nobi4.png", "warbutton10.png", "mapelement4.png", "move1-4.png", "spyelement2.png", "battle8.png", "monsteravatar0.jpg", "nobi12.png", "move2-1.png", "spytab1.png", "warchatbottom.png", "mapelement0.png", "animate_self_left_0_5.png", "warloseelement2.jpg", "animate_enemy_left_0_1.png", "animate_enemy_2_1.png", "throw1-2.png", "watch.png", "nobi14.png", "animate_enemy_left_0_8.png", "nobi11.png", "animate_self_left_0_9.png", "flag4.png", "move3-2.png", "warbutton00.png", "animate_enemy_2_2.png", "nobi18.png", "warinfotab12.png", "monsteravatar5.jpg", "warabout1.png", "battle3.png", "warloseelement.jpg", "nobi13.png", "animate_enemy_left_2_3.png", "spyresultback.jpg", "warabout0.png", "move1-3.png", "nobi9.png", "battleuserback0.png"];


var DragonPic = 
["fire-1-2.png", "earth-4-7.png", "earth-3.png", "water-1-7.png", "egg-1-0.png", "egg-2-3.png", "egg-2-2.png", "fire-1-11.png", "fire-2.png", "fire-9.png", "earth-2.png", "earth-1.png", "egg-3-7.png", "earth-f1.png", "egg-3-5.png", "fire-1-10.png", "fire-3.png", "egg-3.png", "fire-4-3.png", "earth-1-13.png", "fire-1-6.png", "fire-1-9.png", "earth-1-2.png", "water-4-9.png", "earth-9.png", "water-1-6.png", "egg-1-3.png", "fire-1-3.png", "water-f1.png", "egg-2.png", "earth-4-4.png", "earth-4-5.png", "water-1-12.png", "water-1-5.png", "water-4-3.png", "water-4-2.png", "earth-1-9.png", "water-4-7.png", "egg-2-0.png", "earth-f2.png", "earth-4-9.png", "water-1-13.png", "earth-4-2.png", "earth-4-6.png", "earth-f4.png", "fire-4-2.png", "water-4-5.png", "earth-4-8.png", "fire-1-8.png", "water-5.png", "egg-3-2.png", "egg-3-3.png", "egg-1.png", "earth-f3.png", "fire-1-4.png", "water-2.png", "water-3.png", "earth-1-1.png", "egg-3-0.png", "earth-1-12.png", "earth-1-8.png", "water-4-6.png", "fire-6.png", "water-f3.png", "fire-f1.png", "water-4.png", "water-1-10.png", "fire-4-8.png", "earth-1-7.png", "earth-1-6.png", "fire-1-12.png", "fire-1-13.png", "fire-1.png", "water-f4.png", "fire-4-9.png", "water-1-4.png", "fire-4-1.png", "fire-4-4.png", "egg-2-1.png", "earth-1-5.png", "water-f2.png", "egg-3-1.png", "earth-5.png", "earth-4.png", "earth-4-3.png", "water-1.png", "fire-4-6.png", "earth-7.png", "water-1-3.png", "water-1-11.png", "water-4-4.png", "fire-4.png", "fire-1-5.png", "egg-1-1.png", "water-4-8.png", "egg-3-4.png", "earth-1-4.png", "water-1-8.png", "fire-4-7.png", "earth-1-3.png", "fire-1-7.png", "earth-1-10.png", "fire-4-5.png", "egg-3-6.png", "water-4-1.png", "water-7.png", "fire-5.png", "fire-7.png", "fire-f4.png", "earth-1-11.png", "earth-6.png", "fire-1-1.png", "water-9.png", "fire-f3.png", "fire-f2.png", "earth-4-1.png", "water-6.png", "water-1-2.png", "water-1-1.png", "egg-1-2.png", "water-1-9.png"];

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

