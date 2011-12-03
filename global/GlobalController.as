const buildcontext = [9000,2001,2002,2003,2004,3005,3006,
2100,2101,2102,2103,2104,2105,2106,2107,2108,2109,2110,2111,2112,2113,2114,2115,2116,2117,2118,2119,2120,2121,2122,2123,2124,2125,2126,2127,2128,2129,2130,2131,2132,2133,2134,2135,3136,3137,3138,3139,3140,3141,3142,3143,3144,3145,3146,3147,3148,3149,3150,3151,3152,3153,3154,3155,3156,3157,3158,3159,2160,2161,2162,2163,2164,2165,2166,2167,2168,2169,2170,2171,3172,3173,3174,3175,3176,3177,
2200,2201,2202,2203,2204,2205,2206,2207,2208,
2300,2301,2302,2303,2304,2305,2306,2307,2308,2309,2310,2311,2312,2313,2314,2315,2316,2317,2318,2319,2320,2321,2322,2323,2324,2325,2326,3327,3328,3329,2330,2331,2332,
2400,2401,2402,2403,2404,2405,2406,2407,2408,2409,2410,2411,2412,2413,2414,2415,2416,2417,2418,2419,2420,2421,2422,2423,2424,2425,2426,2427,2428,2429,
//todo
1500,1501,1502,1503,1504,1505,1506,1507,1508,1509,1510,1511,1512,1513,1514,1515,1516,1517,1518,1519,1520,1521,1522,1523,1524,1525,1526,1527,1528,1529,1530,1531,1532,1533,1534,1535,1536,1537,1538,2539,2540,2541,1542,1543,2544,1545,1546,1547,1548,1549,
2600,2601,2602,2603,2604,2605];
const darkColorAlpha = 65;
const AutoPop = 1;
const NonAutoPop = 0;
const NotAdd = 2;

//const BASE_URL = "http://223.4.87.9:8000/";
const BASE_URL = "http://uhz000738.chinaw3.com:8080/";

const NEWDATA = [[1000,1,200,370,590,0,60],[1450,2,220,370,590,6,60],[2550,5,190,370,600,26,60]];

const FARM_PRICE = [0,1000,-10,-15,-20,10000,28500];
//const FARM_SALE = [0,375,750,1125,1500,2500,7125];
const FARM_PERSON = [0,80,0,0,0,120,250];
const FARM_EXP = [0,5,15,40,70,20,30];
const FARM_FOOD = [0,0,0,0,0,600,1000];
const FARM_USE = [0,"plant crops","plant crops（x1.2）","plant crops（x1.4）","plant crops（x1.6）","produce wood","produce stone"];


const PLANT_TIME = [600,2700,3600,9360,22680,14400,1800,5400,9000,11520,29160,25200];
const PLANT_PRICE = [50,165,-1,700,1440,-3,230,600,-2,1210,3000,-5];
const PLANT_EXP = [1,3,8,7,12,25,5,9,30,15,25,50];
const PLANT_FOOD = [20,50,120,150,300,430,52,80,280,200,410,650];

const STONE_TIME = [4320,21600,6480,5400,25200,9000];
const WOOD_TIME = [4320,21600,6480,5400,25200,9000];
const STONE_PRICE = [1200,3600,-5,2000,5500,-10];
const WOOD_PRICE = [600,1850,-4,1000,2500,-8];
const STONE_EXP = [10,20,30,15,25,65];
const WOOD_EXP = [5,15,20,10,20,50];
const STONE_GAIN =[20,50,70,40,80,120];
const WOOD_GAIN = [20,50,70,40,80,120];

const ROOM_B_TIME = [600,1200,2400,600,1200,2400,600,1200,2400,600,1200,2400,1800,4320,9000,1800,4320,9000,1800,4320,9000,1800,4320,9000,15840,24480,30600,15840,24480,30600,15840,24480,30600,15840,24480,30600,5400,11160,21240,5400,11160,21240,5400,11160,21240,5400,11160,21240,25200,36720,68040,25200,36720,68040,25200,36720,68040,25200,36720,68040,7560,15480,30600,7560,15480,30600,7560,15480,30600,7560,15480,30600,12240,19800,28800,12240,19800,28800];
const ROOM_B_FOOD = [10,30,-70,10,30,-70,10,30,-70,10,30,-70,60,120,-100,60,120,-100,60,120,-100,60,120,-100,400,-150,-100150,400,-150,-100150,400,-150,-100150,400,-150,-100150,200,-120,-100120,200,-120,-100120,200,-120,-100120,200,-120,-100120,600,-200,-100200,600,-200,-100200,600,-200,-100200,600,-200,-100200,0,-300,-100300,0,-300,-100300,0,-300,-100300,0,-300,-100300,0,-310,-100310,0,-310,-100310];
const ROOM_B_EXP = [3,8,15,3,8,15,3,8,15,3,8,15,5,13,24,5,13,24,5,13,24,5,13,24,13,21,30,13,21,30,13,21,30,13,21,30,11,25,39,11,25,39,11,25,39,11,25,39,20,32,43,20,32,43,20,32,43,20,32,43,15,25,40,15,25,40,15,25,40,15,25,40,20,30,50,20,30,50];
const ROOM_PRICE = [500,1400,2800,550,1540,3080,600,1680,3360,650,1820,3640,1500,4800,9000,1650,5280,9900,1800,5760,10800,1950,6240,11700,7300,15000,19000,8030,16500,20900,8760,18000,22800,9490,19500,24700,3500,6600,11000,3850,7260,12100,4200,7920,13200,4550,8580,14300,10500,15500,19500,11550,17050,21450,12600,18600,23400,13650,20150,25350,-10,20000,25000,-11,22000,27500,-12,24000,30000,-13,26000,32500,-8,22000,26000,-9,24200,28600];
const ROOM_TIME = [1800,1800,1800,1800,1800,1800,1800,1800,1800,1800,1800,1800,7560,7560,7560,7560,7560,7560,7560,7560,7560,7560,7560,7560,18720,18720,18720,18720,18720,18720,18720,18720,18720,18720,18720,18720,12600,12600,12600,12600,12600,12600,12600,12600,12600,12600,12600,12600,29880,29880,29880,29880,29880,29880,29880,29880,29880,29880,29880,29880,14400,14400,14400,14400,14400,14400,14400,14400,14400,14400,14400,14400,21600,21600,21600,21600,21600,21600];
const ROOM_FOOD = [20,30,40,20,30,40,20,30,40,20,30,40,64,86,110,64,86,110,64,86,110,64,86,110,140,174,200,140,174,200,140,174,200,140,174,200,90,116,142,90,116,142,90,116,142,90,116,142,190,230,270,190,230,270,190,230,270,190,230,270,150,225,300,150,225,300,150,225,300,150,225,300,170,245,339,170,245,339];
const ROOM_PERSON = [10,15,20,10,15,20,10,15,20,10,15,20,32,43,55,32,43,55,32,43,55,32,43,55,70,83,100,70,83,100,70,83,100,70,83,100,50,62,75,50,62,75,50,62,75,50,62,75,95,115,135,95,115,135,95,115,135,95,115,135,100,150,200,100,150,200,100,150,200,100,150,200,110,165,230,110,165,230];
const ROOM_EXP = [1,2,5,1,2,5,1,2,5,1,2,5,3,7,11,3,7,11,3,7,11,3,7,11,7,14,21,7,14,21,7,14,21,7,14,21,6,10,17,6,10,17,6,10,17,6,10,17,12,24,36,12,24,36,12,24,36,12,24,36,15,25,35,15,25,35,15,25,35,15,25,35,17,26,39,17,26,39];
const ROOM_UP = [0,"1;a,1","2;a,2;b,3",0,"1;a,1","2;a,2;b,3",0,"1;a,1","2;a,2;b,3",0,"1;a,1","2;a,2;b,3",0,"3;b,2;c,2","4;c,2;d,3",0,"3;b,2;c,2","4;c,2;d,3",0,"3;b,2;c,2","4;c,2;d,3",0,"3;b,2;c,2","4;c,2;d,3",0,"4;f,2;g,2","5;g,2;h,3",0,"4;f,2;g,2","5;g,2;h,3",0,"4;f,2;g,2","5;g,2;h,3",0,"4;f,2;g,2","5;g,2;h,3",0,"5;d,2;e,2","6;e,2;f,3",0,"5;d,2;e,2","6;e,2;f,3",0,"5;d,2;e,2","6;e,2;f,3",0,"5;d,2;e,2","6;e,2;f,3",0,"7;h,2;i,2","8;i,2;j,3",0,"7;h,2;i,2","8;i,2;j,3",0,"7;h,2;i,2","8;i,2;j,3",0,"7;h,2;i,2","8;i,2;j,3",0,"12;b,2;c,2","15;c,2;d,3",0,"12;b,2;c,2","15;c,2;d,3",0,"12;b,2;c,2","15;c,2;d,3",0,"12;b,2;c,2","15;c,2;d,3",0,"15;a,2;f,2","20;d,2;i,4",0,"15;a,2;f,2","20;d,2;i,4"];

