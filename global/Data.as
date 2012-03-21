//const RateURL = "http://papayamobile.com/a/mr?p=com.papaya.miracle_beta1&referrer=in_game_rating";
const RateURL = "market://details?id=com.papaya.miracle_beta1";
const NewsURL = "market://details?id=com.papaya.miracle_beta1";
//const NewsURL = "http://papayamobile.com/a/mr?p=com.papaya.miracle_beta1&referrer=in_game_rating";

var Others = dict([
["SPYITEMS", ["win:", "fight:", "soldier force:", "ally force:", "defence:"]],

["items" , []],//update News information
["timestr", ["1 hour","6 hours","24 hours"]],

["ganname1", ["You can only send every friend one gift one day", "You can ask for gift from every friend once a day"]],

["btname1", ["Delay", "Refresh"]],

["timestr1", ["2 hours", "8 hours", "24 hours"]],

["newupdate1", ["Your territory change to night mode from 8 p.m to 6 a.m automatically. Click menu button->night scene to close"]],

["godstr", [

    "crops yield increase 20%","population recruited increase 20%","tax from stores increase 20%","Soldier's ATK increase 5%",
    "crops yield increase 40%","population recruited increase 40%","tax from stores increase 40%","Soldier's ATK increase 10%",
    "crops yield increase 60%","population recruited increase 60%","tax from stores increase 60%","Soldier's ATK increase 15%",
    "crops yield increase 80%","population recruited increase 80%","tax from stores increase 80%","Soldier's ATK increase 20%",
    "crops yield increase 100%","population recruited increase 100%","tax from stores increase 100%","Soldier's ATK increase 25%",
    "rewards for visiting friends, increase 5 coins","rewards for visiting friends, increase 10 coins","rewards for visiting friends, increase 20 coins","rewards for visiting friends, increase 30 coins","rewards for visiting friends, increase 50 coins",
    "the statue of monsters will strengthen the defense", "the statue of monsters will strengthen the defense","the statue of monsters will strengthen the defense","the statue of monsters will strengthen the defense","the statue of monsters will strengthen the defense"]],

["newstr", [
"{'cp':[400,300],'cz':[120,120],'gtype':0,'posi':[17,8],'cmd':'select','param':0,'tp':[600,140],'text':\"Territory's development needs agriculture, click the free [farmland]\"}",   
"{'cp':[328,288],'cz':[120,120],'gtype':0,'posi':[17,8],'cmd':'btclick','param':0,'tp':[600,140],'text':' Click [plant]'}",   
"{'cp':[209,181],'cz':[240,240],'type':1,'posi':[17,8],'cmd':'state2over','param':0,'tp':[600,140],'text':'Choose  [wheat]'}",   
"{'cp':[400,300],'cz':[120,120],'gtype':0,'posi':[17,8],'cmd':'select','param':0,'tp':[600,140],'text':\"Crop's growth need long time,but we can  accelerate it. Click the busy [farmland]\"}",   
"{'cp':[328,288],'cz':[120,120],'gtype':0,'posi':[17,8],'cmd':'btclick','param':0,'tp':[600,140],'text':'Click [accelerate]'}",   
"{'cp':[314,342],'cz':[160,60],'gtype':0,'posi':[17,8],'cmd':'speed','param':0,'tp':[600,140],'text':\"Accelerate crops' growth.\"}",   
"{'cp':[400,300],'cz':[120,120],'gtype':0,'posi':[17,8],'cmd':'state4over','param':0,'tp':[600,140],'text':'Harvest wheat.'}",   

"",

"{'gtype':2,'posi':[17,8],'cmd':'harvest','param':0,'tp':[400,240],'text':'Task one completed+500+1+4+ Next step + Agriculture related task completed!'}",   
"{'cp':[35,435],'cz':[80,80],'gtype':1,'posi':[14,13],'cmd':'mclick','param':4,'tp':[200,140],'text':\"Territory's development needs population, build residential to recruit more people. Click [Build Icon]\"}",   
"{'cp':[100,250],'cz':[160,280],'gtype':1,'posi':[14,13],'cmd':'pop','param':2100,'mp':[400,240],'tp':[400,140],'text':' Choose  [cottage] '}",   
"{'cp':[445,75],'cz':[80,80],'gtype':0,'posi':[14,13],'cmd':'build','param':1,'mp':[400,180],'tp':[600,340],'text':\"Click [yes] after choosing cottage's build location.\"}", 
"{'cp':[400,300],'cz':[120,120],'gtype':0,'posi':[14,15],'cmd':'state4over','param':0,'tp':[600,140],'text':'Wow! This residential has recruited people,  click [cottage] to receive them!'}",   
"{'cp':[400,300],'cz':[120,120],'gtype':0,'posi':[14,15],'cmd':'select','param':0,'tp':[600,140],'text':'Click a free cottage.'}",    
"{'cp':[328,288],'cz':[120,120],'gtype':0,'posi':[14,15],'cmd':'state2over','param':1,'tp':[600,140],'text':'Click [recruit]'}",   
"{'cp':[400,300],'cz':[160,160],'gtype':0,'posi':[14,10],'cmd':'state4over','param':0,'tp':[600,140],'text':'Your cottage has recruited people. But your territory also needs money, click [bakery]  to collect tax!'}",   

"",

"{'gtype':2,'posi':[14,10],'cmd':'state4over','param':0,'tp':[400,240],'text':'Task Two completed+1500+2+10+ Next step +Population and business related tasks completed!'}",   
"{'cp':[106,435],'cz':[80,80],'gtype':5,'posi':[14,10],'cmd':'mclick','param':5,'tp':[200,140],'text':'There are  [monsters] robbing your crops in your territory, go to kill them!'}",   
"{'cp':[177,435],'cz':[80,80],'gtype':5,'posi':[14,10],'cmd':'mclick','param':2,'tp':[200,140],'text':'Click [map] to view your territory nearby situation.'}",   
"{'cp':[650,360],'cz':[120,120],'gtype':4,'posi':0,'cmd':'monster','param':15,'tp':[600,140],'mp':[650,360],'text':'Click [monster]'}",   
"{'cp':[310,386],'cz':[160,80],'gtype':5,'posi':0,'cmd':'attack','param':1,'tp':[200,140],'mp':[650,360],'text':'Click [attack]'}",   
"{'cp':[450,360],'cz':[120,120],'gtype':4,'posi':0,'cmd':'goback','tp':[600,140],'mp':[650,360],'text':'Congrats, you win! Click [castle] to return your territory.'},",    
"{'cp':[120,40],'cz':[240,80],'gtype':0,'posi':[14,10],'cmd':'rename','param':0,'tp':[600,340],'text':'In the end, give your territory a unique name! Click left-upper  [info bar]'}",   

"",

"{'gtype':2,'posi':[14,10],'cmd':'state4over','param':0,'tp':[400,240],'text':'Novice task completed +2000+3+15+Ok+Congrats!You will be a great emperor!'}"]]

]);

