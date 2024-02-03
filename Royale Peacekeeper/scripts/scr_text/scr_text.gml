///@arg text
///@arg portrait
///@arg snd
///@arg textbox texture
///@arg dir
function scr_text(_text){
	var _portrait = undefined;
	var _snd = undefined;
	var _textbox = undefined;
	if(argument_count>1) _portrait = argument[1];
	if(argument_count>2) _snd = argument[2];
	if(argument_count>3) _textbox = argument[3];
	
	text[page_num]=_text;
	scr_text_set_init();
	
	scr_portrait_decision(_portrait,_snd,_textbox);
	
	if(argument_count>4) speaker_side[page_num]=argument[4];
	
	page_num++;
}
