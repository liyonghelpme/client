//const RateURL = "http://papayamobile.com/a/mr?p=com.papaya.miracle_beta1&referrer=in_game_rating";
const RateURL = "market://details?id=com.papaya.miracle1";
const NewsURL = "market://details?id=com.papaya.miracle1";
//const NewsURL = "http://papayamobile.com/a/mr?p=com.papaya.miracle_beta1&referrer=in_game_rating";

var TradeKinds = [
[2, 0, 1, 1000, 10*60],
[2, 0, 10, 11000, 15*60],
[2, 0, 100, 120000, 30*60],
[1, 0, 100, 1000, 15*60],
[1, 0, 1000, 8000, 2*3600],
[1, 0, 10000, 60000, 8*3600],
[0, 1, 50000, 2000, 10*60],
[0, 1, 10000, 1000, 4*3600],
[0, 1, 5000, 600, 12*3600],
];
var Others = dict([
["SPYITEMS", ["Wins: ", "Fights: ", "Soldiers: ", "Ally Soldiers: ", "Castle Defense: "]], 

["items" , []], //update News information
["timestr", ["1 hour", "6 hours", "24 hours"]], 

["ganname1", ["Thou may only send a friend one gift per day.", 
        "Thou may only ask a friend for one gift per day."]], 

["btname1", ["Delay", "Refresh"]], 

["timestr1", ["2 hours", "8 hours", "24 hours"]], 

["newupdate1", ["Night mode will be automatically activated from 8 p.m to 6 a.m every day. Tap menu button -> night to toggle on/off. "]], 

["godstr", [
    "Crop yields will increase by 20%", "Population growth will increase by 20%", "Tax revenue from stores will increase by 20%", "Soldiers' ATK will increase by 5%", 
    "Crop yields will increase by 40%", "Population growth will increase by 40%", "Tax revenue from stores will increase by 40%", "Soldiers' ATK will increase by 10%", 
    "Crop yields will increase by 60%", "Population growth will increase by 60%", "Tax revenue from stores will increase by 60%", "Soldiers' ATK will increase by 15%", 
    "Crop yields will increase by 80%", "Population growth will increase by 80%", "Tax revenue from stores will increase by 80%", "Soldiers' ATK will increase by 20%", 
    "Crop yields will increase by 100%", "Population growth will increase by 100%", "Tax revenue from stores will increase by 100%", "Soldiers' ATK will increase by 25%", 
    "Get 5 more sliver coins when you visit friends", "Get 10 more silver coins when you visit friends", "Get 20 more silver coins when you visit friends", "Get 30 more silver coins when you visit friends", "Get 50 more silver coins when you visit friends", 
    "Strengthen your castle defense", "Strengthen your castle defense", "Strengthen your castle defense", "Strengthen your castle defense", "Strengthen your castle defense"]], 

["newstr", [
"{'cp': [400, 300], 'cz': [120, 120], 'gtype': 0, 'posi': [17, 8], 'cmd': 'select', 'param': 0, 'tp': [600, 140], 'text': \"It is thy responsibility to provide food for your subjects. Tap on the idle farmland.\"}",   
"{'cp': [328, 288], 'cz': [120, 120], 'gtype': 0, 'posi': [17, 8], 'cmd': 'btclick', 'param': 0, 'tp': [600, 140], 'text': ' Tap the Plant Icon.'}",   
"{'cp': [209, 181], 'cz': [240, 240], 'type': 1, 'posi': [17, 8], 'cmd': 'state2over', 'param': 0, 'tp': [600, 140], 'text': 'Plant your first crop by tapping on wheat.'}",   
"{'cp': [400, 300], 'cz': [120, 120], 'gtype': 0, 'posi': [17, 8], 'cmd': 'select', 'param': 0, 'tp': [600, 140], 'text': \"It takes time to grow crops, but we can accelerate growth time, start by tapping on the busy farmland.\"}",   
"{'cp': [328, 288], 'cz': [120, 120], 'gtype': 0, 'posi': [17, 8], 'cmd': 'btclick', 'param': 0, 'tp': [600, 140], 'text': 'Tap the clock.'}",   
"{'cp': [314, 342], 'cz': [160, 60], 'gtype': 0, 'posi': [17, 8], 'cmd': 'speed', 'param': 0, 'tp': [600, 140], 'text': \"Tap Speed Up to accelerate your crop\'s growth\"}",   
"{'cp': [400, 300], 'cz': [120, 120], 'gtype': 0, 'posi': [17, 8], 'cmd': 'state4over', 'param': 0, 'tp': [600, 140], 'text': 'Harvest wheat.'}",   

"", 

"{'gtype': 2, 'posi': [17, 8], 'cmd': 'harvest', 'param': 0, 'tp': [400, 240], 'text': 'Task one completed+500+1+4+ Next step + Finished agriculture task!'}",   
"{'cp': [35, 435], 'cz': [80, 80], 'gtype': 1, 'posi': [14, 13], 'cmd': 'mclick', 'param': 4, 'tp': [200, 140], 'text': \"An empire needs people to construct buildings and become soldiers. Build homes for people to live in. Tap on the Build Icon.\"}",   
"{'cp': [100, 250], 'cz': [160, 280], 'gtype': 1, 'posi': [14, 13], 'cmd': 'pop', 'param': 2100, 'mp': [400, 240], 'tp': [400, 140], 'text': ' Tap a cottage '}",   
"{'cp': [445, 75], 'cz': [80, 80], 'gtype': 0, 'posi': [14, 13], 'cmd': 'build', 'param': 1, 'mp': [400, 180], 'tp': [600, 340], 'text': \"Choose a plot of land to build it and tap \u221a when ready.\"}", 
"{'cp': [400, 300], 'cz': [120, 120], 'gtype': 0, 'posi': [14, 15], 'cmd': 'state4over', 'param': 0, 'tp': [600, 140], 'text': 'People have already moved into this home. Tap on the cottage to recruit them for work.'}",   
"{'cp': [400, 300], 'cz': [120, 120], 'gtype': 0, 'posi': [14, 15], 'cmd': 'select', 'param': 0, 'tp': [600, 140], 'text': 'Tap on an empty cottage.'}",    
"{'cp': [328, 288], 'cz': [120, 120], 'gtype': 0, 'posi': [14, 15], 'cmd': 'state2over', 'param': 1, 'tp': [600, 140], 'text': 'Tap the Recruit Icon'}",   
"{'cp': [400, 300], 'cz': [160, 160], 'gtype': 0, 'posi': [14, 10], 'cmd': 'state4over', 'param': 0, 'tp': [600, 140], 'text': 'Your cottage has recruited people, but your empire is also going to need money. Tap on the bakery to collect taxes from it.'}",   

"", 

"{'gtype': 2, 'posi': [14, 10], 'cmd': 'state4over', 'param': 0, 'tp': [400, 240], 'text': 'Task Two completed+1500+2+10+ Next step +You have recruited people and collected taxes.'}",   
"{'cp': [106, 435], 'cz': [80, 80], 'gtype': 5, 'posi': [14, 10], 'cmd': 'mclick', 'param': 5, 'tp': [200, 140], 'text': 'There are monsters pillaging your crops. Kill them and protect your territory.'}",   
"{'cp': [177, 435], 'cz': [80, 80], 'gtype': 5, 'posi': [14, 10], 'cmd': 'mclick', 'param': 2, 'tp': [200, 140], 'text': \"Tap on the map to see what's going on around you.\"}",   
"{'cp': [650, 360], 'cz': [120, 120], 'gtype': 4, 'posi': 0, 'cmd': 'monster', 'param': 15, 'tp': [600, 140], 'mp': [650, 360], 'text': 'Tap on the monster to attack it.'}",   
"{'cp': [310, 386], 'cz': [160, 80], 'gtype': 5, 'posi': 0, 'cmd': 'attack', 'param': 1, 'tp': [200, 140], 'mp': [650, 360], 'text': 'Tap attack'}",   
"{'cp': [450, 360], 'cz': [120, 120], 'gtype': 4, 'posi': 0, 'cmd': 'goback', 'tp': [600, 140], 'mp': [650, 360], 'text': 'Congrats, you won! Tap on your castle to return to your territory.'}, ",    
"{'cp': [120, 40], 'cz': [240, 80], 'gtype': 0, 'posi': [14, 10], 'cmd': 'rename', 'param': 0, 'tp': [600, 340], 'text': 'Let everyone know whose territory this is. Give your empire a name!'}",   

"", 

"{'gtype': 2, 'posi': [14, 10], 'cmd': 'state4over', 'param': 0, 'tp': [400, 240], 'text': \"Novice task completed +2000+3+15+Ok+Congrats! You\'re on your way to becoming a great emperor!\"}"]]

]);

