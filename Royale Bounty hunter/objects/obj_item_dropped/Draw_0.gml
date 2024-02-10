/// @description 
if(timer == change_per){//调整tarscale
	
	if(tarscale==1) tarscale=0.9;
	else tarscale=1;
	scr_anim_create(id, "nowscale", 2,2, nowscale, tarscale - nowscale, change_per);
	timer = 0;
}else timer ++;

draw_sprite_ext(sprite_index,image_index,x,y,nowscale,nowscale,image_angle,image_blend,image_alpha);