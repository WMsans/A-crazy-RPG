function scr_player_normal(){
	#region movement
	dirh=key_right-key_left;
	dirv=key_down-key_up;
	if(dirh!=0&&dirv==0) facing=dirh*2;
	else if(dirv!=0&&dirh==0) facing=0-dirv;

	if(dirh!=0) last_dirh=dirh;
	if(dirv!=0) last_dirv=dirv;

	hsp+=accel*dirh;
	vsp+=accel*dirv;
	//stop chara from hor
	if(dirh==0){
		if(hsp>0){
			
			hsp=max(0,hsp+decel);
		}
		if(hsp<0){
			hsp=min(0,hsp-decel);
		}
	}
	//stop chara from vir
	if(dirv==0){
		if(vsp>0){
			vsp=max(0,vsp+decel);
		}
		if(vsp<0){
			vsp=min(0,vsp-decel);
		}
	}

	hsp=clamp(hsp,-max_sp,max_sp);
	vsp=clamp(vsp,-max_sp,max_sp);
	//check the block
	if(!scr_touch_block(x ,y)){
		if(scr_line_touch_block(bbox_left, bbox_top, bbox_left + hsp, bbox_top, false) || scr_line_touch_block(bbox_left, bbox_bottom, bbox_left + hsp, bbox_bottom, false) || scr_line_touch_block(bbox_right, bbox_bottom, bbox_right + hsp, bbox_bottom, false) || scr_line_touch_block(bbox_right, bbox_top, bbox_right + hsp, bbox_top, false)){
			var single=sign(hsp);
			while(!scr_touch_block(x + single, y)) x+=single;
			if(scr_player_get_speeding()){
				if(ds_list_find_index(hit_blocks, scr_place_block(x + single, y)) == -1){
					ds_list_add(hit_blocks, scr_place_block(x + single, y));
				}
			}
			hsp=0;
		}

		if(scr_line_touch_block(bbox_left, bbox_top, bbox_left, bbox_top + vsp, false) || scr_line_touch_block(bbox_left, bbox_bottom, bbox_left, bbox_bottom + vsp, false) || scr_line_touch_block(bbox_right, bbox_bottom, bbox_right, bbox_bottom + vsp, false) || scr_line_touch_block(bbox_right, bbox_top, bbox_right, bbox_top + vsp, false)){
			var single=sign(vsp);
			while(!scr_touch_block(x , y+ single)) y+=single;
			if(scr_player_get_speeding()){
				if(ds_list_find_index(hit_blocks, scr_place_block(x , y+ single)) == -1){
					ds_list_add(hit_blocks, scr_place_block(x , y+ single));
				}
			}
			vsp=0;
		}
		
		if(scr_line_touch_block(bbox_left, bbox_top, bbox_left + hsp, bbox_top + vsp, false) || scr_line_touch_block(bbox_left, bbox_bottom, bbox_left+ hsp, bbox_bottom + vsp, false) || scr_line_touch_block(bbox_right, bbox_bottom, bbox_right+ hsp, bbox_bottom + vsp, false) || scr_line_touch_block(bbox_right, bbox_top, bbox_right+ hsp, bbox_top + vsp, false)){
			var single_h=sign(hsp);
			var single_v=sign(vsp) * abs(vsp / hsp);
			
			while(!scr_touch_block(x + single_h , y+ single_v)){
				x += single_h;
				y+=single_v;
			}
			if(scr_player_get_speeding()){
				if(ds_list_find_index(hit_blocks, scr_place_block(x + single_h , y+ single_v)) == -1){
					ds_list_add(hit_blocks, scr_place_block(x + single_h, y+ single_v));
				}
			}
			hsp = 0;
			vsp=0;
		}
	}
	x+=hsp;//move the character hon
	y+=vsp;//move the character vir
	#endregion
	#region Hit blocks
	for(var i = 0; i < ds_list_size(hit_blocks);i++){
		with(hit_blocks[| i]){
			scr_breakable_hit();
		}
	}
	ds_list_clear(hit_blocks);
	#endregion
	#region animation
	sprite_index = spr;
	if(abs(hsp) > 1) image_xscale = sign(hsp);
	if(hsp == 0 && vsp == 0 && anim_speed_timer % anim_speed_buff == 0){
		image_speed = 0;
		image_index = 0;
		anim_speed_timer = 0;
	}else{
		image_speed = 1;
		anim_speed_timer++;
	}
	if(hsp != 0 || vsp != 0){
		facing_angle = point_direction(0,0,hsp, vsp);
	}

	#endregion
	#region skill
	if(global.charaskillnum){
		if(input_check(global.keyx, 1)&&!skill_cool_timer&&global.charaskillnum&&global.gamestate == game_states.init){
			player_state=PLAYER_STATES.skill;
			scr_overworld_chara_skill_spr();
			skill_cool_timer=skill_cool;
		}else if(skill_cool_timer){
			skill_cool_timer--;
		}
	}
	#endregion
}