var Dicts = 
[
["build_defence_format", "Building a [BUILD] will add [DEFENCE] to castle defense, are you sure you want to build it?"], 

["money", "silver coins"], ["caesars", "caesar coins"], ["food", "food"], ["labor", "idle population"], ["person", "population"], ["stone", "stone"], ["wood", "wood"], ["caesar", "caesar coins"], 

["share", "Share"], ["back", "Back"], ["change", "Done"], ["send", "Send"], ["cancel", "Cancel"], ["system", "System"], ["devine", "Activate"], ["retry", "Retry"], ["help", "Help"], ["close", "Close"], ["openbox", "Open"], ["askforhelp", "Ask friend"], 

["loading_str", "loading..."], ["self", "me"], 

["request_done", "Done"], 

["friend_notload", "Sorry, can't retrieve your friend list"], 
["friend_ally_notice", "You can visit your friends and ally with them. Allies can help you fight!"], 
["friend_invite", "Come create miracles with me!"], ["friend_invite_success", "Invited successfully!"], 

["nest_style_cannotchange", "Your dragon is growing, you can't change your dragon type now!"], 

["nest_talk_morning", "Hey, what a great day today!"], 
["nest_talk_noon", "Hey, good noon!"], 
["nest_talk_night", "Good night, early to bed, early to rise"], 

["nest_talk_other", "I need to train to become stronger. Train with me now."], 

["nest_talk_feedover", "I've eaten enough, thanks"], 
["nest_talk_notfeedover", "I'm hungry, feed me!"], 

["nest_talk_sleep", "I'm still a growing dragon! I can't fly until I reach 285!"], 

["nest_getup_1", "Your dragon egg has successfully hatched!"], 
["nest_getup_2", "Your baby dragon has grown up."], 

["nest_getup_format", "[NAME][DESCRIBE]'s current growing point is: [HEALTH], property: [PROPERTY], ATK: [ATTACK]"], 

["nest_pet_name", "Enter your pet's name: "], 

["nest_pet_name_warning", "Warning: You can't change name."], 

["nest_gotohelp", "Check the HELP document for more information on how to raise your dragon"], 

["box_str_1", "Help me open this treasure chest please!"],
["box_str_2", "Let's share the treasure!"],
["box_str_3", "You found a treasure chest, ask friends to help you open it."], 

["god_bless_over", "Your magic power is recharging."], 

["share_format", "[NAME][DESCRIBE]. Come on! Join [NAME] and build your own Miracle Empire together!"], 

["share_box_format", "[NAME] has received a mysterious treasure chest but can't open it without your help!"], 

["share_petup_1", "You have raised your dragon successfully"], 
["share_petup_2", "'s baby dragon has grown up"], 

["share_openbox", " opened a special treasure chest"], 

["default_petname", "my pet"], 

["news_nonews", "No more news"], 

["news_element0", "<b>[NAME]<b> hath visited you."], 

["news_element1", "<b>[NAME]<b> helped you manage your castle."], 

["news_element2", "<b>[NAME]<b> hath sent you a gift."], 

["news_element3", " You hath defeated <b>[NAME]<b>."], 

["news_element4", "<b>[NAME]<b> hath defeated you."], 

["news_element5", "<b>[NAME]<b> hath helped you open a treasure chest."], 

["news_element6", "<b>[NAME]<b> hath fed your pet."], 

["gift_element0", "[NAME] sent: [GIFT]."], 

["gift_element1", "[NAME] ask for: [GIFT]."], 

["monster_foodwilllost", "Monsters are trying to steal your crops, kill them before your next login."], 

["monster_refresh_format", "Hey, [NAME], give me your crops, or there will be hell to pay."], 

["warrecord_notice_format", "There are [NUM] wars going on right now, would you like to watch?"], 

["war_newmap_notice", "Congrats! you entered a new map. Hint: there are more powerful players on this map"], 

["spy_notice", "Tip: higher level scouts find more details about enemy."], 

["chat_empty", "Content can't be empty."], 
["chat_wordlimit", "Content must be less than 60 characters."], 
["chat_nettimeout", "Could not connect to the game server. Please try again later."], 

["text_wordlimit_format", "Limit [NUM] characters!"], 
["text_cannotset", "Name your empire!"], 
["text_nettimeout", "Could not connect to the game server. Please try again later."], 

["text_message_send", "Write a message: "], 
["text_empty", "Can't be empty"], 
["text_chat_nettimeout", "Could not connect to the game server. Please try again later."], 
["yes", "Yes"],

["message_send_success", "Successfully sent"], 
["text_empire_name", "Please input empire name: "], 

["update_normal", "Ordinary"], 
["update_caesars", "Fast"], 
["update_warning", "The building is busy. Upgrading it will interrupt the process, are you sure?"], 

["onekey_plant", "One-step planting"], ["onekey_harvest", "One-step harvesting"], ["onekey_product", "One-step collect taxes"], ["onekey_visit_normal", "One-step visit all"], ["onekey_visit_inc", "One-step visit all (compounded)"], ["onekey_title", "One-step operation"], 

["onekey_gotohelp", "How to use it?"], 

["tab_fighting", "Wars"], ["tab_attackable", "Castles"], 

["tab_fortress", "Forts"],

["nobattle_fail_whenhasattack", "Sorry, you can't be in protect mode while attacking."], 

["nobattle_whenattack", "Attacking will end protect mode."], 
["attack_whenattacked", "You are already attacking that person."], 
["attack_whenupdated", "Sorry, that player has gone to a new map."], 
["attack_whenwon", "You have already conquered that castle."], 
["attack_cancel", "Do you really want to cancel this battle?"], 
["attack_time", "Time"], 
["attacktime_notice", "*More cavalry results in a shorter march time"], 
["attacktime", "Time"], 
["state_attacking", "Attacking..."], 
["state_defencing", "Defending..."], 
["state_fighting", "Fighting..."], 
["state_adding", "Sending soldiers..."], 

["net_state_1", "Could not connect to the game server. Please try again later."], 
["net_state_2", "Could not connect to the game server. Please try again later."], 

//conquered by
["master", "Conquered by: "], [": ", ": "], 
["user_notoccupy", "Unconquered"], ["user_occupy", "Free"], ["user_protected", "Protecting"], ["user_fighting", "Fighting"], ["user_attacking", "Marching..."], 
["resource_get_format", "This fortress produces [MONEY] coins, [FOOD] food, [WOOD] wood, [STONE] stones per hour. Come back in [TIME]."], 
["quit", "Quit"], ["back", "Back"], 

["sendFight", "Soldiers sent: "], 
["totalFight", "Total ATK: "], 
["lostFight", "Soldiers lost: "], 
["returnFight", "Soldiers remaining: "], 
["defenceFight", "Defense: "], 
["lostDefence", "Defensive damages: "], 
["leftDefence", "Defensive strength: "], 
["lostCoin", "Silver coins lost: "], 
["share", "Share"], 
["ok", "Ok"], 
["attack", "Attack"], 
["defence", "Defense"], 
["retry", "Retry"], 
["cancel", "Cancel"], 
["netFail1", "Could not connect to the game server. Please try again later."], 
["netFail2", "Could not connect to the game server. Please try again later."], 
["taskShare", "Congrats, you finished this task!"], 
["shareReward", "Share with your friends to get 100 silver coins."], 
["complete", "Complete"], 
["giveup", "Give up"], 
["giveupwarn", "Give up on this task and forfeit the rewards?"], 
["playWithme", "Come create miracles with me!"], 
["goSee", "Have a look"], 
["IKnow", "Got it"], 
["genAdd", "Ordinary"], 
["fastAdd", "Fast"], 
["chooseDefence", "Increases Defense: "], 
["youLeft", "Left [NUM] ally position"], 
["allyNum", " Ally number"], 
["sureToally", "Do you want to ally with this friend?"], 
["taskFinishPost", "[NAME] complete [TASK] task, come on and build your own Miracle Empire with me!"], 
["allyOk", "Allies can help you when you are at war. It costs 5 caesar coins to break off an alliance, so choose your allies carefully."], 
["cancelAlly", "Do you want to cancel alliance with "], 
["makeAlly", "Ally"], 
["punish", "Punishment"], 
["allyUp", "You've reached your maximum number of allies."], 
["add", "Add"], ["close", "Close"], 

["addAlly", "Add an ally"], ["attackNow", "Your army is on the way"], 
["HintPower", "Hint: your army's ATK will increase if you are online"], 
["youWin", "You win"],
["attackIt", "Attack!"],
["inBuild", "Building"], 
["inCall", "Recruiting"],
["inProduct", "Producing"], 
["training", "Training"], 
["planting", "Growing"], 
["wooding", "Producing"], 
["stoning", "Mining"], 
["proDefing", "Producing"], 
["blessing", "Performing"], 
["free", "Free"], 
["egging", "Incubating"], 
["growing", "Growing"], 
["shopping", "Purchase"], 
["buyCaesar", " caesar coins"], 
//["fulfill", "The Harvest Goddess can increase the crop yield by performing magic"],
//["population", "The Liberty Goddess can increase the number of people you can recruit by performing magic"], 
//["war", "The War God can strenthen your soldiers' ATK by performing magic"], 
//["beast", "The Beast God will increase your defense by performing magic"], 

["dragon", "You can summon your own pet after building a dragon nest."], 
["godBless", "[GOD] can perform magic, are you sure you want to summon [GOD]?"], 
["call", "Summon"], ["coin", "coin"], ["freePeople", "idle people"], ["food", "food"], 
["zijin", "Your magic capacity will increase by 1 when you level up."], 
["freeZijin", "Your magic capacity will increase by 1 when you level up."], 
["youGet", "Congrats, you got the [NAME] card! [END]"], 
["youPost", "[NAME] got [CARD] [CARDLEV] card, join [NAME] to build your own Miracle Empire!"], 
["loading", "Loading..."], ["noNews", "No messages"], ["loginBonus", "[NAME] has played the Miracle Empire today and received daily rewards!"], 
["godShow", "Magic"], ["inGodShow", ""], 
["show", "Perform"], 
["friend", "friends"], 
["level", "level"], 
["expandOver", "Congrats, you've just acquired more land!"], 
["expandPost", "[NAME] has acquired more territory, come join and start building your Miracle Empire!"], 
["feedback", "If you have any advice of feedback, please email"], 
["feedGift", "You will get special gifts if we listen to your advice."], 
["sendGift", "Choose a gift for <g>"], 
["ask", "Request"], 
["send", "Send"], 
["accept", "Accept"], 
["levelUp", "[NAME] has level up to [LEVEL], play Miracle Empire and enjoy!"], 
["killAll", "[NAME] has defeated crop stealing monsters, play Miracle Empire and have fun!"], 
["nextMonster", "Next attack: "], 
["comeSoon", "Coming soon"], 
//["goInNewMap", ", you will find more powerful players on a higher level map."], 
["NobUp", "Congrats! You've become a "], 
["attackIs", "ATK: "], 
["powerlack", "Your soldiers aren't strong enough!"], 
["monRob", "Monsters have robbed [FOOD] crops"], 
["active", "Active"], 
["activeDra", "Will you help me activate it?"], 
["letsShare", "Let's share the treasure!"],
["askForAct", "Ask friends for help!"], 
["helpMe", "Help"], 
["askFri", "Request help"], 
["unknown", "Unknown"], 
["getDragon", "has built a Dragon's Nest but needs your help to activate it!"], 
["callPet", "Congrats! You have activated your Dragon's Nest, now you can summon your pet!"],
["myPet", "my pet"], 
["dragonPost", "[NAME]'s Dragon's Nest has been activated successfully, play Miracle Empire and have fun!"], 
["curPet", "current pet"], 
["changeMode", "change mode"], 
["petAtt", "A [NAME]'s ATK will increase by [POWER] for every growing point, are you sure you want to change dragon types?"], 
["freeFee", "for free"], 
["changeAtt", "Change attribute"], 
["petPro", "[NAME]'s basic ATK is [POWER], every growing point adds [ADD] ATK. Do you want to change the dragon types?"], 
["spy_result_format", "You lost [NUM] scouts getting [WHO]'s castle info: "], 
["spy_result2_noenemy", "There is no army attacking this castle now."], 
["spy_result2_format", "There are [NUM] armies marching to attack the castle, the first one will arrive at [TIME]."], 
["spy_result2_mode3_format", "ATK Strength: [NUM]"], 

["choosePet", "Choose Pet"], 
["callDragonDia", "[NAME]'s basic ATK is [POWER], every growing point adds [ADD] to ATK. Summon?"], 
["inProtect", "Protecting"], 
["attNoProtect", "You can't enable protect mode while attacking others."], 
["openProtect", "enable protection"], 
["colonial", "colonial "], 
["levelUp", "Congrats! [NAME] has reached to Lv. [LEVEL], come on to build your own Miracle Empire!"], 

//________________________________________________________________________________
["goInNewMap", ", you will find more powerful players on higher level maps."], 
["cityLevelUp", ", you've reached a higher rank!"], 
//knight - 3 class --> knight 2 class  higher  

//["NobUp", "Congrats! You've become a [NAME]"]+, 
["oneLevel", ". Continue to defeat more enemies to reach higher ranks!"], 
["next", "Next"], 
["choosePlant", "Choose Crop"], ["sureToBuy", "Do you want to purchase [NAME]?"], ["acc", "Speed Up"], 
["leftTime", "Time left "], 
["noBattle", "War mode not enabled"], 
["winNum", "wins"], 
["netRefresh", "Could not connect to the game server. Please try again later."], ["fresh", "refresh"], 

["fightAdd", "Hint: soldiers get an ATK bonus while garrisoning a fortress"], 
["peopUp", " pop capacity"], 
["sureTosell", "Are you sure you want to sell [NAME]?"], 
["sell", "Sell"], 
["toDetect", "Spy on enemies"], 
["unitPower", "Strength per unit"], 
["chooseStone", "Choose stone"], 
["noUpdate", "No new updates"], 
["visitReward", "[NAME] has gotten the rewards when you visit friends, join Miracle Empire and have fun!"], 
["yourArmy", "Your military has arrived at [NAME]'s territory. Prepare for war!"], 
["enemyArmy", "[NAME]'s military has arrived your territory, let's get ready for the fight!"], 
["viewWar", "watching"], 
["skip", "Skip"], 
["sendArmy", "<g>+ has sent his army to attack your territory"], 

["godInc", "Hint: your enemy's soldier's ATK will increase porpotion +<b> <b>"], 

["howDef", "*How to strengthen your defense"], 
["youNeed", "You need more"], 
["speNeed", "Not enough materials."], 
["clearList", "Tip: your win/lose record will reset when you enter a new battlefield"], 
["reqHandle", "Done"], 
["income", "Congrats! You have [NUM] colonies and will receive [COIN] coins as tribute."], 
["incomePost", "[NAME] get tribute from colonies, join Miracle Empire and have fun!"], 
["chooseWood", "Choose lumber"], 
["youNeed", "You still lack "], ["speNeed", "Need more special materials"], 
["fullfilMana", "Refill magic"], ["fullfil", "Refill"], ["curMana", "Magic Value"],
["nextTime", "Recharge 1 magic in time "], 

["You", "You"], ["StillNeed", " still need "], 

["MonsterLevUp", "You still need to defeat [NUM] more [NAME] to get the [NAME] Lv. [LEV] card."], 

["MonsterCardGet", " your magic capacity will increase by 2 when you get the Lv. 5 card."], 

["ChangELevUp", "You still need [DAY] continuous logins to get Moon Goddess Lv. [LEV], and your magic capacity will increase by 1"], 
["OtherCardLevUp", ""], 
["NobCard", "[WHO] need to defeated [NUM] more opponents to get the [CARD] card."], 

["BusiCard", "Get [NUM] to get the next level [TYPE]. Your magic capacity will increase by 1 when you get the [TYPE]!"], 

["FriendCard0", "[WHO] need to upgrade the God of Friendship to Lv. 5 to get [NAME] [LEV]. Your magic capacity will increase by 1 when you level up."], 

["FriendCard1", "You need [NUM] more friends to get the [NAME] [LEV] card. Your magic capacity will increase by 1 when you level up."], 

["FriendCard2", "You need to open [NUM] more treasure chest for your friends to get the [NAME] [LEV] card. Your magic capacity will increase by 1 when you level up."], 
["FriendCard3", "You need to feed your friends' dragons [NUM] more times to get the [NAME] [LEV] card. Your magic capacity will increase by 1 when you level up."], 
["FriendCard4", "You need to reach level [NUM] to get the [NAME] [LEV] card. Your magic capacity will increase by 1 when you level up."], 
["FriendCard5", "You can use one-step visiting from now on!"], 
["MonsterZijin", "Congrats! You've earned the Monster Lv. 5 card. Your magic capacity has increased by 2."], 
["ChangEZijin", "Congrats! You've earned the Moon God Lv. 5 card. Your magic capacity has increased by 1."], 
["PlantZijin", "Congrats! You've earned the Planting Lv. 5 card. Your magic capacity has increased by 1."], 
["BusiZijin", "Congrats! You've earned the Business Lv. 5 card. Your magic capacity has increased by 1."], 
["NobZijin", "Congrats! Nobility level up. Your magic capacity has increased by 1."], 
["FriendZijin", "Congrats! You've earned the Friendship Lv. 5 card. Your magic capacity has increased by 1."],
["PlantingCard", "Planting Card"], ["BusinessCard", "Business Card"], 
["Download", "Downloading"], 
["LackMagic", "Not enough magic, recharge now?  Tip: magic recharges 1 point every 5 minutes."], 
["LackMaCap", "Sorry, your magic capacity isn't high enough. You can buy some decorations to increase it."],
["LackCae", "Sorry, you don't have enough caesar coins. Purchase caesar coins now?"],
["infpower", "Infantry: "], 
["cavpower", "Cavalry: "], 
["addsoldier", "Reinforce"], 
["minussoldier", "Withdraw"], 
["getresource", "Collect"], 
["quickSendArmy", "SpeedUp"], 
["LevelNot", "Sorry, you need to reach Lv. [LEVEL] to upgrade your castle."], 
["EmpireNotOpen", "Your castle has reached to top level."], 
["sendCatapult", "Dispatch"], 
["notSendCata", "No"], 
["petNeedDownload", "Summon a pet requires you to download pictures, proceed?"], 
["warNeedDownload", "Entering the war map requires you to download pictures, proceed?"], 
["downloading", "Downloading pictures..."], 
["SendCata", "Do you want to dispatch [NUM] catapults?"], 
["Buy", "Buy"], 
["sureBuyMana", "Are you sure you want to buy [NUM] mana?"], 
["ChooseCata", "Choose Catapult"], 
["Me", "Me"], 
["ItGrowUp", "It grows up!"], 
["Produce", "Produce"], 
["Fast", "Fast"], 
["CataExplain", "Catapults only can be used when attack others; they help boost your ATK. [NAME] ATK [ATK]"], 
["CardAddOne", "Your magic capacity will increase by 1 when you get the violet card."], 
["CardAddTwo", "Reach the top level and your magic capacity will increase by 2."], 

["sendSuc", "request sent successfully!"], 
["downloading", "Downloading files..."], 
["downMusic", "You need to download 800K music files to experience the game music. Proceed?"], 
["showDownNow", "To experience the most out of the game you need to download 3M pictures. Proceed?"], 

["Build", "Build"], 

["PlayDragon", "Use Dragon Stones to gamble on the Dragon Wheel."], 
["OrdStart", "Ordinary"], 
["SpeStart", "Special"], 
["PlayingDra", "[NAME] is playing Dragon Wheel, join \"playingDra\" in Miracle Empire!"], 
["DraNot", "Sorry, you don't have enough Dragon stones, you can get more by opening treasure chest or killing monsters!"], 

["CaeNot", "Sorry, you don't have enough caesar coins!"], 
["HowDra", "Dragon Stones or caesar coins are needed to play Dragon Wheel. Hint: opening treasure chest or killing monsters to get Dragon Stone."], 
["drumReward", "Tap the Drum Icon to get extra silver coins during fights! You tapped [NUM] times and get [MONEY] silver coins in the fight!"], 
["drumFeed", "[NAME] tapped drum [NUM] times and got [MONEY] silver coins in Miracle Empire!"], 
["lev1Disk", "Obtain the rank of Baron before you can  play this Dragon wheel."], 
["lev2Disk", "Obtain the rank of Knight before your can play this Dragon Wheel."], 
["spe", "lumber"], 
["boundary", "Magic Capacity"], 
["dragonStone", "Dragon Stone"], 
["power", "soldiers"], 
["oldUser", "Welcome back to Miracle Empire! You got 10 caesar coins for playing!"], 
["PapaNot", "You don't have enough papayas to make this purchase. Purchase papayas now?"], 
["exp", "Exp"], 
["BuyShip", "You need to upgrade to Lv. 15 to buy ship:)"], 
["BuyShipNow", "Congrats! You can buy ship to trade with others. Are you sure you want to buy it?"],
["", ""], 

];

