function scr_resetgame(){
	global.checkpoint_rm=rm_1;//first room of the game
	global.checkpoint_x=768;
	global.checkpoint_y=288;
	
	#region keyboard
	global.keyup = vk_up;
	global.keydown = vk_down;
	global.keyleft = vk_left;
	global.keyright = vk_right;
	global.keyz = ord("Z");
	global.keyx = ord("X");
	global.keyc = ord("C");
	global.keya=ord("A");
	global.keyesc = vk_escape;
	global.keyshift=vk_shift;
	global.keyctrl=vk_control;
	global.keyspace=vk_space;
	#endregion
	 
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
}