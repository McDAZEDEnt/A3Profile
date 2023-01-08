
/* Steff_fn_LoadoutClassFromUnit
	Author: Steffieth

	Description:
	reads loadout and converts to RespawnInventory string

   	Usage : str = [unit] call Steff_fn_LoadoutClassFromUnit

	Returns: String

	known issues: TFR creates new Radio each time script is executed.
*/

params ["_unit"];

//////////////////////////////////////////////////////////////////////////////////////
// PrimaryWeapon

_PWItemArr = primaryWeaponItems _unit;
_PWeapArr  = [primaryWeapon _unit] + [_PWItemArr select 2] + [_PWItemArr  select 0] + [_PWItemArr select 1];
//hint format ["%1",_PWeapArr];

//////////////////////////////////////////////////////////////////////////////////////
// SecondaryWeapon

_SWItemArr = secondaryWeaponItems _unit;
_SWeapArr  = [secondaryWeapon _unit] + [_SWItemArr select 2] + [_SWItemArr  select 0] + [_SWItemArr select 1];
//hint format ["%1",_SWeapArr];

//////////////////////////////////////////////////////////////////////////////////////
// Handgun

_HGItemArr = handgunItems _unit;
_HGunArr  = [handgunWeapon _unit] + [_HGItemArr select 2] + [_HGItemArr  select 0] + [_HGItemArr select 1];
//hint format ["%1",_HGunArr];

//////////////////////////////////////////////////////////////////////////////////////
// Magazines

_magazineArr = primaryWeaponMagazine _unit + secondaryWeaponMagazine _unit + handgunMagazine _unit + magazines _unit;
_BmagArr = _magazineArr;
_magCntArr = [];
for "_i" from 0 to ((count _magazineArr) - 1) do
{
	_aktMagazine = _magazineArr select 0;
	_cnt = {_x == _aktMagazine} count _magazineArr;
	if ( _cnt != 0 ) then {
		_magazineArr = _magazineArr - [_aktMagazine];
		_Container = [_aktMagazine, _cnt];
		_magCntArr = _magCntArr + [_Container];
		buffer2 = _magCntArr;
	};
};
_magCntArr = buffer2;
//hint format ["%1",_magCntArr];

//////////////////////////////////////////////////////////////////////////////////////
// Generate


// find out which items are there
_AllItems = assignedItems _unit;

_unit linkItem "ItemMap";
_hasMap = (count _AllItems == count assignedItems _unit);
if(!_hasMap) then {_unit unlinkItem "ItemMap";};

_unit linkItem "ItemCompass";
_hasCompass = (count _AllItems == count assignedItems _unit);
if(!_hasCompass) then {_unit unlinkItem "ItemCompass";};

_unit linkItem "ItemWatch";
_hasWatch = (count _AllItems == count assignedItems _unit);
if(!_hasWatch) then {_unit unlinkItem "ItemWatch";};

_unit linkItem "ItemRadio";                                    // collides with TF Radio
_hasRadio = (count _AllItems == count assignedItems _unit);
if(!_hasRadio) then {_unit unlinkItem "ItemRadio";};

_unit linkItem "ItemGPS";
_hasGPS = (count _AllItems == count assignedItems _unit);
if(!_hasGPS) then {_unit unlinkItem "ItemGPS";};

_unit linkItem "NVGoggles";
_hasNVG = (count _AllItems == count assignedItems _unit);
if(!_hasNVG) then {_unit unlinkItem "NVGoggles";};

_unit addWeapon "Binocular";
_hasBinocular = (count _AllItems == count assignedItems _unit);
if(!_hasBinocular) then {_unit removeWeapon "Binocular";};

//_assignArr = [_hasMap,_hasCompass,_hasWatch,_hasRadio,_hasGPS,_hasNVG,_hasBinocular];

// Save ClassNames and reassign right Items
if (_hasMap) then {
	buffer = _AllItems select 0;
	_AllItems = _AllItems - [_AllItems select 0];
	_unit linkItem  buffer;
} else {
	buffer = "";
};
_Map = buffer;

if (_hasCompass) then {
	buffer = _AllItems select 0;
	_AllItems = _AllItems - [_AllItems select 0];
	_unit linkItem buffer;
} else {
	buffer = "";
};
_Compass = buffer;

if (_hasWatch) then {
	buffer = _AllItems select 0;
	_AllItems = _AllItems - [_AllItems select 0];
	_unit linkItem buffer;
} else {
	buffer = "";
};
_Watch = buffer;

if (_hasRadio) then {
	buffer = "ItemRadio";
	_AllItems = _AllItems - [_AllItems select 0];
	_unit linkItem "ItemRadio";
} else {
	buffer = "";
};
_Radio = buffer;

if (_hasGPS) then {
	buffer = _AllItems select 0;
	_AllItems = _AllItems - [_AllItems select 0];
	_unit linkItem buffer;
} else {
	buffer = "";
};
_GPS = buffer;

if (_hasNVG) then {
	buffer = _AllItems select 0;
	_AllItems = _AllItems - [_AllItems select 0];
	_unit linkItem buffer;
} else {
	buffer = "";
};
_NVG = buffer;

if (_hasBinocular) then {
	buffer = _AllItems select 0;
	_AllItems = _AllItems - [_AllItems select 0];
	_unit addWeapon buffer;
} else {
	buffer = "";
};
_Binocular = buffer;

