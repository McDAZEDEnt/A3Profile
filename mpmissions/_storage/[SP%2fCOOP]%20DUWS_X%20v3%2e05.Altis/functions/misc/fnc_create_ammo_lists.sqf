
// CREATE LISTS OF ITEMS FOR ADDING TO AMMOBOXES, VEHICLES, RESTRICTED ARSENAL, etc...

// SPAWN UNITS, COPY ITEMS

// weapons = all weapons
// magazines = ammo mags, grenades, rockets, explosives
// items = medkits, FAKs, toolkits, etc...
// assignedItems = map, compass, radio, etc...
// primaryWeaponItems = scopes, laser, grips, etc...
// headgear = helmets, shemags, etc...
// goggles = goggles, glasses, etc...
// uniformItems = all items in uniform
// vestItems = all items in vest
// backpackItems = all items in backpack

blufor_ammobox_weapons = [];
blufor_ammobox_magazines = [];
blufor_ammobox_items = [];

opfor_ammobox_weapons = [];
opfor_ammobox_magazines = [];
opfor_ammobox_items = [];

// Create the base list for Restricted Arsenal
_basic_ammoArray = [] call fnc_basic_ammo_lists;
_ACE_Items = _basic_ammoArray select 0;
_basic_backpacks = _basic_ammoArray select 1;
_basic_vests = _basic_ammoArray select 2;
_basic_items = _basic_ammoArray select 3;
_basic_optics = _basic_ammoArray select 4;
_basic_magazines = _basic_ammoArray select 5;
_extra_weapons = _basic_ammoArray select 6;

////////////////////////////
// AMMOBOX LISTS
// FOREACH [BLUFOR,OPFOR]
////////////////////////////

_blufor_units = [blufor_SOLDIER_LAT_X,blufor_SPECOPS_MEDIC_X,blufor_SPECOPS_ENG_X];
_opfor_units = [opfor_LAT_SOLDIER_X,opfor_SPECOPS_MEDIC_X,opfor_SPECOPS_ENG_X];

{
	_side = _x;
	_sideArray = [];
	if (_side == 1) then {
		_sideArray = _blufor_units;
	} else {
		_sideArray = _opfor_units;
	};
	
	_total_weapons = [];
	_total_magazines = [];
	_total_items = [];

	_temp_weapons = [];
	_temp_magazines = [];
	_temp_items = [];

	_group = createGroup west;
	_group deleteGroupWhenEmpty true;
	_unit = "";

	{
		_unit = _group createUnit [_x,[0,0], [], 0, "FORM"];
		_temp_weapons = _temp_weapons + [weapons _unit];
		_temp_magazines = _temp_magazines + [magazines _unit];
		_temp_items = _temp_items + [items _unit];
		sleep 1;
		deleteVehicle _unit;

	} forEach _sideArray;

	// Copy temp items to "total items" arrays
	{
		_class = _x;
		{
			if (_x != "" && isClass(configFile >> "CfgWeapons" >> _x)) then {
				_total_weapons = _total_weapons + [_x];
			};
		} forEach _class;
	} forEach _temp_weapons;
	{
		_class = _x;
		{
			if (_x != "" && isClass(configFile >> "CfgMagazines" >> _x)) then {
				_total_magazines = _total_magazines + [_x];
			};
		} forEach _class;
	} forEach _temp_magazines;
	{
		_class = _x;
		{
			if (_x != "" && isClass(configFile >> "CfgWeapons" >> _x)) then {
				_total_items = _total_items + [_x];
			};
		} forEach _class;
	} forEach _temp_items;

	if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
		_total_items = _total_items + _ACE_Items;
	};
	// Create global ammobox arrays
	if (_side == 1) then {
		blufor_ammobox_weapons = _total_weapons;publicVariable "blufor_ammobox_weapons";
		blufor_ammobox_magazines = _total_magazines;publicVariable "blufor_ammobox_magazines";
		blufor_ammobox_items = _total_items;publicVariable "blufor_ammobox_items";
	};
	if (_side == 2) then {
		opfor_ammobox_weapons = _total_weapons;publicVariable "opfor_ammobox_weapons";
		opfor_ammobox_magazines = _total_magazines;publicVariable "opfor_ammobox_magazines";
		opfor_ammobox_items = _total_items;publicVariable "opfor_ammobox_items";
	};
	
} forEach [1,2];  // 1 = blufor, 2 = opfor


//////////////////////////////////////
// CREATE THE RESTRICTED ARSENAL LIST
//////////////////////////////////////

waitUntil {sleep 5;chosen_settings};
if (restricted_arsenal == false) exitWith {};