var Names = dict([

["ROOMNAME1", ["Orange Cottage", "Orange Cottage", "Orange Cottage", "Red Cottage", "Red Cottage", "Red Cottage", "Blue Cottage", "Blue Cottage", "Blue Cottage", "Purple Cottage", "Purple Cottage", "Purple Cottage", "Orange House", "Orange House", "Orange House", "Red House", "Red House", "Red House", "Blue House", "Blue House", "Blue House", "Purple House", "Purple House", "Purple House", "Orange Villa", "Orange Villa", "Orange Villa", "Red Villa", "Red Villa", "Red Villa", "Blue Villa", "Blue Villa", "Blue Villa", "Purple Villa", "Purple Villa", "Purple Villa", "Orange Mansion", "Orange Mansion", "Orange Mansion", "Red Mansion", "Red Mansion", "Red Mansion", "Blue Mansion", "Blue Mansion", "Blue Mansion", "Purple Mansion", "Purple Mansion", "Purple Mansion", "Orange Manor", "Orange Manor", "Orange Manor", "Red Manor", "Red Manor", "Red Manor", "Blue Manor", "Blue Manor", "Blue Manor", "Purple Manor", "Purple Manor", "Purple Manor", "Magical Manor", "Magical Manor", "Magical Manor", "Magical Manor", "Magical Manor", "Magical Manor", "Magical Manor", "Magical Manor", "Magical Manor", "Magical Manor", "Magical Manor", "Magical Manor", "Orange Palace", "Orange Palace", "Orange Palace", "Golden Palace", "Golden Palace", "Golden Palace", 
"Attic", "Attic", "Attic",
"Snow House", "Snow House", "Snow House",
"Tree House", "Tree House", "Tree House",
"Loft", "Loft", "Loft",
"Government House", "Government House", "Government House", 
]], 
["ROOMNAME" , ["Orange Cottage Lv. 1", "Orange Cottage Lv. 2", "Orange Cottage Lv. 3", "Red Cottage Lv. 1", "Red Cottage Lv. 2", "Red Cottage Lv. 3", "Blue Cottage Lv. 1", "Blue Cottage Lv. 2", "Blue Cottage Lv. 3", "Purple Cottage Lv. 1", "Purple Cottage Lv. 2", "Purple Cottage Lv. 3", "Orange House Lv. 1", "Orange House Lv. 2", "Orange House Lv. 3", "Red House Lv. 1", "Red House Lv. 2", "Red House Lv. 3", "Blue House Lv. 1", "Blue House Lv. 2", "Blue House Lv. 3", "Purple House Lv. 1", "Purple House Lv. 2", "Purple House Lv. 3", "Orange Villa Lv. 1", "Orange Villa Lv. 2", "Orange Villa Lv. 3", "Red Villa Lv. 1", "Red Villa Lv. 2", "Red Villa Lv. 3", "Blue Villa Lv. 1", "Blue Villa Lv. 2", "Blue Villa Lv. 3", "Purple Villa Lv. 1", "Purple Villa Lv. 2", "Purple Villa Lv. 3", "Orange Mansion Lv. 1", "Orange Mansion Lv. 2", "Orange Mansion Lv. 3", "Red Mansion Lv. 1", "Red Mansion Lv. 2", "Red Mansion Lv. 3", "Blue Mansion Lv. 1", "Blue Mansion Lv. 2", "Blue Mansion Lv. 3", "Purple Mansion Lv. 1", "Purple Mansion Lv. 2", "Purple Mansion Lv. 3", "Orange Manor Lv. 1", "Orange Manor Lv. 2", "Orange Manor Lv. 3", "Red Manor Lv. 1", "Red Manor Lv. 2", "Red Manor Lv. 3", "Blue Manor Lv. 1", "Blue Manor Lv. 2", "Blue Manor Lv. 3", "Purple Manor Lv. 1", "Purple Manor Lv. 2", "Purple Manor Lv. 3", "Magical Manor Lv. 1", "Magical Manor Lv. 2", "Magical Manor Lv. 3", "Magical Manor Lv. 1", "Magical Manor Lv. 2", "Magical Manor Lv. 3", "Magical Manor Lv. 1", "Magical Manor Lv. 2", "Magical Manor Lv. 3", "Magical Manor Lv. 1", "Magical Manor Lv. 2", "Magical Manor Lv. 3", 
"Orange Palace Lv. 1", "Orange Palace Lv. 2", "Orange Palace Lv. 3", "Golden Palace Lv. 1", "Golden Palace Lv. 2", "Golden Palace Lv. 3", 
"Attic Lv. 1", "Attic Lv. 2", "Attic Lv. 3",

"Snow House Lv. 1", "Snow House Lv. 2", "Snow House Lv. 3",
"Tree House Lv. 1", "Tree House Lv. 2", "Tree House Lv. 3",
"Loft Lv. 1", "Loft Lv. 2", "Loft Lv. 3",
"Government House Lv. 1", "Government House Lv. 2", "Government House Lv. 3", 
]], 

["SOLDIER_NAME" , ["Lv. 1", "Lv. 2", "Lv. 3", "Lv. 1", "Lv. 2", "Lv. 3", "Lv. 1", "Lv. 2", "Lv. 3"]], 
["SOLDIER_NAME1" , ["Lv. 1", "Lv. 2", "Lv. 3", "Lv. 1", "Lv. 2", "Lv. 3", "Scout Lv. 1", "Scout Lv. 2", "Scout Lv. 3"]], 


["MONSTERNAME" , ["Snake Lv. 1", "Snake Lv. 2", "Snake Lv. 3", "Boar Lv. 1", "Boar Lv. 2", "Boar Lv. 3", "Wolf Lv. 1", "Wolf Lv. 2", "Wolf Lv. 3", "Bear Lv. 1", "Bear Lv. 2", "Bear Lv. 3", "Lion Lv. 1", "Lion Lv. 2", "Lion Lv. 3", "Dragon Lv. 1", "Dragon Lv. 2", "Dragon Lv. 3", "Snake King Lv. 1", "Snake King Lv. 2", "Snake King Lv. 3", "Boar King Lv. 1", "Boar King Lv. 2", "Boar King Lv. 3", "Wolf King Lv. 1", "Wolf King Lv. 2", "Wolf King Lv. 3", "Bear King Lv. 1", "Bear King Lv. 2", "Bear King Lv. 3", "Lion King Lv. 1", "Lion King Lv. 2", "Lion King Lv. 3", "Dragon King Lv. 1", "Dragon King Lv. 2", "Dragon King Lv. 3"]], 


["PETS_NAME" , ["Dragon Egg A Lv. 1", "Dragon Egg A Lv. 2", "Dragon Egg A Lv. 3", "Dragon Egg B Lv. 1", "Dragon Egg B Lv. 2", "Dragon Egg B Lv. 3"]], 


["EXTEND_NAME" , ["earth", "fire", "water"]], 

["EXTEND_PETS_NAME" , ["Earth Dragon", "Fire Dragon", "Water Dragon"]], 

["STATUE_NAME" , ["Medusa", "Boar Warrior", "Wolf Warrior", "Bear Warrior", "Lion Warrior", "Dragon Warrior", "Tower1", "Tower2"]], 

["FACTNAME" , ["Bakery Lv. 1", "Bakery Lv. 2", "Bakery Lv. 3", "Fruit Shop Lv. 1", "Fruit Shop Lv. 2", "Fruit Shop Lv. 3", "Butcher Shop Lv. 1", "Butcher Shop Lv. 2", "Butcher Shop Lv. 3", "Restaurant Lv. 1", "Restaurant Lv. 2", "Restaurant Lv. 3", "Clinic Lv. 1", "Clinic Lv. 2", "Clinic Lv. 3", "Book Store Lv. 1", "Book Store Lv. 2", "Book Store Lv. 3", "Clothing Store Lv. 1", "Clothing Store Lv. 2", "Clothing Store Lv. 3", "Jewelers Lv. 1", "Jewelers Lv. 2", "Jewelers Lv. 3", "Casino Lv. 1", "Casino Lv. 2", "Casino Lv. 3", "Dojo Lv. 1", "Dojo Lv. 2", "Dojo Lv. 3", "Fish Market Lv. 1", "Fish Market Lv. 2", "Fish Market Lv. 3", 
"Carpenter Shop Lv. 1", "Carpenter Shop Lv. 2", "Carpenter Shop Lv. 3", 
"Hotel Lv. 1", "Hotel Lv. 2", "Hotel Lv. 3",
"Markets Lv. 1", "Markets Lv. 2", "Markets Lv. 3",
"Wine Shop Lv. 1", "Wine Shop Lv. 2", "Wine Shop Lv. 3",
]], 

["FACTNAME1" , ["Bakery", "Bakery", "Bakery", "Fruit Shop", "Fruit Shop", "Fruit Shop", "Butcher Shop", "Butcher Shop", "Butcher Shop", "Restaurant", "Restaurant", "Restaurant", "Clinic", "Clinic", "Clinic", "Book Store", "Book Store", "Book Store", "Clothing Store", "Clothing Store", "Clothing Store", "Jewelers", "Jewelers", "Jewelers", "Casino", "Casino", "Casino", "Dojo", "Dojo", "Dojo", "Fish Market", "Fish Market", "Fish Market",
"Carpenter", "Carpenter", "Carpenter", 
"Hotel", "Hotel", "Hotel", 
"Markets", "Markets", "Markets",
"Wine Shop", "Wine Shop", "Wine Shop",
]], 

["CAMPNAME" , ["Infantry Camp Lv. 1", "Infantry Camp Lv. 2", "Infantry Camp Lv. 3", "Cavalry Camp Lv. 1", "Cavalry Camp Lv. 2", "Cavalry Camp Lv. 3", "Scout Camp Lv. 1", "Scout Camp Lv. 2", "Scout Camp Lv. 3", "Workshop Lv. 1", "Workshop Lv. 2", "Workshop Lv. 3"]], 
["CAMPNAME1" , ["Infantry Camp", "Infantry Camp", "Infantry Camp", "Cavalry Camp", "Cavalry Camp", "Cavalry Camp", "Scout Camp", "Scout Camp", "Scout Camp", "Workshop", "Workshop", "Workshop"]], 

["FARMNAME" , ["", "Ordinary Farmland", "Crystal Farmland", "Gem Farmland", "Elf Farmland", "Lumber Mill", "Stone Quarry"]], 


["GONAME" , ["Harvest Goddess Lv. 1", "Liberty Goddess Lv. 1", "Wealth God Lv. 1", "War God Lv. 1", "Harvest Goddess Lv. 2", "Liberty Goddess Lv. 2", "Wealth God Lv. 2", " Lv. 2", "Harvest Goddess Lv. 3", "Liberty Goddess Lv. 3", "Wealth God Lv. 3", "War God Lv. 3", "Harvest Goddess Lv. 4", "Liberty Goddess Lv. 4", "Wealth God Lv. 4", "War God Lv. 4", "Harvest Goddess Lv. 5", "Liberty Goddess Lv. 5", "Wealth God Lv. 5", "War God Lv. 5", "Friendship God Lv. 1", "Friendship God Lv. 2", "Friendship God Lv. 3", "Friendship God Lv. 4", "Friendship God Lv. 5", "Beast God Lv. 1", "Beast God Lv. 2", "Beast God Lv. 3", "Beast God Lv. 4", "Beast God Lv. 5"]], 
["GONAME1" , ["Harvest Goddess", "Liberty Goddess", "Wealth God", "War God", "Harvest Goddess", "Liberty Goddess", "Wealth God", "War God", "Harvest Goddess", "Liberty Goddess", "Wealth God", "War God", "Harvest Goddess", "Liberty Goddess", "Wealth God", "War God", "Harvest Goddess", "Liberty Goddess", "Wealth God", "War God", "Friendship God", "Friendship God", "Friendship God", "Friendship God", "Friendship God", "Beast God", "Beast God", "Beast God", "Beast God", "Beast God"]], 


["OBJNAME" , [
"Brick Road", "Concrete Road", "Red Brick Road", "Stone Road", "Golden Road", 
"White Flowerbed", "Red Flowerbed", "Pink Flowerbed", "Yellow Flowerbed", "Blue Flowerbed", " Purple Flowerbed", 
"Lawn", "Vine Lamp", "Street Lamp", "Lamp Post 1", "Lamp Post 2", "Flower Lamp", "Guideboard", "Bench", "Well" , "Magic Well", "Purple Flowers", "Red Flowers", "Orange Flowers", "Green Nepenthe", "Yellow Nepenthe", "Green Nepenthe", "Blue Nepenthe", "Pink Cherry Tree", "Purple Cherry Tree", "Violet Cherry Tree", "Red Cherry Tree", "Orange Shrubs", "Yellow Shrubs", "Green Shrubs", "Spring Maple Tree", "Summer Maple Tree", "Autumn Maple Tree", "Angel Statue", "Rabbit", "Moon cakes", "Moon Festival Rabbit", "Red Candy Lamp", "Golden Candy Lamp", "Jack-O'-Lantern", "Rose lantern", "Blue Gem latern", "Green Gem latern", "Golden Gem latern", "Purple Gem latern", 
"Santa", "Elegant Xmas tree", "Xmas tree", "Elegant Snowmen", "Snowmen", "Elegant Reindeer", "Reindeer", 
"Palm Tree", "Red Lantern", "Stele", "Tai Miao", "Cross", "Pavilion", 
"Cupid", "Rose Flowers", "Rose Garden", "Love Tree", 
"Egypt Tower", "Elephant Lamp", "Horse Lamp", 
"Royal Road", "Camphor", "High Shrubs", "Watchtower", 
"Royal Knight", "Flag Pier", "Square Brick 1", "Square Brick 2", 
"Scarecrow", "Mailbox", "Flower Road", "Heart Road", "Barrel",
]], 


["nobilityname" , ["Civilian", "Baron", "Knight", "Count", "Bishop", "Duke", "Emperor"]], 

["NOBNAME" , ["class 3 Civilian", "class 2 Civilian", "class 1 Civilian", "class 3 Baron", "class 2 Baron", "class 1 Baron", "class 3 Knight", "class 2 Knight", "class 1 Knight", "class 3 Count", "class 2 Count", "class 1 Count", "class 3 Bishop", "class 2 Bishop", "class 1 Bishop", "class 3 Duke", "class 2 Duke", "class 1 Duke", "Emperor"]], 

["NOBNAME2", ["Civilian", "Civilian", "Civilian", "Baron", "Baron", "Baron", "Knight", "Knight", "Knight", "Count", "Count", "Count", "Bishop", "Bishop", "Bishop", "Duke", "Duke", "Duke", "Emperor"]], 

 ["PLANTNAME", ["Wheat", "Carrot", "Corn", "Pineapple", "Eggplant", "Tomato", "Green pepper", "Pumpkin", "Peach", "Watermelon", "Mango", "Strawberry"]], 

["STONENAME", ["Gravel", "Basalt", "Limestone", "Granite", "Mable", "Quartz"]], 

[ "WOONAME" , ["Maple", "Willow", "White poplar", "Sycamore", "Pine", "Oak"]], 

["GIFTNAME" , ["Lumber", "Sand", "Nail", "Rivet", "Red Brick", "Beam", "Door", "Plywood", "Macadam", "Black Brick", "Wooden Stake", "Steel Tube"]], 

["ENAME" , ["Fort Lv. 1", "Fort Lv. 2", "Fort Lv. 3", "Fort Lv. 4", "Fort Lv. 5", "Fort Lv. 6"]], 

 ["cardprename" , ["Snake", "Boar", "Wolf", "Bear", "Lion", "Dragon", "Snake king", "Boar king", "Wolf king", "Bear king", "Lion king", "Dragon king", "Nobility", "Moon Goddess", "Planting", "Business", "", "", "Friendship"]], 

["cardlevelname" , ["", " Lv. 1", " Lv. 2", " Lv. 3", " Lv. 4", " Lv. 5", " Medal"]], 

 ["BUILD_TAB_NAME", ["Houses", "Stores", "Resources", "Military", "Shrines", "Decorations", "Expand"]], 

 ["INVITE_STR", ["papaya games", "enjoy Miracle Empire with me", "come on to help me defeat enemies and build your own empire!", "Miracle Empire is a big, gorgeous SNS game. You can download from Android market, https://market.android.com/details?id=com.papaya.miracle"]]

]);

