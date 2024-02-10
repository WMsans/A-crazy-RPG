/// @description 
#region key check
if(!instance_exists(obj_fade) && global.gamestate == game_states.init){
	key_left=keyboard_check(global.keyleft);
	key_right=keyboard_check(global.keyright);
	key_down=keyboard_check(global.keydown);
	key_up=keyboard_check(global.keyup);
}else{
	key_left=0;
	key_right=0;
	key_down=0;
	key_up=0;
}
#endregion

script_execute(state_machine[player_state]);
