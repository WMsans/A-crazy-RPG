//set for the target pos
switch(obj_textbox.option_num){
	case 1:
		tarx=obj_textbox.box_x+640-32;
		tary=obj_textbox.box_y+128-string_height(obj_textbox.option[0])/2;
		break;
	case 2:
		if(obj_textbox.option_pos==0){
			tarx=obj_textbox.box_x+640-32;
			tary=obj_textbox.box_y+128-string_height(obj_textbox.option[0])/2;
		}
		if(obj_textbox.option_pos==1){
			tarx=obj_textbox.box_x+144+string_width(obj_textbox.option[0])/2+obj_textbox.border-32;
			tary=obj_textbox.box_y+128-string_height(obj_textbox.option[0])/2;
		}
		if(obj_textbox.option_pos==2){
			tarx=obj_textbox.box_x+144+992-string_width(obj_textbox.option[1])/2-obj_textbox.border-32;
			tary=obj_textbox.box_y+128-string_height(obj_textbox.option[1])/2;
		}
		break;
	case 3:
		if(obj_textbox.option_pos==1){
			tarx=obj_textbox.box_x+144+string_width(obj_textbox.option[0])/2+obj_textbox.border-32;
			tary=obj_textbox.box_y+128-string_height(obj_textbox.option[0])/2;
		}
		if(obj_textbox.option_pos==2){
			tarx=obj_textbox.box_x+640-32;
			tary=obj_textbox.box_y+128-string_height(obj_textbox.option[0])/2;
		}
		if(obj_textbox.option_pos==3){
			tarx=obj_textbox.box_x+144+992-string_width(obj_textbox.option[1])/2-obj_textbox.border-32;
			tary=obj_textbox.box_y+128-string_height(obj_textbox.option[1])/2;
		}
		break;
	case 4:
		if(obj_textbox.option_pos==0){
			tarx=obj_textbox.box_x+640-32;
			tary=obj_textbox.box_y+128-string_height(obj_textbox.option[0])/2;
		}
		if(obj_textbox.option_pos==1){
			tarx=obj_textbox.box_x+640-32;
			tary=obj_textbox.box_y+64-string_height(obj_textbox.option[0])/2;
		}
		if(obj_textbox.option_pos==2){
			tarx=obj_textbox.box_x+640-32;
			tary=obj_textbox.box_y+192-string_height(obj_textbox.option[1])/2;
		}
		if(obj_textbox.option_pos==3){
			tarx=obj_textbox.box_x+144+string_width(obj_textbox.option[0])/2+obj_textbox.border-32;
			tary=obj_textbox.box_y+128-string_height(obj_textbox.option[0])/2;
		}
		if(obj_textbox.option_pos==4){
			tarx=obj_textbox.box_x+144+992-string_width(obj_textbox.option[1])/2-obj_textbox.border;
			tary=obj_textbox.box_y+128-string_height(obj_textbox.option[1])/2;
		}
		break;
}
//animate the moving
if(x==-999||y==-999){
	x=tarx;
	y=tary;
}else{
	x+=(tarx-x)/3;
	y+=(tary-y)/3;
}