private["_unit","_items"];
_unit=_this;
//_unit=player;
_items=items _unit;
_items=_items+(assignedItems _unit);
{if((count(getArray(configFile>>"cfgWeapons">>_x>>"magazines")))>0)then{_items=_items-[_x]}}forEach _items;
//{if(getText(configFile>>"cfgMagazines">>_x>>"ammo")=="DRPG_Item")then{_items pushback _x}}forEach magazines _unit;
//systemChat format ["%1",_items];
_items