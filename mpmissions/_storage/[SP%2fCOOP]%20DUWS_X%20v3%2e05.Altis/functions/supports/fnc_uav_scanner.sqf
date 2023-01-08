_centerPos = _this select 0;
_checkedRadius = _this select 1;
_cost = _this select 2;

commandpointsblu1 = commandpointsblu1 - _cost;
publicVariable "commandpointsblu1";

// CREATE MARKER FOR CHECKED SIZE
_markername = format["%1%2vc",round(_centerPos select 0),round(_centerPos select 1)]; // Define marker name
_markerstr = createMarker [str(_markername), _centerPos];
_markerstr setMarkerShape "ELLIPSE";
str(_markername) setMarkerBrush "SolidBorder";
str(_markername) setMarkerColor "ColorWhite";
str(_markername) setMarkerSize [_checkedRadius, _checkedRadius];
str(_markername) setMarkerAlpha 0.5;


// SEND A UAV
_group = "";
_vehicle = "";
_grouptype = [];

// FIND A RANDOM LOCATION
_spawnPos = _centerPos;
switch (VERSION_X) do {
	case "MODERN": {
		_vec =[random [-1,0,1], random [-1,0,1], 0];
		_dist = 200;
		_spawnPos = ((vectorNormalized _vec) vectorMultiply _dist) vectorAdd _spawnPos;
		_spawnPos = [_spawnPos select 0, _spawnPos select 1, (_spawnPos select 2)+500];
		_grouptype = ["B_UAV_02_dynamicLoadout_F"];
	};
	case "WW2": {
		_vec =[random 1, random 1, 0];
		_dist = 500;
		_spawnPos = ((vectorNormalized _vec) vectorMultiply _dist) vectorAdd _spawnPos;
		_spawnPos = [_spawnPos select 0, _spawnPos select 1, (_spawnPos select 2)+700];
		_grouptype = [blufor_PLANE_PATROL1_X];
	};
	case "VIETNAM": {
		_vec =[random [-1,0,1], random [-1,0,1], 0];
		_dist = 1000;
		_spawnPos = ((vectorNormalized _vec) vectorMultiply _dist) vectorAdd _spawnPos;
		_spawnPos = [_spawnPos select 0, _spawnPos select 1, (_spawnPos select 2)+500];
		_grouptype = [blufor_PLANE_PATROL1_X];
	};
};
_group = [_spawnPos, WEST, _grouptype, [], [], blufor_ai_skill] call BIS_fnc_spawnGroup;
_group deleteGroupWhenEmpty true;
_pilot = units _group select 0;
_vehicle = vehicle _pilot;
_vehicle setVehicleAmmo 0;
_vehicle allowdamage false;
_vehicle engineOn true;
switch (VERSION_X) do {
	case "VIETNAM": {
		_vehicle setVelocity [250,0,250];
		_vehicle flyInHeight 400;
	};
};

onStation = false;
_wp1 = _group addWaypoint [_centerPos, -1];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointBehaviour "CARELESS";
_wp1 setWaypointTimeout [40, 60, 80];
_wp1 setWaypointStatements ["true", "onStation = true"]; 
_wp2 = _group addWaypoint [[0,0], 100];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointBehaviour "CARELESS";

switch (VERSION_X) do {
	case "MODERN": {
		[localize "STR_DUWS_X_45np59yv"] spawn fnc_sideChat_filter;
	};
	case "WW2": {
		[localize "STR_DUWS_X_51d2rwpv"] spawn fnc_sideChat_filter;
	};
	case "VIETNAM": {
		[localize "STR_DUWS_X_51d2rwpv"] spawn fnc_sideChat_filter;
	};
};

waitUntil {sleep 0.1;onStation||!alive _vehicle};
if (!alive _vehicle) exitWith {hint localize "STR_DUWS_X_l01sbx6n"};

