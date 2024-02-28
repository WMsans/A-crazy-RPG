function scr_get_mouse_deltx(){
	if(instance_exists(obj_mouse_follow)){
		return obj_mouse_follow.mouse_hsp;
	}
	return 0;
}