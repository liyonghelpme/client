import global.Data;
const buildcontext = [
//castal
9000,
//farm
2001,2002,2003,2004,3005,3006,
//house
2100,2101,2102,2103,2104,2105,2106,2107,2108,2109,2110,2111,2112,2113,2114,2115,2116,2117,2118,2119,2120,2121,2122,2123,2124,2125,2126,2127,2128,2129,2130,2131,2132,2133,2134,2135,3136,3137,3138,3139,3140,3141,3142,3143,3144,3145,3146,3147,3148,3149,3150,3151,3152,3153,3154,3155,3156,3157,3158,3159,2160,2161,2162,2163,2164,2165,2166,2167,2168,2169,2170,2171,3172,3173,3174,3175,3176,3177,
2178, 2179, 2180,
2181, 2182, 2183,
2184, 2185, 2186,
2187, 2188, 2189,
2190, 2191, 2192,

//camp
2200,2201,2202,2203,2204,2205,2206,2207,2208, 2209, 2210, 2211,
//fact
2300,2301,2302,2303,2304,2305,2306,2307,2308,2309,2310,2311,2312,2313,2314,2315,2316,2317,2318,2319,2320,2321,2322,2323,2324,2325,2326,3327,3328,3329,2330,2331,2332,
2333, 2334, 2335, 2336, 2337, 2338,
2339, 2340, 2341, 
2342, 2343, 2344,

//god
2400,2401,2402,2403,2404,2405,2406,2407,2408,2409,2410,2411,2412,2413,2414,2415,2416,2417,2418,2419,2420,2421,2422,2423,2424,2425,2426,2427,2428,2429,
//decor
1500,1501,1502,1503,1504,1505,1506,1507,1508,1509,1510,1511,1512,1513,1514,1515,1516,1517,1518,1519,1520,1521,1522,1523,1524,1525,1526,1527,1528,1529,1530,1531,1532,1533,1534,1535,1536,1537,1538,2539,2540,2541,1542,1543,2544,1545,1546,1547,1548,1549, 
2550, 2551, 1552, 2553, 2554, 2555, 2556,
1557, 1558, 1559, 2560, 1561, 1562,
1563, 1564, 2565, 2566,
1567, 1568, 1569,
1570, 1571, 1572, 1573,
1574, 1575, 1576, 1577,
1578, 1579, 1580, 1581, 1582,
//statue
2600,2601,2602,2603,2604,2605,
1606, 1607,
//dragon disk
3700,
];


const BASE_URL = "http://23.21.135.42:8000/";
//const BASE_URL = "http://uhz000738.chinaw3.com:8888/";
const WARCHAT_URL = "http://ec2-23-20-68-199.compute-1.amazonaws.com:8004/";
//const WARCHAT_URL = "http://uhz000738.chinaw3.com:8004/";
const HELP_URL = "http://ec2-23-20-68-199.compute-1.amazonaws.com/";
//const HELP_URL = "http://uhz000738.chinaw3.com/"

const hmax = [51,201,831, 9999];
const hmaxs = [3, 5, 7, 7];
const OpenReward = 1000;
const FeedReward = 1000;
const LevUpPop = 10;




const DISK_MONEY = [3000];
const DISK_PERSON = [30];
const DISK_LEV = [3];
const DISK_TIME = [45*60];
const DISK_NAME = ["Dragon Wheel"];

const DOCK_NAME = ["Dock"];
const DOCK_COST = [130000, 50];

const NEWDATA = [[1000,1,200,370,590,0,60],[1450,2,220,370,590,6,60],[2550,5,190,370,600,26,60]];
const FARM_PRICE = [0,1000,-20,-50,-100,10000,28500];
const FARM_PERSON = [0,80,0,0,0,120,250];
const FARM_EXP = [0,5,15,40,70,20,30];
const FARM_FOOD = [0,0,0,0,0,600,1000];
const FARM_USE = [0,"plant crops","plant crops (x1.2)","plant crops (x1.4)","plant crops (x1.6)","produce wood","produce stone"];


const PLANT_TIME = [600,2700,3600,9360,22680,14399,1800,3600,9000,11520,29160,25200];
const PLANT_PRICE = [50,165,-1,700,1440,-3,230,600,-2,1210,3000,-5];
const PLANT_EXP = [1,3,6,7,10,10,5,7,10,13,18,20];
const PLANT_FOOD = [20,50,120,150,300,430,52,80,280,200,410,650];

const STONE_TIME = [4320,21600,6480,5400,25200,9000];
const WOOD_TIME = [4320,21600,6480,5400,25200,9000];
const STONE_PRICE = [1200,3600,-5,2000,5500,-10];
const WOOD_PRICE = [600,1850,-4,1000,2500,-8];
const STONE_EXP = [10,20,30,15,25,65];
const WOOD_EXP = [5,15,20,10,20,50];
const STONE_GAIN =[20,50,70,40,80,120];
const WOOD_GAIN = [20,50,70,40,80,120];

