function scr_game_txt(_text_id){
	switch(_text_id){
		#region sign
		case "hello world":
			scr_text("Hi. I'm the first sign...");
			scr_text("I'm blue now!");
				scr_text_color(4,8,c_blue,c_blue,c_white,c_white,);//更改颜色，顺序：左上，右上，左下，右下
			scr_text("I can even talk like a ghost!");
				scr_text_float(23,29);//漂浮字
			scr_text("Or like i'm frightened.");
				scr_text_shake(12,22);//抖动字
			scr_text("Do you want to check out the sign on the left?agiuviskn ",spr_text_portrait1,undefined,undefined,-1)
			scr_options("I'm not sure...","sign1-unsure");//选项1
			scr_options("Not that sign","sign1-neither");//选项2
			scr_options("YeahYeahYeah","sign1-yes");//选项3
			scr_options("NopeNope","sign1-no");//选项4
				scr_option_color(c_red,c_red,c_white,c_white);//更改选项颜色
			break;
		#endregion
		#region cutscene
		case "cutscene1":
			scr_text("Cutscene1 ended successfully!");
			scr_text("Do you want to retry?");
			break;
		#endregion
		#region item using
		case"apple":
			scr_text("You ate an apple...");
			scr_text("You feel awesome!");
			break;
		case"banana":
			scr_text("You ate a banana...");
			scr_text("You feel...very banana.");
			break;
		
		#endregion
		#region item combine
		case"combine_fail":
			scr_text("You can't combine these two objects.");
			break;
		case"applebanana":
			scr_text("You smashed the apple and banana together, trying to make an 'applebanana'...");
			scr_text("...But nothing happened");
			break;
		#endregion
	}
}