var Dicts = 
[
["build_defence_format","Build a [BUILD] will add [DEFENCE] to castle defense, are you sure you want to build?"],

["money","silver"],["caesars","caesars"],["food","food"],["labor","Idle population"],["person","population"],["stone","stone"],["wood","wood"],["caesar","Caesar"],

["share","Share"],["back","Back"],["change","Done"],["ok","yes"],["send","send"],["cancel","Cancel"],["system","system"],["devine","Display"],["retry","Retry"],["help","Help"],["close","close"],["openbox","Open"],["askforhelp","Ask friend"],

["loading_str","loading..."],["self","me"],

["request_done","Request handled"],

["friend_notload","Sorry, can't get your friend list"],["friend_ally_notice","You can visit your friend and ally with him. Allies can help you fight!"],["friend_invite","Come to creat miracles with me!"],["friend_invite_success","Invited successfully!"],

["nest_style_cannotchange","Your dragon is growing, you can't change your dragon type now!"],

["nest_talk_morning","Good morning, isn't the weather nice today?"],
["nest_talk_noon","good afternoon, I'm hungry,would you feed me,please"],
["nest_talk_night","Good night, early to bed, early to rise"],

["nest_talk_other","I'will be stronger after training, come and train with me now!"],
["nest_talk_feedover","I've eaten enough, thanks"],["nest_talk_notfeedover","I'm hungry now,would you feed me?"],

["nest_talk_sleep","I'm still a growing dragon! I can't fly until I reach 285 feed!"],

["nest_getup_1","You have successfully hatched your dragon egg!"],
["nest_getup_2","Baby dragon has grown up."],

["nest_getup_format","[NAME][DESCRIBE]'s current growing point is:[HEALTH], property:[PROPERTY], ATK: [ATTACK]"],

["nest_pet_name","Enter your pet's name:"],

["nest_pet_name_warning","Name can't be changed after done."],

["nest_gotohelp","check the HELP document for more information on how to raise your dragon"],

["box_str_1","Help me open this treasure chest please!"],["box_str_2","Let's share the treasure!"],["box_str_3","You found a treasure chest, ask friends to help you open it."],

["god_bless_over","you have already performed magic!"],

["share_format","[NAME][DESCRIBE], Come on! join [NAME] and build your own miracle empire together!"],

["share_box_format","[NAME] has got a mysterious treasure chest,but he(she) can't unlock it without your help,Let's go and help him(her)!"],

["share_petup_1","you have evolved your pet successfully"],["share_petup_2","'s baby dragon has grown up"],

["share_openbox"," opened one mysterious treasure chest"],

["default_petname","my pet"],

["news_nonews","No more news"],

["news_element0","<b>[NAME]<b> visited your land"],

["news_element1","<b>[NAME]<b> helped you manage your castle"],

["news_element2","<b>[NAME]<b> sent you gift"],

["news_element3"," You defeat <b>[NAME]<b>"],

["news_element4","<b>[NAME]<b> defeated you"],

["news_element5","<b>[NAME]<b> helped you open treasure chest"],

["news_element6","<b>[NAME]<b> helped you feed your pet"],

["gift_element0","[NAME] sent you gift [GIFT]"],

["gift_element1","[NAME] ask you for gift [GIFT]"],
["monster_foodwilllost", "Monsters will rob food if you don't enter map to kill them before next login."], 
["monster_refresh_format","Hey, [NAME], give me your crops, or there will be hell to pay"],

["warrecord_notice_format","There are [NUM] wars, would you like to watch?"],
["war_newmap_notice","Congrats! you entered a new map. Hint: there are more powerful players in this map"],
["spy_notice","Tip: The higher your scout level is, the more details"],

["chat_empty","Your contents can't be empty"],["chat_wordlimit","word number > 30"],["chat_nettimeout","network timeout, send message fail"],

["text_wordlimit_format","Limit [NUM] words!"],["text_cannotset","Can't change this name!"],["text_nettimeout","Sorry, net time out!"],

["text_message_send","Please input message: "],["text_empty","can't empty"],["text_chat_nettimeout","Sorry,fail to send,try again^_^"],

["message_send_success","Successfully sent"],["text_empire_name","Please input empire name: "],

["update_normal","Ordinary"],["update_caesars","Fast"],["update_warning", "The building is occupied. Upgrading will interupt the operation,are you sure?"],

["onekey_plant","One-step planting"],["onekey_harvest","One-step harvesting"],["onekey_product","One-step collect taxes"],["onekey_visit_normal","One-step ordinary visit"],["onekey_visit_inc","One-step accumulated visit"],["onekey_title","One-step operation"],

["onekey_gotohelp","How to use it?"],

["tab_fighting","Wars"],["tab_attackable","Castles"],
["tab_fortress", "Forts"], 
["nobattle_fail_whenhasattack", "Sorry, you can't enable protect mode while attacking"],
["nobattle_whenattack", "Attacking will end protect mode"],
["attack_whenattacked", "You are already attacking that person"],
["attack_whenupdated", "Sorry, player has gone to new map"],
["attack_whenwon", "Sorry, you have conquered the castal."],
["attack_cancel", "Do you really want to cancel the battle?"],
["attack_time", "Time"], 
["attacktime_notice", "*More cavalry, time shorter"],
["attacktime", "Time"],
["state_attacking","Attacking..."],
["state_defencing","Defending..."],
["state_fighting","Fighting..."],
["state_adding", "Sending soldiers..."],

["net_state_1","Network off, please check it"],["net_state_2","Network doesn't work, try again"],

["master","master:"],[":",":"],
["user_notoccupy","Unconquered"],["user_occupy","free"],["user_protected","in protect"],["user_fighting","fighting"],["user_attacking","marching..."],
["resource_get_format","This fortress products [MONEY] coins, [FOOD] foods, [WOOD] woods, [STONE] stones per hour. Time left to harvest [TIME]"],
["quit", "Quit"],["back", "Back"],

["sendFight", "Sent forces:"], ["totalFight", "Total ATK"], ["lostFight", "Lost forces"], ["returnFight", "Return forces"], ["defenceFight", "Defense"], ["lostDefence", "Lost defense"], ["leftDefence", "Left defense"], ["lostCoin", "Lost coin"], ["share", "Share"], ["ok", "Ok"], ["attack", "Attack"], ["defence", "Defence"], ["retry", "Retry"], 
["cancel", "Cancel"], ["netFail1", "It seems off network, check network connect please."], ["netFail2", "Network connect error, try again later."], ["taskShare", "Congrats, you finish this task!"], ["shareReward", "Share with your friends to get 100 silvers."],["complete", "Complete"], ["giveup", "Give up"], ["giveupwarn", "You will lose one chance to get reward if you give up this task."], ["playWithme", "Come create miracles with me!"], ["goSee", "Have a look"], ["IKnow", "Got it"], ["genAdd", "Ordinary"], ["fastAdd", "Fast"], ["chooseDefence", "Defense increase you choose:"], ["youLeft", "Left "], ["allyNum", " Ally number"], ["sureToally", "Sure to ally with him/her?"], 
["taskFinishPost", "[NAME] complete [TASK] task, come on to build your own miracle empire with me!"],
["allyOk", "You will be reinforced from your allies when you are at war. You need Caesar to destroy the covenant, choose ally carefully"], 
["cancelAlly", "Are you sure to cancel alliance with "], ["makeAlly", "Ally"], ["punish", "Punishing"], ["allyUp", "The number of your allies has reached its maximum"], ["add", "Add"], ["close", "Close"],


["addAlly", "Add an ally"], ["attackNow", "Your army is on the way"], ["hintPower", "hint:Your army's ATK will increase if you are on line"], ["youWin", "You win"], ["attackIt", "Attack!"], ["inBuild", "building"], ["inCall", "recruiting"], ["inProduct", "producing"], ["training", "Training"], ["planting", "Planting"], ["wooding", "producing"], ["stoning", "mining"], ["proDefing", "producing"], ["blessing", "performing"], ["free", "free"], ["egging", "incubating"], ["growing", "growing"], ["shopping", "Purchase"], ["buyCaesar", "Buy Caesar coins"], ["fulfill", "The Harvest Goddess can increase the crop yield by performing magic"], ["population", "the Liberty Goddess can increase the number of people you can recruit by performing magic"], ["war", "the god of war can strenthen your soldier's ATK by performing magic"], ["beast", "the god of beast will increase your defense by performing magic"], 

["dragon", "You can summon your own pet after building Dragon Nest."], 
["godBless", "[GOD] can perform magic, are you sure to summon [GOD]?"], 
["call", "Summon"], ["coin", "coin"], ["freePeople", "idle people"], ["food", "food"], ["zijin", "Your magic capacity will +1 when upgrade."], ["freeZijin", "Your magic capacity will +1 when upgrade."], ["youGet", "Congrats! You get [NAME]! [END]"], 
["youPost", "[NAME] got [CARD] [CARDLEV],join [NAME] to build your own miracle empire!"],
["loading", "Loading..."], ["noNews", "No messages"], ["loginBonus", "[NAME] has played the miracle empire and has gained daily rewards"], 
["godShow", "Magic"], ["inGodShow", ""],
["show", "Perform"], 
["friend", "Friends"], 
["level", "Lev"],
["expandOver", "Congrats! Expanding successfully"], 
["expandPost", "[NAME] has expanded his territory,come and join the Miracle Empire!"], 
["feedback", "If you have any advice of feedback,please email"], 
["feedGift", "You will get mysterious gifts if your advice is accepted"], 
["sendGift", "Choose a gift for <g>"],
["ask", "Request"], 
["send", "Send"], ["accept", "Accept"], ["levelUp", "[NAME] has level up to [LEVEL],join the Miracle Empire and enjoy!"], ["killAll", "[NAME] has defeated the monsters and secure his territory,join the Miracle Empire and have fun!"],
["nextMonster", "Next attack: "], 
["comeSoon", "Coming soon"],
["NobUp", "Congrats! You upgrade to "],
["attackIs", "ATK : "], ["powerlack", "You don't have enough fight powers!"], 
["monRob", "Monsters have robbed [FOOD] crops"],
["active", "Active"],
["activeDra", "would you help me activate it?"], ["letsShare", "Let's share the treasure!"], ["askForAct", "Ask friends for help!"], ["helpMe", "Help"],["askFri", "Ask help"], ["unknown", "Unknown"], ["getDragon", "has got the Dragon's nest,but still need your help to activate,let's go and help him!"], ["callPet", "Congrats! You have activated the Dragon's nest,now you can summon your pet!"], ["myPet", "my pet"], ["dragonPost", "[NAME] has activated Dragon's nest successfully,join the Miracle Empire and have fun!"], ["curPet", "current pet"], ["changeMode", "change mode"],
["petAtt", "[NAME] will increase [POWER] fighting point every growing point,are you sure changing mode?"], ["freeFee", "for free"], ["changeAtt", "Change attribute"], ["petPro", "[NAME]'s basic ATK is [POWER], every growing point adds [ADD] ATK. Are you sure to change?"],
["spy_result_format", "You lost [NUM] scouts, get [WHO]'s castle info:"],
["spy_result2_noenemy", "There is no army attacking the castle at this time."],
["spy_result2_format", "There are [NUM] army attacking the castle, the fast one arrive at [TIME]."],
["spy_result2_mode3_format", "Total ATK [NUM]"],

["choosePet", "Choose pet"], ["callDragonDia", "[NAME]'s basic ATK is [POWER], every growing point add [ADD] ATK. Are you sure to summon?"],
["inProtect", "Protecting"], ["attNoProtect", "You can't enable protec mode while attacking others."],
["openProtect", "enable protection"], ["colonial", "colonial "], ["levelUp", "Congrats! [NAME] has upgraded to lev [LEVEL], come on to build your own miracle empire!"], ["goInNewMap", ", you will find more powerful players in higher level map."], ["cityLevelUp", ",your territory is level up!"], ["oneLevel", ", you need more experiences to upgrade your territory!"], ["next", "Next"],
["choosePlant", "Choose Crops"], ["sureToBuy", "Are you sure to purchase [NAME]?"],["acc", "SpeedUp"],
["leftTime", "Time left "], ["noBattle", "War mode unable"], ["winNum", "wins"], ["netRefresh", "data exception because of net problem,please try again"], ["fresh", "refresh"],

["fightAdd", "Hint: soilders have extra ATK in fortress"],
["peopUp", " population capacity"], 
["sureTosell", "Are you sure to sell [NAME]?"],
["sell", "Sell"], 
["toDetect", "use on detecting"], 
["unitPower", "unit fighting"],
["chooseStone", "Choose stone"], 
["noUpdate", "No new update"],
["visitReward", "[NAME] has got the rewards of visiting friends,join the Miracle Empire and have fun!"],
["yourArmy", "Your military has arrived [NAME]'s territory,war is near!"],
["enemyArmy", "[NAME]'s military has arrived your territory,Let's get ready for the fight!"],
["viewWar", "watching"],
["skip", "Skip"], 
["sendArmy", "<g>+ has send his army to attack your territory"],

["godInc", "Hint: your enemy's soldier's ATK will increase a regular porpotion +<b> <b>"],

["howDef", "*How to strengthen defence"],
["youNeed", "You need more"],
["speNeed", "not enough special material"], 
["clearList", "Hint:This list will be emptied in new battlefield"],
["reqHandle", "Requests solved"], 
["income", "Congrats! You have [NUM] colonies, they give you [COIN] coins as tribute."], 
["incomePost", "[NAME] has gained tribute rewards from colonies,join the wonder empire and have fun"], 
["chooseWood", "Choose lumber"],
["youNeed", "You still lack "], ["speNeed", "Need more special materials"],
["fullfilMana", "Fulfil magic"], ["fullfil", "Fulfil"], ["curMana", "Magic Value"], ["nextTime", "next charge time "], 

["You", "You"], ["StillNeed", " still need "], 

["MonsterLevUp", "You still need defeat [NUM] [NAME] to upgrade to Lv. [LEV], and your magic capacity will +2 when upgrade to top lev"],
["MonsterCardGet", " your magic capacity will +2 when upgrade to top lev."],
["ChangELevUp", "You still need [DAY] continuous logins to get Moon Goddess lev[LEV], and your magic capacity will +1"],
["OtherCardLevUp", ""],
["NobCard", "[WHO] needs to defeated [NUM] more opponents to upgrade to [CARD]"],
["BusiCard", "[WHO] have to reach [NUM] to upgrade your [TYPE] to the next level. Your magic capacity will +1 when upgrade!"],
["FriendCard0", "[WHO] need to upgrade the god of friendship to violet golden level to get [NAME] [LEV]. Each upgrade increase one magic capacity."],
["FriendCard1", "You need [NUM] more friends to get [NAME] [LEV]. Each upgrade increase one magic capacity."],
["FriendCard2", "You need to open [NUM] more treasure chest for your friends to get [NAME] [LEV]. Each upgrade increase one magic capacity."],
["FriendCard3", "You need to feed your friends' dragons [NUM] more times to get [NAME] [LEV]. Each upgrade increase one magic capacity."],
["FriendCard4", "You need to reach level [NUM] to get [NAME] [LEV]. Each upgrade increase one magic capacity."],
["FriendCard5", "You can use one-step visiting from now on!"],
["MonsterZijin", "Your magic capacity will increase 2 when get violet card."],
["ChangEZijin", "Your magic capacity will increase 1 when card level up."],
["PlantZijin", "Your magic capacity will increase 1 when card level up."],
["BusiZijin", "Your magic capacity will increase 1 when card level up."],
["NobZijin", "Your magic capacity will increase 1 when card level up."],
["PlantingCard", "Planting Card"], ["BusinessCard", "Business Card"],
["Download", "Downloading"],
["LackMagic", "Sorry, your magic isn't enough,fill it up now? Tips:every 5 mins will recover 1 magic."],
["infpower", "Infantry: "], 
["cavpower", "Cavalry: "],
["addsoldier", "Reinforce"], 
["minussoldier", "Withdraw"], 
["getresource", "Collect"],
["quickSendArmy", "SpeedUp"],
["LevelNot", "Sorry, you need to upgrade to Lv. [LEVEL] to upgrade your castle."],
["EmpireNotOpen", "Sorry, higher level castle is not opened."],
["sendCatapult", "Dispatch"], ["notSendCata", "No"],
["petNeedDownload", "Summon pet need to download pictures, sure to download?"],
["warNeedDownload", "Enter into war map need to download pictures, sure to download?"],
["downloading", "Downloading pictures..."],
["SendCata", "Do you want to dispatch your [NUM] catapults?"],
["Buy", "Buy"],
["sureBuyMana", "Are you sure to buy [NUM] mana?"],
["ChooseCata", "Choose Catapult"],
["Me", "Me"],
["ItGrowUp", "It grows up!"],
["Produce", "Produce"],
["Fast", "Fast"],
["CataExplain", "Catapults only can be used when attack others, and at that time it will have extra ATK. [NAME] ATK [ATK]"],
["CardAddOne", "when the card upgrade, your magic capacity will add one."],
["CardAddTwo", "when the card upgrade to top level, your magic capacity will add two."],

["sendSuc", "request successfully sent!"],
["downloading", "Downloading files..."],
["downMusic", "You should download 800K music files before enjoy music. Sure to download?"],
["showDownNow", "To have good game experience, you need download 3M pictures. Sure to download?"],

["Build", "Build"],
["PlayDragon", "You can use Dragon Stone to play Dragon Wheel. Come on to build it!"],
["OrdStart", "Ord Start"],
["SpeStart", "Spe Start"],
["PlayingDra", "[NAME] is playing Dragon Wheel, come on to join us in Miracle Empire!"],
["DraNot", "Sorry, you don't have enough Dragon stone, you can get it for free by opening treasure chest or killing monsters!"],
["CaeNot", "Sorry, you don't have enough caesars!"],
["HowDra", "You can use Dragon Stone or caesars to play Dragon Wheel. Tip: Dragon Stone can be obtained by opening treasure chesk or killing monsters."],
["drumReward", "Click drum icon to get extra silvers during fight! You click [NUM] times and get [MONEY] silvers in the fight!"],
["drumFeed", "[NAME] click drum [NUM] times and get [MONEY] silvers as reward, come on to join Miracle Empire!"],
["lev1Disk", "You should upgrade to Baron to play this kind of Dragon wheel."],
["lev2Disk", "You should upgrade to Knight to play this kind of Dragon Wheel."],
];

