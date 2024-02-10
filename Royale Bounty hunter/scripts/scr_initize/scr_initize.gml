function scr_initize(){
	randomize();
	scr_enums();
	global.gamestate = game_states.init;
	global.gamestate_last = -1;
	if(!file_exists("file0.sav")){
		scr_resetgame();
	}
	scr_itemdata_load();
	scr_load_setting();
	for(var i=0;i<=global.charanum;i++) global.charahp[i]=global.charamaxhp[i];
	
	global.target_x=global.checkpoint_x;
	global.target_y=global.checkpoint_y;
	
	global.expecting_textblock_x=-999;
	global.expecting_textblock_y=-999;
	
	#region debug
	global.debug = 1;
	scr_item_add(1);
	scr_item_add(2);
	scr_skill_add(1);
	scr_skill_add(1);
	#endregion
	instance_create_depth(-999,-999,0,obj_GAME);
	scr_fadeout(rm_title, global.target_x, global.target_y);
}