function scr_new_bgm(_bgm, _into_len,_loop_len){
	if(instance_exists(obj_bgm)){
		if(obj_bgm.bgm_id==_bgm) return obj_bgm;
		var _id;
		with(obj_bgm){
			event_user(0);
			new_bgm=_bgm;
			new_into_len=_into_len;
			new_loop_len=_loop_len;
			_id=id;
		}
		return _id;
	}else return scr_play_bgm(_bgm,_into_len,_loop_len);
}