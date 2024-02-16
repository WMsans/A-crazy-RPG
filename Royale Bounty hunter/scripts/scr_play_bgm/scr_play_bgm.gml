function scr_play_bgm(_bgm, _into_len,_loop_len){
	
	if(instance_exists(obj_bgm)){
		obj_bgm.into_new_room = false;
		if(obj_bgm.bgm_id==_bgm){
			return obj_bgm;
		}
		return scr_new_bgm(_bgm, _into_len,_loop_len);
		
	}else{
		var _con=instance_create_layer(-999,-999,"Instances",obj_bgm);
		with(_con){
			new_bgm=_bgm;
			new_into_len=_into_len;
			new_loop_len=_loop_len;
			event_user(1);
		}
		_con.into_new_room = false;
		return _con;
	}
	
}