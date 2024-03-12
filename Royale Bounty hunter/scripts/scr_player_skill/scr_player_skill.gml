function scr_player_skill(){
	if(global.gamestate != game_states.init){
		scr_player_skillend();
	}
	switch(global.charaskill[global.charanowskill]){
		case 1://Alex: 冲刺
			if(hsp==0&&vsp==0){
				scr_player_skillend();
				break;
			}
			var _k=0;
			var _wall_flag=0;
			if(skill_tarx==-999&&skill_tary==-999){//计算目标位置
				if(hsp==0){
					if(vsp==0){
						_k=0;
					}else{
						_k=99999;
					}
				}else{
					_k=vsp/hsp;
				}
				skill_tarx=sign(hsp)*sqrt(200*200 / (1 + _k*_k))+x;
				if(hsp!=0) skill_tary=_k*(skill_tarx-x)+y;
				else if(vsp!=0) skill_tary=sign(vsp)*200+y;
			}
			if(abs(x-skill_tarx)>=5||abs(y-skill_tary)>=5){
				
				
				var _hsp=(skill_tarx-x)/4;
				if(scr_touch_block(x+_hsp,y)){
					_wall_flag=1;
					var _blockid=scr_place_block(x + _hsp, y);
					var single=sign(_blockid.x-x);
					while(scr_touch_block(x - single,y)){
						x+=single;
					}
					_hsp=0;
				}
				x+=_hsp;//move the character hon
				
				var _vsp=(skill_tary-y)/4;
				if(scr_touch_block(x,y+_vsp)){
					_wall_flag=1;
					var _blockid = scr_place_block(x + _hsp, y + _vsp);;
					
					var single=sign(y-_blockid.y);
					while(scr_touch_block(x ,y- single)){
						y+=single;
					}
					_vsp=0;
				}
				y+=_vsp-z_move;//move the character vir
				if(_wall_flag){
					scr_player_skillend();
					break;
				}
			}else{//到了, 结束
				scr_player_skillend();
				break;
			}
			
			break;
		case 2://Alex: 挥拳
			instance_create_depth(x,y, depth-1,obj_slash);
			scr_player_skillend();
			break;
	}
}