const ROOM_B_TIME = [600, 1200, 2400, 600, 1200, 2400, 600, 1200, 2400, 600, 1200, 2400, 1800, 4320, 9000, 1800, 4320, 9000, 1800, 4320, 9000, 1800, 4320, 9000, 15840, 24480, 30600, 15840, 24480, 30600, 15840, 24480, 30600, 15840, 24480, 30600, 5400, 11160, 21240, 5400, 11160, 21240, 5400, 11160, 21240, 5400, 11160, 21240, 25200, 36720, 68040, 25200, 36720, 68040, 25200, 36720, 68040, 25200, 36720, 68040, 7560, 15480, 30600, 7560, 15480, 30600, 7560, 15480, 30600, 7560, 15480, 30600, 11520, 21600, 29880, 2520, 4680, 7200, 18000, 31680, 46800, 
8*3600, 10*3600, 12*3600, 10*3600, 12*3600, 14*3600,
1200, 4680, 9360,
6480, 13320, 25200];

const ROOM_B_FOOD = [10, 30, -70, 10, 30, -70, 10, 30, -70, 10, 30, -70, 60, 120, -100, 60, 120, -100, 60, 120, -100, 60, 120, -100, 400, -150, -100150, 400, -150, -100150, 400, -150, -100150, 400, -150, -100150, 200, -120, -100120, 200, -120, -100120, 200, -120, -100120, 200, -120, -100120, 600, -200, -100200, 600, -200, -100200, 600, -200, -100200, 600, -200, -100200, 0, -300, -100300, 0, -300, -100300, 0, -300, -100300, 0, -300, -100300, 0, -160, -100160, 0, -200, -100200, 0, -170, -100170,
350, -250, -100250, 550, -270, -100270,
55, 110, -90, 
0, -280, -100280];

const ROOM_B_EXP = [3, 8, 15, 3, 8, 15, 3, 8, 15, 3, 8, 15, 5, 13, 24, 5, 13, 24, 5, 13, 24, 5, 13, 24, 13, 21, 30, 13, 21, 30, 13, 21, 30, 13, 21, 30, 11, 25, 39, 11, 25, 39, 11, 25, 39, 11, 25, 39, 20, 32, 43, 20, 32, 43, 20, 32, 43, 20, 32, 43, 15, 25, 40, 15, 25, 40, 15, 25, 40, 15, 25, 40, 18, 28, 44, 30, 44, 60, 29, 43, 58,
23, 35, 45, 25, 37, 48,
4, 11, 22,
15, 25, 40,];

const ROOM_PRICE = [500, 1400, 2800, 550, 1540, 3080, 600, 1680, 3360, 650, 1820, 3640, 1500, 4800, 9000, 1650, 5280, 9900, 1800, 5760, 10800, 1950, 6240, 11700, 7300, 15000, 19000, 8030, 16500, 20900, 8760, 18000, 22800, 9490, 19500, 24700, 3500, 6600, 11000, 3850, 7260, 12100, 4200, 7920, 13200, 4550, 8580, 14300, 10500, 15500, 19500, 11550, 17050, 21450, 12600, 18600, 23400, 13650, 20150, 25350, -10, 20000, 25000, -11, 22000, 27500, -12, 24000, 30000, -13, 26000, 32500, -15, 14000, 18500, -20, 20000, 28000, -15, 14400, 19200,
6000, 8300, 10500, 7500, 8900, 20000,
1400, 4700, 8800,
-8, 18000, 23000];

const ROOM_TIME = [1800, 1800, 1800, 1800, 1800, 1800, 1800, 1800, 1800, 1800, 1800, 1800, 7560, 7560, 7560, 7560, 7560, 7560, 7560, 7560, 7560, 7560, 7560, 7560, 18720, 18720, 18720, 18720, 18720, 18720, 18720, 18720, 18720, 18720, 18720, 18720, 12600, 12600, 12600, 12600, 12600, 12600, 12600, 12600, 12600, 12600, 12600, 12600, 29880, 29880, 29880, 29880, 29880, 29880, 29880, 29880, 29880, 29880, 29880, 29880, 14400, 14400, 14400, 14400, 14400, 14400, 14400, 14400, 14400, 14400, 14400, 14400, 5400, 5400, 5400, 10800, 10800, 10800, 21600, 21600, 21600,
8*3600, 8*3600, 8*3600, 12*3600, 12*3600, 12*3600,
6840, 6840, 6840,
10800, 10800, 10800];

