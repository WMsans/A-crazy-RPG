/// @description 

if(cursor_showing){
	draw_sprite_ext(sprite_index, image_index, cursor_x, cursor_y, cursor_scale, cursor_scale, image_angle, image_blend, image_alpha);
	cursor_tarscale = 1;
}else{
	cursor_tarscale = 0;
}
	
cursor_scale += (cursor_tarscale - cursor_scale) / 5;



