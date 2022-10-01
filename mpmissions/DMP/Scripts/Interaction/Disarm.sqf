private["_man","_h","_gear"];
_man=_this select 0;
if!(local _man)exitWith{};
if((animationState _man)=="Acts_AidlPsitMstpSsurWnonDnon_loop")exitWith{hint"Captive can not move"};
if((animationState _man)=="AmovPercMstpSsurWnonDnon")then{[_man,"AidlPercMstpSnonWnonDnon_AI"]remoteExec["switchMove"];sleep .5};
_gear="";
_h="GroundWeaponHolder_Scripted"createVehicle position _man;
while{TRUE}do{
	_gear=backPack _man;
	if(_gear=="")exitWith{};
	_man action["DropBag",_h,_gear];
	sleep .3;
};
while{TRUE}do{
	if((primaryWeapon _man=="")AND(handgunWeapon _man=="")AND(secondaryWeapon _man==""))exitWith{};
	{
	if!(_x=="")then{_man action["DropWeapon",_h,_x];sleep .1};
	}forEach[primaryWeapon _man,handgunWeapon _man,secondaryWeapon _man];
	sleep .3;
};
{_man removeMagazineGlobal _x;_h addMagazineCargoGlobal[_x,1]}forEach(magazines _man);
{_h addItemCargoGlobal[_x,1]}forEach assignedItems _man;
removeAllAssignedItems _man;
{_man removeItem _x;_h addItemCargoGlobal[_x,1]}forEach items _man;
_gear=goggles _man;if!(_gear=="")then{removeGoggles _man;_h addItemCargoGlobal[_gear,1]};
_gear=headGear _man;if!(_gear=="")then{removeHeadgear _man;_h addItemCargoGlobal[_gear,1]};
_gear=vest _man;if!(_gear=="")then{removeVest _man;_h addItemCargoGlobal[_gear,1]};
_gear=hmd _man;if!(_gear=="")then{_man unassignItem _gear;_man removeItem _gear; _man;_h addItemCargoGlobal[_gear,1]};
[_man,"AmovPercMstpSsurWnonDnon"]remoteExec["playMove"];