const ROOM_FOOD = [20, 30, 40, 20, 30, 40, 20, 30, 40, 20, 30, 40, 64, 86, 110, 64, 86, 110, 64, 86, 110, 64, 86, 110, 140, 174, 200, 140, 174, 200, 140, 174, 200, 140, 174, 200, 90, 116, 142, 90, 116, 142, 90, 116, 142, 90, 116, 142, 190, 230, 270, 190, 230, 270, 190, 230, 270, 190, 230, 270, 150, 225, 300, 150, 225, 300, 150, 225, 300, 150, 225, 300, 75, 112, 150, 140, 214, 290, 275, 416, 538,
130, 146, 162, 160, 200, 240,
60, 80, 100,
150, 220, 300,];

const ROOM_PERSON = [10, 15, 20, 10, 15, 20, 10, 15, 20, 10, 15, 20, 32, 43, 55, 32, 43, 55, 32, 43, 55, 32, 43, 55, 70, 83, 100, 70, 83, 100, 70, 83, 100, 70, 83, 100, 50, 62, 75, 50, 62, 75, 50, 62, 75, 50, 62, 75, 95, 115, 135, 95, 115, 135, 95, 115, 135, 95, 115, 135, 100, 150, 200, 100, 150, 200, 100, 150, 200, 100, 150, 200, 50, 72, 100, 47, 68, 190, 90, 134, 370,
65, 73, 81, 80, 100, 120,
30, 40, 50, 
80, 120, 160,];

const ROOM_EXP = [1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3, 3, 5, 7, 3, 5, 7, 3, 5, 7, 3, 5, 7, 7, 9, 11, 7, 9, 11, 7, 9, 11, 7, 9, 11, 7, 9, 11, 7, 9, 11, 7, 9, 11, 7, 9, 11, 13, 15, 17, 13, 15, 17, 13, 15, 17, 13, 15, 17, 15, 17, 19, 15, 17, 19, 15, 17, 19, 15, 17, 19, 9, 11, 13, 19, 21, 23, 17, 19, 21,
7, 9, 11, 11, 13, 15,
2, 4, 6, 
6, 8, 10];

const ROOM_UP = [0, "2;a,1", "4;a,2;b,3", 0, "2;a,1", "4;a,2;b,3", 0, "2;a,1", "4;a,2;b,3", 0, "2;a,1", "4;a,2;b,3", 0, "6;b,2;c,2", "10;c,2;d,3", 0, "6;b,2;c,2", "10;c,2;d,3", 0, "6;b,2;c,2", "10;c,2;d,3", 0, "6;b,2;c,2", "10;c,2;d,3", 0, "15;f,2;g,2", "16;g,2;h,3", 0, "15;f,2;g,2", "16;g,2;h,3", 0, "15;f,2;g,2", "16;g,2;h,3", 0, "15;f,2;g,2", "16;g,2;h,3", 0, "8;d,2;e,2", "11;e,2;f,3", 0, "8;d,2;e,2", "11;e,2;f,3", 0, "8;d,2;e,2", "11;e,2;f,3", 0, "8;d,2;e,2", "11;e,2;f,3", 0, "16;h,2;i,2", "19;i,2;j,3", 0, "16;h,2;i,2", "19;i,2;j,3", 0, "16;h,2;i,2", "19;i,2;j,3", 0, "16;h,2;i,2", "19;i,2;j,3", 0, "18;b,2;c,2", "20;c,2;d,3", 0, "18;b,2;c,2", "20;c,2;d,3", 0, "18;b,2;c,2", "20;c,2;d,3", 0, "18;b,2;c,2", "20;c,2;d,3", 0, "13;a,2;f,2", "16;d,2;i,4", 0, "20;a,2;f,2", "22;d,2;i,4", 0, "14;i,5", "17;j,4",
0, "15;a,5", "18;b,5", 0, "17;c,5", "20;d,5",
0, "5;b,2;d,2", "9;c,2;e,4", 
0, "18;b,2;c,2", "20;c,2;d,3"];

const FACT_B_TIME = [600, 1800, 3600, 3600, 10440, 15120, 5400, 14400, 23400, 19800, 35280, 46800, 8280, 22320, 28800, 20520, 25200, 33120, 21600, 28800, 36720, 30600, 37440, 46800, 25200, 30240, 39600, 11160, 20800, 31680, 7200, 14400, 21600,
8*3600, 10*3600, 12*3600, 10*3600, 12*3600, 14*3600,
2700, 7200, 14400, 
1800, 10800, 21600, ] ;

