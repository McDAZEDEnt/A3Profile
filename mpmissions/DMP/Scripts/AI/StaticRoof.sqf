private["_debug","_group","_radius","_cswTypes","_buildings","_building","_allPositions","_positions","_position","_inside","_marker","_out","_outside","_pos","_cswType","_csw"];
_debug=false;
if(dmpDebug)then{_debug=true};
_group=_this select 0;
_radius=_this select 1;
_cswTypes=_this select 2;
_buildings=nearestObjects[(vehicle(leader _group)),["HOUSE"],_radius];
if((count _buildings)==0)exitWith{
	//if(_debug)then{systemChat "Drongo's Rooftop CSW: No buildings found"};
	[_group,getPos(leader _group),_cswTypes]execVM"DMP\Scripts\AI\Static.sqf";
};

_building=objNull;
_allPositions=[];
_positions=[];
_position=[];
_inside=false;
_marker="";
_out=[];
_outside=false;
{
_building=_x;
_positions=[_building]call BIS_fnc_buildingPositions;
if((count _positions)>0)then{
	_positions=[_building] call BIS_fnc_buildingPositions;
	{if((_x select 2)<4)then{_positions=_positions-[_x]}}forEach _positions;
	{
	_out=lineIntersectsWith[_x,[_x select 0,_x select 1,(_x select 2)+10]];
	_outside=true;
	if((_out select 0)isKindOf"House")then{_outside=false};
	if(_outside)then{
		_allPositions pushback _x;
	};
	}forEach _positions;
};
}forEach _buildings;

if((count _allPositions)==0)exitWith{
	//if(_debug)then{systemChat "Drongo's Rooftop CSW: No building positions found"};
	[_group,getPos(leader _group),_cswTypes]execVM"DMP\Scripts\AI\Static.sqf";
};
//if(_debug)then{systemChat format["Drongo's Rooftop CSW: %1 building positions found",(count _allPositions)]};

_pos=selectRandom _allPositions;
_cswType=selectRandom _cswTypes;
_csw=createVehicle[_cswType,_pos,[],0,"NONE"];
sleep 1;
_csw setDir(random 360);
//_csw setPosASL _pos;
_csw setVehiclePosition[[_pos select 0,_pos select 1,50],[],0,"NONE"];
//_csw setPosASL(getPos _csw);
_group setFormDir(getDir _csw);
(leader _group)assignAsGunner _csw;
(leader _group)moveInGunner _csw;
_group setCombatMode"YELLOW";
_group setBehaviour"COMBAT";
_csw setVariable["dmpAItype","StaticRoof",TRUE];