/// @description Set the Target Pos
tarx=obj_item_mainbox.arrow_tarx;
tary=obj_item_mainbox.arrow_tary;

//animate the moving
if(x==-999||y==-999){
	x=tarx;
	y=tary;
}else{
	x+=(tarx-x)/3;
	y+=(tary-y)/3;
}