var Names = dict([

["ROOMNAME1", ["Orange Cottage","Orange Cottage","Orange Cottage","Red Cottage","Red Cottage","Red Cottage","Blue Cottage","Blue Cottage","Blue Cottage","Purple Cottage","Purple Cottage","Purple Cottage","Orange House","Orange House","Orange House","Red House","Red House","Red House","Blue House","Blue House","Blue House","Purple House","Purple House","Purple House","Orange Villa","Orange Villa","Orange Villa","Red Villa","Red Villa","Red Villa","Blue Villa","Blue Villa","Blue Villa","Purple Villa","Purple Villa","Purple Villa","Orange Mansion","Orange Mansion","Orange Mansion","Red Mansion","Red Mansion","Red Mansion","Blue Mansion","Blue Mansion","Blue Mansion","Purple Mansion","Purple Mansion","Purple Mansion","Orange Manor","Orange Manor","Orange Manor","Red Manor","Red Manor","Red Manor","Blue Manor","Blue Manor","Blue Manor","Purple Manor","Purple Manor","Purple Manor","Orange Magical Manor","Orange Magical Manor","Orange Magical Manor","Red Magical Manor","Red Magical Manor","Red Magical Manor","Blue Magical Manor","Blue Magical Manor","Blue Magical Manor","Purple Magical Manor","Purple Magical Manor","Purple Magical Manor","Orange Palace","Orange Palace","Orange Palace","Golden Palace","Golden Palace","Golden Palace",
"Attic", "Attic", "Attic"
]],
["ROOMNAME" , ["Orange Cottage Lv. 1","Orange Cottage Lv. 2","Orange Cottage Lv. 3","Red Cottage Lv. 1","Red Cottage Lv. 2","Red Cottage Lv. 3","Blue Cottage Lv. 1","Blue Cottage Lv. 2","Blue Cottage Lv. 3","Purple Cottage Lv. 1","Purple Cottage Lv. 2","Purple Cottage Lv. 3","Orange House Lv. 1","Orange House Lv. 2","Orange House Lv. 3","Red House Lv. 1","Red House Lv. 2","Red House Lv. 3","Blue House Lv. 1","Blue House Lv. 2","Blue House Lv. 3","Purple House Lv. 1","Purple House Lv. 2","Purple House Lv. 3","Orange Villa Lv. 1","Orange Villa Lv. 2","Orange Villa Lv. 3","Red Villa Lv. 1","Red Villa Lv. 2","Red Villa Lv. 3","Blue Villa Lv. 1","Blue Villa Lv. 2","Blue Villa Lv. 3","Purple Villa Lv. 1","Purple Villa Lv. 2","Purple Villa Lv. 3","Orange Mansion Lv. 1","Orange Mansion Lv. 2","Orange Mansion Lv. 3","Red Mansion Lv. 1","Red Mansion Lv. 2","Red Mansion Lv. 3","Blue Mansion Lv. 1","Blue Mansion Lv. 2","Blue Mansion Lv. 3","Purple Mansion Lv. 1","Purple Mansion Lv. 2","Purple Mansion Lv. 3","Orange Manor Lv. 1","Orange Manor Lv. 2","Orange Manor Lv. 3","Red Manor Lv. 1","Red Manor Lv. 2","Red Manor Lv. 3","Blue Manor Lv. 1","Blue Manor Lv. 2","Blue Manor Lv. 3","Purple Manor Lv. 1","Purple Manor Lv. 2","Purple Manor Lv. 3","Magical Manor Lv. 1","Magical Manor Lv. 2","Magical Manor Lv. 3","Magical Manor Lv. 1","Magical Manor Lv. 2","Magical Manor Lv. 3","Magical Manor Lv. 1","Magical Manor Lv. 2","Magical Manor Lv. 3","Magical Manor Lv. 1","Magical Manor Lv. 2","Magical Manor Lv. 3",
"Orange Palace Lv. 1","Orange Palace Lv. 2","Orange Palace Lv. 3","Golden Palace Lv. 1","Golden Palace Lv. 2","Golden Palace Lv. 3",
"Attic Lv. 1", "Attic Lv. 2", "Attic Lv. 3"
]],

["SOLDIER_NAME" , ["Lv. 1","Lv. 2","Lv. 3","Lv. 1","Lv. 2","Lv. 3","Lv. 1","Lv. 2","Lv. 3"]],
["SOLDIER_NAME1" , ["Lv. 1","Lv. 2","Lv. 3","Lv. 1","Lv. 2","Lv. 3","Scout Lv. 1","Scout Lv. 2","Scout Lv. 3"]],


["MONSTERNAME" , ["Snake Lv. 1","Snake Lv. 2","Snake Lv. 3","Boar Lv. 1","Boar Lv. 2","Boar Lv. 3","Wolf Lv. 1","Wolf Lv. 2","Wolf Lv. 3","Bear Lv. 1","Bear Lv. 2","Bear Lv. 3","Lion Lv. 1","Lion Lv. 2","Lion Lv. 3","Dragon Lv. 1","Dragon Lv. 2","Dragon Lv. 3","Snake King Lv. 1","Snake King Lv. 2","Snake King Lv. 3","Boar King Lv. 1","Boar King Lv. 2","Boar King Lv. 3","Wolf King Lv. 1","Wolf King Lv. 2","Wolf King Lv. 3","Bear King Lv. 1","Bear King Lv. 2","Bear King Lv. 3","Lion King Lv. 1","Lion King Lv. 2","Lion King Lv. 3","Dragon King Lv. 1","Dragon King Lv. 2","Dragon King Lv. 3"]],


["PETS_NAME" , ["Dragon Egg A Lv. 1","Dragon egg A Lv. 2","Dragon egg A Lv. 3","Dragon egg B Lv. 1","Dragon egg B Lv. 2","Dragon egg B Lv. 3"]],


["EXTEND_NAME" , ["earth","fire","water"]],

["EXTEND_PETS_NAME" , ["Earth Dragon","Fire Dragon","Water Dragon"]],

["STATUE_NAME" , ["Medusa","Boar Warrior","Wolf Warrior","Bear Warrior","Lion Warrior","Dragon Warrior"]],

["FACTNAME" , ["Bakery Lv. 1","Bakery Lv. 2","Bakery Lv. 3","Fruit shop Lv. 1","Fruit shop Lv. 2","Fruit shop Lv. 3","Butcher shop Lv. 1","Butcher shop Lv. 2","Butcher shop Lv. 3","Restaurant Lv. 1","Restaurant Lv. 2","Restaurant Lv. 3","Clinic Lv. 1","Clinic Lv. 2","Clinic Lv. 3","Book Store Lv. 1","Book Store Lv. 2","Book Store Lv. 3","Clothing Store Lv. 1","Clothing Store Lv. 2","Clothing Store Lv. 3","Jewelers Lv. 1","Jewelers Lv. 2","Jewelers Lv. 3","Casino Lv. 1","Casino Lv. 2","Casino Lv. 3","Dojo Lv. 1","Dojo Lv. 2","Dojo Lv. 3", "Fish Market Lv. 1", "Fish Market Lv. 2", "Fish Market Lv. 3"]],

["FACTNAME1" , ["Bakery","Bakery","Bakery","Fruit shop","Fruit shop","Fruit shop","Butcher shop","Butcher shop","Butcher shop","Restaurant","Restaurant","Restaurant","Clinic","Clinic","Clinic","Book Store","Book Store","Book Store","Clothing Store","Clothing Store","Clothing Store","Jewelers","Jewelers","Jewelers","Casino","Casino","Casino","Dojo","Dojo","Dojo", "Fish Market", "Fish Market", "Fish Market"]],

["CAMPNAME" , ["Infantry Camp Lv. 1","Infantry Camp Lv. 2","Infantry Camp Lv. 3","Cavalry Camp Lv. 1","Cavalry Camp Lv. 2","Cavalry Camp Lv. 3","Scout Camp Lv. 1","Scout Camp Lv. 2","Scout Camp Lv. 3", "Arsenal Lv. 1", "Arsenal Lv. 2", "Arsenal Lv. 3"]],
["CAMPNAME1" , ["Infantry Camp","Infantry Camp","Infantry Camp","Cavalry Camp","Cavalry Camp","Cavalry Camp","Scout Camp","Scout Camp","Scout Camp", "Arsenal", "Arsenal", "Arsenal"]],

["FARMNAME" , ["","Ordinary Farmland","Crystal Farmland","Gem Farmland","Elf Farmland","Lumber Mill","Stone Quarry"]],


["GONAME" , ["Harvest Goddess Lv. 1","Liberty Goddess Lv. 1","Wealth God Lv. 1","War God Lv. 1","Harvest Goddess Lv. 2","Liberty Goddess Lv. 2","Wealth God Lv. 2"," Lv. 2","Harvest Goddess Lv. 3","Liberty Goddess Lv. 3","Wealth God Lv. 3","War God Lv. 3","Harvest Goddess Lv. 4","Liberty Goddess Lv. 4","Wealth God Lv. 4","War God Lv. 4","Harvest Goddess Lv. 5","Liberty Goddess Lv. 5","Wealth God Lv. 5","War God Lv. 5","Friendship God Lv. 1","Friendship God Lv. 2","Friendship God Lv. 3","Friendship God Lv. 4","Friendship God Lv. 5", "Beast God Lv. 1", "Beast God Lv. 2", "Beast God Lv. 3", "Beast God Lv. 4", "Beast God Lv. 5"]],
["GONAME1" , ["Harvest Goddess","Liberty Goddess","Wealth God","War God","Harvest Goddess","Liberty Goddess","Wealth God","War God","Harvest Goddess","Liberty Goddess","Wealth God","War God","Harvest Goddess","Liberty Goddess","Wealth God","War God","Harvest Goddess","Liberty Goddess","Wealth God","War God","Friendship God","Friendship God","Friendship God","Friendship God","Friendship God", "Beast God", "Beast God", "Beast God", "Beast God", "Beast God"]],


["OBJNAME" , [
"Brick Road","Concrete Road","Red Brick Road","Stone Road","Golden Road",
"White Flowerbed","Red Flowerbed","Pink Flowerbed","Yellow Flowerbed","Blue Flowerbed"," Purple Flowerbed",
"Lawn","Vine Lamp","Street Lamp","Lamp Post1","Lamp Post2","Flower Lamp","Guideboard","Bench","Well" ,"Magic Well","Purple Flowers","Red Flowers","Orange Flowers","Dark Green Nepenthe","Yellow Nepenthe","Green Nepenthe","Blue Nepenthe","Pink Cherry Tree","Purple Cherry Tree","Lavender Cherry Tree","Red Cherry Tree","Orange Shrubs","Yellow Shrubs","Green Shrubs","Spring Maple Tree","Summer Maple Tree","Autumn Maple Tree","Angel Statue","Rabbit","Moon cakes","Moon Festival Rabbit","Red Candy Lamp","Golden Candy Lamp","Jack-O'-Lantern", "Rose lantern", "Blue Gem latern", "Green Gem latern", "Golden Gem latern", "Purple Gem latern",
"Santa", "Elegant Xmas tree", "Xmas tree", "Elegant Snowmen", "Snowmen", "Elegant Reindeer", "Reindeer",
"Palm Tree", "Red Lantern", "Stele", "Tai Miao", "Cross", "Pavilion",
"Cupid", "Rose Flowers", "Rose Garden", "Love Tree",
"Egypt Tower", "Elephant Lamp", "Horse Lamp", ]],


["nobilityname" , ["Civilian", "Baron", "Knight","Count","Bishop","Duke","Emperor"]],

["NOBNAME" , ["3-class Civilian","2-class Civilian","1-class Civilian","3-class Baron","2-class Baron","1-class Baron","3-class Knight","2-class Knight","1-class Knight","3-class Count","2-class class Count","1-class Count","3-class Bishop","2-class Bishop","1-class Bishop","3-class Duke","2-class Duke","1-class Duke","Emperor"]],

["NOBNAME2",["Civilian","Civilian","Civilian","Baron","Baron","Baron","Knight","Knight","Knight","Count","Count","Count","Bishop","Bishop","Bishop","Duke","Duke","Duke","Emperor"]],

 ["PLANTNAME",["Wheat","Carrot","Corn","Pineapple","Eggplant","Tomato","Green pepper","Pumpkin","Peach","Watermelon","Mango","Strawberry"]],

["STONENAME",["Gravel","Basalt","Limestone","Granite","Mable","Quartz"]],

[ "WOONAME" ,["Maple","Willow","White poplar","Sycamore", "Pine","Oak"]],

["GIFTNAME" ,["Lumber", "Sand","Nail","Rivet","Red Brick","Beam","Door","Plywood","Macadam","Black Brick","Wooden Stake","Steel Tube"]],

["ENAME" , ["Fort Lv. 1","Fort Lv. 2","Fort Lv. 3","Fort Lv. 4","Fort Lv. 5","Fort Lv. 6"]],

 ["cardprename" , ["Snake","Boar","Wolf","Bear","Lion","Dragon","Snake king","Boar king","Wolf king","Bear king","Lion king","Dragon king","Nobility","Moon Goddess","Planting","Business","","","Friendship"]],

["cardlevelname" , [""," Lv. 1"," Lv. 2"," Lv. 3"," Lv. 4"," Lv. 5"," Medal"]],

 ["BUILD_TAB_NAME",["House","Store","Recource","Military","Miracle","Decoration","Expand"]],

 ["INVITE_STR",["papaya games", "enjoy Miracle Empire with me", "come on to help me defeat enemies and build your own empire!", "Miracle Empire is a big,gorgeous SNS game. You can download from Android market, https://market.android.com/details?id=com.papaya.miracle_beta1"]]

]);


