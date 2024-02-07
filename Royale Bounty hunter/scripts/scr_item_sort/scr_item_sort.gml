function scr_item_sort(){
	var _cnt=1;
	for(var i=1;i<=global.item_num;i++){
		if(global.item[i]!=0){
			if(_cnt!=i){
				global.item[_cnt++]=global.item[i];
				global.item[i]=0;
			}else{
				_cnt++;
			}
		}
	}
	global.item_num=_cnt-1;
}