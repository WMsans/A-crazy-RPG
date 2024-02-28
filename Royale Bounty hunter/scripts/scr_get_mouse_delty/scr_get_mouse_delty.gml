function scr_get_mouse_delty(){
	if(instance_exists(obj_mouse_follow)){
		return obj_mouse_follow.mouse_vsp;
	}
	return 0;
}