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

#region character following
if(hsp!=0||vsp!=0){//player moved, update the state
	for(var i=array_size-1;i>0;i--){
		follower_x[i]=follower_x[i-1];
		follower_y[i]=follower_y[i-1];
	}
	follower_x[0]=x;
	follower_y[0]=y;
}
#endregion

if(flashalpha>0){
	flashalpha-=0.05;
}
