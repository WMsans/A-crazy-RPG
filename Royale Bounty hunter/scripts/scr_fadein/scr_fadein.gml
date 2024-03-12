///@arg fadeinrate
function scr_fadein(){
	if(!instance_exists(obj_fade)){
		show_debug_message(string(obj_fade.fadeout))
		if(argument_count==0) instance_create_depth(0,0,layers.fade,obj_fade);
		if(argument_count==1) with(instance_create_depth(0,0,layers.fade,obj_fade)){
			fadeinrate=argument0;
		}
	}else{
		obj_fade.fadeout=0; 
		
		if(argument_count == 1){
			obj_fade.fadeinrate=argument0;
		}
	}
}