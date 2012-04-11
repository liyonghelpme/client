//const RateURL = "http://papayamobile.com/a/mr?p=com.papaya.miracle_beta1&referrer=in_game_rating";
const RateURL = "market://details?id=com.papaya.miracle1";
const NewsURL = "market://details?id=com.papaya.miracle1";
//const NewsURL = "http://papayamobile.com/a/mr?p=com.papaya.miracle_beta1&referrer=in_game_rating";

var Others = dict([
["SPYITEMS", ["win: ", "fight: ", "soldier force: ", "ally force: ", "defense: "]], 

["items" , []], //update News information
["timestr", ["1 hour", "6 hours", "24 hours"]], 

["ganname1", ["You can only send every friend one gift per day", 
        "You can ask for gift from every friend once a day"]], 

["btname1", ["Delay", "Refresh"]], 

["timestr1", ["2 hours", "8 hours", "24 hours"]], 

["newupdate1", ["Your territory change to night mode from 8 p.m to 6 a.m automatically. Tap menu button->night scene to close"]], 

["godstr", [
    "crops yield increase 20%", "population recruited increase 20%", "tax from stores increase 20%", "Soldier's ATK increase 5%", 
    "crops yield increase 40%", "population recruited increase 40%", "tax from stores increase 40%", "Soldier's ATK increase 10%", 
    "crops yield increase 60%", "population recruited increase 60%", "tax from stores increase 60%", "Soldier's ATK increase 15%", 
    "crops yield increase 80%", "population recruited increase 80%", "tax from stores increase 80%", "Soldier's ATK increase 20%", 
    "crops yield increase 100%", "population recruited increase 100%", "tax from stores increase 100%", "Soldier's ATK increase 25%", 
    "get 5 more coins for visiting friends", "get 10 more coins for visiting friends", "get 20 more coins for visiting friends", "get 30 more coins for visiting friends", "get 50 more coins for visiting friends", 
    "the statue of monsters will strengthen the defense", "the statue of monsters will strengthen the defense", "the statue of monsters will strengthen the defense", "the statue of monsters will strengthen the defense", "the statue of monsters will strengthen the defense"]], 

["newstr", [
"{'cp': [400, 300], 'cz': [120, 120], 'gtype': 0, 'posi': [17, 8], 'cmd': 'select', 'param': 0, 'tp': [600, 140], 'text': \"Your people need food, tap on the idle farmland.\"}",   
"{'cp': [328, 288], 'cz': [120, 120], 'gtype': 0, 'posi': [17, 8], 'cmd': 'bttap', 'param': 0, 'tp': [600, 140], 'text': ' Tap the plant icon.'}",   
"{'cp': [209, 181], 'cz': [240, 240], 'type': 1, 'posi': [17, 8], 'cmd': 'state2over', 'param': 0, 'tp': [600, 140], 'text': 'Plant your first crop by tapping on wheat.'}",   
"{'cp': [400, 300], 'cz': [120, 120], 'gtype': 0, 'posi': [17, 8], 'cmd': 'select', 'param': 0, 'tp': [600, 140], 'text': \"It takes time to grow crops, but we can accelerate growth time, start by tapping on the busy farmland.\"}",   
"{'cp': [328, 288], 'cz': [120, 120], 'gtype': 0, 'posi': [17, 8], 'cmd': 'bttap', 'param': 0, 'tp': [600, 140], 'text': 'Tap the clock.'}",   
"{'cp': [314, 342], 'cz': [160, 60], 'gtype': 0, 'posi': [17, 8], 'cmd': 'speed', 'param': 0, 'tp': [600, 140], 'text': \"Tap Speed Up to accelerate your crop\'s growth\"}",   
"{'cp': [400, 300], 'cz': [120, 120], 'gtype': 0, 'posi': [17, 8], 'cmd': 'state4over', 'param': 0, 'tp': [600, 140], 'text': 'Harvest wheat.'}",   

"", 

"{'gtype': 2, 'posi': [17, 8], 'cmd': 'harvest', 'param': 0, 'tp': [400, 240], 'text': 'Task one completed+500+1+4+ Next step + Agriculture related task completed!'}",   
"{'cp': [35, 435], 'cz': [80, 80], 'gtype': 1, 'posi': [14, 13], 'cmd': 'mtap', 'param': 4, 'tp': [200, 140], 'text': \"An empire needs people to construct buildings and become soldiers. Build home for people to live in. Tap on the Build Icon.\"}",   
"{'cp': [100, 250], 'cz': [160, 280], 'gtype': 1, 'posi': [14, 13], 'cmd': 'pop', 'param': 2100, 'mp': [400, 240], 'tp': [400, 140], 'text': ' Tap cottage '}",   
"{'cp': [445, 75], 'cz': [80, 80], 'gtype': 0, 'posi': [14, 13], 'cmd': 'build', 'param': 1, 'mp': [400, 180], 'tp': [600, 340], 'text': \"Choose a plot of land to build it and tap yes when ready.\"}", 
"{'cp': [400, 300], 'cz': [120, 120], 'gtype': 0, 'posi': [14, 15], 'cmd': 'state4over', 'param': 0, 'tp': [600, 140], 'text': 'People have already moved into this home. Tap on the cottage to recruit them for work.'}",   
"{'cp': [400, 300], 'cz': [120, 120], 'gtype': 0, 'posi': [14, 15], 'cmd': 'select', 'param': 0, 'tp': [600, 140], 'text': 'Tap on an empty cottage.'}",    
"{'cp': [328, 288], 'cz': [120, 120], 'gtype': 0, 'posi': [14, 15], 'cmd': 'state2over', 'param': 1, 'tp': [600, 140], 'text': 'Tap the recruit icon'}",   
"{'cp': [400, 300], 'cz': [160, 160], 'gtype': 0, 'posi': [14, 10], 'cmd': 'state4over', 'param': 0, 'tp': [600, 140], 'text': 'Your cottage has recruited people, but your empire is also going to need money. Tap on bakery to collect tax from it.'}",   

"", 

"{'gtype': 2, 'posi': [14, 10], 'cmd': 'state4over', 'param': 0, 'tp': [400, 240], 'text': 'Task Two completed+1500+2+10+ Next step +You have recruited people and collected taxes.'}",   
"{'cp': [106, 435], 'cz': [80, 80], 'gtype': 5, 'posi': [14, 10], 'cmd': 'mtap', 'param': 5, 'tp': [200, 140], 'text': 'There are monsters pillaging your crops. Kill them and protect your territory.'}",   
"{'cp': [177, 435], 'cz': [80, 80], 'gtype': 5, 'posi': [14, 10], 'cmd': 'mtap', 'param': 2, 'tp': [200, 140], 'text': \"Tap on the map to see what's going on around you.\"}",   
"{'cp': [650, 360], 'cz': [120, 120], 'gtype': 4, 'posi': 0, 'cmd': 'monster', 'param': 15, 'tp': [600, 140], 'mp': [650, 360], 'text': 'Tap on the monster to attack it.'}",   
"{'cp': [310, 386], 'cz': [160, 80], 'gtype': 5, 'posi': 0, 'cmd': 'attack', 'param': 1, 'tp': [200, 140], 'mp': [650, 360], 'text': 'Tap attack'}",   
"{'cp': [450, 360], 'cz': [120, 120], 'gtype': 4, 'posi': 0, 'cmd': 'goback', 'tp': [600, 140], 'mp': [650, 360], 'text': 'Congrats, you won! tap on your castle to return to your territory.'}, ",    
"{'cp': [120, 40], 'cz': [240, 80], 'gtype': 0, 'posi': [14, 10], 'cmd': 'rename', 'param': 0, 'tp': [600, 340], 'text': 'Let everyone know whose territory this is. Give your empire a name!'}",   

"", 

"{'gtype': 2, 'posi': [14, 10], 'cmd': 'state4over', 'param': 0, 'tp': [400, 240], 'text': \"Novice task completed +2000+3+15+Ok+Congrats!You\'re on your way to becoming a great emperor!\"}"]]

]);

