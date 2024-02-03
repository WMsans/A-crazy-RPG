function scr_initize(){
	scr_enums();
	global.gamestate = game_states.init;
	global.gamestate_last = -1;
	if(!file_exists("file0.sav")){
		global.checkpoint_rm=rm_1;//first room of the game
		global.checkpoint_x=768;
		global.checkpoint_y=288;
		
		#region keyboard
		global.keyup = vk_up;
		global.keydown = vk_down;
		global.keyleft = vk_left;
		global.keyright = vk_right;
		global.keyz = ord("Z");
		global.keyx = ord("X");
		global.keyesc = vk_escape;
		#endregion
	}
	scr_load_setting();
	
	
	global.target_x=global.checkpoint_x;
	global.target_y=global.checkpoint_y;
	
	global.expecting_textblock_x=-999;
	global.expecting_textblock_y=-999;
	
	global.debug = 0;
	
	global.plot = 1; 
	instance_create_depth(-999,-999,0,obj_GAME);
	scr_fadeout(rm_title, global.target_x, global.target_y);
}