var Tasks = 
[dict([["req", "build"], ["des", ["Build Farmland!", "Special farmland,crops,Harvest Goddess can increase yield.", "Build ordinary farmland"]], ["checknum", 1], ["lev", 3], ["pair", ["ground_id", 1]], ["reward", [200, 5, 0]], ["type", 0], ["id", 0]]),
dict([["req", "planting"], ["des", ["Plant wheat", "Special farmland,crops,Harvest Goddess can increase yield.", "planting wheat", "Tip:Click on a free plot of farmland, then tap the seed icon and choose wheat"]], ["checknum", 3], ["lev", 3], ["pair", ["object_id", 0, "type", 0]], ["reward", [300, 15, 0]], ["type", 0], ["id", 1]]),
dict([["req", "money"], ["des", ["Collect taxes ", "You can collect more taxes from advanced stores.", "collecting taxes from bakery"]], ["checknum", 100], ["lev", 3], ["pair", ["bid", 0]], ["reward", [200, 15, 0]], ["type", 1], ["id", 2]]),
dict([["req", "dialog-territoryinfo"], ["des", ["Check Territory Info", "Be familiar with your territory. Click on your castle.", "Check Territory Information", "hint:click castle to check your territory information"]], ["checknum", 1], ["lev", 3], ["reward", [100, 5, 0]], ["type", 2], ["id", 3]]),
dict([["req", "dialog-help"], ["des", ["View HELP!", "View HELP for some tips!", "View HELP!", "Tip: click the menu icon, then click the help icon"]], ["checknum", 1], ["lev", 3], ["reward", [100, 5, 0]], ["type", 2], ["id", 4]]),
dict([["req", "soldiers"], ["des", ["Training Infantry!", "You can train soldiers to attack other players, kill monsters, etc.", "training infantry", "hint:click free infantry camp first, then click infantry icon"]], ["checknum", 30], ["lev", 4], ["pair", ["btype", 0, "objtype", 0]], ["reward", [500, 20, 0]], ["type", 1], ["id", 5]]),
dict([["req", "defeatmonster"], ["checknum", 1], ["des", ["Defeat monsters", "You can get special materials, activate cards by killing monsters.", "defeat monsters", "hint:first click the map icon,then choose one monster to attack"]], ["lev", 4], ["pair", []], ["reward", [500, 20, 0]], ["type", 0], ["id", 6]]),
dict([["req", "expand"], ["des", ["Expand your territory", "You can build more buildings by expanding land!", "expand your territory", "hint:click the building dialog box, then click the expand button on the right to choose the expansion type"]], ["checknum", 1], ["lev", 4], ["pair", []], ["reward", [600, 20, 0]], ["type", 0], ["id", 7]]),
dict([["req", "getfriend"], ["des", ["Visit Caesar's territory", "Visit Caesar's territory to gain rewards!", "visit Caesar's territory", "hint:click Caesar's icon in the friends list"]], ["checknum", 1], ["lev", 5], ["pair", ["otherid", 0]], ["reward", [150, 5, 0]], ["type", 0], ["id", 8]]),
dict([["req", "dialog-circle"], ["des", ["Add friends", "More friends will bring more visit rewards...", "add friends in Circle", "hint:click the friends list first,then click the circle icon."]], ["checknum", 1], ["lev", 5], ["reward", [700, 10, 0]], ["type", 2], ["id", 9]]),
dict([["req", "selectgift"], ["checknum", 1], ["des", ["Send gift", "You can send free gifts to your friends.", "send a gift", "hint:visit your friend's territory and tap the gift icon on the left to send them gifts"]], ["lev", 5], ["pair", ["askorgive", 0]], ["reward", [200, 10, 0]], ["type", 0], ["id", 10]]),
dict([["req", "selectgift"], ["des", ["Request Gift", "Your friends can send free gift to you.", "request a gift", "Hint: visit your friends' territory and tap the gift icon on the left, choose a gift and ask for it"]], ["checknum", 1], ["lev", 5], ["pair", ["askorgive", 1]], ["reward", [300, 10, 0]], ["type", 0], ["id", 11]]),
dict([["req", "completeopen"], ["des", ["Open Treasure Chest!", "Friends can help you open the treasure chest!", "open the treasure chest", "hint:click the treasure chest on the left,you can ask your friends for help,or you can use caesars to open it."]], ["checknum", 1], ["lev", 5], ["pair", []], ["reward", [500, 20, 0]], ["type", 0], ["id", 12]]),
dict([["des", ["Rate", "If you love our game, help us by rating on Android Market!", "rate Miracle Empire"]], ["checknum", 1], ["lev", 5], ["reward", [-10, 30, 0]], ["type", 3], ["id", 13]]),
dict([["req", "updatebuilding"], ["des", ["Upgrade cottage", "Upgrading your building will increase their production efficiency.", "upgrade cottage", "hint:click a normal cottage first and then click the upgrade icon"]], ["checknum", 1], ["lev", 6], ["pair", ["ground_id", 101]], ["reward", [500, 20, 0]], ["type", 0], ["id", 14]]),
dict([["req", "person"], ["des", ["Increase Population!", "House can recruit people. People can build buildings, trained to soldiers.", "increase population", "hint:click a free dwelling house first,then click the recruit icon"]], ["checknum", 50], ["lev", 6], ["pair", []], ["reward", [500, 30, 0]], ["type", 1], ["id", 15]]),
dict([["req", "build"], ["des", ["Build house", "House can recruit people. People can build buildings, trained to soldiers.", "build normal house"]], ["checknum", 2], ["lev", 6], ["pair", ["ground_id", 112]], ["reward", [400, 25, 0]], ["type", 0], ["id", 16]]),
dict([["req", "planting"], ["des", ["Plant carrots", "Special farmland,crops,Harvest Goddess can increase yield.", "plant carrots"]], ["checknum", 6], ["lev", 6], ["pair", ["object_id", 1, "type", 0]], ["reward", [600, 30, 0]], ["type", 0], ["id", 17]]),
dict([["req", "money"], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.!", "collect taxes from normal butcher shop"]], ["checknum", 1500], ["lev", 6], ["pair", ["bid", 6]], ["reward", [800, 80, 1]], ["type", 1], ["id", 18]]),
dict([["req", "helpopen"], ["des", ["Open Treasure Chest!", "Help your friends open treasure chest and get rewards.", "open treasure chest of your friends", "hint:visit your friends' territory, click the treasure chest icon"]], ["checknum", 5], ["lev", 7], ["pair", []], ["reward", [1000, 25, 0]], ["type", 0], ["id", 25]]),
dict([["des", ["Invite friends", "More friends will bring more visit rewards...", "invite friends", "Hint: Tap on your friends list and invite your friends on Papaya to play with you. You can also do this by tapping on the invite button in the menu"]], ["checknum", 3], ["lev", 7], ["reward", [2000, 50, 1]], ["type", 4], ["id", 26]]),
dict([["req", "planting"], ["checknum", 4], ["des", ["Plant corns", "Special farmland,crops,Harvest Goddess can increase yield.", "plant corns"]], ["lev", 8], ["pair", ["object_id", 2, "type", 0]], ["reward", [1200, 48, 1]], ["type", 0], ["id", 27]]),
dict([["req", "build"], ["des", ["Summon Goddess", "God statue's magic will bring incredible function.", "summon Harvest Goddess", "hint:click the building icon first,then click the miracle page to build Harvest Goddess"]], ["checknum", 1], ["lev", 8], ["pair", ["ground_id", 400]], ["reward", [1000, 40, 0]], ["type", 0], ["id", 28]]),
dict([["req", "godbless"], ["des", ["Perform magic", "God statue's magic will bring incredible function.", "Harvest Goddess performs magic"]], ["checknum", 1], ["lev", 8], ["pair", ["godtype", 0]], ["reward", [1000, 30, 1]], ["type", 0], ["id", 29]]),
dict([["req", "planting"], ["des", ["Plant pineapple", "Special farmland,crops,Harvest Goddess can increase yield.", "plant pineapple"]], ["checknum", 6], ["lev", 8], ["pair", ["object_id", 3, "type", 0]], ["reward", [1200, 36, 0]], ["type", 0], ["id", 30]]),
dict([["req", "build"], ["des", ["Build house", "House can recruit people. People can build buildings, trained to soldiers.", "build a Magical Manor"]], ["checknum", 1], ["lev", 8], ["pair", ["ground_id", 160]], ["reward", [1000, 50, 1]], ["type", 0], ["id", 31]]),
dict([["checknum", 1], ["des", ["Show your territory", "Take a screenshot of your territory and share it with your friends.", "screenshot and share", "hint:click menu button first and then click screenshot button"]], ["lev", 8], ["reward", [800, 30, 0]], ["type", 5], ["id", 32]]),
dict([["des", ["Help friends", "Help your friends remove pests from their farmland, and you will be rewarded.", "eliminate negative state for friends", "hint:visit your friends' territory and help them killing worms, weeding,repairing or cleaning"]], ["checknum", 1], ["lev", 9], ["reward", [1200, 40, 0]], ["type", 6], ["id", 35]]),
dict([["req", "updatebuilding"], ["des", ["Upgrade bakery", "Advanced building will largely encourage the development of your territory!", "upgrade a normal bakery"]], ["checknum", 1], ["lev", 9], ["pair", ["ground_id", 301]], ["reward", [1000, 40, 0]], ["type", 0], ["id", 36]]),
dict([["req", "money"], ["checknum", 700], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.", "collect taxes from bakery Lv. 2"]], ["lev", 9], ["pair", ["bid", 1]], ["reward", [1500, 60, 0]], ["type", 1], ["id", 37]]),
dict([["req", "build"], ["des", ["Build Farmlands", "Crystal farmland can increase crop's yield.", "build crystal farmlands"]], ["checknum", 2], ["lev", 10], ["pair", ["ground_id", 2]], ["reward", [2000, 100, 1]], ["type", 0], ["id", 38]]),
dict([["req", "build"], ["checknum", 1], ["des", ["Build lumber mill", "Wood and stone can be used to upgrade your buildings and produce weapons.", "build a lumber mill"]], ["lev", 10], ["pair", ["ground_id", 5]], ["reward", [1500, 50, 0]], ["type", 0], ["id", 39]]),
dict([["req", "wood"], ["des", ["Collect maple woods", "Wood and stone can be used to upgrade your buildings and produce weapons.", "collect maple woods"]], ["checknum", 30], ["lev", 10], ["pair", ["objid", 0]], ["reward", [1500, 60, 0]], ["type", 1], ["id", 40]]),
dict([["checknum", 5], ["des", ["Invite friends", "More friends will bring more visit rewards...", "invite your friends to join", "hint:enter your friends' list and invite your friends,you can also click menu to invite"]], ["lev", 10], ["reward", [3000, 70, 1]], ["type", 4], ["id", 41]]),
dict([["req", "completepay"], ["des", ["Charge", "You can get bonus rewards for recharging your caesars.", "charge and gain the rewards"]], ["checknum", 1], ["lev", 10], ["pair", []], ["reward", [1000, 200, 1]], ["type", 0], ["id", 42]]),
dict([["req", "build"], ["des", ["Build brick roads", "Decoration can increase population and magic capacity.", "build brick roads"]], ["checknum", 6], ["lev", 11], ["pair", ["ground_id", 500]], ["reward", [600, 30, 0]], ["type", 0], ["id", 43]]),
dict([["req", "build"], ["des", ["Build Flowerbed", "Decoration can increase population and magic capacity.", "build Flowerbed"]], ["checknum", 6], ["lev", 11], ["pair", ["ground_id", 505]], ["reward", [600, 60, 0]], ["type", 0], ["id", 44]]),
dict([["req", "build"], ["des", ["Build golden roads", "Decoration can increase population and magic capacity.", "build golden roads"]], ["checknum", 3], ["lev", 11], ["pair", ["ground_id", 504]], ["reward", [1800, 50, 1]], ["type", 0], ["id", 45]]),
dict([["req", "build"], ["des", ["Build villa", "House can recruit people. People can build buildings, trained to soldiers.", "build a villa"]], ["checknum", 2], ["lev", 11], ["pair", ["ground_id", 124]], ["reward", [1200, 30, 0]], ["type", 0], ["id", 46]]),
dict([["req", "build"], ["checknum", 1], ["des", ["Build vine lamp", "Decoration can increase population and magic capacity.", "build vine lamp"]], ["lev", 11], ["pair", ["ground_id", 512]], ["reward", [1200, 30, 1]], ["type", 0], ["id", 47]]),
dict([["req", "build"], ["des", ["Build magic well", "Decoration can increase population and magic capacity.", "build a magic well"]], ["checknum", 1], ["lev", 11], ["pair", ["ground_id", 520]], ["reward", [1200, 90, 1]], ["type", 0], ["id", 48]]),
dict([["req", "planting"], ["des", ["Plant eggplants", "Special farmland,crops,Harvest Goddess can increase yield.", "plant eggplants"]], ["checknum", 6], ["lev", 11], ["pair", ["object_id", 4, "type", 0]], ["reward", [1300, 100, 0]], ["type", 0], ["id", 49]]),
dict([["req", "planting"], ["des", ["Plant tomatoes", "Special farmland,crops,Harvest Goddess can increase yield.", "plant tomatoes"]], ["checknum", 6], ["lev", 11], ["pair", ["object_id", 5, "type", 0]], ["reward", [1300, 50, 1]], ["type", 0], ["id", 50]]),
dict([["req", "build"], ["checknum", 1], ["des", ["Summon Goddess", "God statue's magic will bring incredible function.", "summon Liberty Goddess"]], ["lev", 12], ["pair", ["ground_id", 401]], ["reward", [1500, 50, 0]], ["type", 0], ["id", 51]]),
dict([["req", "godbless"], ["checknum", 1], ["des", ["Perform magic", "God statue's magic will bring incredible function.", "Liberty Goddess performs magic"]], ["lev", 12], ["pair", ["godtype", 1]], ["reward", [1100, 50, 1]], ["type", 0], ["id", 52]]),
dict([["req", "person"], ["des", ["Increase population", "House can recruit people. People can build buildings, trained to soldiers.", "increase your population"]], ["checknum", 100], ["lev", 12], ["pair", []], ["reward", [1500, 100, 0]], ["type", 1], ["id", 53]]),
dict([["req", "money"], ["checknum", 3000], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.!", "collect taxes from restaurant Lv. 1"]], ["lev", 12], ["pair", ["bid", 9]], ["reward", [1500, 70, 0]], ["type", 1], ["id", 54]]),
dict([["req", "build"], ["des", ["Build cavalry camp", "You can train soldiers to attack other players, kill monsters, etc.", "build a normal cavalry camp"]], ["checknum", 1], ["lev", 13], ["pair", ["ground_id", 203]], ["reward", [1800, 40, 0]], ["type", 0], ["id", 56]]),
dict([["req", "soldiers"], ["checknum", 40], ["des", ["Train cavalries", "You can train soldiers to attack other players, kill monsters, etc.", "train cavalry Lv. 1"]], ["lev", 13], ["pair", ["btype", 1, "objtype", 0]], ["reward", [2000, 50, 0]], ["type", 1], ["id", 57]]),
dict([["req", "planting"], ["des", ["Plant green pepper", "Special farmland,crops, Harvest Goddess can increase yield.", "plant green pepper"]], ["checknum", 6], ["lev", 13], ["pair", ["object_id", 6, "type", 0]], ["reward", [1800, 30, 0]], ["type", 0], ["id", 59]]),
dict([["req", "godbless"], ["des", ["Perform magic", "God statue's magic will bring incredible function.", "Harvest Goddess performs magic"]], ["checknum", 1], ["lev", 13], ["pair", ["godtype", 0]], ["reward", [1200, 50, 1]], ["type", 0], ["id", 60]]),
dict([["req", "updatebuilding"], ["checknum", 1], ["des", ["Upgrade infantry camp", "Advanced building will largely encourage the development of your territory!", "upgrade an infantry camp Lv. 1"]], ["lev", 14], ["pair", ["ground_id", 201]], ["reward", [1800, 80, 0]], ["type", 0], ["id", 62]]),
dict([["req", "soldiers"], ["des", ["Train infantry Lv. 2", "You can train soldiers to attack other players, kill monsters, etc.", "train infantries", "hint:click the intermediate infantry camp and choose the infantry icon"]], ["checknum", 60], ["lev", 14], ["pair", ["btype", 0, "objtype", 1]], ["reward", [3000, 90, 0]], ["type", 1], ["id", 63]]),
dict([["req", "money"], ["checknum", 6000], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.", "collect taxes from book store Lv. 1"]], ["lev", 14], ["pair", ["bid", 15]], ["reward", [1800, 150, 1]], ["type", 1], ["id", 65]]),
dict([["req", "updatebuilding"], ["des", ["Upgrade Magical Manor", "Advanced building will largely encourage the development of your territory!", "upgrade a Magical Manor"]], ["checknum", 1], ["lev", 14], ["pair", ["ground_id", 161]], ["reward", [2000, 200, 1]], ["type", 0], ["id", 66]]),
dict([["req", "build"], ["checknum", 1], ["des", ["Build mansion", "House can recruit people. People can build buildings, trained to soldiers.", "build a mansion"]], ["lev", 15], ["pair", ["ground_id", 136]], ["reward", [1500, 60, 0]], ["type", 0], ["id", 67]]),
dict([["req", "build"], ["des", ["Build well", "Decoration can increase population and magic capacity.", "build a ordinary well"]], ["checknum", 1], ["lev", 15], ["pair", ["ground_id", 519]], ["reward", [300, 15, 0]], ["type", 0], ["id", 68]]),
dict([["req", "wood"], ["des", ["Collect willow woods", "Wood and stone can be used to upgrade your buildings and produce weapons.", "collect willow woods"]], ["checknum", 130], ["lev", 15], ["pair", ["objid", 1]], ["reward", [2100, 180, 0]], ["type", 1], ["id", 69]]),
dict([["req", "money"], ["checknum", 5000], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.!", "collect taxes from clinic Lv. 1"]], ["lev", 15], ["pair", ["bid", 12]], ["reward", [1500, 100, 0]], ["type", 1], ["id", 70]]),
dict([["req", "money"], ["checknum", 3500], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.!", "collect taxes from butcher shop Lv. 2"]], ["lev", 15], ["pair", ["bid", 7]], ["reward", [2500, 250, 1]], ["type", 1], ["id", 71]]),
dict([["req", "planting"], ["des", ["Plant pumpkins", "Special farmland,crops,Harvest Goddess can increase yield.", "plant pumpkins"]], ["checknum", 6], ["lev", 16], ["pair", ["object_id", 7, "type", 0]], ["reward", [1800, 96, 0]], ["type", 0], ["id", 72]]),
dict([["req", "build"], ["checknum", 1], ["des", ["Summon god", "God statue's magic will bring incredible function.", "summon Mars"]], ["lev", 16], ["pair", ["ground_id", 403]], ["reward", [1600, 100, 0]], ["type", 0], ["id", 73]]),
dict([["req", "godbless"], ["des", ["Perform magic", "God statue's magic will bring incredible function.", "Mars performs magic"]], ["checknum", 1], ["lev", 16], ["pair", ["godtype", 3]], ["reward", [1300, 100, 1]], ["type", 0], ["id", 74]]),
dict([["req", "updatebuilding"], ["des", ["Upgrade statue", "The magic power of higher level god or Goddess will be stronger!", "upgrade a statue of god or Goddess"]], ["checknum", 1], ["lev", 16], ["pair", ["ground_id", 404]], ["reward", [4000, 250, 1]], ["type", 0], ["id", 75]]),
dict([["req", "build"], ["checknum", 3], ["des", ["Build flowers", "Decoration can increase population and magic capacity.", "build an flowers"]], ["lev", 17], ["pair", ["ground_id", 521]], ["reward", [900, 45, 0]], ["type", 0], ["id", 76]]),
dict([["req", "build"], ["checknum", 3], ["des", ["Build cherry tree", "Decoration can increase population and magic capacity.", "build cherry trees"]], ["lev", 17], ["pair", ["ground_id", 528]], ["reward", [2100, 100, 1]], ["type", 0], ["id", 77]]),
dict([["req", "wood"], ["des", ["Collect white poplar woods", "Wood and stone can be used to upgrade your buildings and produce weapons.", "collect white poplar woods"]], ["checknum", 200], ["lev", 17], ["pair", ["objid", 2]], ["reward", [4000, 300, 1]], ["type", 1], ["id", 78]]),
dict([["req", "updatebuilding"], ["des", ["Upgrade mansion", "Advanced building will largely encourage the development of your territory!", "upgrade a mansion to the highest level"]], ["checknum", 1], ["lev", 17], ["pair", ["ground_id", 138]], ["reward", [2500, 98, 0]], ["type", 0], ["id", 79]]),
dict([["checknum", 3], ["des", ["Invite friends", "More friends will bring more visit rewards...", "invite your friends to join", "hint:enter your friends' list and invite the uninvited friends or click invite button in menu"]], ["lev", 17], ["reward", [5500, 155, 1]], ["type", 4], ["id", 80]]),
dict([["req", "build"], ["des", ["Build quarry", "Wood and stone can be used to upgrade your buildings and produce weapons.", "build a quarry"]], ["checknum", 1], ["lev", 18], ["pair", ["ground_id", 6]], ["reward", [2100, 56, 0]], ["type", 0], ["id", 81]]),
dict([["req", "stone"], ["des", ["Collect gravel", "Wood and stone can be used to upgrade your buildings and produce weapons.", "collect gravel"]], ["checknum", 50], ["lev", 18], ["pair", ["objid", 0]], ["reward", [2400, 120, 0]], ["type", 1], ["id", 82]]),
dict([["req", "updatebuilding"], ["checknum", 1], ["des", ["Upgrade infantry camp", "Advanced building will largely encourage the development of your territory!", "upgrade a infantry camp Lv. 2"]], ["lev", 18], ["pair", ["ground_id", 202]], ["reward", [3000, 150, 0]], ["type", 0], ["id", 83]]),
dict([["req", "build"], ["des", ["Build nepenthe", "Decoration can increase population and magic capacity.", "build nepenthe"]], ["checknum", 4], ["lev", 19], ["pair", ["ground_id", 524]], ["reward", [1200, 80, 0]], ["type", 0], ["id", 85]]),
dict([["req", "build"], ["checknum", 3], ["des", ["Build shrubbery", "Decoration can increase population and magic capacity.", "build shrubbery"]], ["lev", 19], ["pair", ["ground_id", 532]], ["reward", [900, 60, 0]], ["type", 0], ["id", 86]]),
dict([["req", "build"], ["checknum", 1], ["des", ["Build angel statue", "Decoration can increase population and magic capacity.", "build angel statue"]], ["lev", 19], ["pair", ["ground_id", 538]], ["reward", [2000, 100, 1]], ["type", 0], ["id", 87]]),
dict([["req", "updatebuilding"], ["checknum", 1], ["des", ["Upgrade clinic", "Advanced building will largely encourage the development of your territory!", "upgrade a clinic Lv. 1"]], ["lev", 19], ["pair", ["ground_id", 313]], ["reward", [3000, 100, 0]], ["type", 0], ["id", 88]]),
dict([["req", "build"], ["des", ["Build Farmland", "Gem farmland will increase crops yield.", "build gem farmland"]], ["checknum", 4], ["lev", 20], ["pair", ["ground_id", 3]], ["reward", [4000, 200, 1]], ["type", 0], ["id", 89]]),
dict([["req", "planting"], ["des", ["Plant peaches", "Special farmland,crops,Harvest Goddess can increase yield.", "plant peaches"]], ["checknum", 3], ["lev", 20], ["pair", ["object_id", 8, "type", 0]], ["reward", [3000, 150, 1]], ["type", 0], ["id", 90]]),
dict([["req", "build"], ["checknum", 2], ["des", ["Build manor", "House can recruit people. People can build buildings, trained to soldiers.", "build manor Lv. 2"]], ["lev", 20], ["pair", ["ground_id", 148]], ["reward", [2100, 100, 0]], ["type", 0], ["id", 91]]),
dict([["req", "build"], ["checknum", 1], ["des", ["Summon Goddess", "God statue's magic will bring incredible function.", "summon wealth god"]], ["lev", 20], ["pair", ["ground_id", 402]], ["reward", [2300, 130, 0]], ["type", 0], ["id", 92]]),
dict([["req", "godbless"], ["des", ["Perform magic", "God statue's magic will bring incredible function.", "perform wealth god's magic"]], ["checknum", 1], ["lev", 20], ["pair", ["godtype", 2]], ["reward", [1400, 100, 1]], ["type", 0], ["id", 93]]),
dict([["req", "money"], ["checknum", 3500], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.!", "collect taxes from clothing shop Lv. 1"]], ["lev", 21], ["pair", ["bid", 18]], ["reward", [2600, 150, 0]], ["type", 1], ["id", 94]]),
dict([["req", "wood"], ["des", ["Collect sycamore woods", "Wood and stone can be used to upgrade your buildings and produce weapons.", "collect sycamore woods"]], ["checknum", 100], ["lev", 21], ["pair", ["objid", 3]], ["reward", [2700, 180, 0]], ["type", 1], ["id", 95]]),
dict([["req", "expand"], ["des", ["Expand territory", "You can build more buildings by expanding land!", "expand your territory"]], ["checknum", 1], ["lev", 21], ["pair", []], ["reward", [3000, 300, 0]], ["type", 0], ["id", 96]]),
dict([["req", "money"], ["checknum", 6000], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.!", "collect taxes from butcher shop Lv. 3"]], ["lev", 21], ["pair", ["bid", 8]], ["reward", [4000, 300, 1]], ["type", 1], ["id", 97]]),
dict([["req", "stone"], ["checknum", 130], ["des", ["Collect basalt", "Wood and stone can be used to upgrade your buildings and produce weapons.", "collect basalt"]], ["lev", 22], ["pair", ["objid", 1]], ["reward", [2800, 210, 0]], ["type", 1], ["id", 98]]),
dict([["req", "money"], ["checknum", 10000], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.!", "collect taxes from book store Lv. 2"]], ["lev", 22], ["pair", ["bid", 16]], ["reward", [4000, 280, 1]], ["type", 1], ["id", 99]]),
dict([["req", "planting"], ["des", ["Plant watermelon", "Special farmland,crops,Harvest Goddess can increase yield.", "plant watermelon"]], ["checknum", 6], ["lev", 23], ["pair", ["object_id", 9, "type", 0]], ["reward", [2900, 240, 0]], ["type", 0], ["id", 101]]),
dict([["req", "money"], ["checknum", 13000], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.!", "collect taxes from casino Lv. 1"]], ["lev", 24], ["pair", ["bid", 24]], ["reward", [4500, 350, 1]], ["type", 1], ["id", 103]]),
dict([["req", "stone"], ["des", ["Collect limestone", "Wood and stone can be used to upgrade your buildings and produce weapons.", "collect limestone"]], ["checknum", 200], ["lev", 24], ["pair", ["objid", 2]], ["reward", [4500, 350, 1]], ["type", 1], ["id", 104]]),
dict([["req", "build"], ["des", ["Building maple", "Decoration can increase population and magic capacity.", "building maple"]], ["checknum", 3], ["lev", 25], ["pair", ["ground_id", 535]], ["reward", [1400, 90, 1]], ["type", 0], ["id", 106]]),
dict([["req", "planting"], ["des", ["Plant strawberry", "Special farmland,crops,Harvest Goddess can increase yield.", "plant strawberry"]], ["checknum", 6], ["lev", 25], ["pair", ["object_id", 11, "type", 0]], ["reward", [5400, 420, 1]], ["type", 0], ["id", 107]]),
dict([["req", "wood"], ["des", ["Collect oak", "Wood and stone can be used to upgrade your buildings and produce weapons.", "collect oak woods"]], ["checknum", 300], ["lev", 25], ["pair", ["objid", 5]], ["reward", [5700, 420, 0]], ["type", 1], ["id", 108]]),
dict([["req", "planting"], ["des", ["Plant mango", "Special farmland,crops,Harvest Goddess can increase yield.", "plant mango"]], ["checknum", 6], ["lev", 26], ["pair", ["object_id", 10, "type", 0]], ["reward", [3300, 240, 1]], ["type", 0], ["id", 110]]),
dict([["req", "updatebuilding"], ["des", ["Upgrade statue", "The magic power of god or Goddess will be stronger!", "upgrade a silver statue of god or Goddess"]], ["checknum", 1], ["lev", 26], ["pair", ["ground_id", 408]], ["reward", [4000, 450, 1]], ["type", 0], ["id", 111]]),
dict([["req", "updatebuilding"], ["checknum", 1], ["des", ["Upgrade Magical Manor", "Advanced building will largely encourage the development of your territory!", "upgrade a Magical Manor Lv. 2"]], ["lev", 26], ["pair", ["ground_id", 162]], ["reward", [5000, 450, 0]], ["type", 0], ["id", 112]]),
dict([["req", "stone"], ["des", ["Collect granite", "Wood and stone can be used to upgrade your buildings and produce weapons.!", "collect granite"]], ["checknum", 100], ["lev", 27], ["pair", ["objid", 3]], ["reward", [3000, 300, 0]], ["type", 1], ["id", 113]]),
dict([["req", "updatebuilding"], ["checknum", 1], ["des", ["Upgrade cavalry camp", "Advanced building will largely encourage the development of your territory!", "upgrade a cavalry camp Lv. 2"]], ["lev", 27], ["pair", ["ground_id", 205]], ["reward", [4000, 480, 1]], ["type", 0], ["id", 114]]),
dict([["req", "planting"], ["des", ["Plant corns", "Special farmland,crops,Harvest Goddess can increase yield.", "plant corns on the crystal farmland"]], ["checknum", 6], ["lev", 27], ["pair", ["object_id", 2, "type", 0, "bid", 2]], ["reward", [4500, 500, 1]], ["type", 0], ["id", 115]]),
dict([["req", "wood"], ["des", ["Collect pine trees", "Wood and stone can be used to upgrade your buildings and produce weapons.", "collect pine trees"]], ["checknum", 200], ["lev", 28], ["pair", ["objid", 4]], ["reward", [4200, 300, 0]], ["type", 1], ["id", 116]]),
dict([["req", "money"], ["checknum", 16000], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.!", "collect taxes from casino Lv. 2"]], ["lev", 28], ["pair", ["bid", 25]], ["reward", [5600, 480, 0]], ["type", 1], ["id", 117]]),
dict([["req", "money"], ["checknum", 15000], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.!", "collect taxes from book store Lv. 3"]], ["lev", 28], ["pair", ["bid", 17]], ["reward", [5600, 480, 1]], ["type", 1], ["id", 118]]),
dict([["req", "money"], ["checknum", 7000], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.!", "collect taxes from Jewelers Lv. 1"]], ["lev", 29], ["pair", ["bid", 21]], ["reward", [4200, 300, 0]], ["type", 1], ["id", 119]]),
dict([["req", "planting"], ["des", ["Plant strawberry", "Tale tells that magical strawberry can be harvested from this farmland!", "plant strawberry on the gem farmland"]], ["checknum", 6], ["lev", 29], ["pair", ["object_id", 11, "type", 0, "bid", 3]], ["reward", [6000, 500, 1]], ["type", 0], ["id", 120]]),
dict([["req", "money"], ["checknum", 22000], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.!", "collect taxes from casino Lv. 3"]], ["lev", 29], ["pair", ["bid", 26]], ["reward", [6000, 500, 1]], ["type", 1], ["id", 121]]),
dict([["req", "build"], ["checknum", 4], ["des", ["Build farmland", "Elf farmland can increase crops yield.", "build elf farmland"]], ["lev", 30], ["pair", ["ground_id", 4]], ["reward", [6000, 500, 1]], ["type", 0], ["id", 122]]),
dict([["req", "stone"], ["des", ["Collect quartz", "Wood and stone can be used to upgrade your buildings and produce weapons.", "collect quartz"]], ["checknum", 300], ["lev", 30], ["pair", ["objid", 5]], ["reward", [6200, 480, 1]], ["type", 1], ["id", 123]]),
dict([["req", "stone"], ["des", ["Collect marble", "Wood and stone can be used to upgrade your buildings and produce weapons.", "collect marble"]], ["checknum", 200], ["lev", 30], ["pair", ["objid", 4]], ["reward", [4000, 320, 0]], ["type", 1], ["id", 124]])
];


var WarTasks = 
[dict([["req", "warinfo"], ["des", ["Unlock war mode", "You need reach to Lv. 6 to unlock war mode and fight with friends", "you can unlock war mode to fight with friends", "Unlock war mode", "Hint: Tap on map, then tap War Mode"]], ["checknum", 1], ["pair", []], ["reward", [5000, 10, 0]], ["type", 0], ["id", 0]]),
dict([["req", "dialog-help"], ["des", ["View HELP", "Learn about war mode by viewing HELP document", "view HELP about war"]], ["checknum", 1], ["reward", [100, 5, 0]], ["type", 2], ["id", 1]]),
dict([["req", "makeally"], ["des", ["Ally with friends", "Ally with some friends, and they will help you by providing you with soldiers during a battle", "Ally with a friend"]], ["checknum", 1], ["pair", []], ["reward", [500, 10, 0]], ["type", 0], ["id", 2]]),
dict([["req", "adddefence"], ["des", ["Increase defense", "Increase defence of wall hint: Tap on castle, and then tap \"[+]\" to upgrade defence", "add 100 defence"]], ["checknum", 100], ["reward", [1000, 15, 0]], ["type", 3], ["id", 3]]),
dict([["req", "build"], ["des", ["Build scout camp", "Scout camps are used to train scouts", "build scout camp Lv. 1"]], ["checknum", 1], ["pair", ["ground_id", 206]], ["reward", [500, 8, 0]], ["type", 0], ["id", 4]]),
dict([["req", "soldiers"], ["des", ["Train scout", "Scout can fetch enemy's information", "train scout Lv. 1"]], ["checknum", 9], ["pair", ["byte", 2, "objtype", 0]], ["reward", [800, 10, 0]], ["type", 1], ["id", 5]]),
dict([["req", "detect"], ["des", ["Detect enemy", "If you want to win, it's better you know your enemy!", "detect enemy"]], ["checknum", 1], ["pair", []], ["reward", [300, 7, 0]], ["type", 0], ["id", 6]]),
dict([["req", "attack"], ["des", ["Attack enemy", "Defeat your enemies will bring you money and fame!", "attack enemy"]], ["checknum", 1], ["pair", []], ["reward", [1000, 10, 0]], ["type", 0], ["id", 7]]),
dict([["req", "addallyupbound"], ["des", ["Increase ally capacity", "You can increase your ally capacity to have more allies.", "increase ally capacity"]], ["checknum", 1], ["pair", []], ["reward", [1500, 20, 0]], ["type", 0], ["id", 8]]),
dict([["req", "dialog-nobility"], ["des", ["Upgrade nobility ranking", "Higher nobility will enable you to have more rights", "upgrade nobility"]], ["checknum", 1], ["pair", []], ["reward", [2000, 25, 0]], ["type", 2], ["id", 9]]),
dict([["req", "upgrademap"], ["des", ["Upgrade map", "If you defeat enough enemies, you can start fighting on a higher level map.", " go to a higher level map"]], ["checknum", 1], ["pair", []], ["reward", [2000, 25, 0]], ["type", 0], ["id", 10]]),
];

var Statics = 
[
"Reach to Lv. 6 to unlock war mode",
"Once you have activated War Mode, you can't quit it, please read the HELP documentation for more information.",
"Congrats, you won!",
"Sorry, you were defeated.",
"[ENAME] is too powerful, strengthen your military power and fight another day!",
"Congrats! you have defeated [ENAME],go on fighting and gain glory!",
"How to add power",
"[USERNAME] has entered a new map. Come on, Let's build our own miracle empire with [USERNAME]!",
"[USERNAME]has upgraded to [NOBNAME], Come on, Let's build our own miracle empire with [USERNAME]!",
"[USERNAME] has upgraded the territory, Come on, Let's build our own miracle empire with [USERNAME]!",
"[USERNAME] has defeated the invaders, Come on, Let's build our own miracle empire with [USERNAME]!",
"[USERNAME] is defeated by [ENAME], Let's go and get revenge for [USERNAME]!",
"[USERNAME]'s army has been defeated, gather your troops and help [USERNAME] out!",
"[USERNAME] has defeated [ENAME], Let's build our own miracle empire with [USERNAME]!",
"You must reach Lv. 15 to unlock one-step finishing",
"Sorry,you don't have spare farmland for one-step finishing",
"Sorry, your crops are growing, Please try again later",
"[WHO] must reach [NUM] to upgrade your [TYPE] to the next level.!",
"[WHO] needs to defeated [NUM] more opponents to upgrade to [CARD]",
"Your stores are still in production, please try again later",
"You can get a monster statue for free after you have upgraded your monster card to violet gold level",
"Sorry, the space room is developing; you can get it for free at Lv. 5 with a Moon Goddess card.",
"You can use one-step harvesting and one-step seeding when you upgrade the Harvest Goddess to violet golden level",
"Upgrade the Wealth God Statue to violet golden level to use one-step collecting",
"Sorry, you have already visited all your friends' castles!",
"Your dragon will become stronger if you train it every day!",
"You have visited [NUM] friends and get [MONEY] coins",
"Upgrade the Friendship God to violet golden level",
"You need [NUM] more friends",
"You need to open [NUM] more treasure chest for your friends",
"You need to feed your friends' dragons [NUM] more times",
"You need to reach level [NUM]",
"You can use one-step visiting from now on!",
"[NAME] has shared the screenshot of his territory, let's take a look!",
"",
NewsURL,
"You can feed your dragon once a day, friends can help you feed it. Not feeding your dragon will harm its development!",
"This dragon is going to hatch soon, feed it once it hatches!",
"You can only feed a dragon once a day^_^",
"[NAME]'s dragon has been fed by [NUM] friends, thanks for helping^_^"
];


const darkColorAlpha = 65;
const AutoPop = 1;
const NonAutoPop = 0;
const NotAdd = 2;
const NewQuit = 3;

const NewPop = -999;
const DownLoadPop = -2000;
const NewQuitPop = -5000;


const FeedMoney = 100;
const OpenMoney = 100;

const InCastalPage = 0;
const screenWidth = 800;
const screenHeight = 450;


const DownWarPic = 0;
const DownPetPic = 1;
const DownAllPic = 2;
const DownWarn = -2000;
const DownAniPic = 3;
const DownMusic = 4;
const ShowDownYet = -10000;

const NotDownload = -1;
const UseCata = -3000;
const AttWithCata = 100;
const AttNoCata = 101;
const NoCata = -3001;
const DiskShare = -4000;

const ManaChargeTime = 300000;
const AddDefCae = 25;
const AddDefCoin = 50;
const AddDefFood = 5;

const GenVisMana = 25;
const AccVisMana = 33;

const OneKeyMana = 10;
const ChargeMana = 5;

const CallDragon = 1000;




const Tips = dict([
[3, "Night mode will be opened after 8pm everyday, light decors will lighten your empire! You can close it at settings option."],
[4, "Click castle to see your territory's info, such as attack power, special articles, magic value, resource number, etc."],
[5, "Some decors can enlarge population capacity, others can enlarge magic capacity."],
[6, "You can unlock war mode now! Then you can attack other users for more resources, honor, etc."],
[7, "How to get more silvers&free caesars? Click FAQ button please."],
[8, "You can build Harvest Goddess now! Her performing of magic can greatly increase crop's yield, she can also one-step harvesting&planting"],
[9, "After building Dragon wheel, you can use dragon stone to get free caesars!"],
[10, "You can build Dragon nest now! After building it, you can summon pet, which will help you fight when it grows up."],
[11, "You can build lumber mill now! Wood is a necessity for upgrading buildings!"],
[12, "You can build Liberty Goddess now! Her performing of magic can help increase population recruit number."],
[13, "Tip: You will be given many silvers as reward as well as have probability to won caesars by defeating other users."],

[20, "You can upgrade your castle now! Upgrade your castle to Lv.2, your magic capacity will +5!"],
[30, "You can upgrade your castle to Lv.3 now！You can also build beast god now, which can perform magic to let warrior statue produce castle DTF."]
]);