const FACT_PRICE = [300, 500, 1100, 1200, 1800, 3000, -10, 5000, 7000, 2000, 3300, 4500, 5000, 7000, 13500, -8, 9000, 11000, 7200, 11000, 19900, 8000, 13000, 21000, -30, 13000, 17000, 20000, 25000, 33000, -20, 10000, 15000,
10000, 15000, 24000, 15000, 18000, 27000,
1100, 1700, 2800, 
-8, 4500, 6500,
] ;
const FACT_GAIN = [50, 70, 100, 300, 450, 610, 300, 660, 1000, 530, 750, 1100, 150, 210, 300, 1100, 2400, 4400, 590, 880, 1200, 1100, 1600, 2300, 1700, 3000, 5100, 1500, 2200, 3000, 600, 900, 1300,
1000, 1450, 2100, 1720, 3200, 5050,
190, 250, 380, 
200, 440, 660] ;

const FACT_FOOD = [20, 30, -70, 45, -100, -100100, 0, -120, -100120, 80, -150, -100150, 100, -170, -100170, 0, -200, -100200, 130, -210, -100210, 170, -230, -100230, 0, -250, -100250, 500, -250, -100250, 0, -150, -100150,
200, -280, -100280, 
300, -300, -100300,
40, -100, -100100,
0, -110, -100120] ;
const FACT_B_EXP = [3, 7, 11, 5, 9, 14, 15, 20, 25, 7, 9, 11, 9, 11, 13, 25, 30, 35, 20, 33, 45, 29, 45, 61, 35, 45, 60, 15, 20, 25, 23, 30, 39,
17, 19, 21,
19, 21, 23,
4, 8, 13,
14, 19, 24,] ;
const FACT_EXP = [
2, 3, 5, 
4, 6, 10, 
6, 8, 12, 
8, 10, 15, 
13, 15, 20, 
20, 23, 27, 

18, 23, 30, 
23, 28, 35, 
21, 25, 32,

20, 22, 27,

14, 16, 20,
15, 17, 21,

19, 21, 30,
3, 4, 8,
4, 6, 10,] ;

const FACT_TIME = [600, 600, 600, 5400, 5400, 5400, 1800, 1800, 1800, 10440, 10440, 10440, 1800, 1800, 1800, 14400, 14400, 14400, 7200, 7200, 7200, 14400, 14400, 14400, 26280, 26280, 26280, 36000, 36000, 36000, 7920, 7920, 7920,
6*3600, 6*3600, 6*3600, 
12*3600, 12*3600, 12*3600,
2700, 2700, 2700,
1200, 1200, 1200,] ;

const FACT_PERSON = [20, 25, 35, 40, 50, 65, 0, 0, 0, 50, 65, 85, 70, 90, 115, 0, 0, 0, 90, 115, 145, 110, 140, 175, 0, 0, 0, 55, 73, 100, 0, 130, 170,
70, 85, 105,
90, 115, 155,
30, 37, 52,
0, 0, 0,] ;

const FACT_UP = [0, "3;a,1", "5;a,2;b,3", 0, "5;b,2;c,2", "8;c,2;d,3", 
0, "10;b,2;c,2", "15;c,2;d,3", 0, "10;d,2;e,2", 
"13;e,2;f,3", 0, "18;f,2;g,2", "24;g,2;h,3", 0, 
"19;d,2;e,2", "22;e,2;f,3", 0, "25;h,2;i,2", 
"30;i,2;j,3", 0, "27;j,2;k,2", "30;k,2;l,3", 0, 
"30;h,2;i,2", "33;i,2;j,3", 0, "31;b,5", 
"40;c,5", 0, "20;e,3;c,2", "25;a,5",
0, "21;a,5", "23;b,5",
0, "23;c,5", "25;d,5",
0, "4;a,2;c,2", "7;b,2;d,3",
0, "9;b,2;e,2", "14;a,2;d,3",
] ;


const GOD_B_TIME = [7200,21600,43200,64800,86400];
//const GOD_SALE = [2500,7500,20000,45000,170000];
const GOD_B_PRICE = [10000,20000,50000,100000,500000];
const GOD_UP = [0,"29","49","99","199"];
const GOD_FOOD = [500,1000,2000,5000,10000];
const GOD_PERSON_MAX = [100, 200, 300, 400, 500];
const GOD_EXP = [50,100,170,250,350];

const BLESS_CAESARS = [15, 23, 30, 18, 26, 40, 21, 29, 50, 24, 32, 60, 27, 35, 70];

const CAMP_PRICE = [4000,9000,20000,12000,25000,50000,6000,12000,25000, 20000, 45000, 100000];
const CAMP_FOOD = [130,-200,-100200,320,-500,-100500,150,-300,-100300, 400, -400, -100400];
const CAMP_PERSON = [100,120,170,130,150,200,90,110,160, 200, 250, 300];
const CAMP_EXP = [5,10,20,15,20,35,7,15,30, 20, 50, 100];
const CAMP_TIME = [3600,11520,22680,7200,14760,28440,10800,21600,32400, 5*3600, 7*3600+1800, 10*3600];
const CAMP_USE = ["train infantry","train cavalry","train scout", "train catapult"];
const CAMP_UP = [0,"5;a,3","10;b,3;c,4",0,"7;b,3","15;c,3;d,4",0,"3;c,3","7;d,3;e,4", 0, "29;a,8;b,8", "69;c,15;g,15"];

