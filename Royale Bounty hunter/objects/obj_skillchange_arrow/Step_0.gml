/// @description animate 
tarx=obj_skillchange.arrow_tarx;
tary=obj_skillchange.arrow_tary;
//animate the moving
if(x<0||y<0){
	x=tarx;
	y=tary;
	now_scale  = 0;
	image_alpha = 0;
}else{
	x+=(tarx-x)/3;
	y+=(tary-y)/3;
}

image_alpha += (1 - image_alpha) / 10;
now_scale += (tarscale - now_scale) / 10;
image_xscale = now_scale;
image_yscale = now_scale;