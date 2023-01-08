
_posplayer = _this select 0;
_radius = _this select 1;
_cost = _this select 2;
_foundPickupPos = [];
taxiCanTakeOff = false;
_helo_maxDamage = 0.7;
_helo_minFuel = 0.4;

_music = [] call fnc_taxi_music;

if (commandpointsblu1 < _cost) exitWith {
	["info",["Not enough command points",format["Not enough Command Points (%1CP required)",_cost]]] call bis_fnc_showNotification;
	sleep 15;
	_art = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
};

_foundPickupPos = [_posplayer, 20,_radius,20,0,0.2,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos; // find a valid pos

// try to find a pos, if no pos is found exit the script
if (0 == _foundPickupPos select 0 && 0 == _foundPickupPos select 1) exitWith {hint "No valid LZ nearby"; sleep 5; _art = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;};

// A POS NEAR THE PLAYER HAS BEEN FOUND, CHOPPA EN ROUTE
commandpointsblu1 = commandpointsblu1 - _cost;
publicVariable "commandpointsblu1";

// create marker on LZ
_markerpickup = format["lz%1%2",_foundPickupPos]; // Define marker name
_markerstr = createMarker [str(_markerpickup), _foundPickupPos];
_markerstr setMarkerShape "ICON";
str(_markerpickup) setMarkerType "hd_end";
str(_markerpickup) setMarkerColor "ColorGreen";
str(_markerpickup) setMarkerText "LZ";

////////////////////////////////////////////
//   SPAWN THE HELO
///////////////////////////////////////////

_vehpos = _posplayer;
_vec =[random [-1,0,1], random [-1,0,1], 0];
_dist = 2000;
_vehpos = ((vectorNormalized _vec) vectorMultiply _dist) vectorAdd _vehpos;

_veh = [_vehpos,0,blufor_HELI_TRANS_ARM_X,WEST] call bis_fnc_spawnvehicle;

_helo = _veh select 0 ;// vehicle object
_helo setPos [_vehpos select 0, _vehpos select 1, 200];// set height
//_helo setvelocity [0,0,200];

_helo flyInHeight 50;
_helo addAction ["<t color='#00ff00' size='2'>Give Waypoints to the pilot</t>", fnc_mapclickhelo, "", 0, true, true, "", "vehicle _this == _target"];
 
_heloGroup = _veh select 2;
_heloGroup deleteGroupWhenEmpty true;
//_pilot = units _helogroup select 0;
//_copilot = units _helogroup select 1;
//_gunner1 = units _helogroup select 2;
//_gunner2 = units _helogroup select 3;

_pilot = currentPilot _helo;
_pilot setcaptive true;
_pilot allowfleeing 0;
_pilot disableAI "Target"; 
_pilot allowDamage false;

// Disable VCOM on CREW
{
	_x setVariable ["Vcm_Disable",true];
} forEach units _heloGroup;

///////////////
//  HELI PAD
///////////////

// create the helipad to land and the waypoints
_helipad1 = createVehicle ["Land_HelipadEmpty_F", _foundPickupPos, [], 0, "NONE"]; 
_wp = _helogroup addWaypoint [_foundPickupPos, 0];
_wp setWaypointType "MOVE";
[_helogroup, 1] setWaypointCombatMode "BLUE";

_taxiName = [1] call fnc_random_name;
_random1 = round random 9;
_random2 = round random 9;

hint "Chopper Inbound";
player globalChat format["This is %1 %2-%3, we're approaching your location for pick up, check your map for the LZ",_taxiName,_random1,_random2];
playMusic (selectRandom ShortRadioChatter);

// check damage and exit function
_check_damage = compile "((vehicle _pilot == _pilot) or (damage _helo > _helo_maxDamage) or (fuel _helo < _helo_minFuel))";
_something_happened = {
	params ["_helo","_helogroup","_helipad1","_markerpickup","_taxiName","_random1","_random2"];
	deleteVehicle _helipad1;
	deleteMarker str(_markerpickup);
	hint format["%1 %2-%2 is too damaged to continue the mission.  2 min until next taxi.",_taxiName,_random1,_random2];
	player globalChat format["%1 %2-%2 is too damaged to continue the mission.  2 min until next taxi.",_taxiName,_random1,_random2];
	playMusic (selectRandom ShortRadioChatter);
	_helo land "LAND";
	_helo engineOn false;
	sleep 120;
	_art = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
	{deleteVehicle _x;} foreach units _helogroup;
	deleteVehicle _helo;
};

// wait until the helo is near the lz
waitUntil {sleep 0.1;(_foundpickuppos distance _helo < 350) or (call _check_damage)}; 

// IF THE CHOPPA IS DOWN/DAMAGED  **************
if (call _check_damage) exitWith {
	[_helo,_helogroup,_helipad1,_markerpickup,_taxiName,_random1,_random2] spawn _something_happened;
}; 

////////////////////
// LAND THE HELO
////////////////////

// spawn smokeshell
_smokePos = [_foundpickuppos select 0, (_foundpickuppos select 1)+ random 5];
_smoke = "SmokeShellGreen" createVehicle _smokePos;
_chemlight = "Chemlight_green" createVehicle _smokePos;

_helo land "GET IN";

// spawn the door opening script
_pickupSpawnopen = [_helo,_foundpickuppos] spawn {
	_helo = _this select 0;
	_lzPos = _this select 1;
	waitUntil {sleep 0.1;getpos _helo distance _lzPos < 10};
	sleep 1;
	_helo animateDoor ['door_R', 1];
	sleep 3;
	_helo animateDoor ['door_L', 1];
};

// WAIT FOR PLAYER TO GET IN
_inVehCheck = true;
while {_inVehCheck} do {
	// wait until the player is in choppa or pilot not in choppa
	waitUntil {sleep 0.1;vehicle player == _helo or (call _check_damage)};
	sleep 1;
	// get out of the loop if choppa is down
	if (call _check_damage) exitWith {}; 

	hint "Use the Scroll menu to talk to the pilot.";
	player globalChat "Pilot: where do you wanna go?";
	playMusic (selectRandom ShortRadioChatter);
	// wait until the player has given a validpos or pilot not in choppa
	waitUntil {sleep 0.1;taxiCanTakeOff or (call _check_damage)};
	sleep 1;
	// get out of the loop if choppa is down
	if (call _check_damage) exitWith {}; 
	// check if player is inside choppa
	if (vehicle player != _helo) then {
		taxiCanTakeOff = false; 
		player globalChat format["This is %1 %2-%3, get back in, I can't transport if you're not inside the chopper !",_taxiName,_random1,_random2];
		_helo addAction ["<t color='#00ff00'>Give an LZ to the pilot</t>", fnc_mapclickhelo, "", 0, true, true, "", "vehicle _this == _target"];
		playMusic (selectRandom ShortRadioChatter);
	} else {
		_inVehCheck = false;
	};
};

// IF THE CHOPPA IS DOWN/DAMAGED  **************
if (call _check_damage) exitWith {
	[_helo,_helogroup,_helipad1,_markerpickup,_taxiName,_random1,_random2] spawn _something_happened;
}; 

// *****************************
//   PLAYER IS IN DA CHOPPA
// *****************************
playMusic [_music, 0];
_helo setEffectiveCommander player;  // turn helo "blue" while player is on board.

//_helo lock true;
titleText ["<t color='#00ff00' size='2'>Pilot: Roger that, we're oscar mike...</t>", "PLAIN DOWN", -1, true, true];
playMusic (selectRandom ShortRadioChatter);
str(_markerpickup) setMarkerPos ClickedTaxiPos; 
sleep 2;
openMap false;
hint "";

// create the helipad to land and the waypoints

_helipad = createVehicle ["Land_HelipadEmpty_F", ClickedTaxiPos, [], 0, "NONE"];
_wp1 = _helogroup addWaypoint [getMarkerPos str(Taximarker1),0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointStatements ["true", "deleteMarker str(Taximarker1)"]; 
_wp2 = _helogroup addWaypoint [getMarkerPos str(Taximarker2),0];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointStatements ["true", "deleteMarker str(Taximarker2)"]; 
_wp3 = _helogroup addWaypoint [ClickedTaxiPos,0];
_wp3 setWaypointType "MOVE";
[_helogroup, 1] setWaypointCombatMode "BLUE";

// spawn the door closing script
_pickupSpawnclose = [_helo,_foundpickuppos] spawn {
	_helo = _this select 0;
	_lzPos = _this select 1;
	waitUntil {sleep 0.1;getpos _helo distance _lzPos > 10};
	sleep 1;
	_helo animateDoor ['door_R', 0];
	sleep 3;
	_helo animateDoor ['door_L', 0];
};

waitUntil {sleep 0.1;_helo distance _helipad1 > 350 or (call _check_damage)};
sleep 1;

// IF THE CHOPPA IS DOWN/DAMAGED  **************
if (call _check_damage) exitWith {
	[_helo,_helogroup,_helipad1,_markerpickup,_taxiName,_random1,_random2] spawn _something_happened;
	deleteVehicle _helipad;
	_helo lock false;
	deleteMarker str(Taximarker1);
	deleteMarker str(Taximarker2);
}; 

// *****************************
if (enableChopperFastTravel) then {
	// TELEPORT HELO NEAR LZ
	deleteVehicle _helipad1;
	titleText ["En route to LZ...", "BLACK OUT", 3];
	playMusic (selectRandom ShortRadioChatter);
	sleep 3.5;
	_helo setpos [getpos _helipad select 0, (getpos _helipad select 1)+1000, 150];
	sleep 3;
	titleText ["En route to LZ...", "BLACK IN", 4];
	playMusic (selectRandom ShortRadioChatter);
};

// wait until the helo is near the lz
waitUntil {sleep 0.1;ClickedTaxiPos distance _helo < 350  or (call _check_damage)}; 
sleep 1;

// IF THE CHOPPA IS DOWN/DAMAGED  **************
if (call _check_damage) exitWith {
	[_helo,_helogroup,_helipad1,_markerpickup,_taxiName,_random1,_random2] spawn _something_happened;
	deleteVehicle _helipad;
	_helo lock false;
	deleteMarker str(Taximarker1);
	deleteMarker str(Taximarker2);
}; 

_helo land "GET OUT";

// spawn the door opening script
_LzSpawnopen = [_helo] spawn {
	_helo = _this select 0;
	waitUntil {sleep 0.1;getpos _helo distance ClickedTaxiPos < 20};
	sleep 1;
	_helo animateDoor ['door_R', 1];
	sleep 3;
	_helo animateDoor ['door_L', 1];
};


// time to move ppl out of the helo;
waitUntil {sleep 0.1;(getposATL _helo select 2 < 4) or (call _check_damage)}; // wait until the helo is near the ground
sleep 1;

_helo setEffectiveCommander _pilot;

// IF THE CHOPPA IS DOWN/DAMAGED  **************
if (call _check_damage) exitWith {
	[_helo,_helogroup,_helipad1,_markerpickup,_taxiName,_random1,_random2] spawn _something_happened;
	deleteVehicle _helipad;
	_helo lock false;
	deleteMarker str(Taximarker1);
	deleteMarker str(Taximarker2);
}; 

titleText ["<t color='#00ff00' size='2'>Pilot: We've arrived at the LZ</t>", "PLAIN DOWN", -1, true, true];
playMusic (selectRandom ShortRadioChatter);
_helo lock false;
{
	if (vehicle _x == _helo) then {
		doGetOut _x; 
		sleep 1;
	};
} forEach units group player;

sleep 12;  // wait 10 sec before takeoff

_wp = _helogroup addWaypoint [[0,0,0],0];   // tell the helo to leave
_wp setWaypointType "MOVE";
deleteMarker str(_markerpickup);
deleteVehicle _helipad;
playMusic "";

// spawn the door closing script
_LzSpawnclose = [_helo] spawn {
	_helo = _this select 0;
	sleep 2;
	_helo animateDoor ['door_R', 0];
	sleep 3;
	_helo animateDoor ['door_L', 0];
};

waitUntil {sleep 0.1;_helo distance player > 100 or (call _check_damage)}; // wait until the helo is away
sleep 1;

// IF THE CHOPPA IS DOWN/DAMAGED  **************
if (call _check_damage) exitWith {
	hint format["%1 %2-%2 is too damaged to continue.",_taxiName,_random1,_random2];
	player globalChat format["%1 %2-%2 is too damaged to continue.",_taxiName,_random1,_random2];
	playMusic (selectRandom ShortRadioChatter);
	sleep 200;
	_art = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
	{deleteVehicle _x;} foreach units _helogroup;
	deleteVehicle _helo;
}; 

// *****************************
[format["This is %1 %2-%3, we are RTB",_taxiName,_random1,_random2]] spawn fnc_sideChat_filter;
player globalChat format["This is %1 %2-%3, we are RTB",_taxiName,_random1,_random2];
playMusic (selectRandom ShortRadioChatter);

sleep 200;

terminate _pickupSpawnopen;
terminate _pickupSpawnclose;
terminate _LzSpawnopen;
terminate _LzSpawnclose;

{deleteVehicle _x;} foreach units _helogroup;
deleteVehicle _helo;

sleep 2;
_art = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
