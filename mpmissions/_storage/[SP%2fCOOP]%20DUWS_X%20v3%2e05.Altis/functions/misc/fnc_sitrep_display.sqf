
// DISPLAY A SITREP

sleep 1;
_aliveAllUnits = {alive _x} count allunits;
_aliveAllTanks = {(alive _x) && ((_x isKindOf "Tank") || (_x isKindOf "car"))} count vehicles;
_aliveAllAir = {_x isKindOf "Air" AND alive _x} count vehicles;

_primary_waypoint = WARCOM_zones_controled_by_OPFOR select 0;
_primary_target = "";
{
	if (str (_x select 1) == str (_primary_waypoint)) then {
		_primary_target = _x select 0;
	}
} foreach zone_namePOS_pairs;

hint format [localize "STR_DUWS_X_jjl0pm74",
	_aliveAllUnits,commandpointsblu1,WARCOM_blufor_ap,WARCOM_opfor_ap,_aliveAllTanks,_aliveAllAir,
	(count WARCOM_zones_controled_by_BLUFOR),(count WARCOM_zones_controled_by_OPFOR), (str Player_Reputation), _primary_target,
	weather_type,time_of_day,enableChopperFastTravel,enable_fast_travel,
	ZeusStatus,staminaEnabled,VCOM_AI_enable,time_Multiplier,simple_zones_enable,CIV_PRESENCE
];