var Dicts = 
[
["build_defence_format", "Building a [BUILD] will add [DEFENCE] to castle defense, are you sure you want to build it?"], 

["money", "silver coins"], ["caesars", "caesar coins"], ["food", "food"], ["labor", "Idle population"], ["person", "population"], ["stone", "stone"], ["wood", "wood"], ["caesar", "Caesar"], 

["share", "Share"], ["back", "Back"], ["change", "Done"], ["send", "Send"], ["cancel", "Cancel"], ["system", "System"], ["devine", "Activate"], ["retry", "Retry"], ["help", "Help"], ["close", "Close"], ["openbox", "Open"], ["askforhelp", "Ask friend"], 

["loading_str", "loading..."], ["self", "me"], 

["request_done", "Request handled"], 

["friend_notload", "Sorry, can't retrieve your friend list"], 
["friend_ally_notice", "You can visit your friend and ally with them. Allies can help you fight!"], 
["friend_invite", "Come create miracles with me!"], ["friend_invite_success", "Invited successfully!"], 

["nest_style_cannotchange", "Your dragon is growing, you can't change your dragon type now!"], 

["nest_talk_morning", "Hey, what a great day today!"], 
["nest_talk_noon", "Hey, I'm hungry, feed me!"], 
["nest_talk_night", "Good night, early to bed, early to rise"], 

["nest_talk_other", "I need to train to become stronger. Train with me now."], 

["nest_talk_feedover", "I've eaten enough, thanks"], 
["nest_talk_notfeedover", "I'm hungry, feed me!"], 

["nest_talk_sleep", "I'm still a growing dragon! I can't fly until I reach 285!"], 

["nest_getup_1", "Your dragon egg has successfully hatched!"], 
["nest_getup_2", "Your baby dragon has grown up."], 

["nest_getup_format", "[NAME][DESCRIBE]'s current growing point is: [HEALTH], property: [PROPERTY], ATK: [ATTACK]"], 

["nest_pet_name", "Enter your pet's name: "], 

["nest_pet_name_warning", "Warning: You can't change your dragon's name."], 

["nest_gotohelp", "Check the HELP document for more information on how to raise your dragon"], 

["box_str_1", "Help me open this treasure chest please!"],
["box_str_2", "Let's share the treasure!"],
["box_str_3", "You found a treasure chest, ask friends to help you open it."], 

["god_bless_over", "You have already performed magic!"], 

["share_format", "[NAME][DESCRIBE], Come on! join [NAME] and build your own Miracle Empire together!"], 

["share_box_format", "[NAME] has received a mysterious treasure chest but can't open it without your help!"], 

["share_petup_1", "You have raised your dragon successfully"], 
["share_petup_2", "'s baby dragon has grown up"], 

["share_openbox", " opened one special treasure chest"], 

["default_petname", "my pet"], 

["news_nonews", "No more news"], 

["news_element0", "<b>[NAME]<b> visited your land"], 

["news_element1", "<b>[NAME]<b> helped you manage your castle"], 

["news_element2", "<b>[NAME]<b> sent you a gift."], 

["news_element3", " You defeat <b>[NAME]<b>"], 

["news_element4", "<b>[NAME]<b> defeated you"], 

["news_element5", "<b>[NAME]<b> helped you open a treasure chest."], 

["news_element6", "<b>[NAME]<b> helped you feed your pet"], 

["gift_element0", "[NAME] sent you a gift: [GIFT]"], 

["gift_element1", "[NAME] ask you for a gift: [GIFT]"], 

["monster_foodwilllost", "Kill the monsters before your next login, otherwise they will steal your crops!"], 

["monster_refresh_format", "Hey, [NAME], give me your crops, or there will be hell to pay."], 

["warrecord_notice_format", "There are [NUM] wars going on right now, would you like to watch?"], 

["war_newmap_notice", "Congrats! you entered a new map. Hint: there are more powerful players on this map"], 

["spy_notice", "Tip: Higher level scouts will find more details."], 

["chat_empty", "Content can't be empty"], 
["chat_wordlimit", "Content must be less than 30 characters."], 
["chat_nettimeout", "Could not connect to the game server. Please try again later."], 

["text_wordlimit_format", "Limit [NUM] words!"], 
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

["onekey_plant", "One-step planting"], ["onekey_harvest", "One-step harvesting"], ["onekey_product", "One-step collect taxes"], ["onekey_visit_normal", "One-step ordinary visit"], ["onekey_visit_inc", "One-step accumulated visit"], ["onekey_title", "One-step operation"], 

["onekey_gotohelp", "How to use it?"], 

["tab_fighting", "Wars"], ["tab_attackable", "Castles"], 

["tab_fortress", "Forts"],

["nobattle_fail_whenhasattack", "Sorry, you can't enable protect mode while attacking"], 

["nobattle_whenattack", "Attacking will end protect mode"], 
["attack_whenattacked", "You are already attacking that person"], 
["attack_whenupdated", "Sorry, that player has gone to new map"], 
["attack_whenwon", "You have already conquered that castle."], 
["attack_cancel", "Do you really want to cancel this battle?"], 
["attack_time", "Time"], 
["attacktime_notice", "*More cavalry results in a shoter march time"], 
["attacktime", "Time"], 
["state_attacking", "Attacking..."], 
["state_defencing", "Defending..."], 
["state_fighting", "Fighting..."], 
["state_adding", "Sending soldiers..."], 

["net_state_1", "Could not connect to the game server. Please try again later."], 
["net_state_2", "Could not connect to the game server. Please try again later."], 

//conquered by
["master", "Conquered by: "], [": ", ": "], 
["user_notoccupy", "Unconquered"], ["user_occupy", "Free"], ["user_protected", "In protect"], ["user_fighting", "Fighting"], ["user_attacking", "marching..."], 
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
["allyOk", "You will be reinforced from your allies when you are at war. You need caesar coins to destroy the covenant, choose ally carefully"], 
["cancelAlly", "Do you want to cancel alliance with "], 
["makeAlly", "Ally"], 
["punish", "Punishment"], 
["allyUp", "You've reached your maximum number of allies."], 
["add", "Add"], ["close", "Close"], 

["addAlly", "Add an ally"], ["attackNow", "Your army is on the way"], 
["HintPower", "Hint: your army's ATK will increase if you are on line"], 
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
["buyCaesar", "Buy caesar coins"], 
["fulfill", "The Harvest Goddess can increase the crop yield by performing magic"],
["population", "The Liberty Goddess can increase the number of people you can recruit by performing magic"], 
["war", "The War God can strenthen your soldiers' ATK by performing magic"], 
["beast", "The Beast God will increase your defense by performing magic"], 

["dragon", "You can summon your own pet after building a Dragon Nest."], 
["godBless", "[GOD] can perform magic, are you sure you want to summon [GOD]?"], 
["call", "Summon"], ["coin", "coin"], ["freePeople", "idle people"], ["food", "food"], 
["zijin", "Your magic capacity will increase by 1 when you level up."], 
["freeZijin", "Your magic capacity will increase by 1 when you level up."], 
["youGet", "Congrats, you got the [NAME] card! [END]"], 
["youPost", "[NAME] got [CARD] [CARDLEV] card, join [NAME] to build your own Miracle Empire!"], 
["loading", "Loading..."], ["noNews", "No messages"], ["loginBonus", "[NAME] has played the Miracle Empire and has gained daily rewards"], 
["godShow", "Magic"], ["inGodShow", ""], 
["show", "Perform"], 
["friend", "Friends"], 
["level", "Lev"], 
["expandOver", "Congrats, you've just acquired more land!"], 
["expandPost", "[NAME] has acquired more territory, come join and start building your Miracle Empire!"], 
["feedback", "If you have any advice of feedback, please email"], 
["feedGift", "You will get special gifts if we listen to your advice."], 
["sendGift", "Choose a gift for <g>"], 
["ask", "Request"], 
["send", "Send"], 
["accept", "Accept"], 
["levelUp", "[NAME] has level up to [LEVEL], play Miracle Empire and enjoy!"], 
["killAll", "[NAME] has defeated territory threatening monsters, play Miracle Empire and have fun!"], 
["nextMonster", "Next attack: "], 
["comeSoon", "Coming soon"], 
//["goInNewMap", ", you will find more powerful players on a higher level map."], 
["NobUp", "Congrats! You've become a "], 
["attackIs", "ATK: "], 
["powerlack", "You don't have enough ATK!"], 
["monRob", "Monsters have robbed [FOOD] crops"], 
["active", "Active"], 
["activeDra", "Will you help me activate it?"], 
["letsShare", "Let's share the treasure!"],
["askForAct", "Ask friends for help!"], 
["helpMe", "Help"], 
["askFri", "Ask help"], 
["unknown", "Unknown"], 
["getDragon", "has built a Dragon's Nest but needs your help to activate it!"], 
["callPet", "Congrats! You have activated your Dragon's Nest, now you can summon your pet!"],
["myPet", "my pet"], 
["dragonPost", "[NAME]'s Dragon's Nest has been activated successfully, play Miracle Empire and have fun!"], 
["curPet", "current pet"], 
["changeMode", "change mode"], 
["petAtt", "A [NAME]'s ATK will increase by [POWER] for every growing point, are you sure you want to change the dragon's type?"], 
["freeFee", "for free"], 
["changeAtt", "Change attribute"], 
["petPro", "[NAME]'s basic ATK is [POWER], every growing point adds [ADD] ATK. Do you want to change the dragon's type?"], 
["spy_result_format", "You lost [NUM] scouts getting [WHO]'s castle info: "], 
["spy_result2_noenemy", "There is no army attacking this castle now."], 
["spy_result2_format", "There are [NUM] army marching to attack the castle, the first one will arrive at [TIME]."], 
["spy_result2_mode3_format", "Total ATK [NUM]"], 

["choosePet", "Choose Pet"], 
["callDragonDia", "[NAME]'s basic ATK is [POWER], every growing point add [ADD] ATK. Do you want to summon?"], 
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
["oneLevel", ". Continue to defeat more enemies to reach a higher rank!"], 
["next", "Next"], 
["choosePlant", "Choose Crop"], ["sureToBuy", "Do you want to purchase [NAME]?"], ["acc", "SpeedUp"], 
["leftTime", "Time left "], 
["noBattle", "War mode not enabled"], 
["winNum", "wins"], 
["netRefresh", "Could not connect to the game server. Please try again later."], ["fresh", "refresh"], 

["fightAdd", "Hint: soldiers have extra ATK in fortress"], 
["peopUp", " pop capacity"], 
["sureTosell", "Are you sure you want to sell [NAME]?"], 
["sell", "Sell"], 
["toDetect", "Spy on enemies"], 
["unitPower", "Strength per unit"], 
["chooseStone", "Choose stone"], 
["noUpdate", "No new update"], 
["visitReward", "[NAME] has got the rewards of visiting friends, join the Miracle Empire and have fun!"], 
["yourArmy", "Your military has arrived [NAME]'s territory, war is near!"], 
["enemyArmy", "[NAME]'s military has arrived your territory, let's get ready for the fight!"], 
["viewWar", "watching"], 
["skip", "Skip"], 
["sendArmy", "<g>+ has send his army to attack your territory"], 

["godInc", "Hint: your enemy's soldier's ATK will increase a regular porpotion +<b> <b>"], 

["howDef", "*How to strengthen defense"], 
["youNeed", "You need more"], 
["speNeed", "Not enough special materials."], 
["clearList", "Hint: this list will be emptied in new battlefield."], 
["reqHandle", "Requests handled"], 
["income", "Congrats! You have [NUM] colonies, they give you [COIN] coins as tribute."], 
["incomePost", "[NAME] has gained tribute rewards from colonies, join the Miracle Empire and have fun"], 
["chooseWood", "Choose lumber"], 
["youNeed", "You still lack "], ["speNeed", "Need more special materials"], 
["fullfilMana", "Refill magic"], ["fullfil", "Refill"], ["curMana", "Magic Value"],
["nextTime", "next charge time "], 

["You", "You"], ["StillNeed", " still need "], 

["MonsterLevUp", "You still need to defeat [NUM] more [NAME] to get the [NAME] Lv. [LEV] card. Your magic capacity will increase by 2 when you get the [NAME] Lv. 5 card."], 

["MonsterCardGet", " your magic capacity will increase by 2 when you get the Lv. 5 card."], 

["ChangELevUp", "You still need [DAY] continuous logins to get Moon Goddess Lv. [LEV], and your magic capacity will increase by 1"], 
["OtherCardLevUp", ""], 
["NobCard", "[WHO] needs to defeated [NUM] more opponents to upgrade to [CARD]"], 

["BusiCard", "Get [NUM] silver coins to upgrade your [TYPE] to the next level. Your magic capacity will increase by 1 when you level up!"], 

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
["PlantingCard", "Planting Card"], ["BusinessCard", "Business Card"], 
["Download", "Downloading"], 
["LackMagic", "Not enough magic, recharge now?  Tips: magic recharges 1 point every 5 minutes."], 
["LackMaCap", "Sorry, you don't have enough magic capacity. You can buy some decors to increase it."],
["LackCae", "Sorry, you don't have enough caesar coins. Purchase caesar coins now?"],
["infpower", "Infantry: "], 
["cavpower", "Cavalry: "], 
["addsoldier", "Reinforce"], 
["minussoldier", "Withdraw"], 
["getresource", "Collect"], 
["quickSendArmy", "SpeedUp"], 
["LevelNot", "Sorry, you need to reach Lv. [LEVEL] to upgrade your castle."], 
["EmpireNotOpen", "Sorry, higher level castle is not opened."], 
["sendCatapult", "Dispatch"], 
["notSendCata", "No"], 
["petNeedDownload", "Summon pet requires you to download pictures, proceed?"], 
["warNeedDownload", "Entering war map requires you to download pictures, proceed?"], 
["downloading", "Downloading pictures..."], 
["SendCata", "Do you want to dispatch your [NUM] catapults?"], 
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

["PlayDragon", "You can use Dragon Stone to play Dragon Wheel. Build it!"], 
["OrdStart", "Ordinary"], 
["SpeStart", "Special"], 
["PlayingDra", "[NAME] is playing Dragon Wheel, join \"playingDra\" in Miracle Empire!"], 
["DraNot", "Sorry, you don't have enough Dragon stones, you can get more by opening treasure chest or killing monsters!"], 

["CaeNot", "Sorry, you don't have enough caesar coins!"], 
["HowDra", "You can use Dragon Stones or caesar coins to play Dragon Wheel. Tip: Dragon Stones can be obtained by opening treasure chesk or killing monsters."], 
["drumReward", "Tap the drum icon to get extra silver coins during fights! You tapped [NUM] times and get [MONEY] silver coins in the fight!"], 
["drumFeed", "[NAME] tapped drum [NUM] times and got [MONEY] silver coins in Miracle Empire!"], 
["lev1Disk", "Upgrade to Baron to play this kind of Dragon wheel."], 
["lev2Disk", "Upgrade to Knight to play this kind of Dragon Wheel."], 
["spe", "lumber"], 
["boundary", "Magic Capacity"], 
["dragonStone", "Dragon Stone"], 
["power", "soldiers"], 
["oldUser", "Welcome back to Miracle Empire! You got 10 caesar coins for playing!"], 
["PapaNot", "You don't have enough papayas to make this purchase. Purchase papayas now?"], 
["", ""], 

];

