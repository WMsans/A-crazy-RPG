///@arg obj_id
///@arg image_xscale
function scr_cutscene_change_xscale(){
	var arg;
	for(var i=0;i<argument_count;i++){
		arg[i]=argument[i];
	}
	
	if(argument_count>1){
		with(arg[0]){
			image_xscale=arg[1];
		}
	}else{
		with(arg[0]){
			image_xscale=-image_xscale;
		}
	}
	
	
	scr_cutscene_end_action();
}