//hint format ["%1", _watch];

//////////////////////////////////////////////////////////////////////////////////////
// Items

_itemArr = Items _unit;
_BitemArr = _itemArr;
_itemCntArr = [];
for "_i" from 0 to ((count _itemArr) - 1) do
{
	_aktItem = _itemArr select 0;
	_cnt = {_x == _aktItem} count _itemArr;
	if ( _cnt != 0 ) then {
		_itemArr = _itemArr - [_aktItem];
		_Container = [_aktItem, _cnt];
		_itemCntArr = _itemCntArr + [_Container];
		buffer = _itemCntArr;
	};
};
_itemCntArr = buffer;
//hint format ["%1",_itemCntArr];

//////////////////////////////////////////////////////////////////////////////////////
// Clothing

_Uniform = uniform _unit;
_Vest = vest _unit;
_Headgear = headgear _unit;
_Goggles = goggles _unit;
_Backpack = backpack _unit;

/*-----------------------------------------------------------------------------------------------------*/
/*                             Built Class                                                             */
/*-----------------------------------------------------------------------------------------------------*/

//////////////////////////////////////////////////////////////////////////////////////
//

_classname = "";
if(vehicleVarName _unit == "") then {
	_classname = STEFF_DEFAULT_CLASS_PREFIX + str STEFF_LOADOUT_COUNTER;
	STEFF_LOADOUT_COUNTER = STEFF_LOADOUT_COUNTER + 1;
} else {
	_classname = vehicleVarName _unit;
	_classname = _classname splitString " -,." joinString "_";
};

STEFF_LOADOUT_CLASSES_LIST = STEFF_LOADOUT_CLASSES_LIST + [_classname];
systemChat ("Generated Loadout for: " + _classname);

_str = "";
_str = _str + "    class " + _classname + endl + "    {" + endl;
_str = _str + "        displayName = """+(_unit getVariable ["STEFF_LOADOUT_NAME",STEFF_DEFAULT_LOADOUT_NAME])+""";" + endl;
_str = _str + "        icon = ""\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa"";" + endl;
_saveClassname = (groupId group _unit) splitString " -,." joinString "_";
_str = _str + "        role = """+ _saveClassname +""";" + endl + endl;

_str = _str + "        weapons[] = {" + endl;
if(_PWeapArr select 0 != "") then {_str = _str + format["            ""%1"",", _PWeapArr select 0] + endl;};
if(_SWeapArr select 0 != "") then {_str = _str + format["            ""%1"",", _SWeapArr select 0] + endl;};
if(_HGunArr select 0 != "") then {_str = _str + format["            ""%1"",", _HGunArr select 0] + endl;};
if(_Binocular != "") then {_str = _str + format["            ""%1"",", _Binocular] + endl;};
if((_str select [count (toArray _str)-3,count (toArray _str)]) == ","+endl) then {
  _str = _str select [0, count (toArray _str)-3]; _str = _str + endl; // Delete last ","
};
_str = _str + "        };" + endl;
_str = _str + "        magazines[] = {" + endl;
{_str = _str + format["            ""%1"",", _x] + endl; } forEach _BmagArr;
if((_str select [count (toArray _str)-3,count (toArray _str)]) == ","+endl) then {
  _str = _str select [0, count (toArray _str)-3]; _str = _str + endl; // Delete last ","
};
_str = _str + "        };" + endl;
_str = _str + "        items[] = {" + endl;
{_str = _str + format["            ""%1"",", _x] + endl; } forEach _BitemArr;
if((_str select [count (toArray _str)-3,count (toArray _str)]) == ","+endl) then {
  _str = _str select [0, count (toArray _str)-3]; _str = _str + endl; // Delete last ","
};
_str = _str + "        };" + endl;
_str = _str + "        linkedItems[] = {" + endl;
{if(_x != "") then {_str = _str + format["            ""%1"",", _x] + endl; } else {};} forEach _PWItemArr;
{if(_x != "") then {_str = _str + format["            ""%1"",", _x] + endl; } else {};} forEach _HGItemArr;
if(_Vest != "") then {_str = _str + format["            ""%1"",", _Vest] + endl;};
if(_Headgear != "") then {_str = _str + format["            ""%1"",", _Headgear] + endl;};
if(_Goggles != "") then {_str = _str + format["            ""%1"",", _Goggles] + endl;};
if(_Map != "") then {_str = _str + format["            ""%1"",", _Map] + endl;};
if(_Compass != "") then {_str = _str + format["            ""%1"",", _Compass] + endl;};
if(_Radio != "") then {_str = _str + format["            ""%1"",", _Radio] + endl;};
if(_Watch != "") then {_str = _str + format["            ""%1"",", _Watch] + endl;};
if(_GPS != "") then {_str = _str + format["            ""%1"",", _GPS] + endl;};
if(_NVG != "") then {_str = _str + format["            ""%1"",", _NVG] + endl;};
if((_str select [count (toArray _str)-3,count (toArray _str)]) == ","+endl) then {
  _str = _str select [0, count (toArray _str)-3]; _str = _str + endl; // Delete last ","
};
_str = _str + "        };" + endl;
_str = _str + format["        uniformClass = ""%1"";", _Uniform] + endl;
_str = _str + format["        backpack = ""%1"";", _Backpack] + endl;

_str = _str + "    };" + endl;

_str
