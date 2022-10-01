private["_vehicle","_price","_tc","_v","_allTurrets"];
_vehicle=_this;
_price=10;
_allTurrets=[];
_tc="";
_v=0;
if(_vehicle isKindOf"Motorcycle")then{_price=10};
if(_vehicle isKindOf"Car")then{_price=20};
if(_vehicle isKindOf"Truck")then{_price=20};
if(_vehicle isKindOf"APC")then{_price=50};
if(_vehicle isKindOf"Tank")then{_price=100};
if(_vehicle isKindOf"Air")then{_price=100};
if(_vehicle isKindOf"Helicopter")then{_price=100};
if(_vehicle isKindOf"Plane")then{_price=200};
if(_vehicle isKindOf"Ship")then{_price=100};
if(_vehicle isKindOf"StaticWeapon")then{_price=10};
if(_vehicle isKindOf"Static")then{_price=10};
_v=getNumber(configFile>>"cfgVehicles">>_vehicle>>"armor");
if(_v>0)then{_price=round(_price+(_v/10))};
_v=getNumber(configFile>>"cfgVehicles">>_vehicle>>"transportSoldier");
if(_v>0)then{_price=round(_price+(_v*2))};
_v=0;
_allTurrets=[_vehicle,false]call BIS_fnc_allTurrets;
{
_tc=[_vehicle,_x]call BIS_fnc_turretConfig;
	{
	_v=_x call dmp_fnc_GetPriceVehicleWeapon;
	if(_v>0)then{_price=round(_price+_v)};
	}forEach getArray(_tc>>"weapons");
}forEach _allTurrets;
ceil _price