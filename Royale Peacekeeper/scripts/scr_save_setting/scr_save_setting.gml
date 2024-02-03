function scr_save_setting(){
	if(file_exists("setting.sav")){
		file_delete("setting.sav");
	}
	ini_open("setting.sav");
	ini_write_real("audio","Master",ds_audio[# 3, 0]);
	ini_write_real("audio","Sounds",ds_audio[# 3, 1]);
	ini_write_real("audio","Music",ds_audio[# 3, 2]);
	ini_write_real("graphic","Window Mode",ds_graphic[# 3, 0]);
	ini_write_real("control","UP",ds_control[# 3 , 0]);
	ini_write_real("control","LEFT",ds_control[# 3 , 1]);
	ini_write_real("control","RIGHT",ds_control[# 3 , 2]);
	ini_write_real("control","DOWN",ds_control[# 3 , 3]);
	ini_write_real("control","CONFIRM",ds_control[# 3 , 4]);
	ini_write_real("control","CANCLE",ds_control[# 3 , 5]);
	ini_write_real("control","ESCAPE",ds_control[# 3 , 6]);
}