const FACT_B_TIME = [600,1800,3600,3600,10440,15120,5400,14400,23400,19800,35280,46800,8280,22320,28800,20520,25200,33120,21600,28800,36720,30600,37440,46800,25200,30240,39600,16200,28800,41400, 3600*10, 3600*10+1800, 3600*13+1800];
const FACT_PRICE = [300,500,1100,1200,1800,3000,-5,5000,7000,2000,3300,4500,5000,7000,13500,-8,9000,11000,7200,11000,19900,8000,13000,21000,-11,13000,17000,10000,20000,50000, 10000, 17000, 27000 ];
const FACT_GAIN = [100,300,500,600,900,1200,800,1400,2100,1200,1800,2600,2300,3200,4500,2500,4400,6800,1400,2100,3100,3500,6500,8000,7500,13000,17500,1800,2600,4400,4000,6200,8100];
//what?
const FACT_FOOD = [20,30,-70,45,-100,-100100,0,-120,-100120,80,-150,-100150,100,-170,-100170,0,-200,-100200,130,-210,-100210,170,-230,-100230,0,-250,-100250,1000,-300,-100300,210,-280,-100300];
//build exp
const FACT_B_EXP = [3,7,11,5,9,14,15,20,25,7,9,11,9,11,13,25,30,35,20,33,45,29,45,61,35,45,60,8,15,25,35,47,56];
//product exp
const FACT_EXP = [1,2,5,3,5,9,5,9,15,5,9,17,12,20,29,18,28,40,10,19,30,23,34,45,30,50,70,4,8,12,28,40,52];
//producttime
const FACT_TIME = [600,600,600,5400,5400,5400,1800,1800,1800,10440,10440,10440,21600,21600,21600,7200,7200,7200,11160,11160,11160,30600,30600,30600,26280,26280,26280,16200,16200,16200,3600*6+1800, 3600*6+1800, 3600*6+1800];
//buildCost
const FACT_PERSON = [20,25,35,40,50,65,0,0,0,50,65,85,70,90,115,0,0,0,90,115,145,110,140,175,0,0,0,55,73,100, 100, 130, 170];
//levelup
const FACT_UP = [0,"1;a,1","2;a,2;b,3",0,"3;b,2;c,2","4;c,2;d,3",0,"6;b,2;c,2","7;c,2;d,3",0,"5;d,2;e,2","6;e,2;f,3",0,"7;f,2;g,2","8;g,2;h,3",0,"10;d,2;e,2","11;e,2;f,3",0,"9;h,2;i,2","10;i,2;j,3",0,"10;j,2;k,2","11;k,2;l,3",0,"12;h,2;i,2","13;i,2;j,3",0,"7;a,5;i,4","10;c,5;d,6",0,"10;d,4;h,6", "11;g,5;a,10"];

const GOD_B_TIME = [7200,21600,43200,64800,86400];
//const GOD_SALE = [2500,7500,20000,45000,170000];
const GOD_B_PRICE = [10000,20000,50000,100000,500000];
const GOD_UP = [0,"5","10","15","30"];
const GOD_FOOD = [500,1000,2000,5000,10000];
const GOD_PERSON_MAX = [250,500,750,1000,1250];
const GOD_EXP = [50,100,170,250,350];

const BLESS_CAESARS = [3,15,30];

const CAMP_PRICE = [4000,9000,20000,12000,25000,50000,6000,12000,25000];
const CAMP_FOOD = [130,-200,-100200,320,-500,-100500,150,-300,-100300];
const CAMP_PERSON = [100,120,170,130,150,200,90,110,160];
const CAMP_EXP = [5,10,20,15,20,35,7,15,30];
const CAMP_TIME = [3600,11520,22680,7200,14760,28440,10800,21600,32400];
const CAMP_USE = ["train infantry","train cavalry","train scout"];

const CAMP_UP = [0,"5;a,3","10;b,3;c,4",0,"7;b,3","15;c,3;d,4",0,"3;c,3","7;d,3;e,4"];

const SOLDIER_TIME = [7200,21600,43200];
const SOLDIER_EXP = [5,8,13,9,15,21,16,25,34,10,15,20,30,40,50,60,75,90,3,6,9,5,8,13,9,15,21];
const SOLDIER_PRICE=[750,2400,4800,1600,5000,10000,2400,7500,15000,2000,6300,12600,2600,7900,15800,3300,10000,20000,150,500,1000,310,990,1980,480,1500,3000];
const SOLDIER_PERSON = [30,15,2];
const SOLDIER_FOOD = [3,6,9,10,20,30,5,10,15];
const SOLDIER_POWER = [1,2,3,4,5,6,0,0,0];
const SOLDIER_NAME = ["Lev1","Lev2","Lev3","Lev1","Lev2","Lev3","Lev1","Lev2","Lev3"];

const MONSTERNAME = ["Snake Lev1","Snake Lev2","Snake Lev3","Boar Lev1","Boar Lev2","Boar Lev3","Wolf Lev1","Wolf Lev2","Wolf Lev3","Bear Lev1","Bear Lev2","Bear Lev3","Lion Lev1","Lion Lev2","Lion Lev3","Dragon Lev1","Dragon Lev2","Dragon Lev3","Snake King Lev1","Snake King Lev2","Snake King Lev3","Boar King Lev1","Boar King Lev2","Boar King Lev3","Wolf King Lev1","Wolf King Lev2","Wolf King Lev3","Bear King Lev1","Bear King Lev2","Bear King Lev3","Lion King Lev1","Lion King Lev2","Lion King Lev3","Dragon King Lev1","Dragon King Lev2","Dragon King Lev3"];

const MONSTER_POWER = [20,30,41,25,37,49,28,42,56,33,49,65,40,58,77,50,75,100,42,65,90,51,74,104,60,90,120,73,109,145,80,120,160,100,150,200];

const EXPAND_LEVEL=[4,7,10,15,20,25,30,40,50,60];
const EXPAND_MONEY=[10000,50000,100000,500000,1000000,1500000,2000000,2500000,3000000,5000000];
const EXPAND_CAESARS=[1,3,5,7,10,15,20,27,37,50];
const EXPAND_FRIEND=[1,10,30,60,100,150,210,280,360,450];
const EXPAND_EXP=[10,20,50,90,140,200,330,580,740,920];


    
    const PETS_NAME=["Dragon egg A Lev1","Dragon egg A Lev2","Dragon egg A Lev3","Dragon egg B Lev1","Dragon egg B Lev2","Dragon egg B Lev3"];

    const PETS_PRICE=[50000,100000,500000,-10,-50,-100];
    const PETS_POWER = [100,250,1000,300,1200,1500];
    const PETS_UP = [5,6,10,7,12,17];
    
    const EXTEND_UP=[0,3,3];
    const EXTEND_NAME=["earth","fire","water"];
    const EXTEND_PETS_NAME=["Earth dragon","Fiery dragon","Water dragon"];