const CATA_ATTACK = [400, 1000, 2000];
const CATA_PRICE = [10000, 50000, 100000];
const CATA_SPECIAL = ["500;a,5;b,5", "-500;a,8;c,8", "-1000;g,12;i,12"];
const CATA_TIME = [7200, 21600, 43200];
const CATA_CAE = [20, 50, 100];
const CATA_NAME=["Catapult Lv. 1", "Catapult Lv. 2", "Catapult Lv. 3"];

const SOLDIER_TIME = [7200,21600,43200];
const SOLDIER_EXP = [5,8,13,9,15,21,16,25,34,10,15,20,30,40,50,60,75,90,3,6,9,5,8,13,9,15,21];
const SOLDIER_PRICE=[750,2400,4800,1600,5000,10000,2400,7500,15000,2000,6300,12600,2600,7900,15800,3300,10000,20000,150,500,1000,310,990,1980,480,1500,3000];
const SOLDIER_PERSON = [30,15,2];
const SOLDIER_FOOD = [3,6,9,10,20,30,5,10,15];
const SOLDIER_POWER = [1,2,3,4,5,6,0,0,0];

const MONSTER_POWER = [20,30,41,25,37,49,28,42,56,33,49,65,40,58,77,50,75,100,42,65,90,51,74,104,60,90,120,73,109,145,80,120,160,100,150,200];

const EXPAND_LEVEL=[4,7,10,15,20,25,30,40,50,60];
const EXPAND_MONEY=[10000,50000,100000,500000,1000000,1500000,2000000,2500000,3000000,5000000];
const EXPAND_CAESARS=[10, 30, 50, 70, 100, 150, 200, 300, 500, 1000];
//const EXPAND_CAESARS = [5, 15, 25, 35, 50, 75, 100, 150, 250, 500];
const EXPAND_FRIEND=[1,10,50,100,200,400,800,1000,2000,5000];
const EXPAND_EXP=[10,20,40,70,110,150,210,280,360,450];

const PETS_PRICE=[50000,100000,500000,-10,-50,-100];
const PETS_POWER = [100,250,1000,300,1200,1500];
const PETS_UP = [5,6,10,7,12,17];

const EXTEND_UP=[0,3,3];

//discount sale price
const OBJ_PRICE = [10, 20, 30, 50, -1, 250, 250, 250, 250, -2, -2, 200, -5, 400, 600, 200, 800, 900, 8000, 2000, -5, 3000, 3000, -10, 3000, 3000, -10, -10, 4000, 4000, -10, -10, 800, 800, -10, 6000, -15, 6000, -30, 3000, -8, -99, -20, -20, -15, -10, 5000, 5000, -10, -10, -100, -99, 10000, -10, 5000, 8000, -15, -10, 4000, 1500, 10000, 3000, 1000, -100, -18, -200, -20,
-25, 10000, 9000, 
-2, 8000, 12000, 50000,
-5, 500, 100, 100,
-6, 800, 150, -3, 1000];

const OBJ_PERSON = [5, 5, 5, 7, 15, 13, 13, 13, 13, 18, 18, 13, 40, 15, 15, 12, 17, 18, 67, 50, 45, 40, 40, 90, 41, 41, 93, 93, 45, 45, 91, 91, 19, 19, 90, 65, 100, 65, 150, 45, 90, -1, 110, 110, 99, 89, 44, 44, 85, 85, -1, -1, 70, 80, 43, 60, 93, 91, 46, 24, 130, 40, 21, -1, 110, -3, 100,
130, 72, 70,
26, 70, 75, 95,
20, 13, 6, 6,
28, 15, 7, 27, 17];

const STATUE_PRICE = [10000, -10, 20000, -20, 50000, -50, 80000, -80];
const STATUE_DEFENCE=[600,700,1150,1300,3000,3200, 4000, 4400];
const STATUE_PERSON=[10,10,10,10,10,10, 10, 10];
const STATUE_TIME = [7200,14400,21600,28800,36000,43200, 36000, 43200];

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
const LevAddPer = 100;
const LevAddCoin = 1000;
const LevAddDra = 2;

