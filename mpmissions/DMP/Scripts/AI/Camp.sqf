private["_group","_pos","_h","_tents"];
_group=_this select 0;
_pos=_this select 1;

_group setCombatMode"RED";
_group setBehaviour"SAFE";
_group setFormation"DIAMOND";

_pos=[_pos,0,200,0,0,0,0]call BIS_fnc_findSafePos;

{_x setPos _pos}forEach units _group;
//player setPos _pos;

_h=objNull;
_tents=[1,2]call BIS_fnc_randomInt;
while{_tents>0}do{
	_h="Land_TentDome_F"createVehicle _pos;
	_h setDir(random 360);
	_tents=_tents-1;
	sleep .2;
};
_h="Land_Fireplace_F"createVehicle _pos;
_h setDir(random 360);
if((random 10)>5)then{_h inFlame true};
sleep .2;
_h="Box_NATO_Ammo_F"createVehicle _pos;
_h setDir(random 360);
sleep .2;
clearMagazineCargoGlobal _h;
clearWeaponCargoGlobal _h;
clearItemCargoGlobal _h;
clearBackpackCargoGlobal _h;
if(dmpLoot)then{[[],FALSE,_h]execVM"DMP\Scripts\Loot\GenerateStash.sqf"};