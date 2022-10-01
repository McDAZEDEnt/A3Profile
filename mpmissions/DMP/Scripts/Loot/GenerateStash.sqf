private["_pos","_military","_vehicle","_crateTypes","_crateType","_h","_count","_mCount","_chance","_index","_magazines","_arrays","_array","_magazineChance","_magazineCount","_item","_items"];
_pos=_this select 0;_military=_this select 1;
_vehicle=objNull;
if((count _this)>2)then{_vehicle=_this select 2};
_crateTypes=[
"Box_NATO_Equip_F",
"Box_NATO_Ammo_F",
"Box_NATO_Support_F",
"Land_PlasticCase_01_small_F",
"Land_PlasticCase_01_small_gray_F",
"Land_PlasticCase_01_small_F",
"Land_PlasticCase_01_small_gray_F"
];

//_crateTypes=["GroundWeaponHolder"];

_h=objNull;
_crateType=selectRandom _crateTypes;
if(isNull _vehicle)then{
	if((count _pos)<2)exitWith{_pos=[]};
	_pos=[_pos select 0,_pos select 1,1.5];
	_pos=[_pos,_crateType]call DMP_fnc_LootPos;
	_h=createVehicle[_crateType,_pos,[],0,"none"];
	_h setDir(random 360);
	clearItemCargoGlobal _h;clearWeaponCargoGlobal _h;clearMagazineCargoGlobal _h;clearBackpackCargoGlobal _h;
}else{_h=_vehicle;_pos=getPos _h};
if((count _pos)<2)exitWith{};

_array=[];
_count=0;
_mCount=0;
_chance=0;
_index=0;
_magazines=[];
_items=[];
_item="";

_arrays=[dmpGearChanceFood,dmpGearChanceMed,dmpGearChanceItems,dmpGearChanceWeapons,dmpGearChanceAttachments,dmpGearChanceUniforms,dmpGearChanceVests,dmpGearChanceHeadgear,dmpGearChancePacks,dmpGearChanceGoggles];
_magazineChance=dmpGearChanceMagazines select 0;
_magazineCount=[dmpGearChanceMagazines select 1,dmpGearChanceMagazines select 2];

if(_military)then{
	_arrays=[dmpGearChanceFoodM,dmpGearChanceMedM,dmpGearChanceItemsM,dmpGearChanceWeaponsM,dmpGearChanceAttachmentsM,dmpGearChanceUniformsM,dmpGearChanceVestsM,dmpGearChanceHeadgearM,dmpGearChancePacksM,dmpGearChanceGogglesM];
	_magazineChance=dmpGearChanceMagazinesM select 0;
	_magazineCount=[dmpGearChanceMagazinesM select 1,dmpGearChanceMagazinesM select 2];
};

while{TRUE}do{
	if(_index>((count _arrays)-1))exitWith{};
	_array=[]+(_arrays select _index);
	_chance=_array select 0;
	_count=[_array select 1,_array select 2]call BIS_fnc_randomInt;
	_items=_array select 3;
	if((count _items)==0)then{_chance=0};
	if((random 100)<_chance)then{
		while{_count>0}do{
			_item=selectRandom _items;
			if(_index==8)then{_h addBackpackCargoGlobal[_item,1]};
			if(_index==9)then{_h addItemCargoGlobal[_item,1]};
			if(_index==10)then{_h addMagazineCargoGlobal[_item,1]};
			if(_index <8)then{
				_h addWeaponCargoGlobal[_item,1];
				// Get some mags for the weapon
				if((random 100)<_magazineChance)then{
					if(isNil{getArray(configFile>>"cfgWeapons">>_item>>"magazines")})then{_magazines=[]}
					else{_magazines=getArray(configFile>>"cfgWeapons">>_item>>"magazines")};
					_mCount=_magazineCount call BIS_fnc_RandomInt;
					if!((count _magazines)>0)then{_mCount=0};
					while{_mCount>0}do{
						_h addMagazineCargoGlobal[(selectRandom _magazines),1];
						_mCount=_mCount-1;
					};
				};
			};
			_count=_count-1;
		};
	};
	_index=_index+1;
	if(_index>3)exitWith{};
};
if((count _this)>2)exitWith{};
//_h setPosATL _pos;
//if((getPosATL _h)call DMP_fnc_IsInGeometry)then{_pos=[_pos select 0,_pos select 1,20];_h setVehiclePosition[_pos,[],0,"none"]};
if(count((weaponCargo _h)+(itemCargo _h)+(magazineCargo _h)+(backpackCargo _h)+(weaponsItemsCargo _h))<1)then{deleteVehicle _h};
//_pos=[_pos select 0,_pos select 1,20];_h setVehiclePosition[_pos,[],0,"none"];
if!(dmpDebug)exitWith{};
if(isNull _h)exitWith{};
[_pos,"RED"]call DMP_fnc_Mark3D;
_marker=createMarkerLocal[format["%1",_h],(getPos _h)];
_marker setMarkerTypeLocal"mil_dot";
_marker setMarkerColorLocal"ColorBlack";
_marker setMarkerTextLocal(format["%1",(getText(configFile>>"cfgVehicles">>(typeOf _h)>>"displayName"))]);