function scr_savegame(){
	if(file_exists("file0.sav")){
		file_delete("file0.sav");
	}
	ini_open("file0.sav");
	ini_write_real("progress","room",global.checkpoint_rm);
	ini_write_real("progress","x",global.checkpoint_x);
	ini_write_real("progress","y",global.checkpoint_y);
	
	ini_write_real("item","num",global.item_num);
	ini_write_real("item","backpacksize",global.backpacksize);
	for(var i = 1;i <= global.backpacksize;i ++){
		ini_write_real("item","item" + string(i),global.item[i]);
	}
	
	ini_write_real("progress","charanum",global.charanum);
	ini_write_real("progress","charanowskill",global.charanowskill);
	for(var i=1;i<=global.charanum;i++){
		ini_write_string("progress","charaname"+string(i),global.charaname[i]);
		ini_write_real("progress","charaweapon"+string(i),global.charaweapon[i]);
		ini_write_real("progress","charaarmor"+string(i),global.charaarmor[i]);
		ini_write_real("progress","charaspr"+string(i),global.charaspr[i]);
		ini_write_real("progress","charamaxhp"+string(i),global.charamaxhp[i]);
		ini_write_real("progress","chararesistance"+string(i),global.chararesistance[i]);
		ini_write_real("progress","charaattack"+string(i),global.charaattack[i]);
	}
	for(var j=1;j<=global.charaskillnum;j++) ini_write_real("progress","charaskill"+string(j),global.charaskill[j]);
	ini_write_real("progress","charaskillnum",global.charaskillnum);
	
	ini_write_real("progress","gold",global.gold);
	ini_write_real("progress","plot",global.plot);
	
	ini_close();
}