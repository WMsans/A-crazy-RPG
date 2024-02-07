function scr_itemdata_com_load(){
	for(var i=0;i<999;i++) 
		for(var j=0;j<999;j++)
			global.itemdata_com[i][j]=0;
	
	global.itemdata_com[1][2]=scr_item_com_applebanana;
	global.itemdata_com[2][1]=scr_item_com_applebanana;
	//这个表示编号1（apple)和编号2（banana）进行物品合成会执行scr_item_com_applebanana()。
}