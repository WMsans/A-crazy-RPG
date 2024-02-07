/// @description 
var _pos=audio_sound_get_track_position(bgm);
if(_pos>total_len && total_len > 0){
	audio_sound_set_track_position(bgm,_pos-loop_len);
}
if(audio_sound_get_gain(bgm)<=0){
	audio_stop_sound(bgm);
	event_user(1);
}
