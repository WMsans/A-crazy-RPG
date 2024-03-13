/// @description 
mouse_hsp = window_mouse_get_delta_x() * global.mouse_sensitivity;
mouse_vsp = window_mouse_get_delta_y() * global.mouse_sensitivity;
if(instance_exists(obj_player) && global.gamestate == game_states.init && !instance_exists(obj_fade)&& !(instance_exists(obj_textbox) && obj_textbox.chosing == 1)){
		
	if(input_check(global.keyshift, 0)){
		if(!ori_flag){
			ori_flag = true;
		
			obj_player.accel=ori_accel;
			obj_player.decel=ori_decel;
			obj_player.max_sp=ori_max_sp;
		
			cursor_showing = true;
			cursor_x = obj_player.x;
			cursor_y = obj_player.y;
		}
	
		cursor_x += mouse_hsp + obj_camera.hsp;
		cursor_y += mouse_vsp + obj_camera.vsp;
	
		var p_d = point_direction(obj_player.x, obj_player.y, cursor_x, cursor_y);
		
		obj_player.hsp = clamp((cursor_x - obj_player.x)/3, -abs(lengthdir_x(obj_player.max_sp * sqrt(2), p_d)), abs(lengthdir_x(obj_player.max_sp * sqrt(2), p_d)));
		obj_player.vsp = clamp((cursor_y - obj_player.y)/3, -abs(lengthdir_y(obj_player.max_sp * sqrt(2), p_d)), abs(lengthdir_y(obj_player.max_sp * sqrt(2), p_d)));
	}else{
		cursor_showing = false;
		
		with(obj_player){
			if(other.ori_flag){
				other.ori_flag = false;
				other.ori_accel = accel;
				other.ori_decel = decel;
				other.ori_max_sp = max_sp;
				accel=0;
				decel=0;
				max_sp=1000;
			}
			
			key_left=0;
			key_right=0;
			key_down=0;
			key_up=0;
			
			hsp = other.mouse_hsp;
			vsp = other.mouse_vsp;
		
		}
	}
}else if (instance_exists(obj_player)  && !instance_exists(obj_fade)){
	cursor_showing = false;
	ori_flag = true;
	with(obj_player){
		if(other.ori_flag){
			other.ori_flag = false;
			other.ori_accel = accel;
			other.ori_decel = decel;
			other.ori_max_sp = max_sp;
			accel=0;
			decel=0;
			max_sp=1000;
		}
		
		key_left=0;
		key_right=0;
		key_down=0;
		key_up=0;
		
		hsp = 0;
		vsp = 0;
	
	}
}else if(instance_exists(obj_fade)){
	cursor_showing = false;
}

