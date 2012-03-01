<<<<<<< HEAD
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

["share_format","[NAME][DESCRIBE],Come on!join [NAME] and build your own miracle empire together!"],

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

["onekey_plant","One-step plantint"],["onekey_harvest","One-step harvesting"],["onekey_product","One-step collect taxes"],["onekey_visit_normal","One-step ordinary visit"],["onekey_visit_inc","One-step accumulated visit"],["onekey_title","One-step operation"],

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

["sendFight", "Sent forces"], ["totalFight", "Total ATK"], ["lostFight", "Lost forces"], ["returnFight", "Return forces"], ["defenceFight", "Defense"], ["lostDefence", "Lost defense"], ["leftDefence", "Left defense"], ["lostCoin", "Lost coin"], ["share", "Share"], ["ok", "Ok"], ["attack", "Attack"], ["defence", "Defence"], ["retry", "Retry"], 
["cancel", "Cancel"], ["netFail1", "It seems off network, check network connect please."], ["netFail2", "Network connect error, try again later."], ["taskShare", "Congrats, you finish this task!"], ["shareReward", "Share with your friends to get 100 silvers."],["complete", "Complete"], ["giveup", "Give up"], ["giveupwarn", "You will lose one chance to get reward if you give up this task."], ["playWithme", "Come create miracles with me!"], ["goSee", "Have a look"], ["IKnow", "Got it"], ["genAdd", "Ordinary"], ["fastAdd", "Fast"], ["chooseDefence", "Defense incrense you choose:"], ["youLeft", "Left "], ["allyNum", " Ally number"], ["sureToally", "Sure to ally with him/her?"], 
["taskFinishPost", "[NAME] complete [TASK] task, come on to build your own miracle empire with me!"],
["allyOk", "You will be reinforced from your allies when you are at war. You need Caesar to destroy the covenant, choose ally carefully"], 
["cancelAlly", "Are you sure to cancel alliance with "], ["makeAlly", "Ally"], ["punish", "Punishing"], ["allyUp", "The number of your allies has reached its maximum"], ["add", "Add"], ["close", "Close"],


["addAlly", "Add an ally"], ["attackNow", "Your army is on the way"], ["hintPower", "hint:Your army's ATK will increase if you are on line"], ["youWin", "You win"], ["attackIt", "Attack!"], ["inBuild", "building"], ["inCall", "recruiting"], ["inProduct", "producing"], ["training", "Training"], ["planting", "Planting"], ["wooding", "producing"], ["stoning", "mining"], ["proDefing", "producing"], ["blessing", "performing"], ["free", "free"], ["egging", "incubating"], ["growing", "growing"], ["shopping", "Purchase"], ["buyCaesar", "Buy Caesar coins"], ["fulfill", "The Harvest Goddess can increase the crop yield by performing magic"], ["population", "the Goddess of population can increase the number of people you can recruit by performing magic"], ["war", "the god of war can strenthen your soldier's ATK by performing magic"], ["beast", "the god of beast will increase your defense by performing magic"], 

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
["inProtect", "Protecting"], ["attNoProtect", "You can't enable protection mode during attacking period"],
["openProtect", "enable protection"], ["colonial", "colonial "], ["levelUp", "Congrats! [NAME] has upgraded to lev [LEVEL], come on to build your own miracle empire!"], ["goInNewMap", ", you will find more powerful players in higher level map."], ["cityLevelUp", ",your territory is level up!"], ["oneLevel", ", you need more experiences to upgrade your territory!"], ["next", "Next"],
["choosePlant", "Choose Crops"], ["sureToBuy", "Are you sure to purchase [NAME]?"],["acc", "Quicken"],
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
=======
const stringDict=dict([
["build_defence_format","建造[BUILD]会增加[DEFENCE]城堡防御力，确定建造？（防御力数据可以点击城堡查看）"],
["mana", "魔法值"],
["money","银币"],["caesars","凯撒币"],["food","粮食"],["labor","空闲人口"],["person","人口"],["personmax","人口上限"],["stone","石头"],["wood","木材"],["caesar","凯撒"],
["coin", "银币"], ["freePeople", "空闲人口"], 
["share","分享"],["back","返回"],["change","修改"],["ok","确定"],["send","发送"],["cancel","取消"],["system","系统"],["devine","施展"],["retry","重试"],["help","帮忙"],["close","关闭"],["openbox","打开宝箱"],["askforhelp","求助好友"],
["attack","攻打"],["defence_power","防御力："],["emptyDefence", "未加成防御力"],["infpower","步兵战斗力"],["cavpower","骑兵战斗力"],["addsoldier","增兵"],["minussoldier","撤兵"],["getresource","运回资源"],["quick","加速"],["quickSendArmy", "增兵加速"],
["loading_str","正在载入，请稍候……"],["self","我"],
["request_done","该请求已处理"],
["friend_notload","抱歉，现在无法获得您的好友信息"],["friend_ally_notice","你可以访问好友和好友结盟，盟友会帮你战斗哦！"],["friend_invite","快来和我一起创造奇迹吧！"],["friend_invite_success","邀请成功！"],
["nest_style_cannotchange","宠物正在进化中，这个时候不可以更换哦！"],
["nest_talk_morning","早安，美好的一天又开启咯~"],["nest_talk_noon","午安，好饿呀，快点喂食吧~"],["nest_talk_night","晚安，早睡早起，睡觉啦~"],
["nest_talk_other","每次训练我都会更加强大，快训练我吧！"],["nest_talk_feedover","我已经吃饱啦，感谢前来喂养"],["nest_talk_notfeedover","快喂养我吧，我还可以继续被喂养哦~"],
["nest_talk_sleep","我还要适应成长，喂养到285点，我就可以飞翔咯！"],
["nest_getup_1","孵化成功啦！它是一条土属性龙。"],["nest_getup_2","成长为少年龙啦！"],
["nest_getup_format","[NAME][DESCRIBE]目前成长点为：[HEALTH]，属性为：[PROPERTY]，战斗力为：[ATTACK]"],
["nest_pet_name","请输入宠物名称："],["nest_pet_name_warning","命名之后不能更改，请慎重命名"],
["nest_gotohelp","为了更好地体验宠物系统，请查看帮助文档"],
["box_str_1","快帮我打开这个宝箱，"],["box_str_2","大家一起分享宝藏吧！"],["box_str_3","城堡里突然飘来一只<g>神秘宝箱<g>！！+快邀请好友一起开启吧！！+有神秘礼物等着你哦！"],
["god_bless_over","你已经施展过神迹了！"],
["share_format","[NAME][DESCRIBE]，赶快加入与[NAME]一起打造属于自己的奇迹帝国吧！"],
["share_box_format","[NAME]获得了一只神秘的宝箱，但是需要你们的帮助才能打开，快去帮助TA吧！"],
["share_petup_1","成功孵化出宠物"],["share_petup_2","的幼龙长大啦"],
["share_openbox","打开了一只神秘宝箱"],
["default_petname","我的宠物"],
["news_nonews","还没有任何消息哦！"],
["news_element0","<b>[NAME]<b>访问了你的领地"],
["news_element1","<b>[NAME]<b>帮助你打理城堡"],
["news_element2","<b>[NAME]<b>赠送了你礼物"],
["news_element3","你战胜了<b>[NAME]<b>"],
["news_element4","<b>[NAME]<b>战胜了你"],
["news_element5","<b>[NAME]<b>帮助你打开宝箱"],
["news_element6","<b>[NAME]<b>帮助你喂养了宠物"],
["gift_element0","[NAME]赠送你礼物[GIFT]"],
["gift_element1","[NAME]向你索取礼物[GIFT]"],
["monster_refresh_format","哈哈哈，[NAME]领主，献出你的粮食吧，否则你们将永不得安宁！"],
["monster_foodwilllost","下次登录之前还没有把怪兽消灭，怪兽会抢夺你的粮食哦！ 进入地图消灭它们吧！"],
["warrecord_notice_format","你的领地发生了[NUM]场战争，观看可以知道士兵损失详细情况，是否观看？"],
["war_newmap_notice","恭喜你进入了新的地图！提示：不要太快进入更高等级的地图哦，先暗中积攒兵力吧^_^"],
["spy_notice","注：侦察级别越高，获得的信息越多哦！"],["spy_unknown","未侦察到"],["spy_result_format","你损失了[NUM]个侦察兵，获取了[WHO]的情报："],
["spy_result2_noenemy","未发现有进攻这个城堡的军队"],["spy_result2_format","已有[NUM]支军队正在进攻这个城堡，最快抵达时间为[TIME]以后"],
["spy_result2_mode3_format","总计战斗力为[NUM]"],
["chat_empty","内容为空，无法发送！"],["chat_wordlimit","字数超过30个汉字，无法发送！"],["chat_nettimeout","超时了，你的消息发送失败"],
["text_wordlimit_format","限[NUM]个汉字！"],["text_cannotset","不能改成这个名字！"],["text_nettimeout","抱歉，因网络原因本次改名失败！"],
["text_message_send","请输入留言内容："],["text_empty","内容不能为空"],["text_chat_nettimeout","抱歉，发送失败，请重新发送^_^"],
["message_send_success","发送成功！"],["text_empire_name","请输入帝国名称："],
["update_normal","普通升级"],["update_caesars","快速升级"],["update_warning","该建筑正在运作，如果升级将会导致运作中断，确认升级？"],
["onekey_plant","一键播种"],["onekey_harvest","一键收获"],["onekey_product","一键收税"],["onekey_visit_normal","一键普通访问"],["onekey_visit_inc","一键累计访问"],["onekey_title","一键操作"],
["onekey_gotohelp","查看帮助及如何使用？"],
["tab_fighting","作战中"],["tab_attackable","可攻打"],["tab_fortress", "要塞"],
["nobattle_fail_whenhasattack","抱歉，正在进攻其他玩家时不能开启保护模式"],
["nobattle_whenattack","在保护期中攻打其他玩家，保护状态将会终止"],
["attack_whenattacked","你已经在进攻他了哦！"],["attack_whennobattle","该玩家的领地正在受保护中"],["attack_whenwon","你已经征服他了哦！"],["attack_whenupdated","抱歉，该玩家已经升级到更高等级的地图。"],
["attack_cancel","是否撤消本次进攻？你的战斗力将立即回到城堡。"],["attacktime","行军时间"],["attacktime_notice","*骑兵比重越大，行军时间越短"],
["state_attacking","进攻中"],["state_defencing","防御中"],["state_fighting","正在交战"],["state_adding","增兵中"],
["net_state_1","貌似断网了，请检查是否有网络连接"],["net_state_2","网络连接遇到了问题，请稍候再试"],
["master","领主："],[":","："],
["user_notoccupy","未征服"],["user_occupy","已征服"],["user_protected","保护中"],["user_fighting","正在交战"],["user_attacking","进攻中"],
["resource_get_format","该要塞每小时生产银币[MONEY]，粮食[FOOD]，木材[WOOD]，石头[STONE]，下一次生产结束倒计时：[TIME]"],
["goSee", "去看看"], ["IKnow", "知道了"], ["genAdd", "普通增加"], ["fastAdd", "快速增加"], ["chooseDefence", "你所选择要增加的防御里："], 
["youLeft", "你还剩[NUM]个盟友名额。"], ["sureToally", "你确定与Ta结盟吗？"],
["allyOk", "在你战斗时，盟军将会提供你士兵援助。请慎重结盟，取消结盟会消耗凯撒币的哦！"],
["makeAlly", "结盟"], ["cancelAlly", "确定取消与[NAME]的结盟？"],
["punish", "惩罚："], ["allyUp", "你的盟友数已经达到上限。"],
["add", "增加"], ["addAlly", "增加一个盟友位"], 
["sendSuc",  "请求发送成功！"],
["downloading", "正在下载相关文件..."],
["downMusic", "开启音乐需要下载800K左右音乐文件，是否下载？"],
["showDownNow", "为了更好的体验游戏，你需要下载3M左右的图片，建议使用wifi，是否下载？"],
>>>>>>> 3c3ef9a9c6dfff975511869da9ec8aca34b3cd85
["", ""],
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
"Cupid", "Rose Flowers", "Rose Garden", "Love Tree"]],


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

 ["INVITE_STR",["papaya games", "enjoy Miracle Empire with me", "come on to help me defeat enemies and build your own empire!", "Miracle Empire is a big,gorgeous SNS game. You can download from Android market, https://market.android.com/details?id,com.papaya.wonderempire1_cn"]]

]);


