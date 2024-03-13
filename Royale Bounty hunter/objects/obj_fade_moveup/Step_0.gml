/// @description 
if(fadeout){
	
	
	
		room_goto(target_room);
	
} else{
	if(!flag){
		
		scr_anim_create(id, "a", ANIM_TWEEN.CUBIC,1,0,-h, 60);
		flag = true;
	}
	if(a==-h)
		instance_destroy();
}

//show_debug_message(string(fadeout))