var Tasks = [
dict([["des", ["Build Farmland!", "Increase your crop yield with special farmland and by building the Harvest Goddess shrine.", "Build ordinary farmland."]], ["req", "build"], ["checknum", 1], ["lev", 3], ["pair", ["ground_id", 1]], ["reward", [200, 5, 0]], ["type", 0], ["id", 0]]),
dict([["des", ["Plant Wheat", "Increase your crop yield with special farmland and by building the Harvest Goddess shrine.", "Planting wheat.", "Hint: Tap on a free plot of farmland, then tap the Plant Icon and choose wheat"]], ["req", "planting"], ["checknum", 3], ["lev", 3], ["pair", ["object_id", 0, "type", 0]], ["reward", [300, 15, 0]], ["type", 0], ["id", 1]]),
dict([["des", ["Collect Taxes ", "You can collect higher tax revenue from higher level stores.", "Collect taxes from a bakery."]], ["req", "money"], ["checknum", 100], ["lev", 3], ["pair", ["bid", 0]], ["reward", [200, 15, 0]], ["type", 1], ["id", 2]]),
dict([["des", ["Check Territory Info", "It is wise to be familiar with your territory.", "Tap on your castle.", "Hint: tap on your castle to check your territory information"]], ["req", "dialog-territoryinfo"], ["checknum", 1], ["lev", 3], ["reward", [100, 5, 0]], ["type", 2], ["id", 3]]),
dict([["des", ["View Help!", "View help for some tips!", "View help!", "Hint: tap the Menu Icon, then tap the Help Icon"]], ["req", "dialog-help"], ["checknum", 1], ["lev", 3], ["reward", [100, 5, 0]], ["type", 2], ["id", 4]]),
dict([["des", ["Training Infantry!", "You can train soldiers to kill monsters attack other players, and protect your territory.", "Training infantry.", "Hint: tap free infantry camp first, then tap Infantry Icon"]], ["req", "soldiers"], ["checknum", 30], ["lev", 4], ["pair", ["btype", 0, "objtype", 0]], ["reward", [500, 20, 0]], ["type", 1], ["id", 5]]),
dict([["des", ["Defeat Monsters", "You can get cards and special materials by killing monsters.", "Defeat monsters.", "Hint: first tap the Map Icon, then choose one monster to attack"]], ["req", "defeatmonster"], ["checknum", 1], ["lev", 4], ["pair", []], ["reward", [500, 20, 0]], ["type", 0], ["id", 6]]),
dict([["des", ["Expand Your Territory", "Don't run out of space to build, buy more land to expand your territory!", "Expand your territory.", "Hint: tap the building dialog box, then tap the expand button on the right to choose your expansion type"]], ["req", "expand"], ["checknum", 1], ["lev", 4], ["pair", []], ["reward", [600, 20, 0]], ["type", 0], ["id", 7]]),
dict([["des", ["Visit Caesar's Territory", "Visit caesar's territory to gain rewards!", "Visit caesar's territory.", "Hint: tap Caesar's Icon in the friends list"]], ["req", "getfriend"], ["checknum", 1], ["lev", 5], ["pair", ["otherid", 0]], ["reward", [150, 5, 0]], ["type", 0], ["id", 8]]),
dict([["des", ["Add Friends", "Add a friend for more fun and more rewards, it's a social game!", "Add friends in circle.", "Hint: tap the friends list first, then tap the Circle Icon."]], ["req", "dialog-circle"], ["checknum", 1], ["lev", 5], ["reward", [700, 10, 0]], ["type", 2], ["id", 9]]),
dict([["des", ["Send Gift", "You can send free gifts to your friends.", "Send a gift.", "Hint: visit your friends' territories and tap the Gift Icon on the left to send them gifts"]], ["req", "selectgift"], ["checknum", 1], ["lev", 5], ["pair", ["askorgive", 0]], ["reward", [200, 10, 0]], ["type", 0], ["id", 10]]),
dict([["des", ["Request Gift", "Your friends can send free gift to you.", "Request a gift.", "Hint: visit your one of friends' territory and tap the Gift Icon on the left, choose a gift and ask for it."]], ["req", "selectgift"], ["checknum", 1], ["lev", 5], ["pair", ["askorgive", 1]], ["reward", [300, 10, 0]], ["type", 0], ["id", 11]]),
dict([["des", ["Open Treasure Chest!", "Friends can help you open treasure chests!", "Open the treasure chest.", "Hint: tap the treasure chest on the left, you can ask a friend for help. You can use caesar coins to open it."]], ["req", "completeopen"], ["checknum", 1], ["lev", 5], ["pair", []], ["reward", [500, 20, 0]], ["type", 0], ["id", 12]]),
dict([["des", ["Rate", "If you love our game, help us by rating it on Android Play!", "Rate miracle empire."]], ["checknum", 1], ["lev", 5], ["reward", [-10, 30, 0]], ["type", 3], ["id", 13]]),
dict([["des", ["Upgrade Cottage", "Upgrading buildings will increase production efficiency.", "Upgrade cottage.", "Hint: tap a cottage first and then tap the Upgrade Icon."]], ["req", "updatebuilding"], ["checknum", 1], ["lev", 6], ["pair", ["ground_id", 101]], ["reward", [500, 20, 0]], ["type", 0], ["id", 14]]),
dict([["des", ["Increase Population!", "Homes provide people with a place to live.", "Increase population.", "Hint: tap a free dwelling home, then tap the Recruit Icon."]], ["req", "person"], ["checknum", 50], ["lev", 6], ["pair", []], ["reward", [500, 30, 0]], ["type", 1], ["id", 15]]),
dict([["des", ["Build House", "Homes provide people with a place to live.", "Build a house."]], ["req", "build"], ["checknum", 2], ["lev", 6], ["pair", ["ground_id", 112]], ["reward", [400, 25, 0]], ["type", 0], ["id", 16]]),
dict([["des", ["Plant Carrots", "Increase your crop yield with special farmland and by building the Harvest Goddess shrine.", "Plant carrots."]], ["req", "planting"], ["checknum", 6], ["lev", 6], ["pair", ["object_id", 1, "type", 0]], ["reward", [600, 30, 0]], ["type", 0], ["id", 17]]),
dict([["des", ["Collect Taxes", "You can collect higher tax revenue from higher level stores!", "Collect taxes from normal butcher shop."]], ["req", "money"], ["checknum", 1500], ["lev", 6], ["pair", ["bid", 6]], ["reward", [800, 80, 1]], ["type", 1], ["id", 18]]),
dict([["des", ["Open Treasure Chest!", "Help your friends open treasure chest and get rewards.", "Open treasure chest of your friends.", "Hint: visit one of your friends' territory, tap the treasure Chest Icon."]], ["req", "helpopen"], ["checknum", 5], ["lev", 7], ["pair", []], ["reward", [1000, 25, 0]], ["type", 0], ["id", 25]]),
dict([["des", ["Invite Friends", "Add a friend for more fun and more rewards, it's a social game!", "Invite friends.", "Hint: Tap on your friends list and invite your friends on Papaya to play with you. You can also do this by tapping on the invite button in the menu."]], ["checknum", 3], ["lev", 7], ["reward", [2000, 50, 1]], ["type", 4], ["id", 26]]),
dict([["des", ["Plant Corn", "Increase your crop yield with special farmland and by building the Harvest Goddess shrine.", "Plant corn."]], ["req", "planting"], ["checknum", 4], ["lev", 8], ["pair", ["object_id", 2, "type", 0]], ["reward", [1200, 48, 1]], ["type", 0], ["id", 27]]),
dict([["des", ["Summon Goddess", "God and Goddess shrines can perform magic!", "Summon Harvest Goddess.", "Hint: tap the Building Icon, then tap the shrines tab to build the Harvest Goddess shrine."]], ["req", "build"], ["checknum", 1], ["lev", 8], ["pair", ["ground_id", 400]], ["reward", [1000, 40, 0]], ["type", 0], ["id", 28]]),
dict([["des", ["Perform Magic", "God and Goddess shrines can perform magic!", "Harvest Goddess performs magic."]], ["req", "godbless"], ["checknum", 1], ["lev", 8], ["pair", ["godtype", 0]], ["reward", [1000, 30, 1]], ["type", 0], ["id", 29]]),
dict([["des", ["Plant Pineapple", "Increase your crop yield with special farmland and by building the Harvest Goddess shrine.", "Plant pineapple."]], ["req", "planting"], ["checknum", 6], ["lev", 8], ["pair", ["object_id", 3, "type", 0]], ["reward", [1200, 36, 0]], ["type", 0], ["id", 30]]),
dict([["des", ["Build House", "Homes provide people with a place to live.", "Build a magical manor."]], ["req", "build"], ["checknum", 1], ["lev", 8], ["pair", ["ground_id", 160]], ["reward", [1000, 50, 1]], ["type", 0], ["id", 31]]),
dict([["des", ["Show Your Territory", "Take a screenshot of your territory and share it with your friends.", "Screenshot and share.", "Hint: tap the menu button and then tap the screenshot button."]], ["checknum", 1], ["lev", 8], ["reward", [800, 30, 0]], ["type", 5], ["id", 32]]),
dict([["des", ["Help Friends", "Help your friends remove pests from their farmland, and you will be rewarded.", "Eliminate negative state for friends.", "Hint: visit your friend's territory and help them kill worms, weed, repair and/or clean."]], ["checknum", 1], ["lev", 9], ["reward", [1200, 40, 0]], ["type", 6], ["id", 35]]),
dict([["des", ["Upgrade Bakery", "Advanced buildings will help facilitate the development of your territory!", "Upgrade a normal bakery."]], ["req", "updatebuilding"], ["checknum", 1], ["lev", 9], ["pair", ["ground_id", 301]], ["reward", [1000, 40, 0]], ["type", 0], ["id", 36]]),
dict([["des", ["Collect Taxes", "You can collect higher tax revenue from higher level stores.", "Collect taxes from bakery Lv. 2."]], ["req", "money"], ["checknum", 700], ["lev", 9], ["pair", ["bid", 1]], ["reward", [1500, 60, 0]], ["type", 1], ["id", 37]]),
dict([["des", ["Build Farmland", "Crystal farmland increases a crop's yield.", "Build crystal farmland."]], ["req", "build"], ["checknum", 2], ["lev", 10], ["pair", ["ground_id", 2]], ["reward", [2000, 100, 1]], ["type", 0], ["id", 38]]),
dict([["des", ["Build Lumber Mill", "Wood and stone are needed to upgrade your buildings and produce weapons.", "Build a lumber mill."]], ["req", "build"], ["checknum", 1], ["lev", 10], ["pair", ["ground_id", 5]], ["reward", [1500, 50, 0]], ["type", 0], ["id", 39]]),
dict([["des", ["Collect Maple Wood", "Wood and stone are needed to upgrade your buildings and produce weapons.", "Collect maple wood."]], ["req", "wood"], ["checknum", 30], ["lev", 10], ["pair", ["objid", 0]], ["reward", [1500, 60, 0]], ["type", 1], ["id", 40]]),
dict([["des", ["Invite Friends", "Add a friend for more fun and more rewards, it's a social game!", "Invite your friends to join.", "Hint: open your friends list and invite your friends, you can also tap the menu to invite."]], ["checknum", 5], ["lev", 10], ["reward", [3000, 70, 1]], ["type", 4], ["id", 41]]),
dict([["des", ["Charge", "You can get bonus rewards for recharging your caesar coins.", "Charge and get the rewards."]], ["req", "completepay"], ["checknum", 1], ["lev", 10], ["pair", []], ["reward", [1000, 200, 1]], ["type", 0], ["id", 42]]),
dict([["des", ["Build Brick Roads", "Beautifully decorating your territory will increase your overall population and magic capacity.", "Build brick roads."]], ["req", "build"], ["checknum", 6], ["lev", 11], ["pair", ["ground_id", 500]], ["reward", [600, 30, 0]], ["type", 0], ["id", 43]]),
dict([["des", ["Build a Flowerbed", "Beautifully decorating your territory will increase your overall population and magic capacity.", "Build a flowerbed."]], ["req", "build"], ["checknum", 6], ["lev", 11], ["pair", ["ground_id", 505]], ["reward", [600, 60, 0]], ["type", 0], ["id", 44]]),
dict([["des", ["Build Golden Roads", "Beautifully decorating your territory will increase your overall population and magic capacity.", "Build golden roads."]], ["req", "build"], ["checknum", 3], ["lev", 11], ["pair", ["ground_id", 504]], ["reward", [1800, 50, 1]], ["type", 0], ["id", 45]]),
dict([["des", ["Build Villa", "Homes provide people with a place to live.", "Build a villa."]], ["req", "build"], ["checknum", 2], ["lev", 11], ["pair", ["ground_id", 124]], ["reward", [1200, 30, 0]], ["type", 0], ["id", 46]]),
dict([["des", ["Build a Vine Lamp", "Beautifully decorating your territory will increase your overall population and magic capacity.", "Build a vine lamp."]], ["req", "build"], ["checknum", 1], ["lev", 11], ["pair", ["ground_id", 512]], ["reward", [1200, 30, 1]], ["type", 0], ["id", 47]]),
dict([["des", ["Build Magic Well", "Beautifully decorating your territory will increase your overall population and magic capacity.", "Build a magic well."]], ["req", "build"], ["checknum", 1], ["lev", 11], ["pair", ["ground_id", 520]], ["reward", [1200, 90, 1]], ["type", 0], ["id", 48]]),
dict([["des", ["Plant Eggplants", "Increase your crop yield with special farmland and by building the Harvest Goddess shrine.", "Plant eggplants."]], ["req", "planting"], ["checknum", 6], ["lev", 11], ["pair", ["object_id", 4, "type", 0]], ["reward", [1300, 100, 0]], ["type", 0], ["id", 49]]),
dict([["des", ["Plant Tomatoes", "Increase your crop yield with special farmland and by building the Harvest Goddess shrine.", "Plant tomatoes."]], ["req", "planting"], ["checknum", 6], ["lev", 11], ["pair", ["object_id", 5, "type", 0]], ["reward", [1300, 50, 1]], ["type", 0], ["id", 50]]),
dict([["des", ["Summon Goddess", "God and Goddess shrines can perform magic!", "Summon Liberty Goddess."]], ["req", "build"], ["checknum", 1], ["lev", 12], ["pair", ["ground_id", 401]], ["reward", [1500, 50, 0]], ["type", 0], ["id", 51]]),
dict([["des", ["Perform Magic", "God and Goddess shrines can perform magic!", "Liberty goddess performs magic."]], ["req", "godbless"], ["checknum", 1], ["lev", 12], ["pair", ["godtype", 1]], ["reward", [1100, 50, 1]], ["type", 0], ["id", 52]]),
dict([["des", ["Increase Population", "Homes provide people with a place to live. you need more people to have more soldiers.", "Increase your population."]], ["req", "person"], ["checknum", 100], ["lev", 12], ["pair", []], ["reward", [1500, 100, 0]], ["type", 1], ["id", 53]]),
dict([["des", ["Collect Taxes", "You can collect higher tax revenue from higher level stores.!", "Collect taxes from restaurant Lv. 1."]], ["req", "money"], ["checknum", 3000], ["lev", 12], ["pair", ["bid", 9]], ["reward", [1500, 70, 0]], ["type", 1], ["id", 54]]),
dict([["des", ["Build Cavalry Camp", "You can train soldiers to kill monsters attack other players, and protect your territory.", "Build a cavalry camp."]], ["req", "build"], ["checknum", 1], ["lev", 13], ["pair", ["ground_id", 203]], ["reward", [1800, 40, 0]], ["type", 0], ["id", 56]]),
dict([["des", ["Train Cavalries", "You can train soldiers to kill monsters attack other players, and protect your territory.", "Train cavalry Lv. 1."]], ["req", "soldiers"], ["checknum", 40], ["lev", 13], ["pair", ["btype", 1, "objtype", 0]], ["reward", [2000, 50, 0]], ["type", 1], ["id", 57]]),
dict([["des", ["Plant Green Pepper", "Special farmland, crops and Harvest Goddess can increase yield.", "Plant green pepper."]], ["req", "planting"], ["checknum", 6], ["lev", 13], ["pair", ["object_id", 6, "type", 0]], ["reward", [1800, 30, 0]], ["type", 0], ["id", 59]]),
dict([["des", ["Perform Magic", "God and Goddess shrines can perform magic!", "Harvest Goddess performs magic."]], ["req", "godbless"], ["checknum", 1], ["lev", 13], ["pair", ["godtype", 0]], ["reward", [1200, 50, 1]], ["type", 0], ["id", 60]]),
dict([["des", ["Upgrade Infantry Camp", "Advanced buildings will help facilitate the development of your territory!", "Upgrade an infantry camp Lv. 1."]], ["req", "updatebuilding"], ["checknum", 1], ["lev", 14], ["pair", ["ground_id", 201]], ["reward", [1800, 80, 0]], ["type", 0], ["id", 62]]),
dict([["des", ["Train Infantry Lv. 2", "You can train soldiers to kill monsters attack other players, and protect your territory.", "Train infantries.", "Hint: tap the intermediate infantry camp and choose the Infantry Icon."]], ["req", "soldiers"], ["checknum", 60], ["lev", 14], ["pair", ["btype", 0, "objtype", 1]], ["reward", [3000, 90, 0]], ["type", 1], ["id", 63]]),
dict([["des", ["Collect Taxes", "You can collect higher tax revenue from higher level stores.", "Collect taxes from book store Lv. 1."]], ["req", "money"], ["checknum", 6000], ["lev", 14], ["pair", ["bid", 15]], ["reward", [1800, 150, 1]], ["type", 1], ["id", 65]]),
dict([["des", ["Upgrade Magical Manor", "Advanced buildings will help facilitate the development of your territory!", "Upgrade a magical manor."]], ["req", "updatebuilding"], ["checknum", 1], ["lev", 14], ["pair", ["ground_id", 161]], ["reward", [2000, 200, 1]], ["type", 0], ["id", 66]]),
dict([["des", ["Build Mansion", "Homes provide people with a place to live. You need more people to have more soldiers.", "Build a mansion."]], ["req", "build"], ["checknum", 1], ["lev", 15], ["pair", ["ground_id", 136]], ["reward", [1500, 60, 0]], ["type", 0], ["id", 67]]),
dict([["des", ["Build Well", "Beautifully decorating your territory will increase your overall population and magic capacity.", "Build an ordinary well."]], ["req", "build"], ["checknum", 1], ["lev", 15], ["pair", ["ground_id", 519]], ["reward", [300, 15, 0]], ["type", 0], ["id", 68]]),
dict([["des", ["Collect Willow Wood", "Wood and stone are needed to upgrade your buildings and produce weapons.", "Collect willow wood."]], ["req", "wood"], ["checknum", 130], ["lev", 15], ["pair", ["objid", 1]], ["reward", [2100, 180, 0]], ["type", 1], ["id", 69]]),
dict([["des", ["Collect Taxes", "You can collect higher tax revenue from higher level stores.!", "Collect taxes from clinic Lv. 1."]], ["req", "money"], ["checknum", 5000], ["lev", 15], ["pair", ["bid", 12]], ["reward", [1500, 100, 0]], ["type", 1], ["id", 70]]),
dict([["des", ["Collect Taxes", "You can collect higher tax revenue from higher level stores.!", "Collect taxes from butcher shop Lv. 2."]], ["req", "money"], ["checknum", 3500], ["lev", 15], ["pair", ["bid", 7]], ["reward", [2500, 250, 1]], ["type", 1], ["id", 71]]),
dict([["des", ["Plant Pumpkins", "Increase your crop yield with special farmland and by building the Harvest Goddess shrine.", "Plant pumpkins."]], ["req", "planting"], ["checknum", 6], ["lev", 16], ["pair", ["object_id", 7, "type", 0]], ["reward", [1800, 96, 0]], ["type", 0], ["id", 72]]),
dict([["des", ["Summon God", "God and Goddess shrines can perform magic!", "Summon mars."]], ["req", "build"], ["checknum", 1], ["lev", 16], ["pair", ["ground_id", 403]], ["reward", [1600, 100, 0]], ["type", 0], ["id", 73]]),
dict([["des", ["Perform Magic", "God and Goddess shrines can perform magic!", "Mars performs magic."]], ["req", "godbless"], ["checknum", 1], ["lev", 16], ["pair", ["godtype", 3]], ["reward", [1300, 100, 1]], ["type", 0], ["id", 74]]),
dict([["des", ["Upgrade Shrine", "The magic power of higher level God or Goddess will be stronger!", "Upgrade a shrine of God or Goddess."]], ["req", "updatebuilding"], ["checknum", 1], ["lev", 16], ["pair", ["ground_id", 404]], ["reward", [4000, 250, 1]], ["type", 0], ["id", 75]]),
dict([["des", ["Build Flowers Decoration", "Beautifully decorating your territory will increase your overall population and magic capacity.", "Build flowers decoration."]], ["req", "build"], ["checknum", 3], ["lev", 17], ["pair", ["ground_id", 521]], ["reward", [900, 45, 0]], ["type", 0], ["id", 76]]),
dict([["des", ["Build Cherry Tree Decoration", "Beautifully decorating your territory will increase your overall population and magic capacity.", "Build cherry trees decoration."]], ["req", "build"], ["checknum", 3], ["lev", 17], ["pair", ["ground_id", 528]], ["reward", [2100, 100, 1]], ["type", 0], ["id", 77]]),
dict([["des", ["Collect White Poplar Wood", "Wood and stone are needed to upgrade your buildings and produce weapons.", "Collect white poplar wood."]], ["req", "wood"], ["checknum", 200], ["lev", 17], ["pair", ["objid", 2]], ["reward", [4000, 300, 1]], ["type", 1], ["id", 78]]),
dict([["des", ["Upgrade Mansion", "Advanced buildings will help facilitate the development of your territory!", "Upgrade a mansion to the highest level."]], ["req", "updatebuilding"], ["checknum", 1], ["lev", 17], ["pair", ["ground_id", 138]], ["reward", [2500, 98, 0]], ["type", 0], ["id", 79]]),
dict([["des", ["Invite Friends", "Add a friend for more fun and more rewards, it's a social game!", "Invite your friends to join.", "Hint: open your friends' list and invite the uninvited friends or tap invite button in menu."]], ["checknum", 3], ["lev", 17], ["reward", [5500, 155, 1]], ["type", 4], ["id", 80]]),
dict([["des", ["Build Quarry", "Wood and stone are needed to upgrade your buildings and produce weapons.", "Build a quarry."]], ["req", "build"], ["checknum", 1], ["lev", 18], ["pair", ["ground_id", 6]], ["reward", [2100, 56, 0]], ["type", 0], ["id", 81]]),
dict([["des", ["Collect Gravel", "Wood and stone are needed to upgrade your buildings and produce weapons.", "Collect gravel."]], ["req", "stone"], ["checknum", 50], ["lev", 18], ["pair", ["objid", 0]], ["reward", [2400, 120, 0]], ["type", 1], ["id", 82]]),
dict([["des", ["Upgrade Infantry Camp", "Advanced buildings will help facilitate the development of your territory!", "Upgrade a infantry camp Lv. 2."]], ["req", "updatebuilding"], ["checknum", 1], ["lev", 18], ["pair", ["ground_id", 202]], ["reward", [3000, 150, 0]], ["type", 0], ["id", 83]]),
dict([["des", ["Build Nepenthe Decoration", "Beautifully decorating your territory will increase your overall population and magic capacity.", "Build nepenthe decoration."]], ["req", "build"], ["checknum", 4], ["lev", 19], ["pair", ["ground_id", 524]], ["reward", [1200, 80, 0]], ["type", 0], ["id", 85]]),
dict([["des", ["Build Shrubbery Decoration", "Beautifully decorating your territory will increase your overall population and magic capacity.", "Build shrubbery decoration."]], ["req", "build"], ["checknum", 3], ["lev", 19], ["pair", ["ground_id", 532]], ["reward", [900, 60, 0]], ["type", 0], ["id", 86]]),
dict([["des", ["Build an Angel Statue", "Beautifully decorating your territory will increase your overall population and magic capacity.", "Build an angel statue."]], ["req", "build"], ["checknum", 1], ["lev", 19], ["pair", ["ground_id", 538]], ["reward", [2000, 100, 1]], ["type", 0], ["id", 87]]),
dict([["des", ["Upgrade Clinic", "Advanced buildings will help facilitate the development of your territory!", "Upgrade a clinic Lv. 1."]], ["req", "updatebuilding"], ["checknum", 1], ["lev", 19], ["pair", ["ground_id", 313]], ["reward", [3000, 100, 0]], ["type", 0], ["id", 88]]),
dict([["des", ["Build Farmland", "Gem farmland will increase your crop yield.", "Build a gem farmland."]], ["req", "build"], ["checknum", 4], ["lev", 20], ["pair", ["ground_id", 3]], ["reward", [4000, 200, 1]], ["type", 0], ["id", 89]]),
dict([["des", ["Plant Peaches", "Increase your crop yield with special farmland and by building the Harvest Goddess shrine.", "Plant peaches."]], ["req", "planting"], ["checknum", 3], ["lev", 20], ["pair", ["object_id", 8, "type", 0]], ["reward", [3000, 150, 1]], ["type", 0], ["id", 90]]),
dict([["des", ["Build Manor", "Homes provide people with a place to live. you need more people to have more soldiers.", "Build manor Lv. 2."]], ["req", "build"], ["checknum", 2], ["lev", 20], ["pair", ["ground_id", 148]], ["reward", [2100, 100, 0]], ["type", 0], ["id", 91]]),
dict([["des", ["Summon Goddess", "God and Goddess shrines can perform magic!", "Summon Wealth God Shrine."]], ["req", "build"], ["checknum", 1], ["lev", 20], ["pair", ["ground_id", 402]], ["reward", [2300, 130, 0]], ["type", 0], ["id", 92]]),
dict([["des", ["Perform Magic", "God and Goddess shrines can perform magic!", "Perform Wealth God's magic."]], ["req", "godbless"], ["checknum", 1], ["lev", 20], ["pair", ["godtype", 2]], ["reward", [1400, 100, 1]], ["type", 0], ["id", 93]]),
dict([["des", ["Collect Taxes", "You can collect higher tax revenue from higher level stores.!", "Collect taxes from clothing shop Lv. 1."]], ["req", "money"], ["checknum", 3500], ["lev", 21], ["pair", ["bid", 18]], ["reward", [2600, 150, 0]], ["type", 1], ["id", 94]]),
dict([["des", ["Collect Sycamore Wood", "Wood and stone are needed to upgrade your buildings and produce weapons.", "Collect sycamore wood."]], ["req", "wood"], ["checknum", 100], ["lev", 21], ["pair", ["objid", 3]], ["reward", [2700, 180, 0]], ["type", 1], ["id", 95]]),
dict([["des", ["Expand Territory", "Don't run out of space to build, buy more land to expand your territory!", "Expand your territory."]], ["req", "expand"], ["checknum", 1], ["lev", 21], ["pair", []], ["reward", [3000, 300, 0]], ["type", 0], ["id", 96]]),
dict([["des", ["Collect Taxes", "You can collect higher tax revenue from higher level stores.!", "Collect taxes from butcher shop Lv. 3."]], ["req", "money"], ["checknum", 6000], ["lev", 21], ["pair", ["bid", 8]], ["reward", [4000, 300, 1]], ["type", 1], ["id", 97]]),
dict([["des", ["Collect Basalt", "Wood and stone are needed to upgrade your buildings and produce weapons.", "Collect basalt."]], ["req", "stone"], ["checknum", 130], ["lev", 22], ["pair", ["objid", 1]], ["reward", [2800, 210, 0]], ["type", 1], ["id", 98]]),
dict([["des", ["Collect Taxes", "You can collect higher tax revenue from higher level stores.!", "Collect taxes from book store Lv. 2."]], ["req", "money"], ["checknum", 10000], ["lev", 22], ["pair", ["bid", 16]], ["reward", [4000, 280, 1]], ["type", 1], ["id", 99]]),
dict([["des", ["Plant Watermelon", "Increase your crop yield with special farmland and by building the Harvest Goddess shrine.", "Plant watermelon."]], ["req", "planting"], ["checknum", 6], ["lev", 23], ["pair", ["object_id", 9, "type", 0]], ["reward", [2900, 240, 0]], ["type", 0], ["id", 101]]),
dict([["des", ["Collect Taxes", "You can collect higher tax revenue from higher level stores.!", "Collect taxes from casino Lv. 1."]], ["req", "money"], ["checknum", 13000], ["lev", 24], ["pair", ["bid", 24]], ["reward", [4500, 350, 1]], ["type", 1], ["id", 103]]),
dict([["des", ["Collect Limestone", "Wood and stone are needed to upgrade your buildings and produce weapons.", "Collect limestone."]], ["req", "stone"], ["checknum", 200], ["lev", 24], ["pair", ["objid", 2]], ["reward", [4500, 350, 1]], ["type", 1], ["id", 104]]),
dict([["des", ["Build Maple Decoration", "Beautifully decorating your territory will increase your overall population and magic capacity.", "Build a maple tree decoration."]], ["req", "build"], ["checknum", 3], ["lev", 25], ["pair", ["ground_id", 535]], ["reward", [1400, 90, 1]], ["type", 0], ["id", 106]]),
dict([["des", ["Plant Strawberries", "Increase your crop yield with special farmland and by building the Harvest Goddess shrine.", "Plant strawberries."]], ["req", "planting"], ["checknum", 6], ["lev", 25], ["pair", ["object_id", 11, "type", 0]], ["reward", [5400, 420, 1]], ["type", 0], ["id", 107]]),
dict([["des", ["Collect Oak", "Wood and stone are needed to upgrade your buildings and produce weapons.", "Collect oak wood."]], ["req", "wood"], ["checknum", 300], ["lev", 25], ["pair", ["objid", 5]], ["reward", [5700, 420, 0]], ["type", 1], ["id", 108]]),
dict([["des", ["Plant Mangoes", "Increase your crop yield with special farmland and by building the Harvest Goddess shrine.", "Plant mangoes."]], ["req", "planting"], ["checknum", 6], ["lev", 26], ["pair", ["object_id", 10, "type", 0]], ["reward", [3300, 240, 1]], ["type", 0], ["id", 110]]),
dict([["des", ["Upgrade shrine", "The magic power of God or Goddess will be stronger!", "Upgrade a silver shrine of God or Goddess."]], ["req", "updatebuilding"], ["checknum", 1], ["lev", 26], ["pair", ["ground_id", 408]], ["reward", [4000, 450, 1]], ["type", 0], ["id", 111]]),
dict([["des", ["Upgrade Magical Manor", "Advanced buildings will help facilitate the development of your territory!", "Upgrade a magical manor Lv. 2."]], ["req", "updatebuilding"], ["checknum", 1], ["lev", 26], ["pair", ["ground_id", 162]], ["reward", [5000, 450, 0]], ["type", 0], ["id", 112]]),
dict([["des", ["Collect Granite", "Wood and stone are needed to upgrade your buildings and produce weapons.!", "Collect granite."]], ["req", "stone"], ["checknum", 100], ["lev", 27], ["pair", ["objid", 3]], ["reward", [3000, 300, 0]], ["type", 1], ["id", 113]]),
dict([["des", ["Upgrade Cavalry Camp", "Advanced buildings will help facilitate the development of your territory!", "Upgrade a cavalry camp Lv. 2."]], ["req", "updatebuilding"], ["checknum", 1], ["lev", 27], ["pair", ["ground_id", 205]], ["reward", [4000, 480, 1]], ["type", 0], ["id", 114]]),
dict([["des", ["Plant Corn", "Increase your crop yield with special farmland and by building the Harvest Goddess shrine.", "Plant corn on a plot of crystal farmland."]], ["req", "planting"], ["checknum", 6], ["lev", 27], ["pair", ["object_id", 2, "type", 0, "bid", 2]], ["reward", [4500, 500, 1]], ["type", 0], ["id", 115]]),
dict([["des", ["Collect Pine Trees", "Wood and stone are needed to upgrade your buildings and produce weapons.", "Collect pine trees."]], ["req", "wood"], ["checknum", 200], ["lev", 28], ["pair", ["objid", 4]], ["reward", [4200, 300, 0]], ["type", 1], ["id", 116]]),
dict([["des", ["Collect Taxes", "You can collect higher tax revenue from higher level stores.!", "Collect taxes from casino Lv. 2."]], ["req", "money"], ["checknum", 16000], ["lev", 28], ["pair", ["bid", 25]], ["reward", [5600, 480, 0]], ["type", 1], ["id", 117]]),
dict([["des", ["Collect Taxes", "You can collect higher tax revenue from higher level stores.!", "Collect taxes from book store Lv. 3."]], ["req", "money"], ["checknum", 15000], ["lev", 28], ["pair", ["bid", 17]], ["reward", [5600, 480, 1]], ["type", 1], ["id", 118]]),
dict([["des", ["Collect Taxes", "You can collect higher tax revenue from higher level stores.!", "Collect taxes from jewelers Lv. 1."]], ["req", "money"], ["checknum", 7000], ["lev", 29], ["pair", ["bid", 21]], ["reward", [4200, 300, 0]], ["type", 1], ["id", 119]]),
dict([["des", ["Plant Strawberries", "Wise man once said that magical strawberries can be harvested from this farmland!", "Plant strawberries on the gem farmland."]], ["req", "planting"], ["checknum", 6], ["lev", 29], ["pair", ["object_id", 11, "type", 0, "bid", 3]], ["reward", [6000, 500, 1]], ["type", 0], ["id", 120]]),
dict([["des", ["Collect Taxes", "You can collect higher tax revenue from higher level stores.!", "Collect taxes from casino Lv. 3."]], ["req", "money"], ["checknum", 22000], ["lev", 29], ["pair", ["bid", 26]], ["reward", [6000, 500, 1]], ["type", 1], ["id", 121]]),
dict([["des", ["Build Farmland", "Elf farmland can increase your crop yield.", "Build elf farmland."]], ["req", "build"], ["checknum", 4], ["lev", 30], ["pair", ["ground_id", 4]], ["reward", [6000, 500, 1]], ["type", 0], ["id", 122]]),
dict([["des", ["Collect Quartz", "Wood and stone are needed to upgrade your buildings and produce weapons.", "Collect quartz."]], ["req", "stone"], ["checknum", 300], ["lev", 30], ["pair", ["objid", 5]], ["reward", [6200, 480, 1]], ["type", 1], ["id", 123]]),
dict([["des", ["Collect Marble", "Wood and stone are needed to upgrade your buildings and produce weapons.", "Collect marble."]], ["req", "stone"], ["checknum", 200], ["lev", 30], ["pair", ["objid", 4]], ["reward", [4000, 320, 0]], ["type", 1], ["id", 124]]),
];

