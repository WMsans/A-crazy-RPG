if(global.gamestate != game_states.cutscene){
	var tarx=obj_player.follower_x[record*(chara_num-1)];
	var tary=obj_player.follower_y[record*(chara_num-1)];
	if((abs(tarx-x)<=buff&&abs(tary-y)<=buff)){
		x=tarx;
		y=tary;
	}else{
		x+=(tarx-x)/10;
		y+=(tary-y)/10;
	}
	#region anim
	sprite_index = spr;
	if(x!=xprevious)
		image_xscale = sign(x - xprevious);
		
	if(x==xprevious&&y==yprevious){//player stay still
		image_speed = 0;
		image_index = 0;
	}else{//player is moving
		image_speed = 1;
	}
	#endregion
}
/*
if(inv>0){
	inv--;
}*/
if(flashalpha>0){
	flashalpha-=0.05;
}

//polygon = polygon_from_instance(id);