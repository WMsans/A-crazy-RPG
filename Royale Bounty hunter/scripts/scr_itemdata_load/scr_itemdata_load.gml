/*How to add an item:
1.add info right here
2.go to combine(unnecessary)
3.go to game_txt to add a picking-up text
4.add a item_scr and a battle_use_scr
*/
function scr_itemdata_load(){//translate
	global.itemdata_name[1]="apple";//物品名
	global.itemdata_des[1]="Very juicy!";//物品在物品栏查看的信息
	global.itemdata_des_eff[1]="Recovers 20 hp";//物品在物品栏查看的功效信息
	global.itemdata_scr[1]=scr_item_apple;//物品在使用时执行的函数
	
	global.itemdata_name[2]="banana";
	global.itemdata_des[2]="Very Very Very VeryVeryVery VeryVery Very crispy!";
	global.itemdata_des_eff[2]="";
	global.itemdata_scr[2]=scr_item_banana;
	
	//weapon
	global.itemdata_name[3]="wooden sword";
	global.itemdata_des[3]="A sword for hero.";
	global.itemdata_des_eff[3]="";
	global.itemdata_scr[3]=scr_item_woodensword;
	
	global.itemdata_name[4]="no armor";
	global.itemdata_des[4]="An armor which everyone wears, a set that every set contains";
	global.itemdata_des_eff[4]="";
	global.itemdata_scr[4]=scr_empty;
	
	global.itemdata_name[5]="no weapon";
	global.itemdata_des[5]="A weapon which everyone wears, a set that every set contains";
	global.itemdata_des_eff[5]="";
	global.itemdata_scr[5]=scr_empty;
	
	//load combination
	scr_itemdata_com_load();
}