const OBJ_PRICE = [10,20,30,50,-1,100,100,100,100,100,100,200,-3,400,600,800,1000,900,1200,2000,-5,1500,1500,1500,1600,1600,1600,1600,-3,-3,-3,-3,1800,1800,1800,2000,2000,2000,-10,5000,-5,-10,2000,2000,-10,-2,-5, -6, -7, -8];
const OBJ_PERSON = [5,5,5,5,50,6,6,6,6,6,6,8,170,15,20,25,30,35,40,50,300,60,60,60,65,65,65,65,150,150,150,150,70,70,70,80,80,80,300,90,150,300,30,30,300,120,150, 155, 160, 165];

const STATUE_PRICE = [80000,-8,120000,-12,200000,-20];
const STATUE_DEFENCE=[600,700,950,1200,1600,2500];
const STATUE_PERSON=[20,40,80,60,120,100];
const STATUE_TIME = [7200,14400,21600,28800,36000,43200];
const STATUE_NAME = ["Snake womam","Boar warrior","Wolf fighter","Bear knight","Lion soldier","Dragon fighter"];


const DIALOG_BASE_X = 100-74;
const DIALOG_BASE_Y = 112+22;
const DIALOG_OFF_X = 161;
const DIALOG_OFF_Y = 112-22;

const RECTMAX = 40;
const PAGE_W = 2750;
const PAGE_H = 1460;
const PBX = 1451;
const PBY = 126;
const PS_MAX = 50;
const PS_MIN = -50;
const MS_MAX = 100;
const MS_MIN = -50;
const FILLER_W = 119;
const FILLER_H = 13;
const BUTTONFONTSIZE = 26;

const LEV_EXP =[0,20,50,110,210,360,660,1160,1960,3160,4860,7160,10160,14060,19130,25721,34289,43713,54079,65481,78023,91819,106994,123686,142047,162244,184460,208897,235777,265345];

const ROOMNAME = ["Orange cottage lev1","Orange cottage lev2","Orange cottage lev3","Red cottage lev1","Red cottage lev2","Red cottage lev3","Blue cottage lev1","Blue cottage lev2","Blue cottage lev3","Purple cottage lev1","Purple cottage lev2","Purple cottage lev3","Orange house lev1","Orange house lev2","Orange house lev3","Red house lev1","Red house lev2","Red house lev3","Blue house lev1","Blue house lev2","Blue house lev3","Purple house lev1","Purple house lev2","Purple house lev3","Orange villa lev1","Orange villa lev2","Orange villa lev3","Red villa lev1","Red villa lev2","Red villa lev3","Blue villa lev1","Blue villa lev2","Blue villa lev3","Purple villa lev1","Purple villa lev2","Purple villa lev3","Orange mansion lev1","Orange mansion lev2","Orange mansion lev3","Red mansion lev1","Red mansion lev2","Red mansion lev3","Blue mansion lev1","Blue mansion lev2","Blue mansion lev3","Purple mansion lev1","Purple mansion lev2","Purple mansion lev3","Orange manor lev1","Orange manor lev2","Orange manor lev3","Red manor lev1","Red manor lev2","Red manor lev3","Blue manor lev1","Blue manor lev2","Blue manor lev3","Purple manor lev1","Purple manor lev2","Purple manor lev3","Orange magic house lev1","Orange magic house lev2","Orange magic house lev3","Red magic house lev1","Red magic house lev2","Red magic house lev3","Blue magic house lev1","Blue magic house lev2","Blue magic house lev3","Purple magic house lev1","Purple magic house lev2","Purple magic house lev3","Orange moon palace lev1","Orange moon palace lev2","Orange moon palace lev3","Gold moon palace lev1","Gold moon palace lev2","Gold moon palace lev3"];

const FACTNAME = ["Bakery lev1","Bakery lev2","Bakery lev3","Fruit shop lev1","Fruit shop lev2","Fruit shop lev3","Butcher shop lev1","Butcher shop lev2","Butcher shop lev3","Restaurant lev1","Restaurant lev2","Restaurant lev3","Clinic lev1","Clinic lev2","Clinic lev3","Bookshop lev1","Bookshop lev2","Bookshop lev3","Clothing shop lev1","Clothing shop lev2","Clothing shop lev3","Jewelers lev1","Jewelers lev2","Jewelers lev3","Casino lev1","Casino lev2","Casino lev3","Moon store lev1","Moon store lev2","Moon store lev3", "Fish shop lev1", "Fish shop lev2", "Fish shop lev3"];

const CAMPNAME = ["Infantry barracks lev1","Infantry barracks lev2","Infantry barracks lev3","Cavalry barracks lev1","Cavalry barracks lev2","Cavalry barracks lev3","Scout barracks lev1","Scout barracks lev2","Scout barracks lev3"];

const FARMNAME = [null,"Ordinary farmland","Crystal farmland","Gem farmland","Elves farmland","Lumber mill","Quarry"];

const GONAME = ["Harvest goddess lev1","Liberty goddess lev1","Wealth god lev1","Mars lev1","Harvest goddess lev2","Liberty goddess lev2","Wealth god lev2","Mars lev2","Harvest goddess lev3","Liberty goddess lev3","Wealth god lev3","Mars lev3","Harvest goddess lev4","Liberty goddess lev4","Wealth god lev4","Mars lev4","Harvest goddess lev5","Liberty goddess lev5","Wealth god lev5","Mars lev5","Friendship god lev1","Friendship god lev2","Friendship god lev3","Friendship god lev4","Friendship god lev5", "Beast god lev1", "Beast god lev2", "Beast god lev3", "Beast god lev4", "Beast god lev5"];

//todo
const OBJNAME = ["Brick road","Grid Road","Color brick road","Stone road","Gold road","White parterre","Red parterre","Pink parterre","Yellow parterre","Blue parterre"," Purple parterre","Lawn","Vine lamp","Street lamp1","Street lamp2","Droplamp","Flower lamp","Guideboard","Bench","Ordinary well" ,"Magic well","Purple flowers","Red flowers","Orange flowers","Dark green nepenthe","Yellow nepenthe","Green nepenthe","Blue nepenthe","Pink cherry tree","Purple cherry tree","Lavender cherry tree","Red cherry tree","Orange shrubbery","Yellow shrubbery","Green shrubbery","Spring maple","Summer maple","Autumn maple","Angel Statue","Rabbit","Moon cakes","Moon rabbit","Red candy lamp","Gold candy lamp","Pumpkin lantern", "Rose lantern", "Blue thanksgiven latern", "Green thanksgiven latern", "Golden thanksgiven latern", "Purple thanksgiven latern"];

const UNLOCK = [null,null,"90,object0.png;90,object1.png;90,object2.png","50,plant2.png","50,fact3.png;90,object3.png","90,object4.png;50,room12.png;50,plant3.png","90,object5.png;50,fact6.png","90,object11.png;50,plant4.png","90,object12.png;50,room60.png;25,shen0.png;50,fact9.png","90,object13.png;50,plant5.png","90,object14.png;90,object20.png;50,farm2.png;50,plant6.png;50,room24.png;33,farm5.png","90,object15.png;50,camp3.png","90,object16.png;25,shen1.png","90,object17.png;50,plant7.png","90,object18.png;90,wood1.png;50,fact15.png","90,object19.png;90,object28.png;33,room36.png;50,fact12.png","90,object21.png;50,plant8.png;25,shen3.png","90,wood2.png","90,object24.png;33,farm6.png","90,object32.png;90,object38.png","50,farm3.png;50,plant9.png;33,room48.png;25,shen2.png","50,fact18.png;90,wood3.png","90,stone1.png","50,plant10.png","50,fact24.png;90,stone2.png","90,object35.png;50,plant12.png;90,wood5.png","50,plant11.png","90,stone3.png","90,wood4.png","50,fact21.png","90,stone5.png;50,farm4.png;90,stone4.png"];
const nobilityname = ["Civilians","Baron","Viscount","Earl","Marquis","Duke","Emperor"];

const NOBNAME = ["Third-class civilians","Second-class civilians","First-class civilians","Third-class baron","Second-class baron","First-class baron","Third-class viscount","Second-class viscount","First-class viscount","Third-class earl","Second-class earl","First-class earl","Third-class marquis","Second-class marquis","First-class marquis","Third-class duke","Second-class duke","First-class duke","Emperor"]

