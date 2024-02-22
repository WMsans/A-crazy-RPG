function scr_enums(){
enum game_states{
	init,
	button,
	cutscene,
	setting,
	item,
	skill_setting,
	saving,
}
enum layers{
	overworld = 0,
	buttons = -100,
	UI = -200,
	setting = -300,
	cursor = -400,
	fade = -500
}
enum Input_State{
	keep, 
	pressed,
	released,
	null,
	
}
}