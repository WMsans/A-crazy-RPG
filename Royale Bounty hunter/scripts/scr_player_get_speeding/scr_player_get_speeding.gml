function scr_player_get_speeding(){
	if(global.gamestate != game_states.init) return false;
	if(input_check(global.keyshift, 0)) return false;
	if(!instance_exists(obj_player)) return false;
	if(sqrt(sqr(obj_player.hsp) + sqr(obj_player.vsp)) > 120){
		
		return true;
	}
	return false;
}