const PLANTNAME=["Wheat","Carrot","Corn","Pineapple","Eggplant","Tomato","Green pepper","Pumpkin","Peach","Waten melon","Mango","Strawberry"];

const STONENAME=["Gravel","Wasalt","Limestone","Granite","Mable","Quartz"];

const WOONAME =["Maple","Willow","White poplar","Chinar","Pine","Oak"];

const GIFTNAME =["Wood","Sand","Nail","Rivet","Red brick","Beam","Door","Plywood","Macadam","Black brick","Deadman","Steel tube"];

const ENAME = ["Forts lev1","Forts lev2","Forts lev3","Forts lev4","Forts lev5","Forts lev6"];
const waitaction1 = repeat(animate(2000,"wait1.png","wait2.png","wait3.png","wait4.png","wait5.png","wait6.png","wait7.png","wait8.png","wait9.png","wait10.png","wait11.png","wait12.png","wait13.png","wait14.png","wait15.png","wait16.png","wait17.png","wait18.png","wait19.png","wait20.png"));
const cardprename = ["Snake","Boar","Wolf","Bear","Lion","Dragon","Snake king","Boar king","Wolf king","Bear king","Lion king","Dragon king","Title of nobility","Moon goddess","Planting daren","Business daren","","","Friendship"];

const cardlevelname = ["card","card lev1","card lev2","card lev3","card lev4","card lev5","medal"];

const allcardlevelnum = [[2,4,7,15,30],[1000,5000,20000,50000,100000],[10000,50000,100000,500000,1000000],[],[],[1,100,100,100,40]];
const cardlevelnum = [5,15,45,85,135];

const BUILD_TAB_NAME=["House","Store","Recource","Military","Miracle","Decoration","Expand"];

const DEFAULT_NAME="My empire";
const INVITE_STR=["papaya games", "enjoy Miracle Empire with me", "come on to help me defeat enemies and build your own empire!", "Miracle Empire is a big,gorgeous SNS game. You can download from Android market:https://market.android.com/details?id=com.papaya.wonderempire1_cn"];


const GRAY =m_color(30,59,11,0,0, 30,59,11,0,0, 30,59,11,0,0, 0,0,0,100,0);
const NORMAL = m_color(100,0,0,0,0, 0,100,0,0,0, 0,0,100,0,0, 0,0,0,100,0);

//const scale_node = sprite().addaction(repeat(scaleto(750,1),
const cardnum = 13;
const NEWFLAG = 14;
    
const staticString = ["Upgrade to lv10 to open War mode","You can't quit War mode after you open, please read Help doc carefully.",

"Congratulations！you have defended the attack from [ENAME] succeseefully and protect your territory.","[ENAME] is too powerful,you are defeated unfortunetly.Cheer up and strengthen your military power!",

"[ENAME] is too powerful,strengthen your military power and never give up！","Congratulations!you have defeated [ENAME]，go on fighting and gain your glory！","how to strengthen the military power",

"[USERNAME]has entered a new map.Come on,Let's build our own miracle empire with [USERNAME]！","[USERNAME]has upgraded to[NOBNAME]，Come on,Let's build our own miracle empire with [USERNAME]！",

"[USERNAME] has upgraded the territory，Come on,Let's build our own miracle empire with [USERNAME]！","[USERNAME] has defeated the invaders，Come on,Let's build our own miracle empire with [USERNAME]！",

"[USERNAME] is defeated by YYYY[ENAME]，Let's go and revenge for [USERNAME]！","[USERNAME]'s army is defeated，convene your army and help [USERNAME] attacking！",

"[USERNAME] has defeated [ENAME]，Let's build our own miracle empire with [USERNAME]！","You have to reach level 15 to unlock one-step finishing","Sorry,you don't have spare farmland for one-step finishing","Sorry, your crops are growing, Please try one-step finishing later",

"[WHO] have to reach [NUM] to upgrade your [TYPE] to the next level.[WHO] can use one-step finishing without caesar coins after get the violet gold card of this kind！","[WHO] needs to defeated [NUM] more opponents to upgrade to [CARD]",

"Your stores are working, please try one-step finishing later","You can get a monster statue for free after you have upgraded your monster card to violet gold level","Sorry, space room is developing, you will soon get it for free by lev5 moon goddess card.",

"You can use one-step harvesting and one-step seeding for free when you upgrade the Goddess of Harvest to violet golden level","Upgrade the goddess of treasure to violet golden level to use one-step collecting taxes for free",

"Sorry,you have already visited all your friends' castles！","Your dragon will become stronger after training everyday！","you have visited [NUM] friends and get [MONEY] coins for rewards",

"Upgrade the god of friendship to violet golden level","You need [NUM] more friends","You need to open [NUM] more treasure chest for your friends","You need to feed your friends' dragons [NUM] more times","You need to reach level [NUM]",

"You can use one-step visiting for free from now on！","[NAME] has shared the screenshot of his territory，Let's go and see！","","http://getmugua.com",

"You can feed your dragon once a day，Friends can help you feeding. If your dragon isn't fed that day,it's growing points will decrease！","This dragon is gonna born, you can feed it later，thanks for helping!^_^",

"You can feed a dragon once a day^_^","[NAME]'s dragon has been fed by [NUM] friends，thanks for helping^_^"];

