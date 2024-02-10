function scr_skill_init(_pos){
	if(global.charaskillnum==0) return false;
	switch(global.charaskill[global.charanowskill]){
		case 1://aleX 冲刺
			skill_cool=10;
			skill_tarx=-999;
			skill_tary=-999;
			break;
	}
	skill_cool_timer=skill_cool;
	return true;
}