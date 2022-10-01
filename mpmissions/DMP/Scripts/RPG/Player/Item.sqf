private["_itemText","_pos","_relPos","_object","_selectedItem","_items","_items2","_animIn","_animOut","_cash"];
_itemText=_this;
//if(dmpDebug)then{systemChat format["Trying to use: %1",_itemText]};
_pos=[];
_relPos=[];
_object=objNull;
_selectedItem="";
_items=[];
_animIn="AinvPknlMstpSnonWrflDnon_AinvPknlMstpSnonWrflDnon_medic";
_animOut="AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon";
_items=_items+(items player);
_items=_items+(assignedItems player);
_items=_items+(magazines player);
_items=_items+(weapons player);
_items2=_items;
{
_text=getText(configFile>>"cfgWeapons">>_x>>"displayName");if(_text==_itemText)exitWith{_selectedItem=_x;_items=[]};
_text=getText(configFile>>"cfgMagazines">>_x>>"displayName");if(_text==_itemText)exitWith{_selectedItem=_x;_items=[]};
_text=getText(configFile>>"cfgGlasses">>_x>>"displayName");if(_text==_itemText)exitWith{_selectedItem=_x;_items=[]};
_text=getText(configFile>>"cfgVehicles">>_x>>"displayName");if(_text==_itemText)exitWith{_selectedItem=_x;_items=[]};
}forEach _items;
_items=_items2;
//systemChat format["_items %1",_items];systemChat format["_selectedItem: %1",_selectedItem];
_relPos=[2,0];
_cash=0;
if(_selectedItem in dmpConsumables)exitWith{[_selectedItem,TRUE]execVM"DMP\Scripts\RPG\Player\Consume.sqf"};
if(_selectedItem=="dmpWallet")exitWith{
	player removeItem _selectedItem;
	_cash=dmpCashInWallet call BIS_fnc_RandomInt;
	if((random 100)<1)then{_cash=_cash*10;_cash=round _cash};
	dmpPlayerCash=dmpPlayerCash+_cash;
	systemChat format["Got $%1",_cash];
};
if(_selectedItem=="dmpTent")exitWith{
	closeDialog 0;player playMove _animIn;sleep 3;//player playMove _animOut;sleep 2;
	player removeItem _selectedItem;
	_pos=player getRelPos _relPos;
	//_object="Land_TentDome_F"createVehicle _pos;
	_object=createVehicle["dmpTent_V",_pos,[],0,"CAN_COLLIDE"];
	_object setDir getDir player;
	//if(dmpArsenal)then{[_object,["Arsenal",{execVM"DMP\Scripts\RPG\Misc\Arsenal.sqf"}]]remoteExec["addAction"];};
	if(dmpSleep)then{[_object,["Sleep",{execVM"DMP\Scripts\RPG\Player\PreSleep.sqf"}]]remoteExec["addAction"];};
};
if(_selectedItem=="dmpMatches")exitWith{
	closeDialog 0;player playMove _animIn;sleep 3;//player playMove _animOut;sleep 2;
	//player removeItem _selectedItem;
	_pos=player getRelPos[2,0];
	//_object="FirePlace_burning_F"createVehicle _pos;
	_object=createVehicle["FirePlace_burning_F",_pos,[],0,"CAN_COLLIDE"];
	_object setDir getDir player;
};
if(_selectedItem=="dmpCampingLamp")exitWith{
	closeDialog 0;player playMove _animIn;sleep 3;//player playMove _animOut;sleep 2;
	player removeItem _selectedItem;
	_pos=player getRelPos _relPos;
	_object=createVehicle["dmpCampingLampON",_pos,[],0,"CAN_COLLIDE"];
	//_object="dmpCampingLampON"createVehicle _pos;
	_object setDir getDir player;
	_object execVM"DMP\Scripts\RPG\Misc\Lamp.sqf";
};
if(_selectedItem=="dmpSleepingBag")exitWith{
	closeDialog 0;player playMove _animIn;sleep 3;//player playMove _animOut;sleep 2;
	player removeItem _selectedItem;
	_pos=player getRelPos _relPos;
	//_object="Land_Sleeping_Bag_F"createVehicle _pos;
	_object=createVehicle["Land_Sleeping_Bag_F",_pos,[],0,"CAN_COLLIDE"];
	_object setDir getDir player;
	//_object attachTo[player];
};
if(_selectedItem=="dmpStims")exitWith{
	player removeItem _selectedItem;
	systemChat"Took stims";
	player setStamina 300;
};
if!(dmpScriptItem=="")exitWith{_selectedItem execVM dmpScriptItem};