function scr_chara_join_team(_name,_maxhp,_weapon,_armor,_spr, _resistance = 0, _attack = 0){
	
	global.charanum++;
	global.charahp[global.charanum]=_maxhp;
	global.charamaxhp[global.charanum]=_maxhp;
	global.charaname[global.charanum]=_name;
	global.charaweapon[global.charanum]=_weapon;
	global.charaarmor[global.charanum]=_armor;
	global.charaspr[global.charanum]=_spr;
	global.chararesistance[global.charanum] = _resistance;
	global.charaattack[global.charanum] = _attack;
}