var WarTasks = [
dict([["des", ["Unlock War Mode", "Reach Lv. 6 to unlock war mode and fight with friends.", "You can unlock war mode to fight with friends.", "Unlock war mode", "Hint: tap on map, then tap War Mode."]], ["req", "warinfo"], ["checknum", 1], ["pair", []], ["reward", [5000, 10, 0]], ["type", 0], ["id", 0]]),
dict([["des", ["View Help", "Learn more about war mode by checking out the help document.", "View HELP document about war."]], ["req", "dialog-help"], ["checknum", 1], ["reward", [100, 5, 0]], ["type", 2], ["id", 1]]),
dict([["des", ["Ally With Friends", "Ally with some friends, and they can help you by providing you with soldiers during a battle.", "Become allies with a friend."]], ["req", "makeally"], ["checknum", 1], ["pair", []], ["reward", [500, 10, 0]], ["type", 0], ["id", 2]]),
dict([["des", ["Increase Defense", "Tap on your castle and tap the [+]  button to upgrade your castle wall's defense.", "Add 100 defense.", "Hint: you must enable War Mode."]], ["req", "adddefence"], ["checknum", 100], ["reward", [1000, 15, 0]], ["type", 3], ["id", 3]]),
dict([["des", ["Build Scout Camp", "Scout camps are used to train scouts.", "Build scout camp Lv. 1."]], ["req", "build"], ["checknum", 1], ["pair", ["ground_id", 206]], ["reward", [500, 8, 0]], ["type", 0], ["id", 4]]),
dict([["des", ["Train Scout", "Be prepared for battle, spy on your enemies to learn more about them!", "Train scout Lv. 1."]], ["req", "soldiers"], ["checknum", 9], ["pair", ["byte", 2, "objtype", 0]], ["reward", [800, 10, 0]], ["type", 1], ["id", 5]]),
dict([["des", ["Detect Enemy", "If you want to win, it's better to know your enemy!", "Detect enemy."]], ["req", "detect"], ["checknum", 1], ["pair", []], ["reward", [300, 7, 0]], ["type", 0], ["id", 6]]),
dict([["des", ["Attack Enemy", "Defeating enemies will bring you more money, glory, and fame!", "Attack enemy."]], ["req", "attack"], ["checknum", 1], ["pair", []], ["reward", [1000, 10, 0]], ["type", 0], ["id", 7]]),
dict([["des", ["Increase Ally Capacity", "You can increase your ally capacity to have more allies.", "Increase ally capacity."]], ["req", "addallyupbound"], ["checknum", 1], ["pair", []], ["reward", [1500, 20, 0]], ["type", 0], ["id", 8]]),
dict([["des", ["Upgrade Nobility Ranking", "Higher nobility will allow you to have more rights.", "Upgrade nobility."]], ["req", "dialog-nobility"], ["checknum", 1], ["pair", []], ["reward", [2000, 25, 0]], ["type", 2], ["id", 9]]),
dict([["des", ["Upgrade Map", "If you defeat enough enemies, you can start fighting on a higher level map.", "Go to a higher level map."]], ["req", "upgrademap"], ["checknum", 1], ["pair", []], ["reward", [2000, 25, 0]], ["type", 0], ["id", 10]]),
];


