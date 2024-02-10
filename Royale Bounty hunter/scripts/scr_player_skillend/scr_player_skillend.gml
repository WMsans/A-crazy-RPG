function scr_player_skillend(){
switch(global.charaskill[global.charanowskill]){
		case 1://Alex: 冲刺
			skill_tarx=-999;
			skill_tary=-999;
			player_state=PLAYER_STATES.normal;
			
			#region sprite animation
			if(hsp >= 1) image_xscale = dirh;
			if(hsp == 0 && vsp == 0){
				image_speed = 0;
				image_index = 0;
			}else{
				image_speed = 1;
			}
			#endregion
			break;
	}
}