var Tasks = 
[dict([["req", "build"], ["des", ["Build Farmland!", "Special farmland,crops,harvest goddess can increase yield.", "Build ordinary farmland"]], ["checknum", 1], ["lev", 3], ["pair", ["ground_id", 1]], ["reward", [200, 5, 0]], ["type", 0], ["id", 0]]),
dict([["req", "planting"], ["des", ["Plant wheat", "Special farmland,crops,harvest goddess can increase yield.", "planting wheat", "Tip:Click on a free plot of farmland, then tap the seed icon and choose wheat"]], ["checknum", 3], ["lev", 3], ["pair", ["object_id", 0, "type", 0]], ["reward", [300, 15, 0]], ["type", 0], ["id", 1]]),
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
dict([["des", ["Rate", "If you enjoy the Miracle Empire, please give it 5 stars in Android Market, thanks!In return, you will get 10 caesars!", "rate Miracle Empire"]], ["checknum", 1], ["lev", 5], ["reward", [800, 30, 0]], ["type", 3], ["id", 13]]),
dict([["req", "updatebuilding"], ["des", ["Upgrade cottage", "Upgrading your building will increase their production efficiency.", "upgrade cottage", "hint:click a normal cottage first and then click the upgrade icon"]], ["checknum", 1], ["lev", 6], ["pair", ["ground_id", 101]], ["reward", [500, 20, 0]], ["type", 0], ["id", 14]]),
dict([["req", "person"], ["des", ["Increase Population!", "House can recruit people. People can build builings, trained to soldiers.", "increase population", "hint:click a free dwelling house first,then click the recruit icon"]], ["checknum", 50], ["lev", 6], ["pair", []], ["reward", [500, 30, 0]], ["type", 1], ["id", 15]]),
dict([["req", "build"], ["des", ["Build house", "House can recruit people. People can build builings, trained to soldiers.", "build normal house"]], ["checknum", 2], ["lev", 6], ["pair", ["ground_id", 112]], ["reward", [400, 25, 0]], ["type", 0], ["id", 16]]),
dict([["req", "planting"], ["des", ["Plant carrots", "Special farmland,crops,harvest goddess can increase yield.", "plant carrots"]], ["checknum", 6], ["lev", 6], ["pair", ["object_id", 1, "type", 0]], ["reward", [600, 30, 0]], ["type", 0], ["id", 17]]),
dict([["req", "money"], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.!", "collect taxes from normal butcher shop"]], ["checknum", 1500], ["lev", 6], ["pair", ["bid", 6]], ["reward", [800, 80, 1]], ["type", 1], ["id", 18]]),
dict([["req", "helpopen"], ["des", ["Open Treasure Chest!", "Help your friends open treasure chest and get rewards.", "open treasure chest of your friends", "hint:visit your friends' territory, click the treasure chest icon"]], ["checknum", 5], ["lev", 7], ["pair", []], ["reward", [1000, 25, 0]], ["type", 0], ["id", 25]]),
dict([["des", ["Invite friends", "More friends will bring more visit rewards...", "invite friends", "Hint: Tap on your friends list and invite your friends on Papaya to play with you. You can also do this by tapping on the invite button in the menu"]], ["checknum", 3], ["lev", 7], ["reward", [2000, 50, 1]], ["type", 4], ["id", 26]]),
dict([["req", "planting"], ["checknum", 4], ["des", ["Plant corns", "Special farmland,crops,harvest goddess can increase yield.", "plant corns"]], ["lev", 8], ["pair", ["object_id", 2, "type", 0]], ["reward", [1200, 48, 1]], ["type", 0], ["id", 27]]),
dict([["req", "build"], ["des", ["Summon Goddess", "God statues's magic will bring incredible function.", "summon harvest Goddess", "hint:click the building icon first,then click the miracle page to build Goddess of harvest"]], ["checknum", 1], ["lev", 8], ["pair", ["ground_id", 400]], ["reward", [1000, 40, 0]], ["type", 0], ["id", 28]]),
dict([["req", "godbless"], ["des", ["Perform magic", "God statues's magic will bring incredible function.", "harvest Goddess performs magic"]], ["checknum", 1], ["lev", 8], ["pair", ["godtype", 0]], ["reward", [1000, 30, 1]], ["type", 0], ["id", 29]]),
dict([["req", "planting"], ["des", ["Plant pineapple", "Special farmland,crops,harvest goddess can increase yield.", "plant pineapple"]], ["checknum", 6], ["lev", 8], ["pair", ["object_id", 3, "type", 0]], ["reward", [1200, 36, 0]], ["type", 0], ["id", 30]]),
dict([["req", "build"], ["des", ["Build house", "House can recruit people. People can build builings, trained to soldiers.", "build a Magical Manor"]], ["checknum", 1], ["lev", 8], ["pair", ["ground_id", 160]], ["reward", [1000, 50, 1]], ["type", 0], ["id", 31]]),
dict([["checknum", 1], ["des", ["Show your territory", "Take a screenshot of your territory and share it with your friends.", "screenshot and share", "hint:click menu button first and then click screenshot button"]], ["lev", 8], ["reward", [800, 30, 0]], ["type", 5], ["id", 32]]),
dict([["des", ["Help friends", "Help your friends remove pests from their farmland, and you will be rewarded.", "eliminate negative state for friends", "hint:visit your friends' territory and help them killing worms, weeding,repairing or cleaning"]], ["checknum", 1], ["lev", 9], ["reward", [1200, 40, 0]], ["type", 6], ["id", 35]]),
dict([["req", "updatebuilding"], ["des", ["Upgrade bakery", "Advanced building will largely encourage the development of your territory!", "upgrade a normal bakery"]], ["checknum", 1], ["lev", 9], ["pair", ["ground_id", 301]], ["reward", [1000, 40, 0]], ["type", 0], ["id", 36]]),
dict([["req", "money"], ["checknum", 700], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.", "collect taxes from bakery Lv. 2"]], ["lev", 9], ["pair", ["bid", 1]], ["reward", [1500, 60, 0]], ["type", 1], ["id", 37]]),
dict([["req", "build"], ["des", ["Build Farmlands", "Crystal farmland can increase crop's yield.", "build crystal farmlands"]], ["checknum", 2], ["lev", 10], ["pair", ["ground_id", 2]], ["reward", [2000, 100, 1]], ["type", 0], ["id", 38]]),
dict([["req", "build"], ["checknum", 1], ["des", ["Build lumber mill", "Wood and stone can be used to upgrade your buildings and produce weapons.", "build a lumber mill"]], ["lev", 10], ["pair", ["ground_id", 5]], ["reward", [1500, 50, 0]], ["type", 0], ["id", 39]]),
dict([["req", "wood"], ["des", ["Collect maple woods", "Wood and stone can be used to upgrade your buildings and produce weapons.", "collect maple woods"]], ["checknum", 30], ["lev", 10], ["pair", ["objid", 0]], ["reward", [1500, 60, 0]], ["type", 1], ["id", 40]]),
dict([["checknum", 5], ["des", ["Invite friends", "More friends will bring more visit rewards...", "invite your friends to join", "hint:enter your friends' list and invite your friends,you can also click menu to invite"]], ["lev", 10], ["reward", [3000, 70, 1]], ["type", 4], ["id", 41]]),
dict([["req", "completely"], ["des", ["Charge", "You can get bonus rewards for recharging your caesars.", "charge and gain the rewards"]], ["checknum", 1], ["lev", 10], ["pair", []], ["reward", [1000, 200, 1]], ["type", 0], ["id", 42]]),
dict([["req", "build"], ["des", ["Build brick roads", "Decoration can increase population and magic capacity.", "build brick roads"]], ["checknum", 6], ["lev", 11], ["pair", ["ground_id", 500]], ["reward", [600, 30, 0]], ["type", 0], ["id", 43]]),
dict([["req", "build"], ["des", ["Build parterres", "Decoration can increase population and magic capacity.", "build parterres"]], ["checknum", 6], ["lev", 11], ["pair", ["ground_id", 505]], ["reward", [600, 60, 0]], ["type", 0], ["id", 44]]),
dict([["req", "build"], ["des", ["Build golden roads", "Decoration can increase population and magic capacity.", "build golden roads"]], ["checknum", 3], ["lev", 11], ["pair", ["ground_id", 504]], ["reward", [1800, 50, 1]], ["type", 0], ["id", 45]]),
dict([["req", "build"], ["des", ["Build villa", "House can recruit people. People can build builings, trained to soldiers.", "build a villa"]], ["checknum", 2], ["lev", 11], ["pair", ["ground_id", 124]], ["reward", [1200, 30, 0]], ["type", 0], ["id", 46]]),
dict([["req", "build"], ["checknum", 1], ["des", ["Build vine lamp", "Decoration can increase population and magic capacity.", "build vine lamp"]], ["lev", 11], ["pair", ["ground_id", 512]], ["reward", [1200, 30, 1]], ["type", 0], ["id", 47]]),
dict([["req", "build"], ["des", ["Build magic well", "Decoration can increase population and magic capacity.", "build a magic well"]], ["checknum", 1], ["lev", 11], ["pair", ["ground_id", 520]], ["reward", [1200, 90, 1]], ["type", 0], ["id", 48]]),
dict([["req", "planting"], ["des", ["Plant eggplants", "Special farmland,crops,harvest goddess can increase yield.", "plant eggplants"]], ["checknum", 6], ["lev", 11], ["pair", ["object_id", 4, "type", 0]], ["reward", [1300, 100, 0]], ["type", 0], ["id", 49]]),
dict([["req", "planting"], ["des", ["Plant tomatoes", "Special farmland,crops,harvest goddess can increase yield.", "plant tomatoes"]], ["checknum", 6], ["lev", 11], ["pair", ["object_id", 5, "type", 0]], ["reward", [1300, 50, 1]], ["type", 0], ["id", 50]]),
dict([["req", "build"], ["checknum", 1], ["des", ["Summon Goddess", "God statues's magic will bring incredible function.", "summon liberty Goddess"]], ["lev", 12], ["pair", ["ground_id", 401]], ["reward", [1500, 50, 0]], ["type", 0], ["id", 51]]),
dict([["req", "godbless"], ["checknum", 1], ["des", ["Perform magic", "God statues's magic will bring incredible function.", "liberty Goddess performs magic"]], ["lev", 12], ["pair", ["godtype", 1]], ["reward", [1100, 50, 1]], ["type", 0], ["id", 52]]),
dict([["req", "person"], ["des", ["Increase population", "House can recruit people. People can build builings, trained to soldiers.", "increase your population"]], ["checknum", 100], ["lev", 12], ["pair", []], ["reward", [1500, 100, 0]], ["type", 1], ["id", 53]]),
dict([["req", "money"], ["checknum", 3000], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.!", "collect taxes from restaurant Lv. 1"]], ["lev", 12], ["pair", ["bid", 9]], ["reward", [1500, 70, 0]], ["type", 1], ["id", 54]]),
dict([["req", "build"], ["des", ["Build cavalry camp", "You can train soldiers to attack other players, kill monsters, etc.", "build a normal cavalry camp"]], ["checknum", 1], ["lev", 13], ["pair", ["ground_id", 203]], ["reward", [1800, 40, 0]], ["type", 0], ["id", 56]]),
dict([["req", "soldiers"], ["checknum", 40], ["des", ["Train cavalries", "You can train soldiers to attack other players, kill monsters, etc.", "train cavalry Lv. 1"]], ["lev", 13], ["pair", ["btype", 1, "objtype", 0]], ["reward", [2000, 50, 0]], ["type", 1], ["id", 57]]),
dict([["req", "planting"], ["des", ["Plant green pepper", "Special farmland,crops,harvest goddess can increase yield.", "plant green pepper"]], ["checknum", 6], ["lev", 13], ["pair", ["object_id", 6, "type", 0]], ["reward", [1800, 30, 0]], ["type", 0], ["id", 59]]),
dict([["req", "godbless"], ["des", ["Perform magic", "God statues's magic will bring incredible function.", "Harvest Goddess performs magic"]], ["checknum", 1], ["lev", 13], ["pair", ["godtype", 0]], ["reward", [1200, 50, 1]], ["type", 0], ["id", 60]]),
dict([["req", "updatebuilding"], ["checknum", 1], ["des", ["Upgrade infantry camp", "Advanced building will largely encourage the development of your territory!", "upgrade an infantry camp Lv. 1"]], ["lev", 14], ["pair", ["ground_id", 201]], ["reward", [1800, 80, 0]], ["type", 0], ["id", 62]]),
dict([["req", "soldiers"], ["des", ["Train infantry Lv. 2", "You can train soldiers to attack other players, kill monsters, etc.", "train infantries", "hint:click the intermediate infantry camp and choose the infantry icon"]], ["checknum", 60], ["lev", 14], ["pair", ["btype", 0, "objtype", 1]], ["reward", [3000, 90, 0]], ["type", 1], ["id", 63]]),
dict([["req", "money"], ["checknum", 6000], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.", "collect taxes from book store Lv. 1"]], ["lev", 14], ["pair", ["bid", 15]], ["reward", [1800, 150, 1]], ["type", 1], ["id", 65]]),
dict([["req", "updatebuilding"], ["des", ["Upgrade Magical Manor", "Advanced building will largely encourage the development of your territory!", "upgrade a Magical Manor"]], ["checknum", 1], ["lev", 14], ["pair", ["ground_id", 161]], ["reward", [2000, 200, 1]], ["type", 0], ["id", 66]]),
dict([["req", "build"], ["checknum", 1], ["des", ["Build mansion", "House can recruit people. People can build builings, trained to soldiers.", "build a mansion"]], ["lev", 15], ["pair", ["ground_id", 136]], ["reward", [1500, 60, 0]], ["type", 0], ["id", 67]]),
dict([["req", "build"], ["des", ["Build well", "Decoration can increase population and magic capacity.", "build a ordinary well"]], ["checknum", 1], ["lev", 15], ["pair", ["ground_id", 519]], ["reward", [300, 15, 0]], ["type", 0], ["id", 68]]),
dict([["req", "wood"], ["des", ["Collect willow woods", "Wood and stone can be used to upgrade your buildings and produce weapons.", "collect willow woods"]], ["checknum", 130], ["lev", 15], ["pair", ["objid", 1]], ["reward", [2100, 180, 0]], ["type", 1], ["id", 69]]),
dict([["req", "money"], ["checknum", 5000], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.!", "collect taxes from clinic Lv. 1"]], ["lev", 15], ["pair", ["bid", 12]], ["reward", [1500, 100, 0]], ["type", 1], ["id", 70]]),
dict([["req", "money"], ["checknum", 3500], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.!", "collect taxes from butcher shop Lv. 2"]], ["lev", 15], ["pair", ["bid", 7]], ["reward", [2500, 250, 1]], ["type", 1], ["id", 71]]),
dict([["req", "planting"], ["des", ["Plant pumpkins", "Special farmland,crops,harvest goddess can increase yield.", "plant pumpkins"]], ["checknum", 6], ["lev", 16], ["pair", ["object_id", 7, "type", 0]], ["reward", [1800, 96, 0]], ["type", 0], ["id", 72]]),
dict([["req", "build"], ["checknum", 1], ["des", ["Summon god", "God statues's magic will bring incredible function.", "summon Mars"]], ["lev", 16], ["pair", ["ground_id", 403]], ["reward", [1600, 100, 0]], ["type", 0], ["id", 73]]),
dict([["req", "godbless"], ["des", ["Perform magic", "God statues's magic will bring incredible function.", "Mars performs magic"]], ["checknum", 1], ["lev", 16], ["pair", ["godtype", 3]], ["reward", [1300, 100, 1]], ["type", 0], ["id", 74]]),
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
dict([["req", "planting"], ["des", ["Plant peaches", "Special farmland,crops,harvest goddess can increase yield.", "plant peaches"]], ["checknum", 3], ["lev", 20], ["pair", ["object_id", 8, "type", 0]], ["reward", [3000, 150, 1]], ["type", 0], ["id", 90]]),
dict([["req", "build"], ["checknum", 2], ["des", ["Build manor", "House can recruit people. People can build builings, trained to soldiers.", "build manor Lv. 2"]], ["lev", 20], ["pair", ["ground_id", 148]], ["reward", [2100, 100, 0]], ["type", 0], ["id", 91]]),
dict([["req", "build"], ["checknum", 1], ["des", ["Summon Goddess", "God statues's magic will bring incredible function.", "summon wealth god"]], ["lev", 20], ["pair", ["ground_id", 402]], ["reward", [2300, 130, 0]], ["type", 0], ["id", 92]]),
dict([["req", "godbless"], ["des", ["Perform magic", "God statues's magic will bring incredible function.", "perform wealth god's magic"]], ["checknum", 1], ["lev", 20], ["pair", ["godtype", 2]], ["reward", [1400, 100, 1]], ["type", 0], ["id", 93]]),
dict([["req", "money"], ["checknum", 3500], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.!", "collect taxes from clothing shop Lv. 1"]], ["lev", 21], ["pair", ["bid", 18]], ["reward", [2600, 150, 0]], ["type", 1], ["id", 94]]),
dict([["req", "wood"], ["des", ["Collect sycamore woods", "Wood and stone can be used to upgrade your buildings and produce weapons.", "collect sycamore woods"]], ["checknum", 100], ["lev", 21], ["pair", ["objid", 3]], ["reward", [2700, 180, 0]], ["type", 1], ["id", 95]]),
dict([["req", "expand"], ["des", ["Expand territory", "You can build more buildings by expanding land!", "expand your territory"]], ["checknum", 1], ["lev", 21], ["pair", []], ["reward", [3000, 300, 0]], ["type", 0], ["id", 96]]),
dict([["req", "money"], ["checknum", 6000], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.!", "collect taxes from butcher shop Lv. 3"]], ["lev", 21], ["pair", ["bid", 8]], ["reward", [4000, 300, 1]], ["type", 1], ["id", 97]]),
dict([["req", "stone"], ["checknum", 130], ["des", ["Collect basalt", "Wood and stone can be used to upgrade your buildings and produce weapons.", "collect basalt"]], ["lev", 22], ["pair", ["objid", 1]], ["reward", [2800, 210, 0]], ["type", 1], ["id", 98]]),
dict([["req", "money"], ["checknum", 10000], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.!", "collect taxes from book store Lv. 2"]], ["lev", 22], ["pair", ["bid", 16]], ["reward", [4000, 280, 1]], ["type", 1], ["id", 99]]),
dict([["req", "planting"], ["des", ["Plant watermelon", "Special farmland,crops,harvest goddess can increase yield.", "plant watermelon"]], ["checknum", 6], ["lev", 23], ["pair", ["object_id", 9, "type", 0]], ["reward", [2900, 240, 0]], ["type", 0], ["id", 101]]),
dict([["req", "money"], ["checknum", 13000], ["des", ["Collect taxes", "You can collect more taxes from advanced stores.!", "collect taxes from casino Lv. 1"]], ["lev", 24], ["pair", ["bid", 24]], ["reward", [4500, 350, 1]], ["type", 1], ["id", 103]]),
dict([["req", "stone"], ["des", ["Collect limestone", "Wood and stone can be used to upgrade your buildings and produce weapons.", "collect limestone"]], ["checknum", 200], ["lev", 24], ["pair", ["objid", 2]], ["reward", [4500, 350, 1]], ["type", 1], ["id", 104]]),
dict([["req", "build"], ["des", ["Building maple", "Decoration can increase population and magic capacity.", "building maple"]], ["checknum", 3], ["lev", 25], ["pair", ["ground_id", 535]], ["reward", [1400, 90, 1]], ["type", 0], ["id", 106]]),
dict([["req", "planting"], ["des", ["Plant strawberry", "Special farmland,crops,harvest goddess can increase yield.", "plant strawberry"]], ["checknum", 6], ["lev", 25], ["pair", ["object_id", 11, "type", 0]], ["reward", [5400, 420, 1]], ["type", 0], ["id", 107]]),
dict([["req", "wood"], ["des", ["Collect oak", "Wood and stone can be used to upgrade your buildings and produce weapons.", "collect oak woods"]], ["checknum", 300], ["lev", 25], ["pair", ["objid", 5]], ["reward", [5700, 420, 0]], ["type", 1], ["id", 108]]),
dict([["req", "planting"], ["des", ["Plant mango", "Special farmland,crops,harvest goddess can increase yield.", "plant mango"]], ["checknum", 6], ["lev", 26], ["pair", ["object_id", 10, "type", 0]], ["reward", [3300, 240, 1]], ["type", 0], ["id", 110]]),
dict([["req", "updatebuilding"], ["des", ["Upgrade statue", "The magic power of god or Goddess will be stronger!", "upgrade a silver statue of god or Goddess"]], ["checknum", 1], ["lev", 26], ["pair", ["ground_id", 408]], ["reward", [4000, 450, 1]], ["type", 0], ["id", 111]]),
dict([["req", "updatebuilding"], ["checknum", 1], ["des", ["Upgrade Magical Manor", "Advanced building will largely encourage the development of your territory!", "upgrade a Magical Manor Lv. 2"]], ["lev", 26], ["pair", ["ground_id", 162]], ["reward", [5000, 450, 0]], ["type", 0], ["id", 112]]),
dict([["req", "stone"], ["des", ["Collect granite", "Wood and stone can be used to upgrade your buildings and produce weapons.!", "collect granite"]], ["checknum", 100], ["lev", 27], ["pair", ["objid", 3]], ["reward", [3000, 300, 0]], ["type", 1], ["id", 113]]),
dict([["req", "updatebuilding"], ["checknum", 1], ["des", ["Upgrade cavalry camp", "Advanced building will largely encourage the development of your territory!", "upgrade a cavalry camp Lv. 2"]], ["lev", 27], ["pair", ["ground_id", 205]], ["reward", [4000, 480, 1]], ["type", 0], ["id", 114]]),
dict([["req", "planting"], ["des", ["Plant corns", "Special farmland,crops,harvest goddess can increase yield.", "plant corns on the crystal farmland"]], ["checknum", 6], ["lev", 27], ["pair", ["object_id", 2, "type", 0, "bid", 2]], ["reward", [4500, 500, 1]], ["type", 0], ["id", 115]]),
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
["Reach to Lv. 6 to unlock war mode",
"Once you have activated War Mode, you can't quit it, please read the HELP documentation for more information.",
"Congrats, you won!",
"Sorry, you were defeated.",
"[ENAME] is too powerful, strengthen your military power and fight another day!",
"Congrats! you have defeated [ENAME],go on fighting and gain glory!",
"How to add power",
"[USERNAME] has entered a new map. Come on; Let's build our own miracle empire with [USERNAME]!",
"[USERNAME]has upgraded to [NOBNAME], Come on; Let's build our own miracle empire with [USERNAME]!",
"[USERNAME] has upgraded the territory, Come on; Let's build our own miracle empire with [USERNAME]!",
"[USERNAME] has defeated the invaders, Come on; Let's build our own miracle empire with [USERNAME]!",
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
"http://getmugua.com",
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

<<<<<<< HEAD
=======
]);



const staticString = [
"你需要升到6级才能开启战争模式",
"开启战争模式之后暂时就不能退出咯，请查看帮助文档",
"恭喜你抵挡住了[ENAME]的攻势，保卫了领地不被侵犯！",
"[ENAME]兵力过于强大，你的军队不幸战败，快去加强你的军事力量吧！",
"[ENAME]兵力过于强大，回去厉兵秣马，来日再战！",
"恭喜你战胜了[ENAME]，你离帝王宝座又近了一步！",
"如何提高战斗力",
"[USERNAME]进入新的地图啦，赶快加入与[USERNAME]一起打造属于自己的奇迹帝国吧！",
"[USERNAME]升级为[NOBNAME]啦，赶快加入与[USERNAME]一起打造属于自己的奇迹帝国吧！",
"[USERNAME]的领地升级啦，赶快加入与[USERNAME]一起打造属于自己的奇迹帝国吧！",
"[USERNAME]成功战胜侵略者，赶快加入与[USERNAME]一起打造属于自己的奇迹帝国吧！",
"[USERNAME]被YYYY[ENAME]打败了，赶快加入帮助[USERNAME]复仇吧！",
"[USERNAME]的大军被击退，赶快加入与[USERNAME]一起侵略其他领地吧！",
"[USERNAME]战胜了[ENAME]，赶快加入与[USERNAME]一起打造属于自己的奇迹帝国吧！",
"你需要升到15级才能使用一键操作",
"你没有空闲的农田，不能使用一键操作",
"你的农作物正在生长，无法一键收获",
"[WHO]的[TYPE]数需要达到[NUM]才能升到下一等级。该卡每升一级将会增加1点魔法上限！",
"[WHO]还需要战胜[NUM]个用户才能升级到[CARD]，该卡每升级一级将会增加一点魔法值上限。",
"你的店铺正在工作，无法一键收税",
"恭喜你获得了该紫金卡片，你的魔法值上限增加了两点",
"恭喜，嫦娥卡升到紫金级别，魔法值上限增加了1",
"把丰收之神升到紫金级别，该卡每升一级将会增加一点魔法值上限。",
"把财富之神升到紫金级别，该卡每升一级将会增加一点魔法值上限。",
"抱歉，你已经访问过所有好友了！",
"每天宠物前100次训练才会增加1点战斗力哦！",
"你一键访问了[NUM]个好友，获得了[MONEY]银币奖励",
"升级友谊之神到紫金级别",
"还差[NUM]个好友",
"还需要帮助好友打开[NUM]个宝箱",
"还需要帮助好友喂养[NUM]次宠物",
"需要升到[NUM]级",
"你增加魔法值上限啦！",
"[NAME]晒出了自己领地的截图，大家快来围观吧！",
"",
"http://getmugua.com",
"每天自己只能喂养一次，好友可以帮忙继续喂养。假如当天自己或好友都没喂养，成长点会下降哦！",
"该宠物蛋即将孵化，等孵化之后才能继续喂养，感谢帮忙^_^",
"每天你只能帮同一个好友喂养一次^_^",
"[NAME]的宠物已经有[NUM]个好友喂养过了，谢谢帮忙^_^"];
>>>>>>> 3c3ef9a9c6dfff975511869da9ec8aca34b3cd85

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

<<<<<<< HEAD
const ManaChargeTime = 300000;
const AddDefCae = 25;
const AddDefCoin = 50;
const AddDefFood = 5;

const GenVisMana = 25;
const AccVisMana = 33;

const OneKeyMana = 10;
const ChargeMana = 5;

const CallDragon = 1000;
const RateURL = "http://market.android.com/details?id=com.papaya.wonderempire1_cn&feature=search_result";

=======
const Tasks = 
[
dict([["req", "build"],["des", ["开垦农田","粮食很重要，凯撒农作物、特殊农田、丰收女神都可以大幅度提高粮食产量！","开垦普通农田"]],["checknum", 1],["lev", 3],["pair", ["ground_id", 1]],["reward", [200, 5, 0]],["type", 0],["id", 0]]),
dict([["req", "planting"],["des", ["种植小麦","粮食很重要，凯撒农作物、特殊农田、丰收女神都可以大幅度提高粮食产量！","种植小麦","提示：先点击空闲农田，再点击播种图标，选择小麦"]],["checknum", 3],["lev", 3],["pair", ["object_id", 0, "type", 0]],["reward", [300, 15, 0]],["type", 0],["id", 1]]),
dict([["req", "money"],["des", ["面包房收税","银币是不可或缺的资源，高级店铺可以收集更多的银币！","面包房收税"]],["checknum", 100],["lev", 3],["pair", ["bid", 0]],["reward", [200, 15, 0]],["type", 1],["id", 2]]),
dict([["req", "dialog-castleinfo"],["des", ["查看经营信息","点击城堡可以查看到许多信息。同时也进行城堡升级、增加城堡防御力","查看经营信息","提示：点击城堡查看经营页面信息"]],["checknum", 1],["lev", 3],["reward", [100, 5, 0]],["type", 2],["id", 3]]),
dict([["req", "dialog-help"],["des", ["查看帮助文档","帮助文档有详细的关于游戏的一些设置资料，可以帮助大家更好地畅游游戏","查看帮助文档","提示：先点击menu键（或下菜单设置按钮），再点击帮助选项"]],["checknum", 1],["lev", 3],["reward", [100, 5, 0]],["type", 2],["id", 4]]),
dict([["req", "soldiers"],["des", ["训练民兵","训练士兵可以攻打其他玩家、攻击怪兽、探险...","训练民兵","提示：先点击空闲的步兵训练营，再选择民兵选项"]],["checknum", 30],["lev", 4],["pair", ["btype", 0, "objtype", 0]],["reward", [500, 20, 0]],["type", 1],["id", 5]]),
dict([["req", "defeatmonster"],["des", ["消灭怪物","消灭怪兽会获得特殊物品等奖励，还能激活怪兽荣誉卡片哦！","消灭怪物","提示：先点击地图图标，再选择怪兽攻打"]],["checknum", 1],["lev", 4],["pair", []],["reward", [500, 20, 0]],["type", 0],["id", 6]]),
dict([["req", "expand"],["des", ["扩地","扩地之后可以建造更多的建筑！","扩地","提示：点击建造按钮，进入建造大对话框，再点击最右边的扩地按钮，选择扩地的方式"]],["checknum", 1],["lev", 4],["pair", []],["reward", [600, 20, 0]],["type", 0],["id", 7]]),
dict([["req", "getfriend"],["des", ["访问凯撒的领地","参观凯撒的领地，也许你会有意想不到的收获哦！","访问凯撒的领地","提示：先点击好友列表，再点击凯撒图像"]],["checknum", 1],["lev", 5],["pair", ["otherid", 0]],["reward", [150, 5, 0]],["type", 0],["id", 8]]),
dict([["req", "dialog-circle"],["des", ["加好友","进入圈子可以加好友、反馈bug、查看游戏最新更新信息！","去圈子加好友","提示：先点击好友列表，再点击圈子图标，点击\"成为粉丝\"，再次点击该按钮，点击查看所有粉丝添加好友"]],["checknum", 1],["lev", 5],["reward", [700, 10, 0]],["type", 2],["id", 9]]),
dict([["req", "selectgift"],["des", ["赠送好友礼物","你可以免费赠送好友一个特殊物品！","赠送好友礼物","提示：前往好友页面，点击左侧礼物图标，选择一个礼物赠送给好友"]],["checknum", 1],["lev", 5],["pair", ["askorgive", 0]],["reward", [200, 10]],["type", 0],["id", 10]]),
dict([["req", "selectgift"],["des", ["向好友索要礼物","向好友索要礼物，好友可以免费赠送你特殊物品","向好友索要礼物","提示：前往好友页面，点击右侧礼物图标，选择一个礼物向好友索要"]],["checknum", 1],["lev", 5],["pair", ["askorgive", 1]],["reward", [300, 10, 0]],["type", 0],["id", 11]]),
dict([["req", "completeopen"],["des", ["打开宝箱","好友能帮你打开神秘宝箱哦！请求他们帮你打开吧，。","打开宝箱","提示：左侧有一个宝箱，点击宝箱，可以使用凯撒币完成，也可以请求好友帮忙"]],["checknum", 1],["lev", 5],["pair", []],["reward", [500, 20, 0]],["type", 0],["id", 12]]),
dict([["des", ["打分","如果你喜欢奇迹帝国，去安卓市场打个五分吧，谢谢^_^","前往Androidmarket打分"]],["checknum", 1],["lev", 5],["reward", [-10, 30, 0]],["type", 3],["id", 13]]),
dict([["req", "updatebuilding"],["des", ["升级农舍","高级建筑会大大加快领地的发展！","升级普通农舍","提示：先点击农舍，再点击升级图标"]],["checknum", 1],["lev", 6],["pair", ["ground_id", 101]],["reward", [500, 20, 0]],["type", 0],["id", 14]]),
dict([["req", "person"],["des", ["招募人口","民居可以招募人口，人口可以用来建造建筑、训练成士兵！","招募人口","提示：先点击空闲民居，再点击招募图标"]],["checknum", 50],["lev", 6],["pair", []],["reward", [500, 30, 0]],["type", 1],["id", 15]]),
dict([["req", "build"],["des", ["建造民宅","民居可以招募人口，人口可以用来建造建筑、训练成士兵！","建造普通民宅"]],["checknum", 2],["lev", 6],["pair", ["ground_id", 112]],["reward", [400, 25, 0]],["type", 0],["id", 16]]),
dict([["req", "planting"],["des", ["种植胡萝卜","粮食很重要，凯撒农作物、特殊农田、丰收女神都可以大幅度提高粮食产量！","种植胡萝卜"]],["checknum", 6],["lev", 6],["pair", ["object_id", 1, "type", 0]],["reward", [600, 30, 0]],["type", 0],["id", 17]]),
dict([["req", "money"],["des", ["肉铺收税","银币是不可或缺的资源，高级店铺可以收集更多的银币！","普通肉铺收税"]],["checknum", 1500],["lev", 6],["pair", ["bid", 6]],["reward", [800, 80, 1]],["type", 1],["id", 18]]),
dict([["req", "helpopen"],["des", ["帮助好友打开宝箱","帮助好友打开宝箱你会获得丰厚的回报","帮助好友打开宝箱","提示：前往好友页面，点击宝箱图标，点击帮助"]],["checknum", 5],["lev", 7],["pair", []],["reward", [1000, 25, 0]],["type", 0],["id", 25]]),
dict([["des", ["邀请好友","访问好友有银币奖励，多加些好友吧！","邀请好友","提示：先点击好友列表，邀请还不是游戏用户的木瓜好友，也可以点击最后面的问号图标邀请好友"]],["checknum", 3],["lev", 7],["reward", [2000, 50, 1]],["type", 4],["id", 26]]),
dict([["req", "planting"],["des", ["种植玉米","粮食很重要，凯撒农作物、特殊农田、丰收女神都可以大幅度提高粮食产量！","种植玉米"]],["checknum", 4],["lev", 8],["pair", ["object_id", 2, "type", 0]],["reward", [1200, 48, 1]],["type", 0],["id", 27]]),
dict([["req", "build"],["des", ["召唤丰收之神","神像可以施展魔法，部分神像升到顶级之后可以一键操作","召唤丰收之神","提示：先点击丰收之神，再点击神迹图标施展神迹"]],["checknum", 1],["lev", 8],["pair", ["ground_id", 400]],["reward", [1000, 40, 0]],["type", 0],["id", 28]]),
dict([["req", "godbless"],["des", ["施展神迹","施展神迹可以大幅度增加相关建筑的产值！"]],["checknum", 1],["lev", 8],["pair", ["godtype", 0]],["reward", [1000, 30, 1]],["type", 0],["id", 29]]),
dict([["req", "planting"],["des", ["种植菠萝","粮食很重要，凯撒农作物、特殊农田、丰收女神都可以大幅度提高粮食产量！","种植菠萝"]],["checknum", 6],["lev", 8],["pair", ["object_id", 3, "type", 0]],["reward", [1200, 36, 0]],["type", 0],["id", 30]]),
dict([["req", "build"],["des", ["建造神奇屋","民居可以招募人口，人口可以用来建造建筑、训练成士兵！","建造普通神奇屋"]],["checknum", 1],["lev", 8],["pair", ["ground_id", 160]],["reward", [1000, 50, 1]],["type", 0],["id", 31]]),
dict([["des", ["晒图","让大家欣赏欣赏你的领地吧！","截图并分享","提示：先点击menu键（或下菜单设置按钮），再点击截图"]],["checknum", 1],["lev", 8],["reward", [800, 30, 0]],["type", 5],["id", 32]]),
dict([["des", ["帮助好友","帮助好友清除负面状态会有奖励哦！","帮助好友清除负面状态","提示：前往好友页面，帮助好友农田除虫、除草或是帮助好友建筑维修、打扫"]],["checknum", 1],["lev", 9],["reward", [1200, 40, 0]],["type", 6],["id", 35]]),
dict([["req", "updatebuilding"],["des", ["升级面包房","高级建筑会大大加快领地的发展！","升级普通面包房"]],["checknum", 1],["lev", 9],["pair", ["ground_id", 301]],["reward", [1000, 40, 0]],["type", 0],["id", 36]]),
dict([["req", "money"],["des", ["中级面包房收税","银币是不可或缺的资源，高级店铺可以收集更多的银币！","中级面包房收税"]],["checknum", 700],["lev", 9],["pair", ["bid", 1]],["reward", [1500, 60, 0]],["type", 1],["id", 37]]),
dict([["req", "build"],["des", ["开垦水晶农田","特殊农田可以大大提高产量！","开垦水晶农田"]],["checknum", 2],["lev", 10],["pair", ["ground_id", 2]],["reward", [2000, 100, 1]],["type", 0],["id", 38]]),
dict([["req", "build"],["des", ["建造伐木场","木材和石材用户建筑升级，投石车等物品的建造","建造普通锯木厂"]],["checknum", 1],["lev", 10],["pair", ["ground_id", 5]],["reward", [1500, 50, 0]],["type", 0],["id", 39]]),
dict([["req", "wood"],["des", ["采集枫树","木材和石材用户建筑升级，投石车等物品的建造","采集枫树木材"]],["checknum", 30],["lev", 10],["pair", ["objid", 0]],["reward", [1500, 60, 0]],["type", 1],["id", 40]]),
dict([["des", ["邀请好友","访问好友有银币奖励，多加些好友吧！","邀请好友","提示：进入好友列表，向有邀请提示的好友进行邀请"]],["checknum", 5],["lev", 10],["reward", [3000, 70, 1]],["type", 4],["id", 41]]),
dict([["req", "completepay"],["des", ["充值送礼","现在充值将会赠送凯撒币啦，还等什么？","充值送礼"]],["checknum", 1],["lev", 10],["pair", []],["reward", [1000, 200, 1]],["type", 0],["id", 42]]),
dict([["req", "build"],["des", ["建造砖石路","装饰可以增加人口上限，部分装饰还可以增加魔法值上限！","建造砖石路"]],["checknum", 6],["lev", 11],["pair", ["ground_id", 500]],["reward", [600, 30, 0]],["type", 0],["id", 43]]),
dict([["req", "build"],["des", ["建造花坛","装饰可以增加人口上限，部分装饰还可以增加魔法值上限！","建造花坛"]],["checknum", 6],["lev", 11],["pair", ["ground_id", 505]],["reward", [600, 60, 0]],["type", 0],["id", 44]]),
dict([["req", "build"],["des", ["建造黄金路","装饰可以增加人口上限，部分装饰还可以增加魔法值上限！","建造黄金路"]],["checknum", 3],["lev", 11],["pair", ["ground_id", 504]],["reward", [1800, 50, 1]],["type", 0],["id", 45]]),
dict([["req", "build"],["des", ["建造别墅","民居可以招募人口，人口可以用来建造建筑、训练成士兵！","建造别墅"]],["checknum", 2],["lev", 11],["pair", ["ground_id", 124]],["reward", [1200, 30, 0]],["type", 0],["id", 46]]),
dict([["req", "build"],["des", ["建造精灵灯","装饰可以增加人口上限，部分装饰还可以增加魔法值上限！","建造精灵灯"]],["checknum", 1],["lev", 11],["pair", ["ground_id", 512]],["reward", [1200, 30, 1]],["type", 0],["id", 47]]),
dict([["req", "build"],["des", ["建造魔法水井","装饰可以增加人口上限，部分装饰还可以增加魔法值上限！","建造魔法水井"]],["checknum", 1],["lev", 11],["pair", ["ground_id", 520]],["reward", [1200, 90, 1]],["type", 0],["id", 48]]),
dict([["req", "planting"],["des", ["种植茄子","粮食很重要，凯撒农作物、特殊农田、丰收女神都可以大幅度提高粮食产量！","种植茄子"]],["checknum", 6],["lev", 11],["pair", ["object_id", 4, "type", 0]],["reward", [1300, 100, 0]],["type", 0],["id", 49]]),
dict([["req", "planting"],["des", ["种植西红柿","粮食很重要，凯撒农作物、特殊农田、丰收女神都可以大幅度提高粮食产量！","种植西红柿"]],["checknum", 6],["lev", 11],["pair", ["object_id", 5, "type", 0]],["reward", [1300, 50, 1]],["type", 0],["id", 50]]),
dict([["req", "build"],["des", ["召唤人口之神","神像可以施展魔法，部分神像升到顶级之后可以一键操作","召唤人口之神"]],["checknum", 1],["lev", 12],["pair", ["ground_id", 401]],["reward", [1500, 50, 0]],["type", 0],["id", 51]]),
dict([["req", "godbless"],["des", ["施展神迹","神迹大大可以提高相关建筑产量！","人口之神施展神迹"]],["checknum", 1],["lev", 12],["pair", ["godtype", 1]],["reward", [1100, 50, 1]],["type", 0],["id", 52]]),
dict([["req", "person"],["des", ["招募人口","民居可以招募人口，人口可以用来建造建筑、训练成士兵！","招募人口"]],["checknum", 100],["lev", 12],["pair", []],["reward", [1500, 100, 0]],["type", 1],["id", 53]]),
dict([["req", "money"],["des", ["餐厅收税","银币是不可或缺的资源，高级店铺可以收集更多的银币！","从普通餐厅收税"]],["checknum", 3000],["lev", 12],["pair", ["bid", 9]],["reward", [1500, 70, 0]],["type", 1],["id", 54]]),
dict([["req", "build"],["des", ["建造骑兵训练营","落后就要挨打，建造士兵训练营来训练士兵吧！","建造普通骑兵训练营"]],["checknum", 1],["lev", 13],["pair", ["ground_id", 203]],["reward", [1800, 40, 0]],["type", 0],["id", 56]]),
dict([["req", "soldiers"],["des", ["训练骑兵","训练士兵可以攻打其他玩家、攻击怪兽、探险...","训练轻骑兵"]],["checknum", 40],["lev", 13],["pair", ["btype", 1, "objtype", 0]],["reward", [2000, 50, 0]],["type", 1],["id", 57]]),
dict([["req", "planting"],["des", ["种植青椒","粮食很重要，凯撒农作物、特殊农田、丰收女神都可以大幅度提高粮食产量！","种植青椒"]],["checknum", 6],["lev", 13],["pair", ["object_id", 6, "type", 0]],["reward", [1800, 30, 0]],["type", 0],["id", 59]]),
dict([["req", "godbless"],["des", ["施展神迹","施展神迹可以大幅度增加相关建筑的产值！"]],["checknum", 1],["lev", 13],["pair", ["godtype", 0]],["reward", [1200, 50, 1]],["type", 0],["id", 60]]),
dict([["req", "updatebuilding"],["des", ["升级步兵训练营","高级建筑会大大加快领地的发展！","升级普通步兵训练营"]],["checknum", 1],["lev", 14],["pair", ["ground_id", 201]],["reward", [1800, 80, 0]],["type", 0],["id", 62]]),
dict([["req", "soldiers"],["des", ["训练步兵","训练士兵可以攻打其他玩家、攻击怪兽、探险...","训练步兵","提示：先点击中级步兵训练营，再选择步兵图标"]],["checknum", 60],["lev", 14],["pair", ["btype", 0, "objtype", 1]],["reward", [3000, 90, 0]],["type", 1],["id", 63]]),
dict([["req", "money"],["des", ["书店收税","银币是不可或缺的资源，高级店铺可以收集更多的银币！","从普通书店收税"]],["checknum", 6000],["lev", 14],["pair", ["bid", 15]],["reward", [1800, 150, 1]],["type", 1],["id", 65]]),
dict([["req", "updatebuilding"],["des", ["升级神奇屋","高级建筑会大大加快领地的发展！","升级神奇屋"]],["checknum", 1],["lev", 14],["pair", ["ground_id", 161]],["reward", [2000, 200, 1]],["type", 0],["id", 66]]),
dict([["req", "build"],["des", ["建造豪宅","民居可以招募人口，人口可以用来建造建筑、训练成士兵！","建造豪宅"]],["checknum", 1],["lev", 15],["pair", ["ground_id", 136]],["reward", [1500, 60, 0]],["type", 0],["id", 67]]),
dict([["req", "build"],["des", ["建造普通水井","装饰可以增加人口上限，部分装饰还可以增加魔法值上限！","建造普通水井"]],["checknum", 1],["lev", 15],["pair", ["ground_id", 519]],["reward", [300, 15, 0]],["type", 0],["id", 68]]),
dict([["req", "wood"],["des", ["采集柳树","木材和石材用户建筑升级，投石车等物品的建造","采集柳树木材"]],["checknum", 130],["lev", 15],["pair", ["objid", 1]],["reward", [2100, 180, 0]],["type", 1],["id", 69]]),
dict([["req", "money"],["des", ["诊所收税","银币是不可或缺的资源，高级店铺可以收集更多的银币！","从普通诊所收税"]],["checknum", 5000],["lev", 15],["pair", ["bid", 12]],["reward", [1500, 100, 0]],["type", 1],["id", 70]]),
dict([["req", "money"],["des", ["中级肉铺收税","银币是不可或缺的资源，高级店铺可以收集更多的银币！","从中级肉铺收税"]],["checknum", 3500],["lev", 15],["pair", ["bid", 7]],["reward", [2500, 250, 1]],["type", 1],["id", 71]]),
dict([["req", "planting"],["des", ["种植南瓜","粮食很重要，凯撒农作物、特殊农田、丰收女神都可以大幅度提高粮食产量！","种植南瓜"]],["checknum", 6],["lev", 16],["pair", ["object_id", 7, "type", 0]],["reward", [1800, 96, 0]],["type", 0],["id", 72]]),
dict([["req", "build"],["des", ["召唤战争之神","神像可以施展魔法，部分神像升到顶级之后可以一键操作","召唤战争之神"]],["checknum", 1],["lev", 16],["pair", ["ground_id", 403]],["reward", [1600, 100, 0]],["type", 0],["id", 73]]),
dict([["req", "godbless"],["des", ["施展神迹","神迹大大可以提高相关建筑产量！","战争之神施展神迹"]],["checknum", 1],["lev", 16],["pair", ["godtype", 3]],["reward", [1300, 100, 1]],["type", 0],["id", 74]]),
dict([["req", "updatebuilding"],["des", ["升级神像","把神像升到更高级将会有更强的魔法效果！","升级任意一个神像"]],["checknum", 1],["lev", 16],["pair", ["ground_id", 404]],["reward", [4000, 250, 1]],["type", 0],["id", 75]]),
dict([["req", "build"],["des", ["建造花丛","装饰可以增加人口上限，部分装饰还可以增加魔法值上限！","建造花丛"]],["checknum", 3],["lev", 17],["pair", ["ground_id", 521]],["reward", [900, 45, 0]],["type", 0],["id", 76]]),
dict([["req", "build"],["des", ["建造樱花树","装饰可以增加人口上限，部分装饰还可以增加魔法值上限！","建造樱花树"]],["checknum", 3],["lev", 17],["pair", ["ground_id", 528]],["reward", [2100, 100, 1]],["type", 0],["id", 77]]),
dict([["req", "wood"],["des", ["采集白杨树","木材和石材用户建筑升级，投石车等物品的建造","采集白杨树木材"]],["checknum", 200],["lev", 17],["pair", ["objid", 2]],["reward", [4000, 300, 1]],["type", 1],["id", 78]]),
dict([["req", "updatebuilding"],["des", ["升级豪宅","高级建筑会大大加快领地的发展！","升级豪宅到最高级"]],["checknum", 1],["lev", 17],["pair", ["ground_id", 138]],["reward", [2500, 98, 0]],["type", 0],["id", 79]]),
dict([["des", ["邀请好友","访问好友有银币奖励，多加些好友吧！","邀请好友","提示：进入好友列表，向有邀请提示的好友进行邀请"]],["checknum", 3],["lev", 17],["reward", [5500, 155, 1]],["type", 4],["id", 80]]),
dict([["req", "build"],["des", ["建造采石厂","木材和石材用户建筑升级，投石车等物品的建造","建造普通采石厂"]],["checknum", 1],["lev", 18],["pair", ["ground_id", 6]],["reward", [2100, 56, 0]],["type", 0],["id", 81]]),
dict([["req", "stone"],["des", ["采集砾石","木材和石材用户建筑升级，投石车等物品的建造","采集砾石"]],["checknum", 50],["lev", 18],["pair", ["objid", 0]],["reward", [2400, 120, 0]],["type", 1],["id", 82]]),
dict([["req", "updatebuilding"],["des", ["升级步兵训练营","高级建筑会大大加快领地的发展！","升级中级步兵训练营"]],["checknum", 1],["lev", 18],["pair", ["ground_id", 202]],["reward", [3000, 150, 0]],["type", 0],["id", 83]]),
dict([["req", "build"],["des", ["建造忘忧草","装饰可以增加人口上限，部分装饰还可以增加魔法值上限！","建造忘忧草"]],["checknum", 4],["lev", 19],["pair", ["ground_id", 524]],["reward", [1200, 80, 0]],["type", 0],["id", 85]]),
dict([["req", "build"],["des", ["建造灌木","装饰可以增加人口上限，部分装饰还可以增加魔法值上限！","建造灌木"]],["checknum", 3],["lev", 19],["pair", ["ground_id", 532]],["reward", [900, 60, 0]],["type", 0],["id", 86]]),
dict([["req", "build"],["des", ["建造天使雕像","装饰可以增加人口上限，部分装饰还可以增加魔法值上限！","建造天使雕像"]],["checknum", 1],["lev", 19],["pair", ["ground_id", 538]],["reward", [2000, 100, 1]],["type", 0],["id", 87]]),
dict([["req", "updatebuilding"],["des", ["升级诊所","高级建筑会大大加快领地的发展！","升级普通诊所"]],["checknum", 1],["lev", 19],["pair", ["ground_id", 313]],["reward", [3000, 100, 0]],["type", 0],["id", 88]]),
dict([["req", "build"],["des", ["开垦宝石农田","特殊农田可以大大增加粮食产量！","开垦宝石农田"]],["checknum", 4],["lev", 20],["pair", ["ground_id", 3]],["reward", [4000, 200, 1]],["type", 0],["id", 89]]),
dict([["req", "planting"],["des", ["种植桃树","粮食很重要，凯撒农作物、特殊农田、丰收女神都可以大幅度提高粮食产量！","种植桃树"]],["checknum", 3],["lev", 20],["pair", ["object_id", 8, "type", 0]],["reward", [3000, 150, 1]],["type", 0],["id", 90]]),
dict([["req", "build"],["des", ["建造庄园","民居可以招募人口，人口可以用来建造建筑、训练成士兵！","建造普通庄园"]],["checknum", 2],["lev", 20],["pair", ["ground_id", 148]],["reward", [2100, 100, 0]],["type", 0],["id", 91]]),
dict([["req", "build"],["des", ["召唤财富之神","神像可以施展魔法，部分神像升到顶级之后可以一键操作","召唤财富之神"]],["checknum", 1],["lev", 20],["pair", ["ground_id", 402]],["reward", [2300, 130, 0]],["type", 0],["id", 92]]),
dict([["req", "godbless"],["des", ["施展神迹","神迹大大可以提高相关建筑产量！","施展神迹"]],["checknum", 1],["lev", 20],["pair", ["godtype", 2]],["reward", [1400, 100, 1]],["type", 0],["id", 93]]),
dict([["req", "money"],["des", ["服装店收税","银币是不可或缺的资源，高级店铺可以收集更多的银币！","从普通服装店收税"]],["checknum", 3500],["lev", 21],["pair", ["bid", 18]],["reward", [2600, 150, 0]],["type", 1],["id", 94]]),
dict([["req", "wood"],["des", ["采集梧桐","木材和石材用户建筑升级，投石车等物品的建造","采集梧桐木材"]],["checknum", 100],["lev", 21],["pair", ["objid", 3]],["reward", [2700, 180, 0]],["type", 1],["id", 95]]),
dict([["req", "expand"],["des", ["扩地","有更多的地，才有更多的房！","扩地"]],["checknum", 1],["lev", 21],["pair", []],["reward", [3000, 300, 0]],["type", 0],["id", 96]]),
dict([["req", "money"],["des", ["高级肉铺收税","银币是不可或缺的资源，高级店铺可以收集更多的银币！","从高级肉铺收税"]],["checknum", 6000],["lev", 21],["pair", ["bid", 8]],["reward", [4000, 300, 1]],["type", 1],["id", 97]]),
dict([["req", "stone"],["des", ["采集玄武石","木材和石材用户建筑升级，投石车等物品的建造","采集玄武石"]],["checknum", 130],["lev", 22],["pair", ["objid", 1]],["reward", [2800, 210, 0]],["type", 1],["id", 98]]),
dict([["req", "money"],["des", ["中级书店收税","银币是不可或缺的资源，高级店铺可以收集更多的银币！","从中级书店收税"]],["checknum", 10000],["lev", 22],["pair", ["bid", 16]],["reward", [4000, 280, 1]],["type", 1],["id", 99]]),
dict([["req", "planting"],["des", ["种植西瓜","粮食很重要，凯撒农作物、特殊农田、丰收女神都可以大幅度提高粮食产量！","种植西瓜"]],["checknum", 6],["lev", 23],["pair", ["object_id", 9, "type", 0]],["reward", [2900, 240, 0]],["type", 0],["id", 101]]),
dict([["req", "money"],["des", ["赌场收税","银币是不可或缺的资源，高级店铺可以收集更多的银币！","从普通赌场收税"]],["checknum", 13000],["lev", 24],["pair", ["bid", 24]],["reward", [4500, 350, 1]],["type", 1],["id", 103]]),
dict([["req", "stone"],["des", ["采集石灰岩","木材和石材用户建筑升级，投石车等物品的建造","采集石灰岩"]],["checknum", 200],["lev", 24],["pair", ["objid", 2]],["reward", [4500, 350, 1]],["type", 1],["id", 104]]),
dict([["req", "build"],["des", ["建造枫树","装饰可以增加人口上限，部分装饰还可以增加魔法值上限！","建造枫树"]],["checknum", 3],["lev", 25],["pair", ["ground_id", 535]],["reward", [1400, 90, 1]],["type", 0],["id", 106]]),
dict([["req", "planting"],["des", ["种植草莓","粮食很重要，凯撒农作物、特殊农田、丰收女神都可以大幅度提高粮食产量！","种植草莓"]],["checknum", 6],["lev", 25],["pair", ["object_id", 11, "type", 0]],["reward", [5400, 420, 1]],["type", 0],["id", 107]]),
dict([["req", "wood"],["des", ["采集橡树","木材和石材用户建筑升级，投石车等物品的建造","采集橡树木材"]],["checknum", 300],["lev", 25],["pair", ["objid", 5]],["reward", [5700, 420, 0]],["type", 1],["id", 108]]),
dict([["req", "planting"],["des", ["种植芒果","粮食很重要，凯撒农作物、特殊农田、丰收女神都可以大幅度提高粮食产量！","种植芒果"]],["checknum", 6],["lev", 26],["pair", ["object_id", 10, "type", 0]],["reward", [3300, 240, 1]],["type", 0],["id", 110]]),
dict([["req", "updatebuilding"],["des", ["升级神像","把神像升到更高级将会有更强的魔法效果！","升级任一白银神像"]],["checknum", 1],["lev", 26],["pair", ["ground_id", 408]],["reward", [4000, 450, 1]],["type", 0],["id", 111]]),
dict([["req", "updatebuilding"],["des", ["升级神奇屋","高级建筑会大大加快领地的发展！","升级中级神奇屋"]],["checknum", 1],["lev", 26],["pair", ["ground_id", 162]],["reward", [5000, 450, 0]],["type", 0],["id", 112]]),
dict([["req", "stone"],["des", ["采集花岗岩","木材和石材用户建筑升级，投石车等物品的建造","采集花岗岩"]],["checknum", 100],["lev", 27],["pair", ["objid", 3]],["reward", [3000, 300, 0]],["type", 1],["id", 113]]),
dict([["req", "updatebuilding"],["des", ["升级骑兵训练营","高级建筑会大大加快领地的发展！","升级中级骑兵训练营"]],["checknum", 1],["lev", 27],["pair", ["ground_id", 205]],["reward", [4000, 480, 1]],["type", 0],["id", 114]]),
dict([["req", "planting"],["des", ["种植玉米","听小新说，这个农田能种出水晶玉米哦！！","在水晶农田上种植玉米"]],["checknum", 6],["lev", 27],["pair", ["object_id", 2, "type", 0, "bid", 2]],["reward", [4500, 500, 1]],["type", 0],["id", 115]]),
dict([["req", "wood"],["des", ["采集松树","木材和石材用户建筑升级，投石车等物品的建造","采集松树木材"]],["checknum", 200],["lev", 28],["pair", ["objid", 4]],["reward", [4200, 300, 0]],["type", 1],["id", 116]]),
dict([["req", "money"],["des", ["中级赌场收税","银币是不可或缺的资源，高级店铺可以收集更多的银币！","从中级赌场收税"]],["checknum", 16000],["lev", 28],["pair", ["bid", 25]],["reward", [5600, 480, 0]],["type", 1],["id", 117]]),
dict([["req", "money"],["des", ["高级书店收税","银币是不可或缺的资源，高级店铺可以收集更多的银币！","从高级书店收税"]],["checknum", 15000],["lev", 28],["pair", ["bid", 17]],["reward", [5600, 480, 1]],["type", 1],["id", 118]]),
dict([["req", "money"],["des", ["首饰店收税","银币是不可或缺的资源，高级店铺可以收集更多的银币！","从普通首饰店收税"]],["checknum", 7000],["lev", 29],["pair", ["bid", 21]],["reward", [4200, 300, 0]],["type", 1],["id", 119]]),
dict([["req", "planting"],["des", ["种植草莓","听小新说，这个农田能种出神奇草莓哦！！","在宝石农田上种植草莓"]],["checknum", 6],["lev", 29],["pair", ["object_id", 11, "type", 0, "bid", 3]],["reward", [6000, 500, 1]],["type", 0],["id", 120]]),
dict([["req", "money"],["des", ["高级赌场收税","高级建筑的性价比更高！","从高级赌场收税"]],["checknum", 22000],["lev", 29],["pair", ["bid", 26]],["reward", [6000, 500, 1]],["type", 1],["id", 121]]),
dict([["req", "build"],["des", ["开垦精灵农田","特殊农田可以大大增加粮食产量！","开垦精灵农田"]],["checknum", 4],["lev", 30],["pair", ["ground_id", 4]],["reward", [6000, 500, 1]],["type", 0],["id", 122]]),
dict([["req", "stone"],["des", ["采集石英","木材和石材用户建筑升级，投石车等物品的建造","采集石英"]],["checknum", 300],["lev", 30],["pair", ["objid", 5]],["reward", [6200, 480, 1]],["type", 1],["id", 123]]),
dict([["req", "stone"],["des", ["采集大理石","木材和石材用户建筑升级，投石车等物品的建造","采集大理石"]],["checknum", 200],["lev", 30],["pair", ["objid", 4]],["reward", [4000, 320, 0]],["type", 1],["id", 124]])
];


const Tips = dict([
[8, "第8级可以开始建造神像罗！神像可以施展神迹增加产量。满级神像还有一键操作哦！"],
[10, "第10级可以开始建造龙巢罗，龙巢可以召唤宠物，宠物长大之后会帮助你战斗！"],
[12, "第12级可以建筑雕像罗，兽神施展神迹之后雕像会生产防御力！"],
[20, "第20级可以升级城堡罗，升级城堡会增加5点魔法值上限！"],
[30, "30级可以升级第三等级城堡（夜晚会有烟花特效），也可以建造兽神，它施展神迹会让雕像生产防御力！"],
]);
>>>>>>> 3c3ef9a9c6dfff975511869da9ec8aca34b3cd85
