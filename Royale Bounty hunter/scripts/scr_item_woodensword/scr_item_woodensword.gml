function scr_item_woodensword(){
	if(global.charaname[selected_character]=="Alex"){
		if(global.charaweapon[selected_character]==5){//添加技能
			//scr_skill_add(selected_character,2);
		}else scr_item_add(global.charaweapon[selected_character]);
		scr_item_remove(selected_item1);
		global.charaweapon[selected_character] = 3;
		global.charaattack[selected_character] = 10;
	}
}