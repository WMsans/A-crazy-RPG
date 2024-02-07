function scr_item_drop(_item_pos){
	with(instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_item_dropped)){
		item_id=global.item[_item_pos];
	}
	scr_item_remove(_item_pos);
}