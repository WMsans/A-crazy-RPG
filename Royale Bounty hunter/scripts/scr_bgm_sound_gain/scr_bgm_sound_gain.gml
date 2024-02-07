///@arg level
///@arg time
function scr_bgm_sound_gain(){
	if(instance_exists(obj_bgm)){
		audio_sound_gain(obj_bgm.bgm,argument[0],argument[1]);
	}
}