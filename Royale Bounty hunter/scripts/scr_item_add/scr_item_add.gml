///@arg item_index
function scr_item_add(_add){
	if(global.item_num<global.backpacksize){
		scr_item_sort();
		global.item[++global.item_num]=_add;
		if(instance_exists(obj_item_mainbox)){
			with(obj_item_mainbox){
				var i=global.item_num;
				item_posx[i]=160+box_x+border;
				item_tarposx[i]=160+box_x+border;
				item_alpha[i]=1;
				if(arrow_pos<=9){
					if(i<=10) item_taralpha[i]=1;
					else item_taralpha[i]=0;
				}else if(arrow_pos==global.item_num){
					if(arrow_pos-i<=9) item_taralpha[i]=1;
					else item_taralpha[i]=0;
				}else{
					if(arrow_pos-i<=8&&i<arrow_pos) item_taralpha[i]=1;
					else if(i-arrow_pos<=1&&i>arrow_pos) item_taralpha[i]=1;
					else item_taralpha[i]=0;
				}
			}
		}
		scr_item_sort();
	}else if(instance_exists(obj_player)){
		with(instance_create_layer(obj_player.x,obj_player.y,"Instances",obj_item_dropped)){
			item_id=_add;
		}
	}
}