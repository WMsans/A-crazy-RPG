function scr_enums(){
enum game_states{
	init,
	button,
	cutscene,
	setting,
	item,
}
enum layers{
	overworld = 0,
	buttons = -100,
	UI = -200,
	setting = -300,
	fade = -400
}
}