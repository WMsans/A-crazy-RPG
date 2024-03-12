/// @description 
if(scr_animation_end()){
	instance_destroy();
}
x = obj_player.x;
y = obj_player.y;
image_angle += (obj_player.facing_angle - image_angle) / 5;

var slashing_instances = ds_list_create();
var _len = instance_place_list(x,y,obj_par_depthobj, slashing_instances, false);
for(var i = 0; i < _len; i ++){
	if(ds_list_find_index(slashed_instances, slashing_instances[| i]) != -1)
		continue;
	
	ds_list_add(slashed_instances, slashing_instances[| i]);
	with(slashing_instances[| i]){
		event_user(0);
	}
}

ds_list_destroy(slashing_instances);