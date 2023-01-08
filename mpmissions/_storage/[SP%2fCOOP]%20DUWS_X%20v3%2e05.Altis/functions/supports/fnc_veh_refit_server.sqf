
_foundPickupPos = _this select 0;

// create marker
_markername = format["refit%1%2",round (_foundPickupPos select 0),round (_foundPickupPos select 1)]; // Define marker name
//hint _markername;
_markerstr = createMarker [str(_markername), _foundPickupPos];
_markerstr setMarkerShape "ICON";
str(_markername) setMarkerType "b_maint";
str(_markername) setMarkerColor "ColorBlue";
str(_markername) setMarkerText format[" Vehicle Refit"];
str(_markername) setMarkerSize [1, 1];

sleep 5;

_refit = "Land_HelipadCircle_F" createVehicle _foundPickupPos;

_staticsArray = [
	["Land_BagFence_Long_F",[-9.73438,-3.37695,0.00352859],244.309,1,0,[],"","",true,false], 
	["Land_BagFence_Long_F",[-10.1592,2.51855,-0.00157547],285.977,1,0,[],"","",true,false], 
	["Land_BagFence_Long_F",[10.0498,-3.60547,-0.000999451],114.154,1,0,[],"","",true,false], 
	["Land_BagFence_Long_F",[10.4443,2.56836,-0.000999451],72.4861,1,0,[],"","",true,false], 
	["Land_BagFence_Long_F",[-10.4912,-0.304688,-0.000999451],90,1,0,[],"","",true,false], 
	["Land_BagFence_Long_F",[10.7305,-0.554688,-0.000999451],90,1,0,[],"","",true,false] 
];

// PLACE STATICS WITHOUT INTERACTION
_vehicle = objNull;
{
	_xyz = (_x select 1);
	_posX = (_xyz select 0);
	_posY = (_xyz select 1);
	_posZ = (_xyz select 2);
	_vehicle = createVehicle [(_x select 0), [0,0,0], [], 0, "CAN_COLLIDE"];
	_vehicle setDir (_x select 2);
	_vehicle setPosATL [(_foundPickupPos select 0)+_posX,(_foundPickupPos select 1)+_posY,0.1];
} forEach _staticsArray;

_trg=createTrigger["EmptyDetector",_foundPickupPos,true];
_trg setTriggerArea[12,12,0,false,25];
_trg setTriggerActivation["WEST","PRESENT",true];
_trg setTriggerStatements["this", "[thisTrigger] spawn fnc_veh_refit_script", ""];

["veh_refit_hint",["",localize "STR_DUWS_X_27jtm6ab",localize "STR_DUWS_X_bxme25rw"]] remoteExec ["BIS_fnc_showNotification", [0,-2] select isDedicated,false];