switch (VERSION_X) do {
	case "MODERN": {
		[localize "STR_DUWS_X_7vt59ge6"] spawn fnc_sideChat_filter;
	};
	case "WW2": {
		[localize "STR_DUWS_X_xaibwohn"] spawn fnc_sideChat_filter;
	};
	case "VIETNAM": {
		[localize "STR_DUWS_X_xaibwohn"] spawn fnc_sideChat_filter;
	};
};

sleep 20;
[localize "STR_DUWS_X_2ncoq1yy"] spawn fnc_sideChat_filter;


// CREATE EAST TRIGGER
_trg=createTrigger["EmptyDetector",_centerPos];
_trg setTriggerArea[_checkedRadius,_checkedRadius,0,false];
_trg setTriggerActivation["EAST","PRESENT",false];
_trg setTriggerStatements["this","", ""];
_trg setTriggerTimeout [0, 0, 0, true ];  
sleep 1;
_tlist = list _trg; 

{  
	// CREATE MARKER
	_markername2 = format["%1%2uav",round(getpos _x select 0),round(getpos _x select 1)]; // Define marker name
	_markerstr2 = createMarker [str(_markername2), getpos _x];
	_markerstr2 setMarkerShape "ELLIPSE";
	str(_markername2) setMarkerBrush "SolidBorder";
	str(_markername2) setMarkerColor "ColorRed";
	str(_markername2) setMarkerSize [3, 3];
	str(_markername2) setMarkerAlpha 1;

	// BEGIN FLASHING LOOP
	[_markername2] spawn {
		_markername2 = _this select 0;
		for [{_i=0}, {_i<=200}, {_i = _i+1}] do
		{
			sleep 0.5;
			str(_markername2) setMarkerColor "ColorPink";
			sleep 0.5;
			str(_markername2) setMarkerColor "ColorRed";
		};    
		deleteMarker str(_markername2); 
	};  
 
} forEach _tlist;

// CREATE WEST TRIGGER
_trgwest=createTrigger["EmptyDetector",_centerPos];
_trgwest setTriggerArea[_checkedRadius,_checkedRadius,0,false];
_trgwest setTriggerActivation["WEST","PRESENT",false];
_trgwest setTriggerStatements["this","", ""];
_trgwest setTriggerTimeout [0, 0, 0, true ];  
sleep 1;
_tlistwest = list _trgwest; 

{ 
	// CREATE MARKER
	_markername2 = format["%1%2uavw",round(getpos _x select 0),round(getpos _x select 1)]; // Define marker name
	_markerstr2 = createMarker [str(_markername2), getpos _x];
	_markerstr2 setMarkerShape "ELLIPSE";
	str(_markername2) setMarkerBrush "SolidBorder";
	str(_markername2) setMarkerColor "ColorBlue";
	str(_markername2) setMarkerSize [3, 3];
	str(_markername2) setMarkerAlpha 1;

	// BEGIN FLASHING LOOP
	[_markername2] spawn {
		_markername2 = _this select 0;
		for [{_i=0}, {_i<=200}, {_i = _i+1}] do {
			sleep 0.5;
			str(_markername2) setMarkerColor "ColorBlue";
			sleep 0.5;
			str(_markername2) setMarkerColor "ColorBLUFOR";
		};    
		deleteMarker str(_markername2); 
	};  
 
} forEach _tlistwest;

sleep 30; 
switch (VERSION_X) do {
	case "MODERN": {
		[localize "STR_DUWS_X_rfcxa2ku"] spawn fnc_sideChat_filter;
	};
	case "WW2": {
		[localize "STR_DUWS_X_w7qo214u"] spawn fnc_sideChat_filter;
	};
	case "VIETNAM": {
		[localize "STR_DUWS_X_w7qo214u"] spawn fnc_sideChat_filter;
	};
};
sleep 30;

//DELETE THE UAV
{
	deleteVehicle _x;
} foreach units _group;

deleteVehicle _vehicle;

// WAIT AND EXIT
sleep 200;
deleteMarker str(_markername);
deletevehicle _trg;
deletevehicle _trgwest;

