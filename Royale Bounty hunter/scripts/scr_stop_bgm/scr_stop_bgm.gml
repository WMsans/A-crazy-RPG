function scr_stop_bgm(){
	if(instance_exists(obj_bgm)){
		with(obj_bgm){
			event_user(0);
		}
	}
}