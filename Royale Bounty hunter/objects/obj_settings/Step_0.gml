/// @description 
if(global.gamestate != game_states.setting) exit;
var ds_grid=ds_menu_pages[page],ds_height=ds_grid_height(ds_grid);
if(inputting){
	switch(ds_grid[# 1,menu_option[page]]){
		case element_type.input:
			var kk = keyboard_lastkey;
			if(kk != global.keyz){
				if(kk != ds_grid[# 3, menu_option[page]]){
					//play sound
					ds_grid[# 3, menu_option[page]] = kk;
				}
				variable_global_set(ds_grid[# 2, menu_option[page]], kk);
			}
		
			break;
		case element_type.shift:
			var hinput=keyboard_check_pressed(global.keyright)-keyboard_check_pressed(global.keyleft);
			if(hinput!=0){
				//play sound
				ds_grid[# 3,menu_option[page]]=clamp(ds_grid[# 3,menu_option[page]]+hinput,0,array_length_1d(ds_grid[# 4,menu_option[page]])-1);
				script_execute(ds_grid[# 2, menu_option[page]],ds_grid[# 3, menu_option[page]]);
			}
			break;
		case element_type.slider:
			if(menu_option[page]==1) audio_play_sound(snd_txt_init,1,false);
			var hinput=keyboard_check(global.keyright)-keyboard_check(global.keyleft);
			if(hinput!=0){
				ds_grid[# 3,menu_option[page]]=clamp(ds_grid[# 3,menu_option[page]]+hinput*0.01,0,ds_grid[# 4,menu_option[page]][1]);
				script_execute(ds_grid[# 2, menu_option[page]],ds_grid[# 3, menu_option[page]]);
			}
			
			break;
		case element_type.toggle:
			var hinput=keyboard_check_pressed(global.keyright)-keyboard_check_pressed(global.keyleft);
			if(hinput!=0){
				//play sound
				ds_grid[# 3,menu_option[page]]=clamp(ds_grid[# 3,menu_option[page]]+hinput,0,1);
				script_execute(ds_grid[# 2, menu_option[page]],ds_grid[# 3, menu_option[page]]);
			}
			
			break;
	}
}else{
	var ochange= keyboard_check_pressed(global.keydown)-keyboard_check_pressed(global.keyup);
	if(ochange!=0){
		menu_option[page]+=ochange;
		if(menu_option[page]>ds_height-1-(page==0&&room==rm_title)) menu_option[page]=0;
		if(menu_option[page]<0) menu_option[page]=ds_height-1-(page==0&&room==rm_title);
		//audio play
	}
}
if(page==pages.graphics) ds_grid[# 3, menu_option[pages.graphics]]=!window_get_fullscreen();
if(keyboard_check_pressed(global.keyz)){
	scr_save_setting();
	switch(ds_grid[# 1,menu_option[page]]){
		case element_type.script_runner:
			script_execute(ds_grid[# 2,menu_option[page]]);
			break;
		case element_type.page_transfer:
			page=ds_grid[# 2,menu_option[page]];
			inputting=0;
			break;
		case element_type.shift: 
		case element_type.slider:
		case element_type.toggle:
		case element_type.input:
			inputting=!inputting;
			break;
	}
}