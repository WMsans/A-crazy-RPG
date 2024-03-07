/// @description 
if(global.gamestate != game_states.setting) exit;
var ds_grid=ds_menu_pages[page],ds_height=ds_grid_height(ds_grid);
if(inputting){
	if(input_check(global.keyx, 1)){
		inputting = false;
	}else	
	switch(ds_grid[# 1,menu_option[page]]){
		case element_type.input:
			var kk = keyboard_key;
			if(kk != 0&& kk != global.keyz){
				if(kk != ds_grid[# 3, menu_option[page]]){
					//play sound
					ds_grid[# 3, menu_option[page]] = kk;
				}
				variable_global_set(ds_grid[# 2, menu_option[page]], kk);
			}
			kk = mouse_button;
			if(kk != mb_none && kk != global.keyz){
				if(kk != ds_grid[# 3, menu_option[page]]){
					//play sound
					ds_grid[# 3, menu_option[page]] = kk;
				}
				variable_global_set(ds_grid[# 2, menu_option[page]], kk);
			}
		
			break;
		case element_type.shift:
			var hinput=input_check(global.keyright, 1)-input_check(global.keyleft, 1);
			if(hinput!=0){
				//play sound
				ds_grid[# 3,menu_option[page]]=clamp(ds_grid[# 3,menu_option[page]]+hinput,0,array_length_1d(ds_grid[# 4,menu_option[page]])-1);
				script_execute(ds_grid[# 2, menu_option[page]],ds_grid[# 3, menu_option[page]]);
			}
			break;
		case element_type.slider:
			if(menu_option[page]==1) audio_play_sound(snd_txt_init,1,false);
			var hinput = scr_get_mouse_deltx();
			if(hinput !=0){
				ds_grid[# 3,menu_option[page]]=clamp(ds_grid[# 3,menu_option[page]]+hinput*0.001,0,ds_grid[# 4,menu_option[page]][1]);
				script_execute(ds_grid[# 2, menu_option[page]],ds_grid[# 3, menu_option[page]]);
			}else{
				hinput=input_check(global.keyright, 0)-input_check(global.keyleft, 0);
				
				if(hinput!=0){
					ds_grid[# 3,menu_option[page]]=clamp(ds_grid[# 3,menu_option[page]]+hinput*0.01,0,ds_grid[# 4,menu_option[page]][1]);
					script_execute(ds_grid[# 2, menu_option[page]],ds_grid[# 3, menu_option[page]]);
				}
			}
			break;
		case element_type.toggle:
			mouse_delth_sum += scr_get_mouse_deltx();
			var hinput = mouse_delth_sum;
			show_debug_message(string(hinput))
			if(hinput < -mouse_change_dis){
				mouse_delth_sum = 0;
				ds_grid[# 3,menu_option[page]]=clamp(ds_grid[# 3,menu_option[page]]-1,0,1);
				script_execute(ds_grid[# 2, menu_option[page]],ds_grid[# 3, menu_option[page]]);
			}else if(hinput > mouse_change_dis){
				mouse_delth_sum =0;
				ds_grid[# 3,menu_option[page]]=clamp(ds_grid[# 3,menu_option[page]]+1,0,1);
				script_execute(ds_grid[# 2, menu_option[page]],ds_grid[# 3, menu_option[page]]);
			}else{
				hinput=input_check(global.keyright, 1)-input_check(global.keyleft, 1);
				if(hinput!=0){
					//play sound
					ds_grid[# 3,menu_option[page]]=clamp(ds_grid[# 3,menu_option[page]]+hinput,0,1);
					script_execute(ds_grid[# 2, menu_option[page]],ds_grid[# 3, menu_option[page]]);
				}
			}
			break;
	}
}else{
	mouse_deltv = scr_get_mouse_delty();
	mouse_deltv_sum += mouse_deltv;;
	if(mouse_deltv_sum < -mouse_change_dis){
		mouse_deltv_sum = 0;
		menu_option[page]--;
		if(menu_option[page]>ds_height-1-(page==0&&room==rm_title)) menu_option[page]=0;
		if(menu_option[page]<0) menu_option[page]=ds_height-1-(page==0&&room==rm_title);
		//audio play
	}else if(mouse_deltv_sum > mouse_change_dis){
		mouse_deltv_sum = 0;
		menu_option[page]++;
		if(menu_option[page]>ds_height-1-(page==0&&room==rm_title)) menu_option[page]=0;
		if(menu_option[page]<0) menu_option[page]=ds_height-1-(page==0&&room==rm_title);
		//audio play
	}
	var ochange= input_check(global.keydown, 1)-input_check(global.keyup, 1);
	if(ochange!=0){
		menu_option[page]+=ochange;
		if(menu_option[page]>ds_height-1-(page==0&&room==rm_title)) menu_option[page]=0;
		if(menu_option[page]<0) menu_option[page]=ds_height-1-(page==0&&room==rm_title);
		//audio play
	}
}
if(page==pages.graphics) ds_grid[# 3, menu_option[pages.graphics]]=!window_get_fullscreen();
if(input_check(global.keyz, 1)){
	scr_save_setting();
	mouse_delth_sum= mouse_deltv_sum =0;
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