var Names = dict([

["ROOMNAME1", ["Orange Cottage", "Orange Cottage", "Orange Cottage", "Red Cottage", "Red Cottage", "Red Cottage", "Blue Cottage", "Blue Cottage", "Blue Cottage", "Purple Cottage", "Purple Cottage", "Purple Cottage", "Orange House", "Orange House", "Orange House", "Red House", "Red House", "Red House", "Blue House", "Blue House", "Blue House", "Purple House", "Purple House", "Purple House", "Orange Villa", "Orange Villa", "Orange Villa", "Red Villa", "Red Villa", "Red Villa", "Blue Villa", "Blue Villa", "Blue Villa", "Purple Villa", "Purple Villa", "Purple Villa", "Orange Mansion", "Orange Mansion", "Orange Mansion", "Red Mansion", "Red Mansion", "Red Mansion", "Blue Mansion", "Blue Mansion", "Blue Mansion", "Purple Mansion", "Purple Mansion", "Purple Mansion", "Orange Manor", "Orange Manor", "Orange Manor", "Red Manor", "Red Manor", "Red Manor", "Blue Manor", "Blue Manor", "Blue Manor", "Purple Manor", "Purple Manor", "Purple Manor", "Magical Manor", "Magical Manor", "Magical Manor", "Magical Manor", "Magical Manor", "Magical Manor", "Magical Manor", "Magical Manor", "Magical Manor", "Magical Manor", "Magical Manor", "Magical Manor", "Orange Palace", "Orange Palace", "Orange Palace", "Golden Palace", "Golden Palace", "Golden Palace", 
"Attic", "Attic", "Attic",
"Snow House", "Snow House", "Snow House",
"Tree House", "Tree House", "Tree House",

]], 
["ROOMNAME" , ["Orange Cottage Lv. 1", "Orange Cottage Lv. 2", "Orange Cottage Lv. 3", "Red Cottage Lv. 1", "Red Cottage Lv. 2", "Red Cottage Lv. 3", "Blue Cottage Lv. 1", "Blue Cottage Lv. 2", "Blue Cottage Lv. 3", "Purple Cottage Lv. 1", "Purple Cottage Lv. 2", "Purple Cottage Lv. 3", "Orange House Lv. 1", "Orange House Lv. 2", "Orange House Lv. 3", "Red House Lv. 1", "Red House Lv. 2", "Red House Lv. 3", "Blue House Lv. 1", "Blue House Lv. 2", "Blue House Lv. 3", "Purple House Lv. 1", "Purple House Lv. 2", "Purple House Lv. 3", "Orange Villa Lv. 1", "Orange Villa Lv. 2", "Orange Villa Lv. 3", "Red Villa Lv. 1", "Red Villa Lv. 2", "Red Villa Lv. 3", "Blue Villa Lv. 1", "Blue Villa Lv. 2", "Blue Villa Lv. 3", "Purple Villa Lv. 1", "Purple Villa Lv. 2", "Purple Villa Lv. 3", "Orange Mansion Lv. 1", "Orange Mansion Lv. 2", "Orange Mansion Lv. 3", "Red Mansion Lv. 1", "Red Mansion Lv. 2", "Red Mansion Lv. 3", "Blue Mansion Lv. 1", "Blue Mansion Lv. 2", "Blue Mansion Lv. 3", "Purple Mansion Lv. 1", "Purple Mansion Lv. 2", "Purple Mansion Lv. 3", "Orange Manor Lv. 1", "Orange Manor Lv. 2", "Orange Manor Lv. 3", "Red Manor Lv. 1", "Red Manor Lv. 2", "Red Manor Lv. 3", "Blue Manor Lv. 1", "Blue Manor Lv. 2", "Blue Manor Lv. 3", "Purple Manor Lv. 1", "Purple Manor Lv. 2", "Purple Manor Lv. 3", "Magical Manor Lv. 1", "Magical Manor Lv. 2", "Magical Manor Lv. 3", "Magical Manor Lv. 1", "Magical Manor Lv. 2", "Magical Manor Lv. 3", "Magical Manor Lv. 1", "Magical Manor Lv. 2", "Magical Manor Lv. 3", "Magical Manor Lv. 1", "Magical Manor Lv. 2", "Magical Manor Lv. 3", 
"Orange Palace Lv. 1", "Orange Palace Lv. 2", "Orange Palace Lv. 3", "Golden Palace Lv. 1", "Golden Palace Lv. 2", "Golden Palace Lv. 3", 
"Attic Lv. 1", "Attic Lv. 2", "Attic Lv. 3",

"Snow House Lv. 1", "Snow House Lv. 2", "Snow House Lv. 3",
"Tree House Lv. 1", "Tree House Lv. 2", "Tree House Lv. 3",
]], 

["SOLDIER_NAME" , ["Lv. 1", "Lv. 2", "Lv. 3", "Lv. 1", "Lv. 2", "Lv. 3", "Lv. 1", "Lv. 2", "Lv. 3"]], 
["SOLDIER_NAME1" , ["Lv. 1", "Lv. 2", "Lv. 3", "Lv. 1", "Lv. 2", "Lv. 3", "Scout Lv. 1", "Scout Lv. 2", "Scout Lv. 3"]], 


["MONSTERNAME" , ["Snake Lv. 1", "Snake Lv. 2", "Snake Lv. 3", "Boar Lv. 1", "Boar Lv. 2", "Boar Lv. 3", "Wolf Lv. 1", "Wolf Lv. 2", "Wolf Lv. 3", "Bear Lv. 1", "Bear Lv. 2", "Bear Lv. 3", "Lion Lv. 1", "Lion Lv. 2", "Lion Lv. 3", "Dragon Lv. 1", "Dragon Lv. 2", "Dragon Lv. 3", "Snake King Lv. 1", "Snake King Lv. 2", "Snake King Lv. 3", "Boar King Lv. 1", "Boar King Lv. 2", "Boar King Lv. 3", "Wolf King Lv. 1", "Wolf King Lv. 2", "Wolf King Lv. 3", "Bear King Lv. 1", "Bear King Lv. 2", "Bear King Lv. 3", "Lion King Lv. 1", "Lion King Lv. 2", "Lion King Lv. 3", "Dragon King Lv. 1", "Dragon King Lv. 2", "Dragon King Lv. 3"]], 


["PETS_NAME" , ["Dragon Egg A Lv. 1", "Dragon egg A Lv. 2", "Dragon egg A Lv. 3", "Dragon egg B Lv. 1", "Dragon egg B Lv. 2", "Dragon egg B Lv. 3"]], 


["EXTEND_NAME" , ["earth", "fire", "water"]], 

["EXTEND_PETS_NAME" , ["Earth Dragon", "Fire Dragon", "Water Dragon"]], 

["STATUE_NAME" , ["Medusa", "Boar Warrior", "Wolf Warrior", "Bear Warrior", "Lion Warrior", "Dragon Warrior", "Tower1", "Tower2"]], 

["FACTNAME" , ["Bakery Lv. 1", "Bakery Lv. 2", "Bakery Lv. 3", "Fruit Shop Lv. 1", "Fruit Shop Lv. 2", "Fruit Shop Lv. 3", "Butcher Shop Lv. 1", "Butcher Shop Lv. 2", "Butcher Shop Lv. 3", "Restaurant Lv. 1", "Restaurant Lv. 2", "Restaurant Lv. 3", "Clinic Lv. 1", "Clinic Lv. 2", "Clinic Lv. 3", "Book Store Lv. 1", "Book Store Lv. 2", "Book Store Lv. 3", "Clothing Store Lv. 1", "Clothing Store Lv. 2", "Clothing Store Lv. 3", "Jewelers Lv. 1", "Jewelers Lv. 2", "Jewelers Lv. 3", "Casino Lv. 1", "Casino Lv. 2", "Casino Lv. 3", "Dojo Lv. 1", "Dojo Lv. 2", "Dojo Lv. 3", "Fish Market Lv. 1", "Fish Market Lv. 2", "Fish Market Lv. 3", 
"Carpenter Shop Lv. 1", "Carpenter Shop Lv. 2", "Carpenter Shop Lv. 3", 
"Hotel Lv. 1", "Hotel Lv. 2", "Hotel Lv. 3", 
]], 

["FACTNAME1" , ["Bakery", "Bakery", "Bakery", "Fruit Shop", "Fruit Shop", "Fruit Shop", "Butcher Shop", "Butcher Shop", "Butcher Shop", "Restaurant", "Restaurant", "Restaurant", "Clinic", "Clinic", "Clinic", "Book Store", "Book Store", "Book Store", "Clothing Store", "Clothing Store", "Clothing Store", "Jewelers", "Jewelers", "Jewelers", "Casino", "Casino", "Casino", "Dojo", "Dojo", "Dojo", "Fish Market", "Fish Market", "Fish Market",
"Carpenter", "Carpenter", "Carpenter", 
"Hotel", "Hotel", "Hotel", 
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
]], 


["nobilityname" , ["Civilian", "Baron", "Knight", "Count", "Bishop", "Duke", "Emperor"]], 

["NOBNAME" , ["3-class Civilian", "2-class Civilian", "1-class Civilian", "3-class Baron", "2-class Baron", "1-class Baron", "3-class Knight", "2-class Knight", "1-class Knight", "3-class Count", "2-class class Count", "1-class Count", "3-class Bishop", "2-class Bishop", "1-class Bishop", "3-class Duke", "2-class Duke", "1-class Duke", "Emperor"]], 

["NOBNAME2", ["Civilian", "Civilian", "Civilian", "Baron", "Baron", "Baron", "Knight", "Knight", "Knight", "Count", "Count", "Count", "Bishop", "Bishop", "Bishop", "Duke", "Duke", "Duke", "Emperor"]], 

 ["PLANTNAME", ["Wheat", "Carrot", "Corn", "Pineapple", "Eggplant", "Tomato", "Green pepper", "Pumpkin", "Peach", "Watermelon", "Mango", "Strawberry"]], 

["STONENAME", ["Gravel", "Basalt", "Limestone", "Granite", "Mable", "Quartz"]], 

[ "WOONAME" , ["Maple", "Willow", "White poplar", "Sycamore", "Pine", "Oak"]], 

["GIFTNAME" , ["Lumber", "Sand", "Nail", "Rivet", "Red Brick", "Beam", "Door", "Plywood", "Macadam", "Black Brick", "Wooden Stake", "Steel Tube"]], 

["ENAME" , ["Fort Lv. 1", "Fort Lv. 2", "Fort Lv. 3", "Fort Lv. 4", "Fort Lv. 5", "Fort Lv. 6"]], 

 ["cardprename" , ["Snake", "Boar", "Wolf", "Bear", "Lion", "Dragon", "Snake king", "Boar king", "Wolf king", "Bear king", "Lion king", "Dragon king", "Nobility", "Moon Goddess", "Planting", "Business", "", "", "Friendship"]], 

["cardlevelname" , ["", " Lv. 1", " Lv. 2", " Lv. 3", " Lv. 4", " Lv. 5", " Medal"]], 

 ["BUILD_TAB_NAME", ["Houses", "Stores", "Resources", "Military", "Shrines", "Decorations", "Expand"]], 

 ["INVITE_STR", ["papaya games", "enjoy Miracle Empire with me", "come on to help me defeat enemies and build your own empire!", "Miracle Empire is a big, gorgeous SNS game. You can download from Android market, https://market.android.com/details?id=com.papaya.miracle_beta1"]]

]);


