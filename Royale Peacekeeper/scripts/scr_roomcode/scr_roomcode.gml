function scr_roomcode(){
	scr_fadein();
	if(!instance_exists(obj_camera)){
		instance_create_depth(global.target_x,global.target_y,layers.overworld,obj_camera);
	}
	if(!instance_exists(obj_drawsorter)){
		instance_create_depth(-999,-999,layers.overworld,obj_drawsorter);
	}
	if(!instance_exists(obj_player)){
		instance_create_depth(global.target_x,global.target_y, layers.overworld, obj_player);
	}
	global.gamestate = game_states.init;
}