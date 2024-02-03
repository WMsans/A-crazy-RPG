///@arg x1
///@arg y1
///@arg x2
///@arg y2
function scr_get_point_distance(_x1, _y1, _x2, _y2){
	return sqrt(sqr(_x1 - _x2)  + sqr(_y1 - _y2));
}