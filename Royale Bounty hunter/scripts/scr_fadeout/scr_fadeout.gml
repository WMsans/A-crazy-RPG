///@function scr_fadeout(target room);To fade to another room
///@param {index) _targetroom
///param {integer} _target_x
///param {integer} _target_y
function scr_fadeout(_targetroom,_target_x,_target_y){
	global.target_x=_target_x;
	global.target_y=_target_y;
	
	with(instance_create_depth(0,0,layers.fade,obj_fade)){
		a=0;
		fadeout=1;
		target_room=_targetroom;
	}
	
}