const SPYITEMS=["win:", "fight:", "soldier force", "ally force", "defence"];
const SHARE_URL="http://getmugua.com";
const stringDict=dict([
["build_defence_format","Build [BUILD] will add [DEFENCE] castle defense，sure to build？（click castle to view def）"],

["money","silver"],["caesars","gold"],["food","food"],["labor","idle population"],["person","population"],["stone","stone"],["wood","wood"],["caesar","Caesar"],

["share","share"],["back","back"],["change","modify"],["ok","yes"],["send","send"],["cancel","cancel"],["system","system"],["devine","Display"],["retry","Retry"],["help","help"],["close","close"],["openbox","open treasure chest"],["askforhelp","ask friend"],

["loading_str","loading..."],["self","me"],

["request_done","request handled"],

["friend_notload","sorry,can't get your friend list"],["friend_ally_notice","You can visit your friend and ally with him. Allies can help you fight!"],["friend_invite","Come to creat miracles with me!"],["friend_invite_success","Invite successfully！"],

["nest_style_cannotchange","Your pet is evolving, you can't change your pet now！"],

["nest_talk_morning","Good morning，a goodbegining helps to make a good end"],["nest_talk_noon","good afternoon，I'm hungry,would you feed me,please"],["nest_talk_night","Good night，early to bed,early to rise"],

["nest_talk_other","I'will be stronger after training，come and train me now！"],["nest_talk_feedover","I'm satisfied now，thanks for seeding"],["nest_talk_notfeedover","I'm hungry now,would you feed me?"],

["nest_talk_sleep","I need to adapt growing now，I can fly after being fed to 285 point！"],

["nest_getup_1","Your pet has been evolved successfully！a soil property dragon is borned."],["nest_getup_2","It become a young dragon！"],

["nest_getup_format","[NAME][DESCRIBE]'s current growing point is：[HEALTH]，propertyis：[PROPERTY]，fighting capacity is：[ATTACK]"],

["nest_pet_name","enter your pet's name："],["nest_pet_name_warning","your pet's name can not be changed after named"],

["nest_gotohelp","check the assistant document for better experience in pet system"],

["box_str_1","Help me open this treasure chest,please，"],["box_str_2","Let's share the treasure！"],["box_str_3","a <g>mysterious treasure chest<g> was found in my castle！！+ask your friends to unlock it for you！！+a mysterious gift is waiting for you！"],

["god_bless_over","you have perform magics already！"],

["share_format","[NAME][DESCRIBE]，Come on!join [NAME] and build our own miracle empire together！"],

["share_box_format","[NAME] has got a mysterious treasure chest，but he(she) can't unlock it without your help，Let's go and help him(her)！"],

["share_petup_1","you have evolved your pet successfully"],["share_petup_2","'s baby dragon has grown up"],

["share_openbox","open one mysterious treasure chest"],

["default_petname","my pet"],

["news_nonews","no messages"],

["news_element0","<b>[NAME]<b> visit your land"],

["news_element1","<b>[NAME]<b> help you manage castle"],

["news_element2","<b>[NAME]<b> send you gift"],

["news_element3"," You defeat <b>[NAME]<b>"],

["news_element4","<b>[NAME]<b> defeat you"],

["news_element5","<b>[NAME]<b> help you open treasure chest"],

["news_element6","<b>[NAME]<b> help you feed your pet"],

["gift_element0","[NAME] send you gift [GIFT]"],

["gift_element1","[NAME] ask you for gift [GIFT]"],
["monster_foodwilllost","下次登录之前还没有把怪兽消灭，怪兽会抢夺你的粮食哦！"],

["monster_refresh_format","hahaha，[NAME]，give me your crops，or you will be restless"],

["warrecord_notice_format","there are [NUM] wars, would you like to watch?"],
["war_newmap_notice","congratulations ! you enter a new map. hint : prepare enough soldiers for next level map^_^"],
["spy_notice","tips：higher scout level,more details"],

["chat_empty","Content can't be empty"],["chat_wordlimit","word number > 30"],["chat_nettimeout","network timeout, send message fail"],

["text_wordlimit_format","Limit [NUM] words！"],["text_cannotset","Can't change this name！"],["text_nettimeout","Sorry,net time out！"],

["text_message_send","Please input message: "],["text_empty","can't empty"],["text_chat_nettimeout","Sorry,fail to send,try again^_^"],

["message_send_success","Successfully send"],["text_empire_name","Please input empire name: "],

["update_normal","Ordinary upgrade"],["update_caesars","Special upgrade"],["update_warning", "The building is occupied，upgrading will interupt the operation，are you sure？"],

["onekey_plant","One button plant"],["onekey_harvest","One button harvest"],["onekey_product","One button collect taxes"],["onekey_visit_normal","One button ordinary visit"],["onekey_visit_inc","One button accumulated visit"],["onekey_title","One button operation"],

["onekey_gotohelp","How to free use？"],

["tab_fighting","Fighting"],["tab_attackable","Fightable"],

["state_attacking","attacking"],["state_defencing","defending"],["state_fighting","fighting"],

["net_state_1","Network off, please check it"],["net_state_2","Network doesn't work, try again"],

["master","master:"],[":","："],
["user_notoccupy","unoccupitation"],["user_occupy","occupited"],["user_protected","in protect"],["user_fighting","fighting"],["user_attacking","marching"],
["resource_get_format","the fortress product coin [MONEY] ，food [FOOD]，wood [WOOD]，stone [STONE] per hour，time left to harvest : [TIME]"],
["quit", "quit"],["back", "back"],

["sendFight", "Sent forces"], ["totalFight", "Total forces"], ["lostFight", "Lost forces"], ["returnFight", "Return forces"], ["defenceFight", "Defend fighting"], ["lostDefence", "Lost defense"], ["leftDefence", "Left defense"], ["lostCoin", "Lost coin"], ["share", "Share"], ["ok", "Ok"], ["attack", "Attack"], ["defence", "Defend"], ["retry", "Retry"], ["cancel", "Cancel"], ["netFail1", "It seems off network, check network connect please."], ["netFail2", "Network connect error, try again later."], ["taskShare", "Congratulations,you finish this task! Come on to share with your friends!"], ["shareReward", "Share with your friends, you will get reward."],["complete", "Complete"], ["giveup", "Give up"], ["giveupwarn", "You will lose one chance to get reward if you give up this task."], ["playWithme", "Come on to build your own miracle empire with me!"], ["goSee", "Have a look"], ["IKnow", "Got it"], ["genAdd", "Ordinary add"], ["fastAdd", "Fast add"], ["chooseDefence", "Defense incrense you choose:"], ["youLeft", "Left"], ["allyNum", "Ally number"], ["sureToally", "Sure to ally with him/her?"], ["allyOk", "You will be reinforced from your allies when you are at war. You need Caesar coins to destroy the covenant, please choose your ally carefully"], ["cancelAlly", "Cancel ally, Are you sure？"], ["makeAlly", "Ally"], ["punish", "Punishing"], ["allyUp", "The number of your allies has reached its maximum"], ["add", "Add"], ["close", "Close"], ["addAlly", "add an ally"], ["attackNow", "Your army is on the way"], ["hintPower", "hint:Your army's fighting capability will increase if you are on line when they are fighting"], ["youWin", "You win"], ["attackIt", "Attack！"], ["inBuild", "building"], ["inCall", "recruiting"], ["inProduct", "producting"], ["training", "Training"], ["planting", "Planting"], ["wooding", "lumbering"], ["stoning", "mining"], ["proDefing", "defending producting"], ["blessing", "magic performing"], ["free", "unoccupied"], ["egging", "incubating"], ["growing", "growing"], ["shopping", "purchasing"], ["buyCaesar", "Buy Caesar coins"], ["fulfill", "The goddess of harvest can increase the crop yield by performing magic"], ["population", "the goddess of population can increase the number of people you can recruit by performing magic"], ["war", "the god of war can strenthen your fighting capacity by performing magic"], ["beast", "the god of beast will increase your defense by performing magic"], ["dragon", "The dragon's nest will make it possible to summon your own pet！Are you sure？"], 
["godBless", "[GOD] can perform magic，summon [GOD],are you sure?"], 
["call", "summon"], ["coin", "coin"], ["freePeople", "unoccupied people"], ["food", "food"], ["zijin", "Upgrading to the violet golden level to use one-step finishing for free"], ["freeZijin", "You can use one-step finishing for free now"], ["youGet", "Congratulations！你获得了"],
["youPost", "[NAME] got [CARD] [CARDLEV]，join [NAME] to build your own miracle empire！"],
["loading", "Loading..."], ["noNews", "No more news"], ["loginBonus", "[NAME] has played the miracle empire and gas gained daily rewards"], 
["godShow", "Magic"], ["inGodShow", "in the magic time of effect，"],
["show", "perform"], ["friend", "Friends"], ["level", "Lev"],["expandOver", "Congratulations！expanding successfully"], ["expandPost", "[NAME] has expanded his territory，come and join the Miracle Empire！"], ["feedback", "If you have any advice of feedback,please email"], ["feedGift", "You will get mysterious gifts if your advice is accepted"], ["sendGift", "Choose a gift and send it to<g>"],["ask", "Ask "], ["send", "Send"], ["accept", "Accept"], ["levelUp", "[NAME] has level up to [LEVEL]，join the Miracle Empire and enjoy！"], ["killAll", "[NAME] has defeated the monsters and secure his territory，join the Miracle Empire and have fun！"],["nextMonster", "Monsters will come again after"], ["comeSoon", "Coming soon"],
["attackIs", "fighting capacity is"], ["powerlack", "You don't have enough fighting capacity！"], ["monRob", "Monsters have robbed"],["activeDra", "would you help me activating?"], ["letsShare", "Let's share together！"], ["askForAct", "Let's go and ask friends for help！"], ["helpme", "Help"],["askFri", "Ask friends for help"], ["unknown", "Unknown"], ["getDragon", "has got the dragon's nest，but still need your help to activate，let's go and help him！"], ["callPet", "Congratulations! You have activated the dragon's nest，now you can summon your pet！"], ["myPet", "my pet"], ["dragonPost", "[NAME] has activated dragon's nest successfully，join the Miracle Emoire and have fun！"], ["curPet", "current pet"], ["changeMode", "change mode"],
["petAtt", "[NAME] will increase [POWER] fighting point every growing point，are you sure changing mode？"], ["freeFee", "for free"], ["changeAtt", "change attribute"], ["petPro", "[NAME]'s initial fighting capacity：[POWER],increased fighting points every growing point：[ADD]. Are you sure？"],
["choosePet", "choose your pet"], ["callDragonDia", "[NAME]'s initial fighting points：[POWER],every growing point will increase [ADD].are you sure summoning this pet？"],
["inProtect", "under protection"], ["attNoProtect", "You can't enable protection mode during attacking period"],
["openProtect", "enable protection"], ["colonial", "colonial"], ["levelUp", "Congratulations！Level up"], ["goInNewMap", ", New map entered，you will see stronger opponents there，try to defeat them！"], ["cityLevelUp", ",your territory is level up！"], ["oneLevel", ", you need more experiences to upgrade your territory！"], ["next", "Next"],
["choosePlant", "choose crops"], ["sureToBuy", "are you sure purchasing"],["acc", "Accelerate"],
["leftTime", "Time left"], ["noBattle", "War mode unable"], ["winNum", "winning number："], ["netRefresh", "data exception because of net problem，please try again"], ["fresh", "refresh"],["fightAdd", "hint：soilders will have fighting capacity added when quarteres at fortress"],
["peopUp", "the miximum of population"], 
["sureTosell", "selling, are you sure？"],
["sell", "sell"], 
["toDetect", "use on detecting"], 
["unitPower", "unit fighting capacity"],
["chooseStone", "choose stone"], 
["noUpdate", "no new update！"],
["visitReward", "[NAME] has got the rewards of visiting friends，join the Miracle Empire and have fun!"],
["yourArmy", "Your military has arrived [NAME]'s territory，war is near！"],
["enemyArmy", "[NAME]'s military has arrived your territory，Let's get ready for the fight！"],
["viewWar", "watching"],
["skip", "Skip"], 
["sendArmy", "<g>+ has send his army to attack your territory"],
["godInc", "Hint: your enemy's fighting capacity will increase a regular porpotion +<b> <b>"],
["howDef", "*How to strengthen defence"],
["youNeed", "You need more"],
["speNeed", "not enough special material"], 
["clearList", "Hint：The listing will be emptied every time you entered new battlefield"],
["reqHandle", "Requests solved"], 
["income", "Congratulations![COIN] coins have been paid tribute to you，You have [NUM] colonies currently. The more your colonies is, The more your rewards is！"], 
["incomePost", "[NAME] has gained tribute rewards from colonies，join the wonder empire and have fun"], 
["chooseWood", "choose lumber"]
["youNeed", "你还缺少"], ["speNeed", "你的特殊物品不足"], ["", ""]
]);
const ganname1 = ["You can send every friend one gift a day", "You can ask for gift from every friend once a day"];
const btname1 = ["one day delay", "refresh monsters immediately"];
const timestr1 = ["2 hours", "8 hours", "24 hours"];
const  newupdate1 = ["Your territory change to night mode from 8 p.m to 6 a.m automatically. Click menu button-》night scene to close"];


