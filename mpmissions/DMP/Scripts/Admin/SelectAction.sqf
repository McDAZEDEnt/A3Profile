private["_index","_action","_group","_v"];
_index=lbCurSel 903;
_action=lbData[903,_index];
_group=dmpAdminGroup;
_v=[];
if(_action=="Force Win")exitWith{
	dmpVP=9999999999999999;publicVariable"dmpVP";
};
if(_action=="Force Lose")exitWith{
	dmpVP=-1;publicVariable"dmpVP";
};
if(_action=="Delete Campaign")exitWith{
	dmpCVP=-999;publicVariable"dmpCVP";
	dmpDFClosses=999;publicVariable"dmpDFClosses";
	dmpDFClossLimit=-999;publicVariable"dmpDFClossLimit";
	dmpVP=-999;publicVariable"dmpVP";
};

if(_action=="End Mission")exitWith{
	"EveryoneWON"call BIS_fnc_endMissionServer;
};
if(_action=="Abort Mission")exitWith{
	"EveryoneLOST"call BIS_fnc_endMissionServer;
};

if(_action=="Mark")exitWith{
	execVM"DMP\Scripts\Admin\Mark.sqf";
};

if(_action=="Teleport")exitWith{
	closeDialog 0;
	sleep 0.5;
	openMap true;
	hintSilent"Click destination";
	onMapSingleClick"";
	onMapSingleClick"[_pos,_alt,_shift]execVM'DMP\Scripts\Admin\Teleport.sqf'; onMapSingleClick ''; true;";
};

if(_action=="Kill")exitWith{
	{
	(vehicle _x)setDammage 1;
	_x setDammage 1;
	}forEach(units _group);
	hintSilent format["%1 killed",dmpAdminGroup];
};

if(_action=="Kill Side")exitWith{
	{_group=_x;
		{
		(vehicle _x)setDammage 1;
		_x setDammage 1;
		}forEach(units _group);
	}forEach dmpAdminGroups;
	hintSilent format["%1 killed",dmpAdminSide];
};

if(_action=="Heal")exitWith{
	{
	(vehicle _x)setDammage 0;
	_x setDammage 0;
	}forEach(units _group);
	hintSilent"Group healed";
};

if(_action=="Delete")exitWith{
	{_v pushBackUnique(vehicle _x)}forEach(units _group);
	{deleteVehicle _x}forEach _v;
	sleep .5;
	{deleteVehicle _x}forEach(units _group);
	hintSilent format["%1 deleted",dmpAdminGroup];
};

if(_action=="Fly")exitWith{
	{
	{_v pushBackUnique(vehicle _x)}forEach(units _group);
	{_x setPosASL[((getPos _x)select 0),((getPos _x)select 1),1000];[_x,TRUE]remoteExec["engineOn"]}forEach _v;
	}forEach(units _group);
	hintSilent format["%1 placed 1500m in air",dmpAdminGroup];
};