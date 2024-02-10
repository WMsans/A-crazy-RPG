/// @description 
if(global.gamestate != game_states.skill_setting) exit;
draw_set_font(fnt_init);
draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_sprite(spr_skill_mainbox,0,x,y);

var _yborder=42-yborder_negative ;
yborder_negative+=(yborder_negative_tar-yborder_negative)/5;
//draw options
var nowarrow_pos=_charanowskill;
if(arrow_state==1) nowarrow_pos=arrow_pos;

for(var i=1;i<=global.charaskillnum;i++){
	if(nowarrow_pos==i){
		if(arrow_state==1){//locate the arrow x,y
			arrow_tarx=x+36+24;
			arrow_tary=y+_yborder+24;
			
			skill_tarposx[i]=64+x+border;
		}else skill_tarposx[i]=x+border;
		skill_taralpha[i]=1;
	}
	else{
		skill_tarposx[i]=x+border;
		if(nowarrow_pos<=5){
			if(i<=6) skill_taralpha[i]=1;
			else skill_taralpha[i]=0;
		}else if(nowarrow_pos==global.charaskillnum){
			if(nowarrow_pos-i<=5) skill_taralpha[i]=1;
			else skill_taralpha[i]=0;
		}else{
			if(nowarrow_pos-i<=4&&i<nowarrow_pos) skill_taralpha[i]=1;
			else if(i-nowarrow_pos<=1&&i>nowarrow_pos) skill_taralpha[i]=1;
			else skill_taralpha[i]=0;
		}
		
	}
	if(i==_charanowskill) draw_set_color(c_yellow);
	draw_text_color(skill_posx[i],y+_yborder,scr_skill_name(global.charaskill[i]),draw_get_color(),draw_get_color(),c_white,c_white,skill_alpha[i]);
	_yborder+=string_height(scr_skill_name(global.charaskill[i]));
	draw_set_color(c_white);
}
//animate the movement of skill text
for(var i=1;i<=global.charaskillnum;i++){
	skill_posx[i]+=(skill_tarposx[i]-skill_posx[i])/5;
	skill_alpha[i]+=(skill_taralpha[i]-skill_alpha[i])/5;
}

