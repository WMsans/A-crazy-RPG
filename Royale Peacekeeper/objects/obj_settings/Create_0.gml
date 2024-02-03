/// @description 
global.gamestate = game_states.setting;
with(obj_GAME){
	instance_deactivate_all(1);
	pause_surf=surface_create(resw, resh);
	surface_set_target (pause_surf);
	draw_surface (application_surface,0,0);
	surface_reset_target();
	//Back up this surface to a buffer in case we lose it (screen focus, etc) if (buffer_exists(pause_surfbuffer)) buffer_delete(pause_surfbuffer);
	pause_surfbuffer = buffer_create(resw * resh * 4, buffer_fixed, 1); 
	buffer_get_surface (pause_surfbuffer, pause_surf, 0);
	
}
//create pages
if(file_exists("setting.sav")){
	ini_open("setting.sav");
	ds_menu_main=scr_create_menu_page(
		["Resume",element_type.script_runner,scr_menu_resume],
		["Audio",element_type.page_transfer,pages.audio],
		["Graphics",element_type.page_transfer,pages.graphics],
		["Controls",element_type.page_transfer,pages.controls],
		["Back to title",element_type.script_runner,scr_rmgoto_title]
	);
	ds_audio=scr_create_menu_page(
		["Master",element_type.slider,scr_change_volume_master,ini_read_real("audio","Master",0.75),[0,1]],
		["Sounds",element_type.slider,scr_change_volume_sound,ini_read_real("audio","Sounds",1),[0,1]],
		["Music",element_type.slider,scr_change_volume_music,ini_read_real("audio","Music",1),[0,1]],
		["Back",element_type.page_transfer,pages.main]
	);
	ds_graphic=scr_create_menu_page(
		["Full Screen",element_type.toggle,scr_fullscreen,!window_get_fullscreen(),["On","Off"]],
		["Back",element_type.page_transfer,pages.main]
	);
	ds_control = scr_create_menu_page(
		["UP",			element_type.input,			"keyup",				ini_read_real("control","UP",vk_up)],
		["LEFT",		element_type.input,			"keyleft",  			ini_read_real("control","LEFT",vk_left)],
		["RIGHT",		element_type.input,			"keyright",	     		ini_read_real("control","RIGHT",vk_right)],
		["DOWN",		element_type.input,			"keydown",				ini_read_real("control","DOWN",vk_down)],
		["CONFIRM",		element_type.input,			"keyz",					ini_read_real("control","CONFIRM",ord("Z"))],
		["CANCLE",		element_type.input,			"keyx",					ini_read_real("control","CANCLE",ord("X"))],
		["ESCAPE",		element_type.input,			"keyesc",				ini_read_real("control","ESCAPE",vk_escape)],
		["Back",		element_type.page_transfer,	pages.main],
	);
	ini_close();
}else{
	ds_menu_main=scr_create_menu_page(
		["Resume",element_type.script_runner,scr_menu_resume],
		["Audio",element_type.page_transfer,pages.audio],
		["Graphics",element_type.page_transfer,pages.graphics],
		["Controls",element_type.page_transfer,pages.controls],
		["Back to title",element_type.script_runner,scr_rmgoto_title]
	);
	ds_audio=scr_create_menu_page(
		["Master",element_type.slider,scr_change_volume_master,0.75,[0,1]],
		["Sounds",element_type.slider,scr_change_volume_sound,1,[0,1]],
		["Music",element_type.slider,scr_change_volume_music,1,[0,1]],
		["Back",element_type.page_transfer,pages.main]
	);
	ds_graphic=scr_create_menu_page(
		["Full Screen",element_type.toggle,scr_fullscreen,!window_get_fullscreen(),["On","Off"]],
		["Back",element_type.page_transfer,pages.main]
	);
	ds_control = scr_create_menu_page(
		["UP",			element_type.input,			"keyup",				vk_up],
		["LEFT",		element_type.input,			"keyleft",  			vk_left],
		["RIGHT",		element_type.input,			"keyright",				vk_right],
		["DOWN",		element_type.input,			"keydown",				vk_down],
		["CONFIRM",		element_type.input,			"keyz",					ord("Z")],
		["CANCLE",		element_type.input,			"keyx",					ord("X")],
		["ESCAPE",		element_type.input,			"keyesc",				vk_escape],
		["Back",		element_type.page_transfer,	pages.main],
	);
}
page=0;
ds_menu_pages=[ds_menu_main,ds_audio,ds_graphic,ds_control];

var i=0,array_len=array_length_1d(ds_menu_pages);
repeat(array_len){
	menu_option[i]=0;
	for(var j=0;j<10;j++){
		x_tar_offset[i][j]=0;
		x_offset[i][j]=0;
	}
	i++;
}

inputting=false;