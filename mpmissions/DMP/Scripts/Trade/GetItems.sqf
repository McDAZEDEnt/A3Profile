private["_unit","_items"];
_unit=_this;
_items=items _unit;
_items=_items+(assignedItems _unit);
{if((count(getArray(configFile>>"cfgWeapons">>_x>>"magazines")))>0)then{_items=_items-[_x]}}forEach _items;
_items