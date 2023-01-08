
// CREATE THE LOCATION ARRAY FOR CIV PLACEMENT
//_half = worldSize / 2;
//_safehalf = worldSize / 2.2;  //STAY OFF THE EDGES OF SMALL MAPS
//_mapradius = sqrt 2 * _safehalf;
//_mapcenter = [_half, _half, 0];

_ZnObjects = [];

_ZnObjects = nearestLocations [PosOfBLUHQ, ["NameCityCapital","NameVillage","NameCity","Name"], (zones_max_dist_from_hq * 1.5)];
_ZnObjects = _ZnObjects call BIS_fnc_arrayShuffle;
_placesCfg = configFile >> "CfgWorlds" >> worldName >> "Names";
_namesToKeep = ["FACTORY","POWER","TRAIN","AIRFIELD","AIRSTRIP","AIRBASE","STORAGE","WAREHOUSE","LUMBER","HOSPITAL"];
_typesToChk =["NameLocal", "ViewPoint", "NameMarine", "Strategic", "StrongPointArea"];
_places = [];
for "_i" from 0 to (count _placesCfg)-1 do {
	_place = _placesCfg select _i;
	_name = toUpper(getText(_place >> "name"));
	_position = getArray (_place >> "position");
	_type = getText(_place >> "type");
	_location = nearestLocation [_position, _type];
	if(_type in _typesToChk) then {
		{
			if (_x in _name) exitWith {_ZnObjects = _ZnObjects + [_location]};
		} forEach _namesToKeep;
	};
};	

// return locations
_ZnObjects