var Tasks = 
[dict([["req", "build"], ["des", ["Build Farmland!", "You can increase crop yield with special farmland and by building the Harvest Goddess statue.", "Build ordinary farmland"]], ["checknum", 1], ["lev", 3], ["pair", ["ground_id", 1]], ["reward", [200, 5, 0]], ["type", 0], ["id", 0]]), 
dict([["req", "planting"], ["des", ["Plant wheat", "You can increase crop yield with special farmland and by building the Harvest Goddess statue.", "planting wheat", "Tip: Click on a free plot of farmland, then tap the seed icon and choose wheat"]], ["checknum", 3], ["lev", 3], ["pair", ["object_id", 0, "type", 0]], ["reward", [300, 15, 0]], ["type", 0], ["id", 1]]), 
dict([["req", "money"], ["des", ["Collect taxes ", "You can collect higher tax revenue from more higher level stores.", "collect taxes from bakery"]], ["checknum", 100], ["lev", 3], ["pair", ["bid", 0]], ["reward", [200, 15, 0]], ["type", 1], ["id", 2]]), 
dict([["req", "dialog-territoryinfo"], ["des", ["Check Territory Info", "It is wise to be familiar with your territory.", "Click on your castle", "hint: click castle to check your territory information"]], ["checknum", 1], ["lev", 3], ["reward", [100, 5, 0]], ["type", 2], ["id", 3]]), 
dict([["req", "dialog-help"], ["des", ["View HELP!", "View HELP for some tips!", "View HELP!", "Tip: click the menu icon, then click the help icon"]], ["checknum", 1], ["lev", 3], ["reward", [100, 5, 0]], ["type", 2], ["id", 4]]), 
dict([["req", "soldiers"], ["des", ["Training Infantry!", "You can train soldiers to attack other players, kill monsters and protect your territory.", "training infantry", "hint: click free infantry camp first, then click infantry icon"]], ["checknum", 30], ["lev", 4], ["pair", ["btype", 0, "objtype", 0]], ["reward", [500, 20, 0]], ["type", 1], ["id", 5]]), 
dict([["req", "defeatmonster"], ["checknum", 1], ["des", ["Defeat monsters", "You can get special materials, activate cards by killing monsters.", "defeat monsters", "hint: first click the map icon, then choose one monster to attack"]], ["lev", 4], ["pair", []], ["reward", [500, 20, 0]], ["type", 0], ["id", 6]]), 
dict([["req", "expand"], ["des", ["Expand your territory", "Don’t run out of space to build, buy more land to expand your territory!", "expand your territory", "hint: click the building dialog box, then click the expand button on the right to choose the expansion type"]], ["checknum", 1], ["lev", 4], ["pair", []], ["reward", [600, 20, 0]], ["type", 0], ["id", 7]]), 
dict([["req", "getfriend"], ["des", ["Visit Caesar's territory", "Visit Caesar's territory to gain rewards!", "visit Caesar's territory", "hint: click Caesar's icon in the friends list"]], ["checknum", 1], ["lev", 5], ["pair", ["otherid", 0]], ["reward", [150, 5, 0]], ["type", 0], ["id", 8]]), 
dict([["req", "dialog-circle"], ["des", ["Add friends", "Add a friend for more fun and more rewards, it’s a social game!", "add friends in Circle", "hint: click the friends list first, then click the circle icon."]], ["checknum", 1], ["lev", 5], ["reward", [700, 10, 0]], ["type", 2], ["id", 9]]), 
dict([["req", "selectgift"], ["checknum", 1], ["des", ["Send gift", "You can send free gifts to your friends.", "send a gift", "hint: visit your friend's territory and tap the gift icon on the left to send them gifts"]], ["lev", 5], ["pair", ["askorgive", 0]], ["reward", [200, 10, 0]], ["type", 0], ["id", 10]]), 
dict([["req", "selectgift"], ["des", ["Request Gift", "Your friends can send free gift to you.", "request a gift", "Hint: visit your friends' territory and tap the gift icon on the left, choose a gift and ask for it"]], ["checknum", 1], ["lev", 5], ["pair", ["askorgive", 1]], ["reward", [300, 10, 0]], ["type", 0], ["id", 11]]), 
dict([["req", "completeopen"], ["des", ["Open Treasure Chest!", "Friends can help you open the treasure chest!", "open the treasure chest", "hint: click the treasure chest on the left, you can ask your friends for help, or you can use caesar coins to open it."]], ["checknum", 1], ["lev", 5], ["pair", []], ["reward", [500, 20, 0]], ["type", 0], ["id", 12]]), 
dict([["des", ["Rate", "If you love our game, help us by rating on Android Market!", "rate Miracle Empire"]], ["checknum", 1], ["lev", 5], ["reward", [-10, 30, 0]], ["type", 3], ["id", 13]]), 
dict([["req", "updatebuilding"], ["des", ["Upgrade cottage", "Upgrading buildings will increase production efficiency.", "upgrade cottage", "hint: click a normal cottage first and then click the upgrade icon"]], ["checknum", 1], ["lev", 6], ["pair", ["ground_id", 101]], ["reward", [500, 20, 0]], ["type", 0], ["id", 14]]), 
dict([["req", "person"], ["des", ["Increase Population!", "Homes provide people with a place to live.", "increase population", "hint: click a free dwelling house first, then click the recruit icon"]], ["checknum", 50], ["lev", 6], ["pair", []], ["reward", [500, 30, 0]], ["type", 1], ["id", 15]]), 
dict([["req", "build"], ["des", ["Build house", "Homes provide people with a place to live.", "build normal house"]], ["checknum", 2], ["lev", 6], ["pair", ["ground_id", 112]], ["reward", [400, 25, 0]], ["type", 0], ["id", 16]]), 
dict([["req", "planting"], ["des", ["Plant carrots", "You can increase crop yield with special farmland and by building the Harvest Goddess statue.", "plant carrots"]], ["checknum", 6], ["lev", 6], ["pair", ["object_id", 1, "type", 0]], ["reward", [600, 30, 0]], ["type", 0], ["id", 17]]), 
dict([["req", "money"], ["des", ["Collect taxes", "You can collect higher tax revenue from more higher level stores.!", "collect taxes from normal butcher shop"]], ["checknum", 1500], ["lev", 6], ["pair", ["bid", 6]], ["reward", [800, 80, 1]], ["type", 1], ["id", 18]]), 
dict([["req", "helpopen"], ["des", ["Open Treasure Chest!", "Help your friends open treasure chest and get rewards.", "open treasure chest of your friends", "hint: visit your friends' territory, click the treasure chest icon"]], ["checknum", 5], ["lev", 7], ["pair", []], ["reward", [1000, 25, 0]], ["type", 0], ["id", 25]]), 
dict([["des", ["Invite friends", "Add a friend for more fun and more rewards, it’s a social game!", "invite friends", "Hint: Tap on your friends list and invite your friends on Papaya to play with you. You can also do this by tapping on the invite button in the menu"]], ["checknum", 3], ["lev", 7], ["reward", [2000, 50, 1]], ["type", 4], ["id", 26]]), 
dict([["req", "planting"], ["checknum", 4], ["des", ["Plant corns", "You can increase crop yield with special farmland and by building the Harvest Goddess statue.", "plant corns"]], ["lev", 8], ["pair", ["object_id", 2, "type", 0]], ["reward", [1200, 48, 1]], ["type", 0], ["id", 27]]), 
dict([["req", "build"], ["des", ["Summon Goddess", "God and Goddess statues can perform miracles and magic!", "summon Harvest Goddess", "hint: click the building icon first, then click the miracle page to build Harvest Goddess"]], ["checknum", 1], ["lev", 8], ["pair", ["ground_id", 400]], ["reward", [1000, 40, 0]], ["type", 0], ["id", 28]]), 
dict([["req", "godbless"], ["des", ["Perform magic", "God and Goddess statues can perform miracles and magic!", "Harvest Goddess performs magic"]], ["checknum", 1], ["lev", 8], ["pair", ["godtype", 0]], ["reward", [1000, 30, 1]], ["type", 0], ["id", 29]]), 
dict([["req", "planting"], ["des", ["Plant pineapple", "You can increase crop yield with special farmland and by building the Harvest Goddess statue.", "plant pineapple"]], ["checknum", 6], ["lev", 8], ["pair", ["object_id", 3, "type", 0]], ["reward", [1200, 36, 0]], ["type", 0], ["id", 30]]), 
dict([["req", "build"], ["des", ["Build house", "Homes provide people with a place to live.", "build a Magical Manor"]], ["checknum", 1], ["lev", 8], ["pair", ["ground_id", 160]], ["reward", [1000, 50, 1]], ["type", 0], ["id", 31]]), 
dict([["checknum", 1], ["des", ["Show your territory", "Take a screenshot of your territory and share it with your friends.", "screenshot and share", "hint: click menu button first and then click screenshot button"]], ["lev", 8], ["reward", [800, 30, 0]], ["type", 5], ["id", 32]]), 
dict([["des", ["Help friends", "Help your friends remove pests from their farmland, and you will be rewarded.", "eliminate negative state for friends", "hint: visit your friends' territory and help them killing worms, weeding, repairing or cleaning"]], ["checknum", 1], ["lev", 9], ["reward", [1200, 40, 0]], ["type", 6], ["id", 35]]), 
dict([["req", "updatebuilding"], ["des", ["Upgrade bakery", "Advanced buildings will help facilitate the development of your territory!", "upgrade a normal bakery"]], ["checknum", 1], ["lev", 9], ["pair", ["ground_id", 301]], ["reward", [1000, 40, 0]], ["type", 0], ["id", 36]]), 
dict([["req", "money"], ["checknum", 700], ["des", ["Collect taxes", "You can collect higher tax revenue from more higher level stores.", "collect taxes from bakery Lv. 2"]], ["lev", 9], ["pair", ["bid", 1]], ["reward", [1500, 60, 0]], ["type", 1], ["id", 37]]), 
dict([["req", "build"], ["des", ["Build Farmlands", "Crystal farmland increases crop's yield.", "build crystal farmlands"]], ["checknum", 2], ["lev", 10], ["pair", ["ground_id", 2]], ["reward", [2000, 100, 1]], ["type", 0], ["id", 38]]), 
dict([["req", "build"], ["checknum", 1], ["des", ["Build lumber mill", "Wood and stone are needed to upgrade your buildings and produce weapons.", "build a lumber mill"]], ["lev", 10], ["pair", ["ground_id", 5]], ["reward", [1500, 50, 0]], ["type", 0], ["id", 39]]), 
dict([["req", "wood"], ["des", ["Collect maple woods", "Wood and stone are needed to upgrade your buildings and produce weapons.", "collect maple woods"]], ["checknum", 30], ["lev", 10], ["pair", ["objid", 0]], ["reward", [1500, 60, 0]], ["type", 1], ["id", 40]]), 
dict([["checknum", 5], ["des", ["Invite friends", "Add a friend for more fun and more rewards, it’s a social game!", "invite your friends to join", "hint: enter your friends' list and invite your friends, you can also click menu to invite"]], ["lev", 10], ["reward", [3000, 70, 1]], ["type", 4], ["id", 41]]), 
dict([["req", "completepay"], ["des", ["Charge", "You can get bonus rewards for recharging your caesar coins.", "charge and gain the rewards"]], ["checknum", 1], ["lev", 10], ["pair", []], ["reward", [1000, 200, 1]], ["type", 0], ["id", 42]]), 
dict([["req", "build"], ["des", ["Build brick roads", "Beautifully decorating your territory will increase your overall population and magic capacity.", "build brick roads"]], ["checknum", 6], ["lev", 11], ["pair", ["ground_id", 500]], ["reward", [600, 30, 0]], ["type", 0], ["id", 43]]), 
dict([["req", "build"], ["des", ["Build Flowerbed", "Beautifully decorating your territory will increase your overall population and magic capacity.", "build Flowerbed"]], ["checknum", 6], ["lev", 11], ["pair", ["ground_id", 505]], ["reward", [600, 60, 0]], ["type", 0], ["id", 44]]), 
dict([["req", "build"], ["des", ["Build golden roads", "Beautifully decorating your territory will increase your overall population and magic capacity.", "build golden roads"]], ["checknum", 3], ["lev", 11], ["pair", ["ground_id", 504]], ["reward", [1800, 50, 1]], ["type", 0], ["id", 45]]), 
dict([["req", "build"], ["des", ["Build villa", "Homes provide people with a place to live.", "build a villa"]], ["checknum", 2], ["lev", 11], ["pair", ["ground_id", 124]], ["reward", [1200, 30, 0]], ["type", 0], ["id", 46]]), 
dict([["req", "build"], ["checknum", 1], ["des", ["Build vine lamp", "Beautifully decorating your territory will increase your overall population and magic capacity.", "build vine lamp"]], ["lev", 11], ["pair", ["ground_id", 512]], ["reward", [1200, 30, 1]], ["type", 0], ["id", 47]]), 
dict([["req", "build"], ["des", ["Build magic well", "Beautifully decorating your territory will increase your overall population and magic capacity.", "build a magic well"]], ["checknum", 1], ["lev", 11], ["pair", ["ground_id", 520]], ["reward", [1200, 90, 1]], ["type", 0], ["id", 48]]), 
dict([["req", "planting"], ["des", ["Plant eggplants", "You can increase crop yield with special farmland and by building the Harvest Goddess statue.", "plant eggplants"]], ["checknum", 6], ["lev", 11], ["pair", ["object_id", 4, "type", 0]], ["reward", [1300, 100, 0]], ["type", 0], ["id", 49]]), 
dict([["req", "planting"], ["des", ["Plant tomatoes", "You can increase crop yield with special farmland and by building the Harvest Goddess statue.", "plant tomatoes"]], ["checknum", 6], ["lev", 11], ["pair", ["object_id", 5, "type", 0]], ["reward", [1300, 50, 1]], ["type", 0], ["id", 50]]), 
dict([["req", "build"], ["checknum", 1], ["des", ["Summon Goddess", "God and Goddess statues can perform miracles and magic!", "summon Liberty Goddess"]], ["lev", 12], ["pair", ["ground_id", 401]], ["reward", [1500, 50, 0]], ["type", 0], ["id", 51]]), 
dict([["req", "godbless"], ["checknum", 1], ["des", ["Perform magic", "God and Goddess statues can perform miracles and magic!", "Liberty Goddess performs magic"]], ["lev", 12], ["pair", ["godtype", 1]], ["reward", [1100, 50, 1]], ["type", 0], ["id", 52]]), 
dict([["req", "person"], ["des", ["Increase population", "Homes provide people with a place to live. You need more people to have more soldiers.", "increase your population"]], ["checknum", 100], ["lev", 12], ["pair", []], ["reward", [1500, 100, 0]], ["type", 1], ["id", 53]]), 
dict([["req", "money"], ["checknum", 3000], ["des", ["Collect taxes", "You can collect higher tax revenue from more higher level stores.!", "collect taxes from restaurant Lv. 1"]], ["lev", 12], ["pair", ["bid", 9]], ["reward", [1500, 70, 0]], ["type", 1], ["id", 54]]), 
dict([["req", "build"], ["des", ["Build cavalry camp", "You can train soldiers to attack other players, kill monsters and protect your territory.", "build a normal cavalry camp"]], ["checknum", 1], ["lev", 13], ["pair", ["ground_id", 203]], ["reward", [1800, 40, 0]], ["type", 0], ["id", 56]]), 
dict([["req", "soldiers"], ["checknum", 40], ["des", ["Train cavalries", "You can train soldiers to attack other players, kill monsters and protect your territory.", "train cavalry Lv. 1"]], ["lev", 13], ["pair", ["btype", 1, "objtype", 0]], ["reward", [2000, 50, 0]], ["type", 1], ["id", 57]]), 
dict([["req", "planting"], ["des", ["Plant green pepper", "Special farmland, crops, Harvest Goddess can increase yield.", "plant green pepper"]], ["checknum", 6], ["lev", 13], ["pair", ["object_id", 6, "type", 0]], ["reward", [1800, 30, 0]], ["type", 0], ["id", 59]]), 
dict([["req", "godbless"], ["des", ["Perform magic", "God and Goddess statues can perform miracles and magic!", "Harvest Goddess performs magic"]], ["checknum", 1], ["lev", 13], ["pair", ["godtype", 0]], ["reward", [1200, 50, 1]], ["type", 0], ["id", 60]]), 
dict([["req", "updatebuilding"], ["checknum", 1], ["des", ["Upgrade infantry camp", "Advanced buildings will help facilitate the development of your territory!", "upgrade an infantry camp Lv. 1"]], ["lev", 14], ["pair", ["ground_id", 201]], ["reward", [1800, 80, 0]], ["type", 0], ["id", 62]]), 
dict([["req", "soldiers"], ["des", ["Train infantry Lv. 2", "You can train soldiers to attack other players, kill monsters and protect your territory.", "train infantries", "hint: click the intermediate infantry camp and choose the infantry icon"]], ["checknum", 60], ["lev", 14], ["pair", ["btype", 0, "objtype", 1]], ["reward", [3000, 90, 0]], ["type", 1], ["id", 63]]), 
dict([["req", "money"], ["checknum", 6000], ["des", ["Collect taxes", "You can collect higher tax revenue from more higher level stores.", "collect taxes from book store Lv. 1"]], ["lev", 14], ["pair", ["bid", 15]], ["reward", [1800, 150, 1]], ["type", 1], ["id", 65]]), 
dict([["req", "updatebuilding"], ["des", ["Upgrade Magical Manor", "Advanced buildings will help facilitate the development of your territory!", "upgrade a Magical Manor"]], ["checknum", 1], ["lev", 14], ["pair", ["ground_id", 161]], ["reward", [2000, 200, 1]], ["type", 0], ["id", 66]]), 
dict([["req", "build"], ["checknum", 1], ["des", ["Build mansion", "Homes provide people with a place to live. You need more people to have more soldiers.", "build a mansion"]], ["lev", 15], ["pair", ["ground_id", 136]], ["reward", [1500, 60, 0]], ["type", 0], ["id", 67]]), 
dict([["req", "build"], ["des", ["Build well", "Beautifully decorating your territory will increase your overall population and magic capacity.", "build a ordinary well"]], ["checknum", 1], ["lev", 15], ["pair", ["ground_id", 519]], ["reward", [300, 15, 0]], ["type", 0], ["id", 68]]), 
dict([["req", "wood"], ["des", ["Collect willow woods", "Wood and stone are needed to upgrade your buildings and produce weapons.", "collect willow woods"]], ["checknum", 130], ["lev", 15], ["pair", ["objid", 1]], ["reward", [2100, 180, 0]], ["type", 1], ["id", 69]]), 
dict([["req", "money"], ["checknum", 5000], ["des", ["Collect taxes", "You can collect higher tax revenue from more higher level stores.!", "collect taxes from clinic Lv. 1"]], ["lev", 15], ["pair", ["bid", 12]], ["reward", [1500, 100, 0]], ["type", 1], ["id", 70]]), 
dict([["req", "money"], ["checknum", 3500], ["des", ["Collect taxes", "You can collect higher tax revenue from more higher level stores.!", "collect taxes from butcher shop Lv. 2"]], ["lev", 15], ["pair", ["bid", 7]], ["reward", [2500, 250, 1]], ["type", 1], ["id", 71]]), 
dict([["req", "planting"], ["des", ["Plant pumpkins", "You can increase crop yield with special farmland and by building the Harvest Goddess statue.", "plant pumpkins"]], ["checknum", 6], ["lev", 16], ["pair", ["object_id", 7, "type", 0]], ["reward", [1800, 96, 0]], ["type", 0], ["id", 72]]), 
dict([["req", "build"], ["checknum", 1], ["des", ["Summon god", "God and Goddess statues can perform miracles and magic!", "summon Mars"]], ["lev", 16], ["pair", ["ground_id", 403]], ["reward", [1600, 100, 0]], ["type", 0], ["id", 73]]), 
dict([["req", "godbless"], ["des", ["Perform magic", "God and Goddess statues can perform miracles and magic!", "Mars performs magic"]], ["checknum", 1], ["lev", 16], ["pair", ["godtype", 3]], ["reward", [1300, 100, 1]], ["type", 0], ["id", 74]]), 
dict([["req", "updatebuilding"], ["des", ["Upgrade statue", "The magic power of higher level god or Goddess will be stronger!", "upgrade a statue of god or Goddess"]], ["checknum", 1], ["lev", 16], ["pair", ["ground_id", 404]], ["reward", [4000, 250, 1]], ["type", 0], ["id", 75]]), 
dict([["req", "build"], ["checknum", 3], ["des", ["Build flowers", "Beautifully decorating your territory will increase your overall population and magic capacity.", "build an flowers"]], ["lev", 17], ["pair", ["ground_id", 521]], ["reward", [900, 45, 0]], ["type", 0], ["id", 76]]), 
dict([["req", "build"], ["checknum", 3], ["des", ["Build cherry tree", "Beautifully decorating your territory will increase your overall population and magic capacity.", "build cherry trees"]], ["lev", 17], ["pair", ["ground_id", 528]], ["reward", [2100, 100, 1]], ["type", 0], ["id", 77]]), 
dict([["req", "wood"], ["des", ["Collect white poplar woods", "Wood and stone are needed to upgrade your buildings and produce weapons.", "collect white poplar woods"]], ["checknum", 200], ["lev", 17], ["pair", ["objid", 2]], ["reward", [4000, 300, 1]], ["type", 1], ["id", 78]]), 
dict([["req", "updatebuilding"], ["des", ["Upgrade mansion", "Advanced buildings will help facilitate the development of your territory!", "upgrade a mansion to the highest level"]], ["checknum", 1], ["lev", 17], ["pair", ["ground_id", 138]], ["reward", [2500, 98, 0]], ["type", 0], ["id", 79]]), 
dict([["checknum", 3], ["des", ["Invite friends", "Add a friend for more fun and more rewards, it’s a social game!", "invite your friends to join", "hint: enter your friends' list and invite the uninvited friends or click invite button in menu"]], ["lev", 17], ["reward", [5500, 155, 1]], ["type", 4], ["id", 80]]), 
dict([["req", "build"], ["des", ["Build quarry", "Wood and stone are needed to upgrade your buildings and produce weapons.", "build a quarry"]], ["checknum", 1], ["lev", 18], ["pair", ["ground_id", 6]], ["reward", [2100, 56, 0]], ["type", 0], ["id", 81]]), 
dict([["req", "stone"], ["des", ["Collect gravel", "Wood and stone are needed to upgrade your buildings and produce weapons.", "collect gravel"]], ["checknum", 50], ["lev", 18], ["pair", ["objid", 0]], ["reward", [2400, 120, 0]], ["type", 1], ["id", 82]]), 
dict([["req", "updatebuilding"], ["checknum", 1], ["des", ["Upgrade infantry camp", "Advanced buildings will help facilitate the development of your territory!", "upgrade a infantry camp Lv. 2"]], ["lev", 18], ["pair", ["ground_id", 202]], ["reward", [3000, 150, 0]], ["type", 0], ["id", 83]]), 
dict([["req", "build"], ["des", ["Build nepenthe", "Beautifully decorating your territory will increase your overall population and magic capacity.", "build nepenthe"]], ["checknum", 4], ["lev", 19], ["pair", ["ground_id", 524]], ["reward", [1200, 80, 0]], ["type", 0], ["id", 85]]), 
dict([["req", "build"], ["checknum", 3], ["des", ["Build shrubbery", "Beautifully decorating your territory will increase your overall population and magic capacity.", "build shrubbery"]], ["lev", 19], ["pair", ["ground_id", 532]], ["reward", [900, 60, 0]], ["type", 0], ["id", 86]]), 
dict([["req", "build"], ["checknum", 1], ["des", ["Build angel statue", "Beautifully decorating your territory will increase your overall population and magic capacity.", "build angel statue"]], ["lev", 19], ["pair", ["ground_id", 538]], ["reward", [2000, 100, 1]], ["type", 0], ["id", 87]]), 
dict([["req", "updatebuilding"], ["checknum", 1], ["des", ["Upgrade clinic", "Advanced buildings will help facilitate the development of your territory!", "upgrade a clinic Lv. 1"]], ["lev", 19], ["pair", ["ground_id", 313]], ["reward", [3000, 100, 0]], ["type", 0], ["id", 88]]), 
dict([["req", "build"], ["des", ["Build Farmland", "Gem farmland will increase crops yield.", "build gem farmland"]], ["checknum", 4], ["lev", 20], ["pair", ["ground_id", 3]], ["reward", [4000, 200, 1]], ["type", 0], ["id", 89]]), 
dict([["req", "planting"], ["des", ["Plant peaches", "You can increase crop yield with special farmland and by building the Harvest Goddess statue.", "plant peaches"]], ["checknum", 3], ["lev", 20], ["pair", ["object_id", 8, "type", 0]], ["reward", [3000, 150, 1]], ["type", 0], ["id", 90]]), 
dict([["req", "build"], ["checknum", 2], ["des", ["Build manor", "Homes provide people with a place to live. You need more people to have more soldiers.", "build manor Lv. 2"]], ["lev", 20], ["pair", ["ground_id", 148]], ["reward", [2100, 100, 0]], ["type", 0], ["id", 91]]), 
dict([["req", "build"], ["checknum", 1], ["des", ["Summon Goddess", "God and Goddess statues can perform miracles and magic!", "summon wealth god"]], ["lev", 20], ["pair", ["ground_id", 402]], ["reward", [2300, 130, 0]], ["type", 0], ["id", 92]]), 
dict([["req", "godbless"], ["des", ["Perform magic", "God and Goddess statues can perform miracles and magic!", "perform wealth god's magic"]], ["checknum", 1], ["lev", 20], ["pair", ["godtype", 2]], ["reward", [1400, 100, 1]], ["type", 0], ["id", 93]]), 
dict([["req", "money"], ["checknum", 3500], ["des", ["Collect taxes", "You can collect higher tax revenue from more higher level stores.!", "collect taxes from clothing shop Lv. 1"]], ["lev", 21], ["pair", ["bid", 18]], ["reward", [2600, 150, 0]], ["type", 1], ["id", 94]]), 
dict([["req", "wood"], ["des", ["Collect sycamore woods", "Wood and stone are needed to upgrade your buildings and produce weapons.", "collect sycamore woods"]], ["checknum", 100], ["lev", 21], ["pair", ["objid", 3]], ["reward", [2700, 180, 0]], ["type", 1], ["id", 95]]), 
dict([["req", "expand"], ["des", ["Expand territory", "Don’t run out of space to build, buy more land to expand your territory!", "expand your territory"]], ["checknum", 1], ["lev", 21], ["pair", []], ["reward", [3000, 300, 0]], ["type", 0], ["id", 96]]), 
dict([["req", "money"], ["checknum", 6000], ["des", ["Collect taxes", "You can collect higher tax revenue from more higher level stores.!", "collect taxes from butcher shop Lv. 3"]], ["lev", 21], ["pair", ["bid", 8]], ["reward", [4000, 300, 1]], ["type", 1], ["id", 97]]), 
dict([["req", "stone"], ["checknum", 130], ["des", ["Collect basalt", "Wood and stone are needed to upgrade your buildings and produce weapons.", "collect basalt"]], ["lev", 22], ["pair", ["objid", 1]], ["reward", [2800, 210, 0]], ["type", 1], ["id", 98]]), 
dict([["req", "money"], ["checknum", 10000], ["des", ["Collect taxes", "You can collect higher tax revenue from more higher level stores.!", "collect taxes from book store Lv. 2"]], ["lev", 22], ["pair", ["bid", 16]], ["reward", [4000, 280, 1]], ["type", 1], ["id", 99]]), 
dict([["req", "planting"], ["des", ["Plant watermelon", "You can increase crop yield with special farmland and by building the Harvest Goddess statue.", "plant watermelon"]], ["checknum", 6], ["lev", 23], ["pair", ["object_id", 9, "type", 0]], ["reward", [2900, 240, 0]], ["type", 0], ["id", 101]]), 
dict([["req", "money"], ["checknum", 13000], ["des", ["Collect taxes", "You can collect higher tax revenue from more higher level stores.!", "collect taxes from casino Lv. 1"]], ["lev", 24], ["pair", ["bid", 24]], ["reward", [4500, 350, 1]], ["type", 1], ["id", 103]]), 
dict([["req", "stone"], ["des", ["Collect limestone", "Wood and stone are needed to upgrade your buildings and produce weapons.", "collect limestone"]], ["checknum", 200], ["lev", 24], ["pair", ["objid", 2]], ["reward", [4500, 350, 1]], ["type", 1], ["id", 104]]), 
dict([["req", "build"], ["des", ["Building maple", "Beautifully decorating your territory will increase your overall population and magic capacity.", "building maple"]], ["checknum", 3], ["lev", 25], ["pair", ["ground_id", 535]], ["reward", [1400, 90, 1]], ["type", 0], ["id", 106]]), 
dict([["req", "planting"], ["des", ["Plant strawberry", "You can increase crop yield with special farmland and by building the Harvest Goddess statue.", "plant strawberry"]], ["checknum", 6], ["lev", 25], ["pair", ["object_id", 11, "type", 0]], ["reward", [5400, 420, 1]], ["type", 0], ["id", 107]]), 
dict([["req", "wood"], ["des", ["Collect oak", "Wood and stone are needed to upgrade your buildings and produce weapons.", "collect oak woods"]], ["checknum", 300], ["lev", 25], ["pair", ["objid", 5]], ["reward", [5700, 420, 0]], ["type", 1], ["id", 108]]), 
dict([["req", "planting"], ["des", ["Plant mango", "You can increase crop yield with special farmland and by building the Harvest Goddess statue.", "plant mango"]], ["checknum", 6], ["lev", 26], ["pair", ["object_id", 10, "type", 0]], ["reward", [3300, 240, 1]], ["type", 0], ["id", 110]]), 
dict([["req", "updatebuilding"], ["des", ["Upgrade statue", "The magic power of god or Goddess will be stronger!", "upgrade a silver statue of god or Goddess"]], ["checknum", 1], ["lev", 26], ["pair", ["ground_id", 408]], ["reward", [4000, 450, 1]], ["type", 0], ["id", 111]]), 
dict([["req", "updatebuilding"], ["checknum", 1], ["des", ["Upgrade Magical Manor", "Advanced buildings will help facilitate the development of your territory!", "upgrade a Magical Manor Lv. 2"]], ["lev", 26], ["pair", ["ground_id", 162]], ["reward", [5000, 450, 0]], ["type", 0], ["id", 112]]), 
dict([["req", "stone"], ["des", ["Collect granite", "Wood and stone are needed to upgrade your buildings and produce weapons.!", "collect granite"]], ["checknum", 100], ["lev", 27], ["pair", ["objid", 3]], ["reward", [3000, 300, 0]], ["type", 1], ["id", 113]]), 
dict([["req", "updatebuilding"], ["checknum", 1], ["des", ["Upgrade cavalry camp", "Advanced buildings will help facilitate the development of your territory!", "upgrade a cavalry camp Lv. 2"]], ["lev", 27], ["pair", ["ground_id", 205]], ["reward", [4000, 480, 1]], ["type", 0], ["id", 114]]), 
dict([["req", "planting"], ["des", ["Plant corns", "You can increase crop yield with special farmland and by building the Harvest Goddess statue.", "plant corns on the crystal farmland"]], ["checknum", 6], ["lev", 27], ["pair", ["object_id", 2, "type", 0, "bid", 2]], ["reward", [4500, 500, 1]], ["type", 0], ["id", 115]]), 
dict([["req", "wood"], ["des", ["Collect pine trees", "Wood and stone are needed to upgrade your buildings and produce weapons.", "collect pine trees"]], ["checknum", 200], ["lev", 28], ["pair", ["objid", 4]], ["reward", [4200, 300, 0]], ["type", 1], ["id", 116]]), 
dict([["req", "money"], ["checknum", 16000], ["des", ["Collect taxes", "You can collect higher tax revenue from more higher level stores.!", "collect taxes from casino Lv. 2"]], ["lev", 28], ["pair", ["bid", 25]], ["reward", [5600, 480, 0]], ["type", 1], ["id", 117]]), 
dict([["req", "money"], ["checknum", 15000], ["des", ["Collect taxes", "You can collect higher tax revenue from more higher level stores.!", "collect taxes from book store Lv. 3"]], ["lev", 28], ["pair", ["bid", 17]], ["reward", [5600, 480, 1]], ["type", 1], ["id", 118]]), 
dict([["req", "money"], ["checknum", 7000], ["des", ["Collect taxes", "You can collect higher tax revenue from more higher level stores.!", "collect taxes from Jewelers Lv. 1"]], ["lev", 29], ["pair", ["bid", 21]], ["reward", [4200, 300, 0]], ["type", 1], ["id", 119]]), 
dict([["req", "planting"], ["des", ["Plant strawberry", "Tale tells that magical strawberry can be harvested from this farmland!", "plant strawberry on the gem farmland"]], ["checknum", 6], ["lev", 29], ["pair", ["object_id", 11, "type", 0, "bid", 3]], ["reward", [6000, 500, 1]], ["type", 0], ["id", 120]]), 
dict([["req", "money"], ["checknum", 22000], ["des", ["Collect taxes", "You can collect higher tax revenue from more higher level stores.!", "collect taxes from casino Lv. 3"]], ["lev", 29], ["pair", ["bid", 26]], ["reward", [6000, 500, 1]], ["type", 1], ["id", 121]]), 
dict([["req", "build"], ["checknum", 4], ["des", ["Build farmland", "Elf farmland can increase crops yield.", "build elf farmland"]], ["lev", 30], ["pair", ["ground_id", 4]], ["reward", [6000, 500, 1]], ["type", 0], ["id", 122]]), 
dict([["req", "stone"], ["des", ["Collect quartz", "Wood and stone are needed to upgrade your buildings and produce weapons.", "collect quartz"]], ["checknum", 300], ["lev", 30], ["pair", ["objid", 5]], ["reward", [6200, 480, 1]], ["type", 1], ["id", 123]]), 
dict([["req", "stone"], ["des", ["Collect marble", "Wood and stone are needed to upgrade your buildings and produce weapons.", "collect marble"]], ["checknum", 200], ["lev", 30], ["pair", ["objid", 4]], ["reward", [4000, 320, 0]], ["type", 1], ["id", 124]])
];