const LEV_EXP =[0,20,50,110,210,360,660,1160,1960,3160,4860,7160,10160,14060,19130,25721,34289,43713,54079,65481,78023,91819,106994,123686,142047,162244,184460,208897,235777,265345];
const UNLOCK = dict(
[[1, ["room0.png", "room3.png", "room6.png", "room9.png", "camp0.png", "fact0.png", "plant1.png"]],
[2, ["object0.png", "object1.png", "object2.png"]],
[3, ["camp6.png", "plant2.png"]], [4, ["object3.png", "object61.png", "object66.png", "fact3.png"]], [5, ["object4.png", "object15.png", "room12.png", "room15.png", "room18.png", "room21.png", "plant3.png"]], [6, ["object5.png", "object6.png", "object7.png", "object8.png", "fact6.png"]], [7, ["object9.png", "object10.png", "plant4.png"]], [8, ["object11.png", "object12.png", "object53.png", "object54.png", "room60.png", "room63.png", "room66.png", "room69.png", "fact9.png", "shen0.png"]], [9, ["object13.png", "object55.png", "object56.png", "plant5.png"]], [10, ["object14.png", "object46.png", "object47.png", "object48.png", "object49.png", "room24.png", "room27.png", "room30.png", "room33.png", "fact30.png", "plant6.png"]], [11, ["object16.png", "object20.png", "camp3.png"]], [12, ["object17.png", "object50.png", "room72.png", "camp0.png", "camp1.png", "fact27.png", "shen1.png"]], [13, ["object18.png", "object45.png", "camp2.png", "camp3.png", "plant7.png"]], [14, ["object32.png", "fact15.png"]], [15, ["object19.png", "object33.png", "disk0.png", "object44.png", "room36.png", "room39.png", "room42.png", "room45.png", "camp4.png", "camp5.png", "fact12.png"]], [16, ["object28.png", "object29.png", "object30.png", "object31.png", "object57.png", "shen3.png", "plant8.png"]], [17, ["object21.png", "object22.png", "object23.png", "object40.png"]], [18, ["object24.png", "object25.png", "object26.png", "object27.png", "object58.png", "room75.png"]], [19, ["object38.png"]], [20, ["object35.png", "object36.png", "object37.png", "object63.png", "room48.png", "room51.png", "room54.png", "room57.png", "shen2.png", "plant9.png"]], [21, ["object42.png", "object43.png", "object62.png", "fact18.png"]], [22, ["object51.png", "object52.png", "room78.png"]], [23, ["object64.png", "plant10.png"]], [24, ["object59.png", "object65.png","camp9.png", "fact24.png"]], [25, ["object39.png", "object41.png",  "shen20.png", "plant12.png"]], [26, ["plant11.png", "object67.png"]], [27, ["object68.png", "object69.png"]], [29, ["fact21.png"]], [31, ["shen25.png"]]]

);

const waitaction1 = repeat(animate(2000,"wait1.png","wait2.png","wait3.png","wait4.png","wait5.png","wait6.png","wait7.png","wait8.png","wait9.png","wait10.png","wait11.png","wait12.png","wait13.png","wait14.png","wait15.png","wait16.png","wait17.png","wait18.png","wait19.png","wait20.png"));


const allcardlevelnum = [[2,4,7,15,30],[1000,5000,20000,50000,100000],[10000,50000,100000,500000,1000000],[],[],[1,100,100,100,40]];
const cardlevelnum = [5,15,45,85,135];


const DEFAULT_NAME="My empire";

const GRAY =m_color(30,59,11,0,0, 30,59,11,0,0, 30,59,11,0,0, 0,0,0,100,0);
const NORMAL = m_color(100,0,0,0,0, 0,100,0,0,0, 0,0,100,0,0, 0,0,0,100,0);
const cardnum = 13;
const NEWFLAG = 14;

var staticString = ["loading", "loading"];
//var sta = c_file_op(C_FILE_READ, c_res_file("static.txt"));
//sta = json_loads(sta);
var sta = Statics;
if(sta != null)
{
    trace("pass sta");
    staticString = sta;
}

var stringDict;
//sta = c_file_op(C_FILE_READ, c_res_file("dict.txt"));
//sta = json_loads(sta);
sta = Dicts;
if(sta != null)
{
    trace("pass dict");
    stringDict = dict(sta);
    trace(stringDict.get("NobCard"));
}

var newstrs;
var timestr;
var ganname1;
var btname1;
var timestr1;
var newupdate1;
var godstr;
var items;
var SPYITEMS;

//sta = c_file_op(C_FILE_READ, c_res_file("others.txt"));
//sta = json_loads(sta);
sta = Others;
if(sta != null)
{
    trace("pass others");
    newstrs = sta.get("newstr");
    timestr = sta.get("timestr");
    timestr1 = sta.get("timestr1");
    ganname1 = sta.get("ganname1");
    btname1 = sta.get("btname1");
    newupdate1 = sta.get("newupdate1");
    godstr = sta.get("godstr");
    items = sta.get("items");
    SPYITEMS = sta.get("SPYITEMS");
}
var FACTNAME;
var FACTNAME1;
var WOONAME;
var cardprename;
var PLANTNAME;
var FARMNAME;
var ENAME;
var STATUE_NAME;
var PETS_NAME;
var BUILD_TAB_NAME;
var STONENAME;
var GIFTNAME;
var EXTEND_PETS_NAME;
var NOBNAME;
var NOBNAME2;

