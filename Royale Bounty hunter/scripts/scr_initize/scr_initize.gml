function scr_initize(){
	randomize();
	scr_enums();
	global.gamestate = game_states.init;
	global.gamestate_last = -1;
	global.checkpoint_id = noone;
	if(!file_exists("file0.sav")){
		scr_resetgame();
	}else{
		scr_loadgame();
	}
	scr_itemdata_load();
	scr_init_setting();
	for(var i=0;i<=global.charanum;i++) global.charahp[i]=global.charamaxhp[i];
	
	global.target_x=global.checkpoint_x;
	global.target_y=global.checkpoint_y;
	
	global.expecting_textblock_x=-999;
	global.expecting_textblock_y=-999;
	
	#region debug
	global.checkpoint_rm=rm_lab1;//first room of the game
	global.checkpoint_x=288;
	global.checkpoint_y=336;
	global.target_x=global.checkpoint_x;
	global.target_y=global.checkpoint_y;
	
	global.debug = 0;
	global.backpacksize = 999;
	scr_item_add(1);
	scr_item_add(2);
	scr_item_add(1);
	scr_item_add(2);
	scr_item_add(1);
	scr_item_add(2);
	scr_item_add(1);
	scr_item_add(2);
	scr_item_add(1);
	scr_item_add(2);
	scr_item_add(1);
	scr_item_add(2);
	scr_item_add(1);
	scr_item_add(2);
	scr_item_add(1);
	scr_item_add(2);
	scr_item_add(1);
	scr_item_add(2);
	
	scr_skill_add(1);
	scr_skill_add(2);
	
	scr_chara_join_team("Jack", 100, 5, 4, 2);
	#endregion
	
	instance_create_depth(-999,-999,0,obj_mouse_follow);
	instance_create_depth(-999,-999,0,obj_GAME);
	scr_fadeout(rm_title, global.target_x, global.target_y);
}