/// @description 
draw_self();
//显示技能冷却
/*
if(global.charaskillnum){
	if(skill_cool_timer&&!instance_exists(obj_cutscene)) draw_rectangle_color(x-27,y-80,x+54*(skill_cool_timer/skill_cool)-27,y-60,make_color_rgb(0,131,255),make_color_rgb(107,206,255),make_color_rgb(107,206,255),make_color_rgb(0,131,255),false);
}*/
//flash
if(flashalpha>0){
	shader_set(sh_flash);
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,flashcolor,flashalpha);
	shader_reset();
}