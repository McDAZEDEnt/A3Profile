
private["_c","_unitTypes","_pos","_side","_groupSize","_scriptMen","_scriptShip","_useAI","_shipTypes","_crewTypes","_ship","_man","_ships","_count","_AItype","_string","_group","_rank"];
if!(isServer)exitWith{};
_c=0;
_unitTypes=_this select _c;_c=_c+1;
_pos=_this select _c;_c=_c+1;
_side=_this select _c;_c=_c+1;
_groupSize=_this select _c;_c=_c+1;
_scriptMen=_this select _c;_c=_c+1;
_scriptShip=_this select _c;_c=_c+1;
_useAI=_this select _c;_c=_c+1;

_crewTypes=_unitTypes select 0;
_shipTypes=_unitTypes select 1;
if((count _shipTypes)==0)exitWith{};
if((count _crewTypes)==0)exitWith{};

_ship=objNull;
_man=objNull;
_ships=[];

_count=[(_groupSize select 0),(_groupSize select 1)]call BIS_fnc_randomInt;

_AItype=["B_UAV_AI"];
if(_side==EAST)then{_AItype=["O_UAV_AI"]};
if(_side==RESISTANCE)then{_AItype=["I_UAV_AI"]};
if(_side==CIVILIAN)then{_AItype=["C_UAV_AI"]};

_string="";
_group=createGroup _side;
_rank="CAPTAIN";

while{_count>0}do{
	_ship=(selectRandom _shipTypes)createVehicle _pos;
	sleep .5;
	_ship allowDamage false;
	if((typeOf _ship)call dmp_fnc_IsDrone)then{_crewTypes=_AItype};
	// Protects a vehicle from damage for the first few seconds of a mission(this is to avoid damage when using setPos to put it somewhere)
	if((_ship emptyPositions"Commander")>0)then{
		(selectRandom _crewTypes)createunit[_pos,_group,_string,1,_rank];
		sleep 1;
		{if((vehicle _x)==_x)exitWith{_man=_x}}forEach units _group;
		_man assignAsCommander _ship;
		sleep .2;
		_man moveInCommander _ship;
		sleep 1;
	};
	if((count units _group)>0)then{_rank="PRIVATE"};
	if((_ship emptyPositions"Driver")>0)then{
		(selectRandom _crewTypes)createunit[_pos,_group,"",1,_rank];
		sleep 1;
		{if((vehicle _x)==_x)exitWith{_man=_x}}forEach units _group;
		_man assignAsDriver _ship;
		sleep .2;
		_man moveInDriver _ship;
		sleep 1;
	};
	if((count units _group)>0)then{_rank="PRIVATE"};
	if((_ship emptyPositions "Gunner")>0)then{
		(selectRandom _crewTypes)createunit[_pos,_group,"",1,_rank];
		sleep 1;
		{if((vehicle _x)==_x)exitWith{_man=_x}}forEach units _group;
		_man assignAsGunner _ship;
		sleep .3;
		_man moveInGunner _ship;
		sleep 1;
	};
	_ship setDamage 0;
	_ships pushBack _ship;
	_count=_count-1;
};
sleep .3;
{if!(_scriptMen=="")then{_x execVM _scriptMen}}forEach units _group;
{if!(_scriptShip=="")then{_x execVM _scriptShip}}forEach _ships;
{_x setVariable["dmpAItype",(format["%1","Ship"]),TRUE]}forEach units _group;
{_x setVariable["dmpAItype",(format["%1","Ship"]),TRUE]}forEach _ships;
//{_x setVariable["dmpFaction",_factionName,TRUE]}forEach units _group;
sleep 3;


{_x setDammage 0}forEach units _group;
// Delete dismounts
{if((vehicle _x)==_x)then{deleteVehicle _x}}forEach units _group;

{_x setDir(random 360)}forEach _ships;

{_x setDammage 0;(vehicle _x)setDammage 0;(vehicle _x)allowDamage true;_x enableAI"ALL"}forEach units _group;
//if("Ship"=="Convoy")then{_group enableDynamicSimulation false};
if(dmpDebug)then{[_group,"Ship"]execVM"DMP\Scripts\AI\Track.sqf"};

if(dmpDebug)then{{if((typeOf _x)call dmp_fnc_IsDrone)then{[getPos _x,"Ship","ColorRED"]execVM"DMP\Scripts\Misc\DebugMarker.sqf"}}forEach _ships};

{if((typeOf _x)call dmp_fnc_IsDrone)then{_x setVehicleReportRemoteTargets TRUE;_x setVehicleReceiveRemoteTargets TRUE}}forEach _ships;

if!(_useAI)exitWith{};
[_group,_pos]execVM"DMP\Scripts\AI\WaterPatrol.sqf";

_group execVM"DMP\Scripts\Spawn\PrepGroup.sqf";