var Statics = 
[
"Reach to Lv. 6 to unlock War Mode", 
"Once you have activated War Mode, you can't quit it, please read the HELP documentation for more information.", 
"Congrats, you won!", 
"Sorry, you were defeated.", 
"[ENAME] is too powerful, strengthen your military power and fight another day!", 
"Congrats! you have defeated [ENAME], go on fighting and gain glory!", 
"How to add power", 
"[USERNAME] has entered a new map. Let's build our own Miracle Empire with [USERNAME]!", 
"[USERNAME] has upgraded to [NOBNAME]. Let's build our own Miracle Empire with [USERNAME]!", 
"[USERNAME] has gotten more territory. Let's build our own Miracle Empire with [USERNAME]!", 
"[USERNAME] has defeated the invaders. Let's build our own Miracle Empire with [USERNAME]!", 
"[USERNAME] has been defeated by [ENAME]. Let's go and get revenge for [USERNAME]!", 
"[USERNAME]'s army has been defeated, gather your troops and help [USERNAME] out!", 
"[USERNAME] has defeated [ENAME]. Let's build our own Miracle Empire with [USERNAME]!", 
"You must reach Lv. 15 to unlock one-step finishing", 
"Sorry, you don't have spare farmland for one-step finishing", 
"Sorry, your crops are growing, please try again later", 
"[WHO] must reach [NUM] to upgrade your [TYPE] to the next level.!", 
"[WHO] needs to defeated [NUM] more opponents to upgrade to [CARD]", 
"Your stores are still in production, please try again later", 
"You can get a monster shrine for free after you have upgraded your monster card to violet gold level", 
"Sorry, the space room is developing; you can get it for free at Lv. 5 with a Moon Goddess card.", 
"You can use one-step harvesting and one-step seeding when you upgrade the Harvest Goddess to violet level", 
"Upgrade the Wealth God shrine to violet golden level to use one-step collecting", 
"Sorry, you have already visited all of your friends' castles!", 
"Your dragon will become stronger if you train it every day!", 
"You have visited [NUM] friends and got [MONEY] coins", 
"Upgrade the Friendship God to violet golden level", 
"You need [NUM] more friends", 
"You need to open [NUM] more treasure chest for your friends", 
"You need to feed your friends' dragons [NUM] more times", 
"You need to reach level [NUM]", 
"You can use one-step visiting from now on!", 
"[NAME] has shared an imperial screenshot, let's take a look!", 
"", 
NewsURL, 
//"You can feed your dragon once a day, friends can help you feed it. Not feeding your dragon will harm its development!", 
"You need to feed your dragon every day. Friends can help feed it too. Letting your dragon go hungry will hurts its development.",
"This dragon is going to hatch soon, feed it once it hatches!", 
"You can only feed a dragon once a day!", 
"[NAME]'s dragon has been fed by [NUM] friends, thanks for helping!",
];


