disableSerialization;
private["_code","_selected","_split","_item","_itemType","_price","_vehicle"];
_code=toUpper _this;
_selected=[];
_split=[];
_item="";
_itemType="";
_price=0;
_vehicle=objNull;
_canAdd=false;
systemChat str _code;
if(_code=="BUY")exitWith{
	_selected=lbData[8030,lbCurSel 8030];
	if(dmpDebug)then{systemChat str _selected};
	if((count _selected)==0)exitWith{};
	_split=[];
	_split=_selected splitString"--";
	_item=_split select 0;
	_price=parseNumber(_split select 1);
	if(dmpPlayerCash<_price)exitWith{hintSilent"Not enough cash"};
	if(dmpCurrentTraderMode=="Other")exitWith{
		dmpPlayerCash=dmpPlayerCash-_price;
		_vehicle=_item createVehicle(getPos player);
		clearMagazineCargoGlobal _vehicle;
		clearWeaponCargoGlobal _vehicle;
		clearItemCargoGlobal _vehicle;
		clearBackpackCargoGlobal _vehicle;
		_vehicle setVariable["dmpSave",true,true];
		systemChat format["Bought %1",_item call dmp_fnc_GetDisplayName];
	};
	_itemType=_item call dmp_fnc_ItemType2;
	if(dmpDebug)then{systemChat str _itemType};
	if(_itemType=="WeaponP")then{if((primaryWeapon player)=="")then{player addWeapon _item;_canAdd=true}else{hintSilent"You already have a primary weapon"}};
	if(_itemType=="WeaponS")then{if((secondaryWeapon player)=="")then{player addWeapon _item;_canAdd=true}else{hintSilent"You already have a secondary weapon"}};
	if(_itemType=="WeaponH")then{if((handgunWeapon player)=="")then{player addWeapon _item;_canAdd=true}else{hintSilent"You already have a handgun"}};
	if(_itemType=="Headgear")then{if((headgear player)=="")then{player addHeadgear _item;_canAdd=true}else{hintSilent"You already have headgear"}};
	if(_itemType=="Uniform")then{if((uniform player)=="")then{player forceAddUniform _item;_canAdd=true}else{hintSilent"You already have a uniform"}};
	if(_itemType=="Vest")then{if((vest player)=="")then{player addVest _item;_canAdd=true}else{hintSilent"You already have a vest"}};
	if(_itemType=="Backpack")then{if((backpack player)=="")then{player addBackpack _item;_canAdd=true}else{hintSilent"You already have a backpack"}};
	if(_itemType=="Item")then{if(player canAdd[_item,1])then{player addItem _item;_canAdd=true}else{hintSilent"Not enough space"}};
	if(_itemType=="Magazine")then{if(player canAdd[_item,1])then{player addMagazine _item;_canAdd=true}else{hintSilent"Not enough space"}};
	if(_itemType=="AttachmentM")then{if(player canAdd[_item,1])then{player addItem _item;_canAdd=true}else{hintSilent"Not enough space"}};
	if(_itemType=="AttachmentO")then{if(player canAdd[_item,1])then{player addItem _item;_canAdd=true}else{hintSilent"Not enough space"}};
	if(_itemType=="AttachmentP")then{if(player canAdd[_item,1])then{player addItem _item;_canAdd=true}else{hintSilent"Not enough space"}};
	if(_itemType=="AttachmentB")then{if(player canAdd[_item,1])then{player addItem _item;_canAdd=true}else{hintSilent"Not enough space"}};
	if(_canAdd)then{dmpPlayerCash=dmpPlayerCash-_price;systemChat format["Bought %1",_item call dmp_fnc_GetDisplayName]}else{
		if(dmpDebug)then{systemChat format["Buy failed: %1",_item call dmp_fnc_GetDisplayName]};
	};
	sleep .3;
	execVM"dmp\Scripts\Trade\Dialog.sqf";
};

if(_code=="SELL")exitWith{
	_selected=lbData[8030,lbCurSel 8030];
	if((count _selected)==0)exitWith{};
	_split=[];
	_split=_selected splitString"--";
	_item=_split select 0;
	_price=parseNumber(_split select 1);
	player removeItem _item;
	//if(_item==uniform player)then{player removeUniform};
	//OR(_item==vest player)OR(_item==secondaryWeapon player))then{player removeWeapon _item};
	if(_item==headGear player)exitWith{systemChat"Can not sell equipped headgear"};
	if(_item==vest player)exitWith{systemChat"Can not sell equipped vests"};
	if(_item==uniform player)exitWith{systemChat"Can not sell equipped uniforms"};
	if((_item==primaryWeapon player)OR(_item==handgunWeapon player)OR(_item==secondaryWeapon player))then{player removeWeapon _item};
	dmpPlayerCash=dmpPlayerCash+_price;
	systemChat format["Sold %1",_item call dmp_fnc_GetDisplayName];
	execVM"DMP\Scripts\Trade\Dialog.sqf";
};