const newstrs = ["{'cp':[400,300],'cz':[120,120],'gtype':0,'posi':[17,8],'cmd':'select','param':0,'tp':[600,140],'text':'领地的发展离不开农业，种植些+粮食吧。点击空闲的【农田】'}",
    "{'cp':[328,288],'cz':[120,120],'gtype':0,'posi':[17,8],'cmd':'btclick','param':0,'tp':[600,140],'text':'点击【种植】'}",
    "{'cp':[209,181],'cz':[240,240],'gtype':1,'posi':[17,8],'cmd':'state2over','param':0,'tp':[600,140],'text':'选择营养丰富的+【小麦】'}",
    "{'cp':[400,300],'cz':[120,120],'gtype':0,'posi':[17,8],'cmd':'select','param':0,'tp':[600,140],'text':'种植会耗费时间，但我们能加快+这一过程。点击种植中的【农田】'}",
    "{'cp':[328,288],'cz':[120,120],'gtype':0,'posi':[17,8],'cmd':'btclick','param':0,'tp':[600,140],'text':'点击【加速】'}",
    "{'cp':[314,342],'cz':[160,60],'gtype':0,'posi':[17,8],'cmd':'speed','param':0,'tp':[600,140],'text':'加速农作物成熟过程'}",
    "{'cp':[400,300],'cz':[120,120],'gtype':0,'posi':[17,8],'cmd':'state4over','param':0,'tp':[600,140],'text':'小麦成熟了，点击收获吧'}",
    null,
    "{'gtype':2,'posi':[17,8],'cmd':'harvest','param':0,'tp':[400,240],'text':'第一阶段任务完成+500+1+4+下一步+农业相关任务完成啦！ 恭喜，你必将+成为一个优秀的领主！'}",
    "{'cp':[35,435],'cz':[80,80],'gtype':1,'posi':[14,13],'cmd':'mclick','param':4,'tp':[200,140],'text':'领地的发展也离不开人口，建造+民居来招募人口。点击【建造】'}",
    "{'cp':[100,250],'cz':[160,280],'gtype':1,'posi':[14,13],'cmd':'pop','param':2100,'mp':[400,240],'tp':[400,140],'text':'选择【农舍】'}",
    "{'cp':[445,75],'cz':[80,80],'gtype':0,'posi':[14,13],'cmd':'build','param':1,'mp':[400,180],'tp':[600,340],'text':'选择建造农舍的位置后，点击+【确认】'}",
    "{'cp':[400,300],'cz':[120,120],'gtype':0,'posi':[14,15],'cmd':'state4over','param':0,'tp':[600,140],'text':'哇！这座民居已经招募到人口了，+点击【农舍】接收他们吧！'}",
    "{'cp':[400,300],'cz':[120,120],'gtype':0,'posi':[14,15],'cmd':'select','param':0,'tp':[600,140],'text':'点击【空闲】的农舍'}",
    //"{'cp':[282,266],'cz':[120,120],'gtype':0,'posi':[14,15],'cmd':'btclick','param':0}",
    "{'cp':[328,288],'cz':[120,120],'gtype':0,'posi':[14,15],'cmd':'state2over','param':1,'tp':[600,140],'text':'点击【招募】'}",
    "{'cp':[400,300],'cz':[160,160],'gtype':0,'posi':[14,10],'cmd':'state4over','param':0,'tp':[600,140],'text':'你的农舍已经开始招募人口了。+领地的发展也离不开金钱，点击+面包房【收税】吧！'}",
    null,
    "{'gtype':2,'posi':[14,10],'cmd':'state4over','param':0,'tp':[400,240],'text':'第二阶段任务完成+1500+2+10+下一步+人口及商业相关任务完成啦！恭喜，+祝你的领地蒸蒸日上！'}",
    "{'cp':[106,435],'cz':[80,80],'gtype':5,'posi':[14,10],'cmd':'mclick','param':5,'tp':[200,140],'text':'竟然有【怪兽】前来你的领地掠+夺粮食，去消灭它们吧！'}",
    "{'cp':[177,435],'cz':[80,80],'gtype':5,'posi':[14,10],'cmd':'mclick','param':2,'tp':[200,140],'text':'点击【地图】，查看你领地周边+的情况'}",
    "{'cp':[650,360],'cz':[120,120],'gtype':4,'posi':0,'cmd':'monster','param':15,'tp':[600,140],'mp':[650,360],'text':'点击【怪兽】'}",
    "{'cp':[310,386],'cz':[160,80],'gtype':5,'posi':0,'cmd':'attack','param':1,'tp':[200,140],'mp':[650,360],'text':'点击【攻击】'}",
    "{'cp':[450,360],'cz':[120,120],'gtype':4,'posi':0,'cmd':'goback','tp':[600,140],'mp':[650,360],'text':'恭喜你获得了胜利，点击【城堡】+返回领地'},",
    "{'cp':[120,40],'cz':[240,80],'gtype':0,'posi':[14,10],'cmd':'rename','param':0,'tp':[600,340],'text':'最后给自己的领地取一个独一无+二的名字吧！点击左上的+【信息栏】'}",
    null,
    "{'gtype':2,'posi':[14,10],'cmd':'state4over','param':0,'tp':[400,240],'text':'新手任务完成+2000+3+15+完成+恭喜你命名成功!再接再厉，让奇迹+大陆铸就你的传奇！'}"];

