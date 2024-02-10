/// @description 
event_inherited();

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
#endregion
flashalpha=0;
flashcolor=c_white;