var WarTasks = [
dict([["des", ["Unlock War Mode", "Reach lv. 10 to unlock war mode and fight with friends", "You can unlock war mode to fight with friends", "Unlock war mode", "Hint: tap on map, then tap War Mode"]], ["req", "warinfo"], ["checknum", 1], ["pair", []], ["reward", [5000, 10, 0]], ["type", 0], ["id", 0]]),
dict([["des", ["View Help", "Learn more about war mode by checking out the help document", "View help about war"]], ["req", "dialog-help"], ["checknum", 1], ["reward", [100, 5, 0]], ["type", 2], ["id", 1]]),
dict([["des", ["Ally With Friends", "Ally with some friends, and they can help you by providing you with soldiers during a battle", "Become allies with friend"]], ["req", "makeally"], ["checknum", 1], ["pair", []], ["reward", [500, 10, 0]], ["type", 0], ["id", 2]]),
dict([["des", ["Increase Defense", "Tap on your castle and tap the [+]  button to upgrade the your castle wall's defense", "Add 100 defense"]], ["req", "adddefence"], ["checknum", 100], ["reward", [1000, 15, 0]], ["type", 3], ["id", 3]]),
dict([["des", ["Build Scout Camp", "Scout camps are used to train scouts", "Build scout camp lv. 1"]], ["req", "build"], ["checknum", 1], ["pair", ["ground_id", 206]], ["reward", [500, 8, 0]], ["type", 0], ["id", 4]]),
dict([["des", ["Train Scout", "If be prepared for battle, spy on your enemies to learn more about them!", "Train scout lv. 1"]], ["req", "soldiers"], ["checknum", 9], ["pair", ["byte", 2, "objtype", 0]], ["reward", [800, 10, 0]], ["type", 1], ["id", 5]]),
dict([["des", ["Detect Enemy", "If you want to win, it's better you know your enemy!", "Detect enemy"]], ["req", "detect"], ["checknum", 1], ["pair", []], ["reward", [300, 7, 0]], ["type", 0], ["id", 6]]),
dict([["des", ["Attack Enemy", "Defeating enemies will bring you more money, glory, and fame!", "Attack enemy"]], ["req", "attack"], ["checknum", 1], ["pair", []], ["reward", [1000, 10, 0]], ["type", 0], ["id", 7]]),
dict([["des", ["Increase Ally Capacity", "You can increase your ally capacity to have more allies.", "Increase ally capacity"]], ["req", "addallyupbound"], ["checknum", 1], ["pair", []], ["reward", [1500, 20, 0]], ["type", 0], ["id", 8]]),
dict([["des", ["Upgrade Nobility Ranking", "Higher nobility will allow you have more rights", "Upgrade nobility"]], ["req", "dialog-nobility"], ["checknum", 1], ["pair", []], ["reward", [2000, 25, 0]], ["type", 2], ["id", 9]]),
dict([["des", ["Upgrade Map", "If you defeat enough enemies, you can start fighting on a higher level map.", "Go to a higher level map"]], ["req", "upgrademap"], ["checknum", 1], ["pair", []], ["reward", [2000, 25, 0]], ["type", 0], ["id", 10]]),
];


