/// @description Key check
if(global.gamestate != game_states.skill_setting) exit;
box_x=camera_get_view_x(view_camera[0]);
box_y=camera_get_view_y(view_camera[0]);
x=box_x+480;
y=box_y+192;

if(arrow_state==1){
	//choose skill
	if(keyboard_check_pressed(global.keydown)){
		arrow_pos=clamp(arrow_pos+1,1,global.charaskillnum);
		if(arrow_pos!=global.charaskillnum) yborder_negative_tar=max(0,(arrow_pos-5)*string_height(scr_skill_name(global.charaskill[arrow_pos])));//set yborder_negative_tar
	}
	if(keyboard_check_pressed(global.keyup)){
		arrow_pos=clamp(arrow_pos-1,1,global.charaskillnum);
		yborder_negative_tar=max(0,(arrow_pos-5)*string_height(scr_skill_name(global.charaskill[arrow_pos])));//set yborder_negative_tar
	}
	_charanowskill=arrow_pos;
}