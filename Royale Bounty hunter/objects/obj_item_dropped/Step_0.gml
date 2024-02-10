if(instance_exists(obj_player)){
	if(distance_to_object(obj_player)<24 && !obj_item_mainbox.showing){
		if(global.expecting_textblock_x==-999||global.expecting_textblock_y==-999){
			global.expecting_textblock_x=x;
			global.expecting_textblock_y=y-sprite_height/2;
			if(!instance_exists(obj_block_arrow) && global.gamestate == game_states.init && touch_r==0){
				with(instance_create_depth(x+sprite_width/2,y,layers.UI,obj_block_arrow)){
					image_xscale=0;
					image_yscale=0;
				}
			}
		}
		if(keyboard_check_pressed(global.keyz)){
			if(global.gamestate == game_states.init && !touch_r && global.expecting_textblock_x==x && global.expecting_textblock_y==y-sprite_height/2){
				touch_r=0;
				arrow_r=0;
				global.expecting_textblock_x=-999
				global.expecting_textblock_y=-999;
				scr_item_add(item_id);
				scr_create_text("item_pick"+string(item_id));
				
				instance_destroy();
			}
			touch_r=1;
		}
	}else{
		touch_r=0;
		arrow_r=0;
		if(global.expecting_textblock_x==x&&global.expecting_textblock_y==y-sprite_height/2){
			global.expecting_textblock_x=-999;
			global.expecting_textblock_y=-999;
		}
	}
}else{
	touch_r=0;
	arrow_r=0;
}



