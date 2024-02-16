/// @description 
if(instance_exists(obj_player)){
	if(distance_to_object(obj_player)<24 && global.gamestate == game_states.init){
		//tarscale=1.2;
		if(global.expecting_textblock_x==-999||global.expecting_textblock_y==-999){
			global.expecting_textblock_x=x;
			global.expecting_textblock_y=y-sprite_height/2;
			if(!instance_exists(obj_block_arrow) && global.gamestate != game_states.cutscene && !instance_exists(obj_textbox) && touch_r==0){
				
				with(instance_create_depth(x+sprite_width/2,y,layers.UI,obj_block_arrow)){
					image_xscale=0;
					image_yscale=0;
				}
			}
		}
		if(input_check(global.keyz, Input_State.pressed)){
			if(global.gamestate == game_states.init && !instance_exists(obj_textbox) && !touch_r && global.expecting_textblock_x==x && global.expecting_textblock_y==y-sprite_height/2){
				scr_create_text(sign_id);
			}
			touch_r=1;
		}
	}else{
		touch_r=0;
		arrow_r=0;
		if(global.expecting_textblock_x==x && global.expecting_textblock_y==y-sprite_height/2){
			global.expecting_textblock_x=-999;
			global.expecting_textblock_y=-999;
		}
	}
}else{
	touch_r=0;
	arrow_r=0;
}

