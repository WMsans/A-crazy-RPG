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
		if(scr_touch_block(x + hsp, y)){
			var single=sign(hsp);
			while(!scr_touch_block(x + single, y)) x+=single;
			hsp=0;
		}

		if(scr_touch_block(x, y + vsp)){
			var single=sign(vsp);
			while(!scr_touch_block(x , y+ single)) y+=single;
			vsp=0;
		}
	}
	x+=hsp;//move the character hon
	y+=vsp;//move the character vir
	#endregion
	#region animation
	sprite_index = spr;
	if(dirh != 0) image_xscale = dirh;
	if(hsp == 0 && vsp == 0){
		image_speed = 0;
		image_index = 0;
	}else{
		image_speed = 1;
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