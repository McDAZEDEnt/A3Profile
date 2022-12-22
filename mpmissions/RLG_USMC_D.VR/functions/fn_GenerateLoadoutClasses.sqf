/* Steff_fn_GenerateLoudoutClasses
	Author: Steffieth

	Description: 
	reads loadout from units and converts to RespawnInventory string
	set STEFF_LOADOUT_EXCLUDE Variable to Unit to escape unit from LoadoutGeneration

   	Usage : str = [] call Steff_fn_GenerateLoudoutClasses

	Returns: String
*/

params [];

// constants
STEFF_DEFAULT_LOADOUT_EXCLUDE = false;
STEFF_DEFAULT_LOADOUT_NAME = "<displayname>";
STEFF_DEFAULT_CLASS_PREFIX = "Loadout_";
STEFF_LOADOUT_COUNTER = 0;
STEFF_LOADOUT_CLASSES_LIST = [];
publicVariable "STEFF_DEFAULT_LOADOUT_EXCLUDE";
publicVariable "STEFF_DEFAULT_LOADOUT_NAME";
publicVariable "STEFF_DEFAULT_CLASS_PREFIX";
publicVariable "STEFF_LOADOUT_COUNTER";
publicVariable "STEFF_LOADOUT_CLASSES_LIST";

private _str = "";
private _catstr = "";

{
	_unit = _x;
	if(!(_unit getVariable ["STEFF_LOADOUT_EXCLUDE",STEFF_DEFAULT_LOADOUT_EXCLUDE])) then {
		_catstr = _catstr + ([_unit] call Steff_fnc_LoadoutClassFromUnit) + endl;
	};
} forEach allUnits;

_str = "// {[west, _x, 1, -1] call BIS_fnc_addRespawnInventory;} "+endl+"// forEach "+str STEFF_LOADOUT_CLASSES_LIST+";"+endl+ "class CfgRespawnInventory"+endl+"{"+endl+_catstr+"};"+endl;

_catstr = "class CfgRoles"+endl+"{"+endl;
{
	_grp = _x;
	if(!((leader _grp) getVariable ["STEFF_LOADOUT_EXCLUDE",STEFF_DEFAULT_LOADOUT_EXCLUDE])) then {
		_classname = groupId _grp;
		_saveClassname = _classname splitString " -,." joinString "_";
		_catstr = _catstr + "    class "+_saveClassname+endl+"    {"+endl+"        displayName = """+_classname+""";"+endl+"        icon = """";"+endl+"    };"+endl;
		systemChat str ("Role created: " + _saveClassname);
	};
}forEach allGroups;
_catstr = _catstr + "};";

_str = _str + _catstr;

copyToClipboard _str;
hint "copyed CfgRespawnInventory to clipboard";

_str
