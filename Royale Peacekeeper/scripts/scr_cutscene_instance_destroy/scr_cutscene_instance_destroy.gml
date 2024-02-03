///@arg obj_name
function scr_cutscene_instance_destroy(){
	with(argument0){
		instance_destroy();
	}
	
	scr_cutscene_end_action();
}