const items = ["2011/11/15 兽神神像上线啦！+兽神神像施展神迹期间，所有怪兽雕像都会增加城堡防御力哦！注：神迹施展之后建造的雕像无效，即神迹只对已经建造完成的雕像有效",
        "2011/11/2 奇迹帝国2.3版本上线啦！+大家可以去电子市场（Android market）或其他任何渠道下载更新。新版本增加了如下功能：+1. 支付宝充值功能；+2. 优化了访问好友速度，修复了访问好友死机的bug；+3. 增加了战争聊天室，增加了夜景和灯光效果。",
        "2011/10/30 战争聊天室上线啦！+1. 战争页面点击红色箭头就可以看到战争聊天室罗！+2. 预告：“要塞”即将上线！伯爵以上地图会出现怪兽占领的要塞，大家可以争夺要塞，要塞每小时会生产资源，占领越多的要塞会不停地获得更多的资源哦！敬请期待！+3. 给凯撒留言：由于木瓜社区置顶帖功能要过段时间才能恢复，所以大家有啥建议都可以给凯撒留言，熊哥我会及时看并回复的！",
        "2011/10/29 宠物训练&一键访问好友上线啦！+1. 训练宠物增加战斗力：点击宠物-》点击最右侧训练图标-》“完整”训练动画结束【注意是完整的动画结束哦！】-》宠物增加1点战斗力（每天最多只能加100点战斗力） +2. 一键访问好友：一键访问好友会领取所有未访问好友奖励，详细请查看帮助文档。+3. 圈子升级：这个是木瓜社区控制的，有好的建议可以反馈给木瓜社区哦！+4. 怪兽第一次出现后没有被立即消灭才会抢粮，大家要及时杀怪呀！"];
const godstr = [
    "crops yield increase 20%","population recruited in dwellings increase 20%","tax from stores increase 20%","fighting capacity increase 5%",
    "crops yield increase 40%","population recruited in dwellings increase 40%","tax from stores increase 40%","fighting capacity increase 10%",
    "crops yield increase 60%","population recruited in dwellings increase 60%","tax from stores increase 60%","fighting capacity increase 15%",
    "crops yield increase 80%","population recruited in dwellings increase 80%","tax from stores increase 80%","fighting capacity increase 20%",
    "crops yield increase 100%","population recruited in dwellings increase 100%","tax from stores increase 100%","fighting capacity increase 25%",
    "rewards for visiting friends, increase 5 coins","rewards for visiting friends, increase 10 coins","rewards for visiting friends, increase 20 coins","rewards for visiting friends, increase 30 coins","rewards for visiting friends, increase 50 coins",
    "the statue of monsters will strengthen the defense", "the statue of monsters will strengthen the defense","the statue of monsters will strengthen the defense","the statue of monsters will strengthen the defense","the statue of monsters will strengthen the defense"];
    const timestr = ["Last for 1 hour","Last for 6 hours","Last for 24 hours"];


/*注：上面标点符号都是汉字， 请改成英文的标点符号！*/
/*
    function getEmptyName(gid){
        var firstName = ["天","地", "人", "月", "秦", "赵", "齐", "楚", "阳", "牙","风", "雷", "火", "水", "木", "金", "山", "音", "伊"];
        var secondName = ["明", "暗", "井", "景", "静", "迟", "车", "龙", "紫", "念", "宁", "凝", "幻", "北", "西", "东", "南", "隐"];
        var lastName = ["国", "城", "郡", "谷", "邦", "县", "寨", "洞", "府"];
        return firstName[(gid/8)%len(firstName)]+secondName[(gid+1234)%len(secondName)]+lastName[(gid+3456)%len(lastName)];
    }
*/

var image=dict();    
function getimage(str){
    if(image.get(str)==null){
        image.update(str,fetch(str));
    }
    return image.get(str);
}

function removeself(n){
    n.removefromparent();
}

function donothing(){
    trace("sb");
    return 1;
}
    
function destroynode(p){
    var sn=p.subnodes();
    if(sn!=null){
            for(var i=0;i<len(sn);i++){
                destroynode(sn[i]);
            }
        }
        p.addaction(stop());
        p.removefromparent();
    }

import global.TimeController;

class DataController{
    var datadict;
    var sizedict;
    var builddict;
    function DataController(){
        builddict = dict();
        var build = dict([["size",3],["level",15],["price",100000],["food",1000],["exp",0],["personmax",100],["name","Dragon Eyrie"]]);

        builddict.update(1000,build);
        sizedict = dict();
        for(var i=len(buildcontext)-1;i>=0;i--){
            sizedict.update(buildcontext[i]%1000,buildcontext[i]/1000);
        }
        sizedict.update(1000,3);
    }
    function getbuild(id){
        return builddict.get(abs(id));
    }
    function getSize(id){
        return sizedict.get(id);
    }
}


class GlobalController{
    var emptyCitiesInGlo = null;
    var mapUsers = null;
    var self;
    var screen;
    var dialogscreen;
    var shotscreen;
    var context;
    var request;
    var currentLevel;
    var dark;
    var newcontext;
    var card;

    var battlelist;

    var money;
    var caesars;
    
    var personlimit;
    var rect;
    var allymax;
    var flagnew;
    var lastpage;
    var soldiers;
    var special;
    var nobility;
    var http;
    var image;
    var task;
    var wartask;
    
    var ppyuserdict;

    var godbuild;

    var userid;
    var cityid;
    var mapid;
    var system;
    var timer;
    var user;
    var data;

    var dataname;
    
    var lockpage;
    var flagshownew;
    function lock(){
        if(lockpage==null){
            lockpage = new ClockObject();
            lockpage.init(lockpage,self);
            black(NonAutoPop);
            dialogscreen.add(lockpage.getNode());
        }
    }
    
    function flock(){
        if(lockpage==null){
            lockpage = new VisitObject();
            lockpage.init(lockpage,self);
            black(NonAutoPop);
            dialogscreen.add(lockpage.getNode());
        }
    }
    
    function getEmptyName(gid){
        var firstName = ["天","地", "人", "月", "秦", "赵", "齐", "楚", "阳", "牙","风", "雷", "火", "水", "木", "金", "山", "音", "伊"];
        var secondName = ["明", "暗", "井", "景", "静", "迟", "车", "龙", "紫", "念", "宁", "凝", "幻", "北", "西", "东", "南", "隐"];
        var lastName = ["国", "城", "郡", "谷", "邦", "县", "寨", "洞", "府"];
        return firstName[(gid/8)%len(firstName)]+secondName[(gid+1234)%len(secondName)]+lastName[(gid+3456)%len(lastName)];
    }
    
    function unlock(){
        if(lockpage!=null){
            lockpage.deleteContext();
            white();
            lockpage = null;
        }
    }
    
    function getStaticString(index){
        if(type(index)==type(0)){
            if(len(staticString)<=index||index<0){
                return "";
            }
            else{
                return staticString[index];
            }
        }
        return stringDict.get(index,"");
    }
    
    function getMedalString(index,pre,leftnum,medallevel){
        var medalstr = pre+" still need ";

        if(index<12){
            medalstr = medalstr+" defeat "+str(leftnum)+" "+substring(MONSTERNAME[index*3],6);

        }
        else if(index==13){
            medalstr = medalstr+" continue login "+str(leftnum)+"days";

        }
        medalstr = medalstr+" to get "+cardprename[index]+cardlevelname[medallevel];

        return medalstr;
    }
    
    function getFormatString(index,pair){
        var rstr = getStaticString(index);
        for(var i=0;i<len(pair);i=i+2){
            rstr = rstr.replace(pair[i],pair[i+1]);
        }
        return rstr;
    }

    
    function getMedalString2(who,cstr,ctype,clevel){
        return who+cstr+" to get "+cardprename[ctype]+cardlevelname[clevel];
    }
    
    function GlobalController(){
        flagshownew = 0;
        lockpage = null;
        var s = getscene();
        screen = s.addsprite();
        flagnew = 0;
        dialogscreen = s.addsprite();
        shotscreen = s.addsprite().size(800,480);
        
        context = new Array(15);
        request = new Array(15);
        currentLevel = -1;
        dark = new Array(0);
        lastpage = new Array(0,400,400,400,0,400,400);
        godbuild = new Array(0,0,0,0);
        rect = 20;
        soldiers = [0,0,0,0,0];
        battlelist = new Array(0);
        dataname = new dict();
        dataname.update("room",ROOMNAME);
        dataname.update("fact",FACTNAME);
        dataname.update("god",GONAME);
        dataname.update("camp",CAMPNAME);
        dataname.update("farm",FARMNAME);
        dataname.update("obj",OBJNAME);
        dataname.update("soldier",SOLDIER_NAME);
        dataname.update("plant",PLANTNAME);
        dataname.update("stone",STONENAME);
        dataname.update("wood",WOONAME);
        dataname.update("statue",STATUE_NAME);
        timer =null;
        data = new DataController();
        ppyuserdict = dict([[str(ppy_userid()),dict([["name",ppy_username()]])],["0",dict([["name","Caesar"]])]]);

    }
    