const darkColorAlpha = 65;
const AutoPop = 1;
const NonAutoPop = 0;
const NotAdd = 2;
const NewQuit = 3;


const NewPop = -999;
const DownLoadPop = -2000;
const NewQuitPop = -5000;
const FinBuyPay = -11000;
const ShowDownYet = -10000;
const DownWarn = -2000;
const UseCata = -3000;
const NoCata = -3001;
const DiskShare = -4000;
const RankFri = -6000;


const FeedMoney = 100;
const OpenMoney = 100;

const InCastalPage = 0;
const screenWidth = 800;
const screenHeight = 450;


const DownWarPic = 0;
const DownPetPic = 1;
const DownAllPic = 2;
const DownAniPic = 3;
const DownMusic = 4;


const NotDownload = -1;
const AttWithCata = 100;
const AttNoCata = 101;


const ManaChargeTime = 300000;
const AddDefCae = 25;
const AddDefCoin = 50;
const AddDefFood = 5;

const GenVisMana = 25;
const AccVisMana = 33;

const OneKeyMana = 10;
const ChargeMana = 4;

const CallDragon = 1000;




const Tips = dict([
[3, "Night mode begins everyday at 8 pm. Having lamps and other light decorations will come in handy then. You can toggle night mode under the settings option."], 
[4, "Tap on your castle to see your territory's info. Here you can view your attack power, special articles, magic, resources, etc."], 
[5, "Decorations are great for your empire! They can increase your population and magic capacity too!"], 

[6, "You can unlock war mode. Now you can attack other players. Be careful, once you unlock war mode there is no turning back."], 
[7, "Want to get more silver and/or free caesar coins? Tap the FAQ button."], 
[8, "You can build the Harvest Goddess shrine now! The shrine can perform magic that will increase your crop yield as well as one-step harvesting and planting."], 
[9, "Build the Dragon Wheel and then use the Dragon Stone to get FREE caesar coins."], 

[10, "You can build a dragon nest now. A dragon nest will allow you to raise a pet dragon. When it reaches adulthood, it can help you fight in battles."], 
[11, "Build a lumber mill. Wood is a necessary resource for upgrading buildings."], 
[12, "Build the Population Goddess shrine! She can perform magic that increases your population recruitment number."], 
[13, "Tip: You will be given silver coins as a reward, and you will have a higher probability of winning!"], 

[14, "Cavalry is faster than infantry."], 

[15, "Castle defense work as a shield for your soldiers. Others can just break your shield, but can't kill your soldiers!"], 

[16, "Build the War God shrine! He can perform magic that will increase your ATK power during battles."], 
[17, "You will get many silver coins and dragon stones as rewards when you upgrade to higher level."],

[18, "Build a stone quarry. Stone is necessary to upgrade buildings."], 
[19, "There are forts scatter around the world map. When you occupy a fort it will produce resources for you every hour."], 
[20, "You can upgrade your castle to Lv. 2! Upgrading will increase your magic capacity by 5, and your population capacity by 100."], 
[21, "Build the Wealth God shrine! He can perform magic that will increase the taxes that you collect from your shops."], 
[24, "Build a workshop! Workshops produce military weapons."], 
[30, "You can upgrade your castle to Lv. 3! Upgrading will increase your magic capacity by 5, and your population capacity by 100."], 
[31, "Build the Beast God shrine! He can perform magic that will increase the defense of your castle."]

]);

