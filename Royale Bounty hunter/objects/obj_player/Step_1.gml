/// @description initilize
//initilize
if(initflag){
	initflag=0;
	facing=-1;
	scr_load_character_spr(1);
	skill_init=1;
}
//skill
if(skill_init){
	scr_skill_init(1);
	skill_init=0;
}
