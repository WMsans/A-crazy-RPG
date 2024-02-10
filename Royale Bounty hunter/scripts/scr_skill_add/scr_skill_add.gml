function scr_skill_add(_skill_idx){
	global.charaskillnum++;
	global.charaskill[global.charaskillnum]=_skill_idx;
	if(instance_exists(obj_player)){
		obj_player.initflag=1;
	}
}