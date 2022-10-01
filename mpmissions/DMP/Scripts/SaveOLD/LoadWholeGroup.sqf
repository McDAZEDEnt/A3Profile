// Load a whole group (should work better than loading individually)
private["_groupInfo","_groupVehicleInfo","_groupManInfo","_manInfo","_id","_status","_loadout","_vars","_name","_type","_side","_rank","_face","_speaker","_pitch","_pos","_dir","_uPos","_dam","_AItype","_sideTrue","_group","_man","_vehicle","_role"];
_groupInfo=_this select 0;

_groupVehicleInfo=_groupInfo select 0;
_groupManInfo=_groupInfo select 1;

_vehicles=_groupVehicleInfo call dmp_fnc_LoadGroupVehicles;

//_manInfo=_groupInfo select 1;
_manInfo=_groupManInfo select 0;

_id=_manInfo select 0;
_status=_manInfo select 1;
_loadout=_manInfo select 2;
_vars=_manInfo select 3;
_vehicleInfo=_manInfo select 4;

_name=_id select 0;
_type=_id select 1;
_side=_id select 2;
_rank=_id select 3;
_face=_id select 4;
_speaker=_id select 5;
_pitch=_id select 6;

_pos=_status select 0;
_dir=_status select 1;
_uPos=_status select 2;
_dam=_status select 3;

_sideTrue=WEST;
if(toUpper(format["%1",_side])=="WEST")then{_sideTrue=WEST};
if(toUpper(format["%1",_side])=="EAST")then{_sideTrue=EAST};
if(toUpper(format["%1",_side])=="GUER")then{_sideTrue=RESISTANCE};
if(toUpper(format["%1",_side])=="SIDEENEMY")then{_sideTrue=sideEnemy};
if(toUpper(format["%1",_side])=="CIVILIAN")then{_sideTrue=CIVILIAN};
_group=createGroup _sideTrue;
_man=objNull;
_vehicle=objNull;
_role="";

//hintc format["About to load group: %1\n\n%2",count _groupInfo,_groupInfo];sleep 1;
{
_manInfo=_x;
//hintc format["About to spawn: %1\n\n",_manInfo];sleep 1;
//if((count _manInfo)==0)exitWith{hintc format["%1\n\n%2",_group,_manInfo]};
_id=_manInfo select 0;
_status=_manInfo select 1;
_loadout=_manInfo select 2;
_vars=_manInfo select 3;
_vehicleInfo=_manInfo select 4;
_name=_id select 0;
_type=_id select 1;
_side=_id select 2;
_rank=_id select 3;
_face=_id select 4;
_speaker=_id select 5;
_pitch=_id select 6;
_pos=_status select 0;
_dir=_status select 1;
_uPos=_status select 2;
_dam=_status select 3;
_type createunit[_pos,_group,"",1,_rank];
_man=(units _group)select((count(units _group))-1);
sleep .1;
if(isNull _man)exitWith{hintc format["%1\n\n%2",_group,_manInfo]};
_man setPosASL _pos;
_man setDir _dir;
_man setUnitPos _uPos;
_man setDammage _dam;
_man setName _name;
_man setFace _face;
_man setSpeaker _speaker;
_man setPitch _pitch;
_man setUnitLoadout _loadout;
[_man,_vars]call dmp_fnc_SetVariables;
if((count _vehicleInfo)>0)then{
	_vehicle=_vehicles select(_vehicleInfo select 0);
	_role=_vehicleInfo select 1;
	if(_role=="Driver")then{_man assignAsDriver _vehicle;_man moveInDriver _vehicle};
	if(_role=="Gunner")then{_man assignAsGunner _vehicle;_man moveInGunner _vehicle};
	if(_role=="Commander")then{_man assignAsCommander _vehicle;_man moveInCommander _vehicle};
	if(_role=="Cargo")then{_man assignAsCargo _vehicle;_man moveInCargo _vehicle};
	// Need turret code here
};
}forEach _groupInfo;

if(isNil{(leader _group)getVariable"dmpAItype"})then{
	{_x setVariable["dmpAItype","Patrol",TRUE]}forEach(units _group);
};

_AItype=(leader _group)getVariable"dmpAItype";

if(_AItype=="Patrol")then{_group execVM"DMP\Scripts\AI\EnhancedPatrol.sqf"};


// Need to examine dmpAItype and restart the appropriate AI script for the group
//if(dmpDebug)then{[_group,_AItype]execVM"DMP\Scripts\AI\Track.sqf"};

if(dmpDebug)then{[_group,"LOADED"]execVM"DMP\Scripts\AI\Track.sqf"};