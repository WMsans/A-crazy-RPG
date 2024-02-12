///@arg x
///@arg y
///@arg block_index
function scr_touch_block(_x, _y){
	return place_meeting(_x, _y, obj_block) || place_meeting(_x, _y, obj_block_transparent)
}