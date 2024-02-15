function scr_resetgame(){
	global.checkpoint_rm=rm_1;//first room of the game
	global.checkpoint_x=768;
	global.checkpoint_y=288;
	 
	global.gold=0;
	global.backpacksize=8;
	global.item_num=0;
	for(var i = 1; i <= global.backpacksize;i++){
		global.item[i]=0;
	}
	
	global.plot=1;
	
	global.charanum=1;
	global.charanowskill=1;
	global.charaskillnum=0;
	global.charaskill[1]=1;
	for(var i=1;i<=12;i++){
		global.charaname[i]="Alex";
		global.charamaxhp[i]=100;
		global.charaweapon[i]=5;
		global.charaarmor[i]=4;
		global.charaspr[i]=1;
		global.charaattack[i]=0;
		global.chararesistance[i]=0;
	}
	
	ini_open("setting.sav");
	global.keyup = ini_read_real("control","UP",vk_up);
	global.keyleft = ini_read_real("control","LEFT",vk_left);
	global.keyright = ini_read_real("control","RIGHT",vk_right);
	global.keydown = ini_read_real("control","DOWN",vk_down);
	global.keyz = ini_read_real("control","CONFIRM",ord("Z"));
	global.keyx = ini_read_real("control","CANCLE",ord("X"));
	global.keyc = ini_read_real("control","BACKPACK",ord("C"));
	global.keya = ini_read_real("control","SKILL",ord("A"));
	global.keyesc = ini_read_real("control","ESCAPE",vk_escape);
	global.keyshift = ini_read_real("control","SHIFT",vk_shift);
	global.keyctrl =  ini_read_real("control","CONTROL",vk_control);
	global.keyspace = ini_read_real("control","SPACE",vk_space);
	
	global.mouse_sensitivity = ini_read_real("control","mouse_sensitivity",1)
	ini_close();
}