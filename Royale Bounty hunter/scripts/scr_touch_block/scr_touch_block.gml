///@arg x
///@arg y
function scr_touch_block(_x, _y){
	return place_meeting(_x, _y, obj_block) || place_meeting(_x, _y, obj_block_transparent)
}

///@arg x
///@arg y
function scr_place_block(_x, _y){
	var _id = instance_place(_x, _y, obj_block);
	if(_id == noone) _id = instance_place(_x, _y, obj_block_transparent);
	return _id; 
}