// get blufor faction and create the array of units
_factionUnitArray = [];
_temp_factionUnitArray = [];
{
	_group = createGroup west;
	_group deleteGroupWhenEmpty true;
	_unit = "";
	_unit = _group createUnit [_x,[0,0], [], 0, "FORM"];
	_faction = [format["%1",faction _unit]] select 0;
	sleep 1;
	deleteVehicle _unit;

	//array of all vehicles player faction
	//_factionVehArray = ("(configname _x iskindOf 'car') && (gettext (_x >> 'faction') == _faction )" configClasses (configfile >> "CfgVehicles")) apply {configName _x};
	
	//array of all units in player faction
	_temp_factionUnitArray = ("(configname _x iskindOf 'CAManBase') && (gettext (_x >> 'faction') == _faction) && (getNumber (_x >> 'scope') == 2)" configClasses (configfile >> "CfgVehicles")) apply {configName _x};
	_factionUnitArray = _factionUnitArray + _temp_factionUnitArray;

} foreach [blufor_SOLDIER_X,blufor_SPECOPS_X,blufor_SPECOPS_MEDIC_X];

//remove duplicates
_factionUnitArray = _factionUnitArray arrayIntersect _factionUnitArray; 
//diag_log format ["_factionUnitArray: %1", str _factionUnitArray];

//array of all loadouts of all units in player faction
_factionLoadouts = [];
{ 
	_factionLoadouts append (flatten getUnitLoadout _x);
	sleep 0.1;
} forEach _factionUnitArray;
//diag_log format ["_factionLoadouts before duplicates filter: %1", str _factionLoadouts];

//remove duplicates
_factionLoadouts = _factionLoadouts arrayIntersect _factionLoadouts; 
//diag_log format ["_factionLoadouts after filter: %1", str _factionLoadouts];
copyToClipboard str _factionLoadouts;
//add faction items to arsenal
{
    if (typeName _x == "STRING") then {
		if (_x != "") then {
			if (_x isKindOf "Bag_Base") then {
				_pack = _x;
				//retrieve valid backpack parent class
				/*
				_possibleBackpack = [ configFile >> "CfgVehicles" >> _x, true ] call BIS_fnc_returnParents; 
				diag_log format ["_possibleBackpack: %1", _possibleBackpack];
				_backpack = "";
				//get parent class  for current backpack... 
				//if immediate parent class in array contains str 'base' 
				//then backpack itself can be added to arsenal, 
				//else use parent class that isn't base class
				if !(["base", str(_possibleBackpack select 1)] call BIS_fnc_inString) then {
						_backpack = _possibleBackpack select 1;
					} else {
						_backpack = _possibleBackpack select 0;
				};
				*/
				_possibleBackpack = [ configFile >> "CfgVehicles" >> _pack, true ] call BIS_fnc_returnParents; 
				_possibleBackpackParent = []; 
				_possibleBackpackChildren = [];
				{ 
					if (getNumber(configFile >> "CfgVehicles" >> _x >> "scope") == 2) then {_possibleBackpackParent pushBackUnique _x}; 
				} forEach _possibleBackpack;
				_possibleBackpackChildren = ("(configname _x iskindOf 'Bag_Base') && (configname _x iskindOf _pack) && (getNumber(_x >> 'scope') == 2)" 
											configClasses (configfile >> "CfgVehicles")) apply {configName _x};
				{
					[missionNamespace, _x, true,false] call BIS_fnc_addVirtualBackpackCargo; 
				} forEach _possibleBackpackParent + _possibleBackpackChildren;
				
			} else {
				[missionNamespace, _x, true,false] call BIS_fnc_addVirtualItemCargo;
				[missionNamespace, _x, true,false] call BIS_fnc_addVirtualBackpackCargo;
				[missionNamespace, _x, true,false] call BIS_fnc_addVirtualMagazineCargo;
				if (isClass(configFile >> "CfgWeapons" >> _x)) then {
					[missionNamespace, _x, true,false] call BIS_fnc_addVirtualWeaponCargo;
				};
			};
		};
    };
} forEach _factionLoadouts;

//Add additional basic items that some factions may lack, especially backpacks.
//basic backpacks - multicolor variants to make them as usable with as many factions as possible
if (VERSION_X != "MODERN") exitWith {};

//backpacks	
[missionNamespace, _basic_backpacks,true,false] call BIS_fnc_addVirtualBackpackCargo;
//basic vests
[missionNamespace, _basic_vests,true,false] call BIS_fnc_addVirtualItemCargo;
//basic items
[missionNamespace, _basic_items,true,false] call BIS_fnc_addVirtualItemCargo;
//basic optics
[missionNamespace, _basic_optics,true,false] call BIS_fnc_addVirtualItemCargo;
//misc magazines
[missionNamespace, _basic_magazines,true,false ] call BIS_fnc_addVirtualMagazineCargo;
//extra weapons
[missionNamespace, _extra_weapons,true,false ] call BIS_fnc_addVirtualWeaponCargo;

// ACE Items from above
if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
	[missionNamespace, _ACE_Items,true,false] call BIS_fnc_addVirtualItemCargo;
};