    function inittimer(t){
        if(timer == null){
            timer=new TimeController(t);
        }
    }

    function getfriend(papayaid){
        if(type(papayaid)!=4){
            papayaid=str(papayaid);
        }
        var u = ppyuserdict.get(papayaid);
        if(u==null){
            u = dict([["name","unknown"],["level",-1]]);
        }
        return u;
    }

    function getname(namestr,nameid){
        return dataname.get(namestr)[nameid];
    }

    function changesoldiers(ne,b,value,hi){
        soldiers[b] = soldiers[b]+value;
        if(ne.contextNode!=null){
            var ps = ne.contextNode.pos();
            var x = ps[0]+ne.contextid*2;
            var y = ps[1]-ne.contextid*17-hi*17;
            var n = node().pos(x,y);
            n.add(sprite("flysoldier.png").anchor(100,50).pos(-5,0));
            var ns = str(value);
            var f = 0;
            if(value > 0){
                ns = "+"+ns;
                f = 1;
            }
            n.addlabel(ns,null,40).color(100,f*100,0,100).anchor(0,50).pos(5,0);
            n.addaction(sequence(moveby(1000,0,-80),tintto(1000,0,0,0,0),callfunc(removeself)));
            context[0].contextNode.add(n.scale(80),20000);
        }
        if(task.tasktype==1){
            if(value>0 && ne.objectid/100==2 && ne.objnode.bid/3==task.taskpair[1] && ne.objnode.objid/3==task.taskpair[3]){
                task.inctaskstep(value);
            }
        }
        if(wartask.wartasktype==1){
            if(value>0 && ne.objectid/100==2 && ne.objnode.bid/3==wartask.wartaskpair[1] && ne.objnode.objid/3==wartask.wartaskpair[3]){
                wartask.incwartaskstep(value);
            }
        }
    }

    function keydown(n,e,p,c){
        trace(c);
        //quitgame();
    }

    function black(auto){
        var i= len(dark);
        if(i>0)
            dark[i-1].visible(0);
        dark.append(dialogscreen.addsprite("dark.png").size(800,480).color(0,  0,  0,darkColorAlpha));
        dark[i].setevent(EVENT_TOUCH,autopopContext,auto);
        if(flagnew == 1 && newcontext.getNode().visible()==1)
            dark[i].visible(0);
    }

    function autopopContext(n,e,p){
        if(p == AutoPop){
            popContext(null);
        }
    }

    function white(){
        dark.pop().removefromparent();
        if(len(dark) > 0 && (flagnew==0||newcontext.getNode().visible()==0))
            dark[len(dark)-1].visible(1);
    }

    function pushContext(re,co,auto){
        if(currentLevel>=0 && context[currentLevel].contextname.rfind("control")==0){
            popContext(null);
        }
        if(auto == NotAdd){
            flagnew = 1;
            newcontext = co;
        }
        else{
            currentLevel++;
            if(currentLevel > 0)
                black(auto);
            request[currentLevel] = re;
            if(re == null && currentLevel>0)
                request[currentLevel] = context[currentLevel-1];
            context[currentLevel] = co;
        }
        co.global = self;
        co.self = co;
        co.contextLevel = currentLevel;
        if(auto == NotAdd)
            shotscreen.add(co.getNode());
        else if(currentLevel == 0)
            screen.add(co.getNode());
        else
            dialogscreen.add(co.getNode());
        if(flagnew == 0 || auto == NotAdd)
            co.getNode().focus(1);
        context[0].hiddentime = 10;
        if(task.tasktype==2){
            if(task.taskreq == co.contextname){
                task.inctaskstep(1);
            }
        }
        if(wartask.wartasktype==2){
            if(wartask.wartaskreq == co.contextname){
                wartask.incwartaskstep(1);
            }
        }
    }

    function popContext(re){
        if(re == -999){
            newcontext.deleteContext();
            flagnew = 0;
            context[currentLevel].getNode().focus(1);
            if(len(dark)>0)
                dark[len(dark)-1].visible(1);
        }
        else if(currentLevel > 0){
            context[currentLevel].deleteContext();
            context[currentLevel] = null;
            currentLevel--;
            white();
            if(flagnew == 0)
                context[currentLevel].getNode().focus(1);
            request[currentLevel+1].response(re);

        }
    }
    
    function getdatestr(seconds){
        var day = seconds/86400;
        var months=[31,28,31,30,31,30,31,31,30,31,30,31];
        var year = 2011;
        var month = 0;
        while(day>months[month]){
            day=day-months[month];
            month = (month+1)%12;
            if(month==0){
                year++;
                if(year%4==0){
                    months[1]=29;
                }
                else{
                    months[1]=28;
                }
            }
        }
        return str(year)+"-"+str(month+1)+"-"+str(day+1);
    }
    
    function getdatetimestr(t){
        return getdatestr(t)+" "+gettimestr(t%86400);
    }

    function gettimestr(t){
        var ti = new Array(3);
        ti[2] = t%60;
        ti[1] = t%3600/60;
        ti[0] = t/3600;
        for(var i=0;i<3;i++){
            if(ti[i] < 10)
                ti[i] = "0"+str(ti[i]);
            else
                ti[i] = str(ti[i]);
        }
        return ti[0]+":"+ti[1]+":"+ti[2];
    }

    function getnobility(nob,subnob){
        if(subnob==3) subnob=2;
        var n = sprite("nobi"+str(nob*3+subnob)+".png").size(30,30);
        n.addlabel(NOBNAME[nob*3+subnob],null,20).anchor(0,50).pos(32,15).color(0,0,0,100);
        return n;
    }
    
    function addtext(n,x,y,text,fsize){
        var strs = text.split("+");
        for(var i=0;i<len(strs);i++){
            if(strs[i].rfind("<b>")!= -1){
                var str = strs[i].split("<b>");
                var tmp1=n.addlabel(str[0],null,fsize).pos(x,y+fsize*6/5*i).color(0,0,0,100);
                tmp1.prepare();
                var tmp2=n.addlabel(str[1],null,fsize).pos(x+tmp1.size()[0],y+fsize*6/5*i).color(0,0,67,100);
                tmp2.prepare();
                n.addlabel(str[2],null,fsize).pos(x+tmp1.size()[0]+tmp2.size()[0],y+fsize*6/5*i).color(0,0,0,100);
            }
            else if(strs[i].rfind("<g>")!=-1){
                str = strs[i].split("<g>");
                tmp1=n.addlabel(str[0],null,fsize).pos(x,y+fsize*6/5*i).color(0,0,0,100);
                tmp1.prepare();
                tmp2=n.addlabel(str[1],null,fsize).pos(x+tmp1.size()[0],y+fsize*6/5*i).color(43,75,0,100);
                tmp2.prepare();
                n.addlabel(str[2],null,fsize).pos(x+tmp1.size()[0]+tmp2.size()[0],y+fsize*6/5*i).color(0,0,0,100);
            }
            else if(strs[i].rfind("<r>")!=-1){
                str = strs[i].split("<r>");
                tmp1=n.addlabel(str[0],null,fsize).pos(x,y+fsize*6/5*i).color(0,0,0,100);
                tmp1.prepare();
                tmp2=n.addlabel(str[1],null,fsize).pos(x+tmp1.size()[0],y+fsize*6/5*i).color(75,0,0,100);
                tmp2.prepare();
                n.addlabel(str[2],null,fsize).pos(x+tmp1.size()[0]+tmp2.size()[0],y+fsize*6/5*i).color(0,0,0,100);
            }
            else{
                n.addlabel(strs[i],null,fsize).pos(x,y+fsize*6/5*i).color(0,0,0,100);
            }
        }
    }
}
var global= new GlobalController();
