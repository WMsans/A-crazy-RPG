if(showing) global.gamestate = game_states.item;
if(global.gamestate != game_states.init && global.gamestate != game_states.item) exit;
box_x=camera_get_view_x(view_camera[0])-48;
box_y=camera_get_view_y(view_camera[0]);
x=box_x+672;
y=box_y+32;

draw_set_font(fnt_init);
draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

var _yborder=42-yborder_negative;
yborder_negative+=(yborder_negative_tar-yborder_negative)/5;
if(arrow_pos>2000) selected_character=arrow_pos-2000;
var nowarrow_pos=selected_item1;
if(arrow_selecting==1) nowarrow_pos=arrow_pos;
else if(arrow_selecting==2&&arrow_pos<=global.item_num) nowarrow_pos=arrow_pos;

if(showing){
	draw_self();
	//draw act text at the bottom
		//"use"
	if(arrow_selecting==1){
		draw_set_color(c_grey);
	}else if(arrow_selecting==2){
		draw_set_color(c_white);
	}
	if(arrow_pos==1000) draw_set_color(c_yellow);
	draw_text_color(x+64+border,y+548,"use",draw_get_color(),draw_get_color(),c_white,c_white,1);
		//"drop"
	if(arrow_selecting==1){
		draw_set_color(c_grey);
	}else if(arrow_selecting==2){
		draw_set_color(c_white);
	}
	if(arrow_pos==1100) draw_set_color(c_yellow);
	draw_text_color(x+256+border,y+548,"drop",draw_get_color(),draw_get_color(),c_white,c_white,1);
	
	draw_set_color(c_white);//reset color to normal
	//draw items
	for(var i=1;i<=global.item_num;i++){
		if(nowarrow_pos==i){
			if(!(arrow_selecting==2&&arrow_pos>=1000)&&arrow_selecting!=3){//locate the arrow x,y
				arrow_tarx=x+36+32;
				arrow_tary=y+_yborder+24;
				item_tarposx[i]=64+x+border;
			}else item_tarposx[i]=x+border;
			
			item_taralpha[i]=1;
		}else{
			item_tarposx[i]=x+border;
			if(nowarrow_pos<=9){
				if(i<=10) item_taralpha[i]=1;
				else item_taralpha[i]=0;
			}else if(nowarrow_pos==global.item_num){
				if(nowarrow_pos-i<=9) item_taralpha[i]=1;
				else item_taralpha[i]=0;
			}else{
				if(nowarrow_pos-i<=8&&i<nowarrow_pos) item_taralpha[i]=1;
				else if(i-nowarrow_pos<=1&&i>nowarrow_pos) item_taralpha[i]=1;
				else item_taralpha[i]=0;
			}
		}
		if(arrow_pos==1000){//arrow is at "use"
			arrow_tarx=x+36+32;
			arrow_tary=y+548+24;
		}else if(arrow_pos==1100){//arrow is at "drop"
			arrow_tarx=x+228+32;
			arrow_tary=y+548+24;
		}
		item_posx[i]+=(item_tarposx[i]-item_posx[i])/5;
		item_alpha[i]+=(item_taralpha[i]-item_alpha[i])/5;
		if(i==selected_item1) draw_set_color(c_yellow);
		draw_text_color(item_posx[i],y+_yborder,global.itemdata_name[global.item[i]],draw_get_color(),draw_get_color(),c_white,c_white,item_alpha[i]);
		_yborder+=string_height(global.itemdata_name[global.item[i]]);
		draw_set_color(c_white);
	}
	
	//draw arrow
	//selecting
	if(arrow_selecting==1){//selected nothing but available
		if(keyboard_check_pressed(global.keydown)){
			arrow_pos=(arrow_pos+1)%global.item_num;
			if(arrow_pos==0) arrow_pos=global.item_num;
			else yborder_negative_tar=max(0,(arrow_pos-9)*string_height(global.itemdata_name[global.item[arrow_pos]]));//set yborder_negative_tar
		}
		if(keyboard_check_pressed(global.keyup)){
			arrow_pos--;
			if(arrow_pos==0){
				arrow_pos=global.item_num;
				yborder_negative_tar=max(0,(arrow_pos-10)*string_height(global.itemdata_name[global.item[arrow_pos]]));//set yborder_negative_tar
			}else yborder_negative_tar=max(0,(arrow_pos-9)*string_height(global.itemdata_name[global.item[arrow_pos]]));//set yborder_negative_tar
			
		}
		if(keyboard_check_pressed(global.keyx)){
			showing=0;
		}
		if(keyboard_check_pressed(global.keyz)){//select one item
			selected_item1=arrow_pos;
			arrow_selecting=2;
		}
		
	}else if(arrow_selecting==2){//selected one, available
		if(keyboard_check_pressed(global.keydown)){
			arrow_pos++;
			if(arrow_pos>global.item_num){
				arrow_pos=1000;
				if(selected_item1==global.item_num)yborder_negative_tar=max(0,(selected_item1-10)*string_height(global.itemdata_name[global.item[selected_item1]]));//set yborder_negative_tar
				else yborder_negative_tar=max(0,(selected_item1-9)*string_height(global.itemdata_name[global.item[selected_item1]]));//set yborder_negative_tar
			}else if(arrow_pos!=global.item_num) yborder_negative_tar=max(0,(arrow_pos-9)*string_height(global.itemdata_name[global.item[arrow_pos]]));//set yborder_negative_tar
		}
		if(keyboard_check_pressed(global.keyup)){
			if(arrow_pos<=global.item_num){
				arrow_pos--;
				if(arrow_pos==0) arrow_pos=1;
				yborder_negative_tar=max(0,(arrow_pos-9)*string_height(global.itemdata_name[global.item[arrow_pos]]));//set yborder_negative_tar
				
			}else{//在use
				arrow_pos=global.item_num;
				yborder_negative_tar=max(0,(arrow_pos-10)*string_height(global.itemdata_name[global.item[arrow_pos]]));//set yborder_negative_tar
			}
		}
		if(keyboard_check_pressed(global.keyx)){
			arrow_selecting=1;
			if(arrow_pos>global.item_num) arrow_pos=selected_item1;
			selected_item1=0;
		}
		if(keyboard_check_pressed(global.keyright)){
			if(arrow_pos==1000){//跳转到drop
				arrow_pos=1100;
			}else{//跳转到use
				arrow_pos=1000;
				if(selected_item1==global.item_num) yborder_negative_tar=max(0,(selected_item1-10)*string_height(global.itemdata_name[global.item[selected_item1]]));//set yborder_negative_tar
				else yborder_negative_tar=max(0,(selected_item1-9)*string_height(global.itemdata_name[global.item[selected_item1]]));//set yborder_negative_tar
			}
		}
		if(keyboard_check_pressed(global.keyleft)){
			if(arrow_pos==1100){//跳转到use
				arrow_pos=1000;
			}else{//跳转到选择的物品处
				arrow_pos=selected_item1;
				if(arrow_pos==global.item_num) yborder_negative_tar=max(0,(arrow_pos-10)*string_height(global.itemdata_name[global.item[arrow_pos]]));//set yborder_negative_tar
				else yborder_negative_tar=max(0,(arrow_pos-9)*string_height(global.itemdata_name[global.item[arrow_pos]]));//set yborder_negative_tar
			}
		}
		
		if(keyboard_check_pressed(global.keyz)){
			if(arrow_pos==selected_item1){//cancel the select
				selected_item1=0;
				arrow_selecting=1;
			}else if(arrow_pos==1000){//use the single item
				arrow_pos=2000+selected_character;
				arrow_selecting=3;
			}else if(arrow_pos==1100){//drop the item
				showing=0;
				scr_item_drop(selected_item1);
				arrow_selecting=1;
				selected_item1=0;
				arrow_pos=1;
			}else if(enable_combine){//combine another item
				showing=0;
				
				if(global.itemdata_com[global.item[selected_item1]][global.item[arrow_pos]]){
					script_execute(global.itemdata_com[global.item[selected_item1]][global.item[arrow_pos]]);
					global.item[arrow_pos]=0;
					global.item[selected_item1]=0;
					scr_item_sort();
					arrow_selecting=1;
					selected_item1=0;
					arrow_pos=1;
				}
				else{
					scr_item_com_init();
				}
			}else{//select the new item
				selected_item1=arrow_pos;
				arrow_selecting=2;
			}
		}
	}else if(arrow_selecting==3){//selecting characters
		if(keyboard_check_pressed(global.keydown)){
			arrow_pos=(arrow_pos-2000+1)%global.charanum+2000;
			if(arrow_pos-2000==0) arrow_pos=global.charanum+2000;
		}
		if(keyboard_check_pressed(global.keyup)){
			arrow_pos--;
			if(arrow_pos-2000==0) arrow_pos=global.charanum+2000;
		}
		if(keyboard_check_pressed(global.keyx)){
			arrow_selecting=2;
			arrow_pos=selected_item1;
		}
		if(keyboard_check_pressed(global.keyz)){//use the item
			showing=0;
			script_execute(global.itemdata_scr[global.item[selected_item1]],arrow_pos-2000);
			arrow_selecting=1;
			selected_item1=0;
			arrow_pos=1;
		}
	}if(showing){
	if(!instance_exists(obj_itembox_arrow)) instance_create_depth(-999,-999,layers.UI - 1,obj_itembox_arrow);
	//draw side box
	draw_sprite(spr_item_sidebox,image_index,288+box_x,300+box_y);
	if(arrow_pos<=global.item_num){
		draw_set_font(fnt_sidebox2);
		var _guide_tmp= arrow_selecting==2 ? use_item_guide_txt : global.itemdata_des[global.item[arrow_pos]]+"\n"+global.itemdata_des_eff[global.item[arrow_pos]];
		draw_text_ext(288+box_x+border,300+box_y+border,_guide_tmp,string_height(global.itemdata_des[global.item[arrow_pos]]),sprite_get_width(spr_item_sidebox)-border*2);
		
		draw_set_font(fnt_init);
	}else if(arrow_pos>2000){
		for(var i=1;i<=global.charanum;i++){
			if(i==selected_character){
				arrow_tarx=288+box_x+border+32;
				arrow_tary=300+box_y+border+string_height("K")*(i-1)+24;
				chara_tarposx[i]=288+box_x+border+64;
				draw_text_color(chara_posx[i],300+box_y+border+string_height("K")*(i-1),global.charaname[i],c_yellow,c_yellow,c_white,c_white,1);
			}else{
				chara_tarposx[i]=288+box_x+border;
				draw_text(chara_posx[i],300+box_y+border+string_height("K")*(i-1),global.charaname[i]);
			}
			chara_posx[i]+=(chara_tarposx[i]-chara_posx[i])/5;
			
		}
	}
	//draw character side box
	draw_set_font(fnt_sidebox2);
	draw_sprite(spr_item_sidebox2,image_index,288+box_x,16+box_y);
	draw_text(288+box_x+border,16+box_y+border,global.charaname[selected_character]);
	draw_text(288+box_x+border,16+box_y+border+string_height(global.charaname[selected_character]),"HP:"+string(global.charahp[selected_character])+"/"+string(global.charamaxhp[selected_character]));
	draw_text(288+box_x+border,16+box_y+border+string_height("K")*3,global.itemdata_name[global.charaweapon[selected_character]]);
	draw_text(288+box_x+border,16+box_y+border+string_height("K")*4,global.itemdata_name[global.charaarmor[selected_character]]);
	draw_set_font(fnt_init);
	}
}else{
	for(var i=1;i<=global.item_num;i++){
		item_posx[i]=box_x+672;
	}
}

if(global.item_num){
	if(keyboard_check_pressed(global.keyc)){//switch states
		if(!showing) showing=1;
		else showing=0;
	}
}else showing=0;

if(!showing && last_showing){
	global.gamestate = game_states.init;
}
last_showing = showing;