var Statics = 
[
"Reach to Lv. 10 to unlock War Mode", 
"Once you have activated War Mode, you can't quit it, please read the HELP documentation for more information.", 
"Congrats, you won!", 
"Sorry, you were defeated.", 
"[ENAME] is too powerful, strengthen your military power and fight another day!", 
"Congrats! you have defeated [ENAME], go on fighting and gain glory!", 
"How to add power", 
"[USERNAME] has entered a new map. Come on. Let's build our own Miracle Empire with [USERNAME]!", 
"[USERNAME] has upgraded to [NOBNAME]. Come on. Let's build our own Miracle Empire with [USERNAME]!", 
"[USERNAME] has gotten more territory. Come on. Let's build our own Miracle Empire with [USERNAME]!", 
"[USERNAME] has defeated the invaders. Come on, Let's build our own Miracle Empire with [USERNAME]!", 
"[USERNAME] has been defeated by [ENAME]. Let's go and get revenge for [USERNAME]!", 
"[USERNAME]'s army has been defeated, gather your troops and help [USERNAME] out!", 
"[USERNAME] has defeated [ENAME]. Let's build our own Miracle Empire with [USERNAME]!", 
"You must reach Lv. 15 to unlock one-step finishing", 
"Sorry, you don't have spare farmland for one-step finishing", 
"Sorry, your crops are growing, please try again later", 
"[WHO] must reach [NUM] to upgrade your [TYPE] to the next level.!", 
"[WHO] needs to defeated [NUM] more opponents to upgrade to [CARD]", 
"Your stores are still in production, please try again later", 
"You can get a monster statue for free after you have upgraded your monster card to violet gold level", 
"Sorry, the space room is developing; you can get it for free at Lv. 5 with a Moon Goddess card.", 
"You can use one-step harvesting and one-step seeding when you upgrade the Harvest Goddess to violet level", 
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
const ChargeMana = 5;

const CallDragon = 1000;




const Tips = dict([
[3, "Night mode begins everyday at 8 pm. Having lamps and other light decorations will come in handy then. You can toggle night mode under the settings option."], 
[4, "Tap on your castle to see your territory's info. Here you can view your attack power, special articles, magic, resources, etc."], 
[5, "Decorations are great for your empire! They can increase your population and magic capacity too!"], 

[7, "Want to get more silver and/or free caesar coins? Tap the FAQ button."], 
[8, "You can build Harvest Goddess statue now! The statue can perform magic that will increase your crops' yield as well as one-step harvesting and planting."], 
[9, "Build the Dragon Wheel and then use the Dragon Stone to get FREE caesar coins."], 
[10, "You can unlock war mode. Now you can attack other players. Be careful, once you unlock war mode there is no turning back."], 

[11, "Build a lumber mill. Wood is a necessary resource for upgrading buildings."], 
[12, "Build the Population Goddess statue! She can perform magic that increases your population recruitment number."], 
[13, "Tip: You will be given silver coins as a reward, and you will have a higher probability of winning!"], 
[14, "Cavalry's speed is higher than infantry's."], 
[15, "You can build Dragon nest now. A dragon nest will allow you to raise a pet dragon. When it reaches adulthood, it can help you fight in battles."], 
//[15, "Dragons help defend your empire. You can also train it to increase its ATK."], 
[16, "Build the War God statue! He can perform magic that will increase your ATK power during battles."], 
[18, "Build a stone quarry. Stone is necessary to upgrade buildings."], 
[19, "There are forts scatter around the world map. When you occupy a fort it will produce resouces for you every hour."], 
[20, "You can upgrade your castle to Lv. 2! Upgrading will increase your magic capacity by 5, and your population capacity by 100."], 
[21, "Build the Wealth God Statue! He can perform magic that will increase the taxes that you collect from your shops."], 
[24, "Build a workshop! Workshops produce military weapons."], 
[30, "You can upgrade your castle to lv. 3! Upgrading will increase your magic capacity by 5, and your population capacity by 100."], 
[31, "Build the Beast God Statue! He can perform magic that will increase the defence of your castle."]

]);