var nobilityname;
var ROOMNAME;
var ROOMNAME1;
var cardlevelname;
var GONAME;
var GONAME1;
var INVITE_STR;
var SOLDIER_NAME;
var SOLDIER_NAME1;
var EXTEND_NAME;
var CAMPNAME;
var CAMPNAME1;
var OBJNAME;
var MONSTERNAME;

//sta = c_file_op(C_FILE_READ, c_res_file("names.txt"));
//sta = json_loads(sta);
sta = Names;
if(sta != null)
{
    trace("pass name");
    FACTNAME = sta.get("FACTNAME");
    FACTNAME1 = sta.get("FACTNAME1");
    WOONAME = sta.get("WOONAME");
    cardprename = sta.get("cardprename");
    PLANTNAME = sta.get("PLANTNAME");
    FARMNAME = sta.get("FARMNAME");
    ENAME = sta.get("ENAME");
    STATUE_NAME = sta.get("STATUE_NAME");
    PETS_NAME = sta.get("PETS_NAME");
    BUILD_TAB_NAME = sta.get("BUILD_TAB_NAME");
    STONENAME = sta.get("STONENAME");
    GIFTNAME = sta.get("GIFTNAME");
    EXTEND_PETS_NAME = sta.get("EXTEND_PETS_NAME");
    NOBNAME = sta.get("NOBNAME");
    NOBNAME2 = sta.get("NOBNAME2");
    nobilityname = sta.get("nobilityname");
    ROOMNAME = sta.get("ROOMNAME");
    ROOMNAME1 = sta.get("ROOMNAME1");
    cardlevelname = sta.get("cardlevelname");
    GONAME = sta.get("GONAME");
    GONAME1 = sta.get("GONAME1");
    INVITE_STR = sta.get("INVITE_STR");
    SOLDIER_NAME = sta.get("SOLDIER_NAME");
    SOLDIER_NAME1 = sta.get("SOLDIER_NAME1");
    EXTEND_NAME = sta.get("EXTEND_NAME");
    CAMPNAME = sta.get("CAMPNAME");
    CAMPNAME1 = sta.get("CAMPNAME1");
    OBJNAME = sta.get("OBJNAME");
    MONSTERNAME = sta.get("MONSTERNAME");
}

const WarMode_Lev = 6;

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

