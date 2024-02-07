/// @description turn to player
event_inherited();
if(instance_exists(obj_player)){
	if(obj_player.x - x != 0){
		image_xscale = sign(obj_player.x - x);
	}
}