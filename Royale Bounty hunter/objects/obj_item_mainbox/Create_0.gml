use_item_guide_txt="Press "+keychecks(global.keyright)+" to use the item, or select another item to combine them.";//translate
enable_combine = true;

#region don't tweak
box_x=0;
box_y=0;

border=32;
showing=0;
last_showing = showing;
arrow_pos=1;
arrow_tarx=0;
arrow_tary=0;
arrow_img=0;
arrow_selecting=1;
selected_item1=0;
yborder_negative_tar=0;
yborder_negative=0;

selected_character=1;

/*for(var i=1;i<=global.item_num;i++){
	item_posx[i]=0;
	item_tarposx[i]=0;
	item_alpha[1]=0;
	item_taralpha[1]=0;
}*/
item_posx[1]=160+box_x+border;
item_tarposx[1]=160+box_x+border;
item_alpha[1]=0;
item_taralpha[1]=0;
for(var i=1;i<=global.item_num;i++){
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

chara_posx[1]=0;
chara_tarposx[1]=0;
for(var i=1;i<=global.charanum;i++){
	chara_posx[i]=288+box_x+border;
	chara_tarposx[i]=288+box_x+border;
}


#endregion