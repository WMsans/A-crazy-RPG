function scr_chara_join_team(_name,_maxhp,_weapon,_armor,_spr){
	global.charanum++;
	global.charahp[global.charanum]=_maxhp;
	global.charamaxhp[global.charanum]=_maxhp;
	global.charaname[global.charanum]=_name;
	global.charaweapon[global.charanum]=_weapon;
	global.charaarmor[global.charanum]=_armor;
	global.charaspr[global.charanum]=_spr;
}