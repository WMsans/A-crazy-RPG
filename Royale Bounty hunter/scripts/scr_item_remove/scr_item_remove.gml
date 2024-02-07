function scr_item_remove(_pos){
	global.item[_pos]=0;
	scr_item_sort();
}