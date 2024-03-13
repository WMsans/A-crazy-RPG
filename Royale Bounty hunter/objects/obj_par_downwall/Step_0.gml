/// @description 
if(place_meeting(x,y,obj_player)){
	tar_alpha = 0.7;
}else{
	tar_alpha = 1;
}

image_alpha += (tar_alpha - image_alpha) / 5;