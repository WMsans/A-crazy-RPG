/// @description 
global.gamestate = game_states.skill_setting;

_charanowskill=global.charanowskill;

box_x=camera_get_view_x(view_camera[0]);
box_y=camera_get_view_y(view_camera[0]);
arrow_tarx=-999;
arrow_tary=-999;
arrow_pos=_charanowskill;
border=32;
yborder_negative_tar=0;
yborder_negative=0;
yborder_negative2_tar=0;
yborder_negative2=0;


skill_posx[1]=0;
skill_tarposx[1]=0;
skill_alpha[1]=0;
skill_taralpha[1]=0;
chara_posx[1]=0;
chara_tarposx[1]=0;
chara_alpha[1]=0;
chara_taralpha[1]=0;

for(var i=1;i<=global.charaskillnum;i++){
	skill_posx[i]=160+box_x+border;
	skill_tarposx[i]=160+box_x+border;
	skill_alpha[i]=0;
	if(_charanowskill<=5){
		if(i<=6) skill_taralpha[i]=1;
		else skill_taralpha[i]=0;
	}else if(_charanowskill==global.charaskillnum){
		if(_charanowskill-i<=5) skill_taralpha[i]=1;
		else skill_taralpha[i]=0;
	}else{
		if(_charanowskill-i<=4&&i<_charanowskill) skill_taralpha[i]=1;
		else if(i-_charanowskill<=1&&i>_charanowskill) skill_taralpha[i]=1;
		else skill_taralpha[i]=0;
	}
}

if(!instance_exists(obj_skillchange_arrow)){
	instance_create_depth(-999,-999,depth - 1,obj_skillchange_arrow);
}

if(global.charaskillnum) arrow_state=1;
else{
	instance_destroy();
}
