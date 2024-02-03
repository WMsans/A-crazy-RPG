/// @description 
if(instance_exists(obj_camera))
draw_sprite_ext(sprite_index, image_index, x + obj_camera.x - obj_camera.view_w_half, y + obj_camera.y - obj_camera.view_h_half,image_xscale, image_yscale, image_angle, image_blend, image_alpha);
else draw_self();