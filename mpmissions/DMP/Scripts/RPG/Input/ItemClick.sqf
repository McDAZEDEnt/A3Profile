private["_idc","_selectedIndex","_itemText"];
_idc=ctrlIDC(_this select 0);
_selectedIndex=_this select 1;
_itemText=format["%1",lbText[_idc,_selectedIndex]];
_itemText execVM"DMP\Scripts\RPG\Player\Item.sqf";