class ImageController{
    var images1 = ["shen25.png","shen26.png", "shen27.png", "shen28.png","shen29.png","defence_bubble.png", "friend_objback1s.png","new.png","opbutton9.png","object42.png","object43.png","object44.png","object42_l.png","object43_l.png","object44_l.png","object45.png", "object46.png", "object45_l.png","object46_l.png", "object47.png", "object47_l.png", "object48.png", "object48_l.png", "object49.png", "object49_l.png",
    "flyboundary.png", "personboard1.png", "flymana.png", "magic_bar.png", "mana_bar.png", "magic_big.png",
    "dialogelement_state3.png", "dialogelement_state4.png",
    "chargeBack.png", "chargeLeft.jpg", "timeLeft.png",
    "object39.png","object40.png","object41.png","room72.png","room73.png","room74.png","room75.png","room76.png","room77.png","fact27.png","fact28.png","fact29.png","fact30.png","fact31.png","fact32.png",
    "camp6.png","camp7.png","camp8.png","dialogelement_military2.png","dialogelement_state2.png","dialogelement_state3.png", "dialogelement_state4.png","soldier3_1.png","soldier3_2.png","soldier3_3.png", "magic_bar.png", "magic_big.png",
    "buyelement20.png", "buyelement21.png",
    "dialogback_info.png","dialogtab_info0.png","dialogtab_info1.png","infobutton0.png","infobutton1.png","infocell0.jpg","infocell1.jpg","infotab0.png","infotab1.png",
    "medalcard0_1.png","medalcard0_2.png","medalcard0_3.png","medalcard0_4.png","medalcard0_5.png","medalcard1_1.png","medalcard1_2.png","medalcard1_3.png","medalcard1_4.png","medalcard1_5.png",
    "medalnob.png","wtask1.png","wtask2.png","wtask3.png","wtask4.png","medalbutton2.png","medalIcon2.png","loadingwarback.jpg", "loading-winter.jpg","loadingbar2.png","warchoosebuttonback0.png","warchoosebuttonback1.png",
    "dialogback_rank.png","friend_rank.png","rankcell4.jpg","rankcell5.jpg","rankcell6.jpg","rankcell7.jpg","rankleft.png","warchoose0.png","warchoose1.png","warchoose2.png",
    "rankright.png","ranktab0_0.png","ranktab0_1.png","ranktab1_0.png","ranktab1_1.png","ranktype0_0.png","ranktype0_1.png","ranktype1_0.png","ranktype1_1.png","egg-3-2.png",
    "egg-3-3.png","egg-3-4.png","egg-3-5.png","egg-3-6.png","egg-3-7.png","egg-3.png","nestbuildingback.png","nestbuildingfiller.png","nestdialogelement.jpg","nestpetfiller0.png",
    "nestpetfiller1.png","nestpetfiller2.png","nestpettab1.png","nesttab0.png","opbutton19.png","opbutton21.png","opbutton23.png","opbutton25.png","petrenamepic.jpg","build1000.png",
    "egg-1-0.png","egg-1-1.png","egg-1-2.png","egg-1-3.png","egg-1.png","egg-2-0.png","egg-2-1.png","egg-2-2.png","egg-2-3.png","egg-2.png","egg-3-0.png","egg-3-1.png",
    "shen20.png","shen21.png","shen22.png","shen23.png","shen24.png","dialogelement2d3.png","dialogelement2d2.png","build600.png","build601.png","object12_l.png","object13_l.png","object14_l.png","object15_l.png","object16_l.png",
    "object50.png", "object51.png", "object52.png", "object53.png", "object54.png", "object55.png", "object56.png", 
    "blessing1.png","blessing2.png","blessing3.png","blessing4.png","blessing5.png","blessing6.png","blessing7.png","blessing8.png","blessing9.png","opbutton17.png",
    "earth-1-10.png","earth-1-11.png","earth-1-12.png","earth-1-13.png","earth-1-1.png","earth-1-2.png","earth-1-3.png","earth-1-4.PNG","earth-1-5.png","earth-1-6.png",
    "earth-1-7.png","earth-1-8.png","earth-1-9.png","earth-1.png","earth-2.png","earth-3.png","earth-4-1.png","earth-4-2.png","earth-4-3.png","earth-4-4.png","earth-4-5.png",
    "earth-4-6.png","earth-4-7.png","earth-4-8.png","earth-4-9.png","earth-4.png","earth-5.png","earth-6.png","earth-7.png","earth-9.png","earth-f1.png","earth-f2.png","earth-f3.png","earth-f4.png",
    "fire-1-10.png","fire-1-11.png","fire-1-12.png","fire-1-13.png","fire-1-1.png","fire-1-2.png","fire-1-3.png","fire-1-4.PNG","fire-1-5.png","fire-1-6.png",
    "fire-1-7.png","fire-1-8.png","fire-1-9.png","fire-1.png","fire-2.png","fire-3.png","fire-4-1.png","fire-4-2.png","fire-4-3.png","fire-4-4.png","fire-4-5.png",
    "fire-4-6.png","fire-4-7.png","fire-4-8.png","fire-4-9.png","fire-4.png","fire-5.png","fire-6.png","fire-7.png","fire-9.png","fire-f1.png","fire-f2.png","fire-f3.png","fire-f4.png",
    "water-1-10.png","water-1-11.png","water-1-12.png","water-1-13.png","water-1-1.png","water-1-2.png","water-1-3.png","water-1-4.PNG","water-1-5.png","water-1-6.png",
    "water-1-7.png","water-1-8.png","water-1-9.png","water-1.png","water-2.png","water-3.png","water-4-1.png","water-4-2.png","water-4-3.png","water-4-4.png","water-4-5.png",
    "water-4-6.png","water-4-7.png","water-4-8.png","water-4-9.png","water-4.png","water-5.png","water-6.png","water-7.png","water-9.png","water-f1.png","water-f2.png","water-f3.png","water-f4.png", "monsteravatar0.jpg", "monsteravatar1.jpg", "monsteravatar2.jpg", "monsteravatar3.jpg", "monsteravatar4.jpg", "monsteravatar5.jpg", "monsteravatar6.jpg", "selopen.png", "selclose.png"
    ];
    const images2 = [
"addallybound.jpg","allyelement.png","bindButton.png","cancelallyelement.png","friend_objadd.png","friend_objback2.png","friend_objnone.png","friendbutton2.png",
"wartabperson.png","adddefence.png","attack_head.png","attackbeginelement.png", 
"animate_self_left_2_4.png","animate_enemy_1_1.png","dialogback_attack.png",
"animate_enemy_1_2.png","animate_enemy_2_1.png","animate_enemy_2_2.png","animate_enemy_left_0_1.png","animate_enemy_left_0_2.png","animate_enemy_left_0_3.png",
"animate_enemy_left_0_4.png","animate_enemy_left_0_5.png","animate_enemy_left_0_6.png","animate_enemy_left_0_8.png","animate_enemy_left_0_9.png","animate_enemy_left_0_10.png",
"animate_enemy_left_0_11.png","animate_enemy_left_0_12.png","animate_enemy_left_0_13.png","animate_enemy_left_1_1.png","animate_enemy_left_1_2.png","animate_enemy_left_1_3.png",
"animate_enemy_left_1_4.png","animate_enemy_left_2_1.png","animate_enemy_left_2_2.png","animate_enemy_left_2_3.png","animate_enemy_left_2_4.png","animate_self_left_0_1.png",
"animate_self_left_0_2.png","animate_self_left_0_3.png","animate_self_left_0_4.png","animate_self_left_0_5.png","animate_self_left_0_6.png","animate_self_left_0_8.png",
"animate_self_left_0_9.png","animate_self_left_0_10.png","animate_self_left_0_11.png","animate_self_left_0_12.png","animate_self_left_0_13.png","animate_self_left_1_4.png",
"battle1.png","battle2.png","battle3.png","battle4.png","battle5.png","battle6.png","battle7.png","battle8.png","battle9.png","battleresultback.jpg","battleuserback0.png","battleuserback1.png",
"defence_head.png","defenceback.jpg","dialogback_warabout.png","dialogtab_warabout0.png","adddefence2.png",
"dialogtab_warabout1.png","flagother.png","help.png","mapelement0.png","mapelement2.png","mapelement3.png","mapempirelv1.png",
"mapempirelv2.png","mapempirelv2_self.png","mapempirelv3.png","mapempirelv3_self.png","mapempirelv4.png","mapempirelv4_self.png","mapempirelv5.png","mapempirelv5_self.png",
"mapempirelv6.png","mapempirelv6_self.png","mapempirelv7.png","mapempirelv7_self.png","mapobj0lv1.png","mapobj0lv2.png","mapobj0lv3.png","mapobj1lv1.png","mapobj1lv2.png",
"mapobj1lv3.png","mapobj2lv1.png","mapobj2lv2.png","mapobj2lv3.png","mapobj3lv1.png","mapobj3lv2.png","mapobj3lv3.png","mapobj4lv1.png","mapobj4lv2.png","mapobj4lv3.png",
"mapuserboard0.png","moveback.png","moveblock.png",
"nobi0.png","nobi1.png","nobi2.png","nobi3.png","nobi4.png","nobi5.png","nobi6.png","nobi7.png","nobi8.png","nobi9.png","nobi10.png","nobi11.png","nobi12.png","nobi13.png","nobi14.png","nobi15.png","nobi16.png","nobi17.png","nobi18.png",
"nobilityback.png","nobilityreward.jpg",
"opbutton12.png","opbutton13.png","opbutton14.png","opbutton15.png","spyback.jpg","spyelement0.png","spyelement1.png",
"spyelement2.png","spyelement3.png","spyresultback.jpg","spytab0.png","spytab1.png","unbindButton.png","warabout0.png","warabout1.png","warback.png","warbutton00.png",
"warbutton01.png","warbutton10.png","warbutton11.png","warbutton20.png","warbutton21.png",
"warinfotab00.png","warinfotab01.png","warinfotab10.png","warinfotab11.png","warinfotab12.png","warmenulistback.png","warmenutab0.png",
"warmenutab1.png","warrecord.png","warrecordcell.png","4.mp3", "adddefencetitle.png","adddefenceboard.jpg","nobattletab0.png","nobattletab1.png","wartabperson_b.png","wartabperson_r.png",
"warlostleft.jpg","warwinelement2.jpg","warwinleft.jpg","warloseelement2.jpg","help2.png","defence.png","opbutton16.png"];
    var images;
    var imageindex;
    var imagemax;
    var flagtime;
    var needloading;
    function ImageController(){
        needloading=-1;
        /*if(sysinfo(21)>=3){
            var taskfile = c_res_file("resfile.txt");
            var taskstr = c_file_op(C_FILE_READ,taskfile);
            images1 = taskstr.split(",");
        }*/
        node().addaction(request("build600.png",1,null));
        node().addaction(request("build601.png",1,null));
    }
    function begindownload(i){
        if(i==1){
            images=images1;
        }
        else if(i==2){
            images=images2;
        }
        needloading=0;
        imagemax = len(images);
        imageindex = 0;
        flagtime=0;
        checkimages(0,0,0);
    }
    function checkimages(s,f,p){
        while(imageindex<imagemax&&checkimage(images[imageindex])==1){
            imageindex++;
            flagtime=0;
        }
    }
    
    function checkimage(str){
        var im=fetch(str);
        if(im!=null){
            im=null;
            return 1;
        }
        else{
            node().addaction(request(str,1,checkimages));
            needloading=1;
            imageindex++;
            return 0;
        }
    }
    
    function isdownloadfinish(){
        if(needloading==-1 || imageindex==imagemax){
            return 1;
        }
        return 0;
    }
}
