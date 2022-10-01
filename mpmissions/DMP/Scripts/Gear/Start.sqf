private["_info","_c","_a","_index","_weapons","_magazines","_items","_backpacks","_allLoot","_crate","_exit","_pos"];
_info=_this;
waitUntil{!(isNil"dmpReady")};
waitUntil{dmpReady};

dmpGearWeapons=[];
dmpGearMagazines=[];
dmpGearItems=[];
dmpGearBackpacks=[];

dmpGearCommon=[];
dmpGearRare=[];
dmpGearVeryRare=[];
dmpGearMilitary=[];

dmp_fnc_GearType=compile preprocessFile"DMP\Scripts\Gear\GearType.sqf";

// Get gear from loaded mods

//_cfgWeapons=("getNumber(_x>>'scope')>1"configClasses(configfile>>"CfgWeapons"))apply{configName _x};
_weaponsIn=[];
_weaponsIn="getNumber(_x>>""scope"")>1"configClasses(configfile>>"cfgWeapons");

_type="";
{
_type=_x call dmp_fnc_GearType;
if(_type=="WEAPON")then{
	if(_x call dmp_fnc_GearIsMilitary)exitWith{dmpGearMilitary pushBackUnique _x}else{dmpGearRare pushBackUnique _x};
};

}forEach _weaponsIn;


/*
_gun=FALSE;
{
_gun=FALSE;
if((getNumber(configFile>>"cfgWeapons">>_x>>"type"))in[1,2,4])then{_gun=TRUE};
if(_gun)then{
	if(_x call dmp_fnc_GearIsMilitary)exitWith{dmpGearMilitary pushBackUnique _x}else{dmpGearRare pushBackUnique _x};
};

}forEach _weaponsIn;