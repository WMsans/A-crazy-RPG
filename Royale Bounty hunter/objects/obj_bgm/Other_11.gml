/// @description start new music
if(audio_exists(new_bgm)){
	bgm_id=new_bgm;
	new_bgm=noone;
	into_len=new_into_len;
	new_into_len=0;
	loop_len=new_loop_len;
	new_loop_len=0;
	if(loop_len <= 0){
		bgm= audio_play_sound(bgm_id,1000,1);
		loop_len = -1;
		total_len = loop_len;
	}else{
		bgm= audio_play_sound(bgm_id,1000,0);
		total_len=into_len+loop_len;
	}
}