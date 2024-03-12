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
	lighting = -50,
	downwall = -200,
	buttons = -300,
	UI = -400,
	setting = -500,
	cursor = -600,
	fade = -700
}
enum Input_State{
	keep, 
	pressed,
	released,
	null,
	
}
}