function donothing(n, e, p, x, y, points){
    trace("sb", n, e, p, x, y, points);
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

var BattleKey;
function InitBattleKey()
{
    var keys = [
    "type", "readed",
    "kind", "otherUid", "win", "lostPower", "attFullPow", "defFullPow", "attPurePow", "defPurePow", "reward", "eneOtherid", "eneEmpirename", "eneNobility", "attGod", "defGod", "attCatapult", "defCatapult" 
    ];
    BattleKey = dict();
    for(var i = 0; i < len(keys); i++)
    {
        BattleKey.update([[keys[i], i]]);
    }
}
InitBattleKey();
function getBattleResult(key, data)
{
    return data[BattleKey.get(key)];
}
function setBattleResult(key, value, data)
{
    data[BattleKey.get(key)] = value;
}
var EmptyResult;
function InitEmptyResult()
{
    var keys =  [
    "type", "readed",
    "id", "kind", "otherUid", "win", "lostPower", "attFullPow", "defFullPow", "attPurePow", "defPurePow", "eneOtherid", "eneEmpirename", "eneNobility", "attGod", "defGod", "empInf", "empCav", "empLev", "empGid", "attCatapult", "coinReward", "foodReward", "woodReward", "stoneReward"
    ];//coinGen foodGen woodGen stoneGen
    EmptyResult = dict();
    for(var i = 0; i < len(keys); i++)
        EmptyResult.update([[keys[i], i]]);
}
InitEmptyResult();
function getEmptyResult(key, data)
{
    return data[EmptyResult.get(key)];
}
function getEmptyResults(keys, data)
{
    var res = [];
    for(var i = 0; i < len(keys); i++)
    {
        if(type(keys[i]) == type(""))
            res.append(getEmptyResult(keys[i], data));
        else
            res.append(keys[i]);
    }
    return res;
}
function setEmptyResult(key, value, data)
{
   data[EmptyResult.get(key)] = value; 
}
function getWarrecordList(key, data)
{
    var kind = data[0];
    //trace("war kind", key);
    if(kind == 0)
        return getBattleResult(key, data);
    return getEmptyResult(key, data);
}
function setWarrecordList(key, value, data)
{   
    var kind = data[0];
    if(kind == 0)//normal user
        setBattleResult(key, value, data);
    else
        setEmptyResult(key, value, data);
}
//import global.TimeController;


class DataController{
    var datadict;
    var sizedict;
    var builddict;
    function DataController(){
        builddict = dict();
        var build = dict([["size",3],["level",10],["price", 50000],["food", 500],["exp",0],["personmax",100],["name","Dragon Nest"]]);

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
    var papaId = ppy_userid();
    var myDock;
    var Quit;
    var TooMany = 0;
    var InNew = 0;

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
    var sp;

    var castalPage = null;
    var inWarMap = 0;

    var foodRankData = null;


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
        var secondName = ["Moon ","Sun ", "Earth ", "Lone ", "Sky ", "Far ", "New ", "Old ", "Wind ", "Tooth "];
        var firstName = ["Light ", "Dark ", "Small ", "Great ", "Sill ", "Late ", "Far ", "Near ", "Red ", "Blue ", "Lone ", "East "];
        var lastName = ["County", "City", "Town", "Village", "State", "Province", "Bay", "Hill", "Lake"];
        return firstName[(gid/8)%len(firstName)]+lastName[(gid+3456)%len(lastName)];
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
    
    function getFormatString(index,pair){
        //trace("format", index, pair);
        var rstr = getStaticString(index);
        //trace("static string", rstr);
        for(var i=0;i<len(pair);i=i+2){
            var rep = pair[i+1];
            if(type(rep) != type(""))
                rep = str(rep);
            rstr = rstr.replace(pair[i], rep);
        }
        return rstr;
    }


    
    function GlobalController(){
        Quit = 0;
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
        dataname.update("room1", ROOMNAME1);
        dataname.update("fact",FACTNAME);
        dataname.update("fact1", FACTNAME1);
        dataname.update("god",GONAME);
        dataname.update("god1",GONAME1);
        dataname.update("camp",CAMPNAME);
        dataname.update("camp1", CAMPNAME1);
        dataname.update("farm",FARMNAME);
        dataname.update("obj",OBJNAME);
        dataname.update("soldier",SOLDIER_NAME);
        dataname.update("soldier1",SOLDIER_NAME1);
        dataname.update("plant",PLANTNAME);
        dataname.update("stone",STONENAME);
        dataname.update("wood",WOONAME);
        dataname.update("statue",STATUE_NAME);
        dataname.update("disk", DISK_NAME);
        dataname.update("dock", DOCK_NAME);
        timer =null;
        data = new DataController();
        ppyuserdict = dict([[str(papaId),dict([["name",ppy_username()]])],["0",dict([["name","Caesar"]])]]);

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
        if(soldiers[b] < 0)
        {
            soldiers[b] = MAX_INT;
        }
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

    var newQuit = null;
    function pushContext(re,co,auto){
        if(currentLevel>=0 && context[currentLevel].contextname.rfind("control")==0){
            popContext(null);
        }
        //New Control no black
        if(auto == NotAdd){
            if(currentLevel > 0)
            {
                popContext(null);
            }
            flagnew = 1;
            InNew = 1;
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
        //trace("current lev", currentLevel, flagnew, co.contextname);
        if(auto == NotAdd)
            shotscreen.add(co.getNode());
        else if(auto == NewQuit)
        {
            shotscreen.add(co.getNode());
            newQuit = co;
        }
        else if(currentLevel == 0)
        {
            screen.add(co.getNode());
        }
        else if(flagnew == 1 && (co.contextname == "dialog-reward-levelup" || co.contextname == "dialog-rename"))//newUser pop dialog at dialogscreen 
        {
            trace("add shot");
            shotscreen.add(co.getNode());
        }
        else
            dialogscreen.add(co.getNode());
        /*
        if(flagnew == 1 && auto == NonAutoPop)
        {
            clearShotScreen();
        }
        */
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
        if(re == NewQuitPop)
        {
            newQuit.deleteContext();
        }
        else if(re == NewPop){//new user task 
            newcontext.deleteContext();
            flagnew = 0;
            InNew = 0;
            context[currentLevel].getNode().focus(1);
            if(len(dark)>0)
                dark[len(dark)-1].visible(1);
        }
        else 
        {
            /* 
            if(flagnew == 1)
            {
                setShotScreen();
            }
            */
            if(currentLevel < 0)
                return;
            context[currentLevel].deleteContext();
            context[currentLevel] = null;
            currentLevel--;
            white();
            if(re == DownWarn)
            {
                sp.DecideToDown();
                return;
            }
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
        n.addlabel(NOBNAME2[nob*3+subnob],null,20).anchor(0,50).pos(32,15).color(0,0,0,100);
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
var global = new GlobalController();
var spriteManager = new SpriteManager(global);
spriteManager.self = spriteManager;
global.sp = spriteManager;
