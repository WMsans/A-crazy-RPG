/// @description 
event_inherited();
flashalpha=0;
flashcolor=c_white;

player_vision_in_dark = true;//create a lightsource following the player
#region state machine
enum PLAYER_STATES{
	normal,
	fight,
	skill,
	attack
}

player_state = PLAYER_STATES.normal;
state_machine[PLAYER_STATES.normal]=scr_player_normal;
state_machine[PLAYER_STATES.skill]=scr_player_skill;

#endregion
#region speed
accel=1;
decel=-1.2;
max_sp=6;
#endregion
#region don't tweak
hsp=0;
vsp=0;

//inv=50;//无敌时间
//keys
key_left=0;
key_right=0;
key_down=0;
key_up=0;
//movement

dirv=0;
dirh=0;
last_dirv=0;
last_dirh=0;
//skill
skill_init=1;

//animation
initflag=1;
facing=-1;
anim_speed_buff = 30;
anim_speed_timer = 0;
facing_angle = 0;

//lighting
if(player_vision_in_dark && instance_exists(obj_lighting_init)){
	instance_create_depth(x,y,depth,obj_characterlight);
}

//follower
array_size=256;
for(var i=0;i<array_size;i++){
	follower_x[i]=x;
	follower_y[i]=y;
}
for(var i=2;i<=global.charanum;i++){
	global.charainst[i]=instance_create_layer(x,y,"Instances",obj_follower);
	with(global.charainst[i]){
		chara_num=i;
		scr_load_character_spr(i);
	}
}

//block hit
hit_blocks = ds_list_create();
#endregion
