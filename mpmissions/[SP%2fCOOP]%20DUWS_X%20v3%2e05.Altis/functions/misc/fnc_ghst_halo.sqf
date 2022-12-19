
/*
fnc_ghst_halo
--------------
V1.3.1 Script by: Ghost.  Put this in an objects init line: 
ghst_halo = this addAction ["<t color='#00ffff'>HALO Jump</t> ", fnc_ghst_halo, [false,600,70], 5, true, true, "","alive _target"];
*/

_host = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_params = _this select 3;
_typehalo = _params select 0;//true for all group, false for player only.
_althalo = _params select 1;//altitude of halo jump
_altchute = _params select 2;//altitude for autochute deployment

if (not alive _host) exitwith {
	hint localize "STR_DUWS_X_royy580r"; 
	_host removeaction _id;
};

_caller groupchat localize "STR_DUWS_X_vtkkn80v";

openMap true;
player setVariable["Saved_Loadout", getUnitLoadout player];
removeBackpack player;
mapclick = false;

onMapSingleClick "clickpos = _pos; mapclick = true; onMapSingleClick """";true;";

waituntil {mapclick or !(visiblemap)};
if (!visibleMap) exitwith {
	_caller groupchat localize "STR_DUWS_X_q639bywa";
	player setUnitLoadout(player getVariable["Saved_Loadout",[]]);
};

_pos = clickpos;

_tooClose = false;
{
	if ((_pos distance _x) < zones_max_radius) then {_tooClose = true};
} forEach WARCOM_zones_controled_by_OPFOR;
if (_tooClose == true) exitWith {
	player setUnitLoadout(player getVariable["Saved_Loadout",[]]);
	openMap false;
	["info",[localize "STR_DUWS_X_lz5ab73w",format[localize "STR_DUWS_X_z2i74zs7",zones_max_radius]]] call BIS_fnc_showNotification;
	_caller groupchat format[localize "STR_DUWS_X_z2i74zs7",zones_max_radius];
};

player addBackpack "b_parachute";

if (_typehalo) then {

	{
		if (isNull objectParent _x) then {  // grab all group members NOT in vehicles
			_x setpos [(_pos select 0)+(random [10, 50, 100]), (_pos select 1)-(random [10, 50, 100]), _althalo];
			_x spawn bis_fnc_halo;
		}
	} foreach (units group _caller) - (call BIS_fnc_ListPlayers);
	
};

_caller setpos [(_pos select 0)+30, _pos select 1, _althalo];
//[_caller] spawn bis_fnc_halo;

titleCut ["", "BLACK IN", 5];
openMap false;
_bis_fnc_halo_action = _caller addaction [localize "STR_DUWS_X_bd22lcos","A3\functions_f\misc\fn_HALO.sqf",[],1,true,true,"Eject"];
sleep 5;
_caller groupchat localize "STR_DUWS_X_sjk84cdc";  // and dont forget to open your chute!";

////////////////////////////
// auto open before impact
////////////////////////////

if (_typehalo) then {

	{
		if (isNull objectParent _x) then {  // all group members NOT in vehicles
			[_x,_altchute] spawn {
				waituntil {sleep 0.1;(position (_this select 0) select 2) <= (_this select 1)};
				[_this select 0] spawn bis_fnc_halo;
			};
		};	
	} foreach (units group _caller) - (call BIS_fnc_ListPlayers);

};	
waituntil {sleep 0.1;(position _caller select 2) <= _altchute};
_caller removeaction _bis_fnc_halo_action;
if ((vehicle _caller) iskindof "ParachuteBase") exitwith {
	removeBackpack player;
	waitUntil {sleep 0.1;isTouchingGround player};
	player setUnitLoadout(player getVariable["Saved_Loadout",[]]);
};

_caller groupchat localize "STR_DUWS_X_o3yt6tzg";
[_caller] spawn bis_fnc_halo;

waitUntil {sleep 0.1;isTouchingGround player};
removeBackpack player;
player setUnitLoadout(player getVariable["Saved_Loadout",[]]);

