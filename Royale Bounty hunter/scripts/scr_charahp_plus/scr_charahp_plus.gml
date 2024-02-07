function scr_charahp_plus(_pos,_num){
	global.charahp[_pos]=clamp(global.charahp[_pos]+_num,0,global.charamaxhp[_pos]);
	return global.charahp[_pos];
}