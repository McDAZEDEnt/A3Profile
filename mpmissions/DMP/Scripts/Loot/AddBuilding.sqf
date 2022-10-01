private["_b","_pos","_marker","_bText","_positions"];
_b=_this;
_pos=[];
_positions=[];
_marker="";
_bText="";
_crates=0;
if((count([_b]call BIS_fnc_buildingPositions))<1)exitWith{};
if(_b in dmpAllBuildings)exitWith{};
dmpAllBuildings pushback _b;
if((getDammage _b)>0.7)exitWith{};
_marker="";
if(dmpDebug)then{_marker=createMarkerLocal[format["%1",_b],(getPos _b)];_marker setMarkerTypeLocal"mil_dot";_marker setMarkerColorLocal"ColorBlue"};
_bText=toLower(getText(configfile>>"CfgVehicles">>(typeOf _b)>>"editorSubcategory"));
// Military building
if((_bText find"military")>-1)exitWith{
	if(dmpDebug)then{_marker setMarkerTypeLocal"mil_box";_marker setMarkerColorLocal"ColorGREEN"};
	if((random 100)<dmpGearChanceLootM)then{
		//_pos=selectRandom([_b]call BIS_fnc_buildingPositions);
		_positions=[_b]call BIS_fnc_buildingPositions;
		{if!(_x call DMP_fnc_IsInside)then{_positions=_positions-[_x]}}forEach _positions;
		if((count _positions)<1)then{_positions=[_b]call BIS_fnc_buildingPositions};
		if((count _positions)<1)exitWith{};
		_pos=selectRandom _positions;
		_crates=round((count _positions)/3);
		[_pos,TRUE]spawn dmp_fnc_GenerateStash;
		_positions=_positions-[_pos];
		_crates=_crates-1;
		while{TRUE}do{
			if((count _positions)<1)exitWith{};
			if(_crates<1)exitWith{};
			if((random 100)>50)then{
				_pos=selectRandom _positions;
				_positions=_positions-[_pos];
				[_pos,TRUE]spawn dmp_fnc_GenerateStash;
			};
			_crates=_crates-1;
		};
	}else{if(dmpDebug)then{_marker setMarkerColorLocal"ColorYellow"}};
};
// Civilian building
if((random 100)<dmpGearChanceLoot)then{
	_positions=[_b]call BIS_fnc_buildingPositions;
	{if!(_x call DMP_fnc_IsInside)then{_positions=_positions-[_x]}}forEach _positions;
	if((count _positions)<1)then{_positions=[_b]call BIS_fnc_buildingPositions};
	if((count _positions)<1)exitWith{};
	_pos=selectRandom _positions;
	_crates=round((count _positions)/3);
	[_pos,FALSE]spawn dmp_fnc_GenerateStash;
	_positions=_positions-[_pos];
	_crates=_crates-1;
	while{TRUE}do{
		if((count _positions)<1)exitWith{};
		if(_crates<1)exitWith{};
		if((random 100)>50)then{
			_pos=selectRandom _positions;
			_positions=_positions-[_pos];
			[_pos,FALSE]spawn dmp_fnc_GenerateStash;
		};
		_crates=_crates-1;
	};
}else{if(dmpDebug)then{_marker setMarkerColorLocal"ColorYellow"}};