private["_list","_array","_index","_action"];
onMapSingleClick"";
//if(dialog)exitWith{closeDialog 0};sleep .2;
//createDialog"dmpDialogRPG";
if!(dialog)then{createDialog"dmpDialogRPG"};
ctrlShow[10000,TRUE];
ctrlShow[10010,FALSE];
ctrlShow[10011,FALSE];
//ctrlShow[10012,FALSE];
if(dmpRPGplayersCanLoad)then{ctrlShow[10010,TRUE]};
if(dmpRPGplayersCanEnd)then{ctrlShow[10011,TRUE]};

_list=(findDisplay 10000)displayCtrl 10000;
lbClear _list;
_array=[]+dmpMenuActions;
if(call dmp_fnc_NearWell)then{
	_array pushBack["Get clean water","DMP\Scripts\RPG\Actions\GetCleanWater.sqf"];
	_array pushBack["Drink clean water","DMP\Scripts\RPG\Actions\DrinkCleanWater.sqf"];
};
if(surfaceIsWater(getPos player))then{
	_array pushBack["Get dirty water","DMP\Scripts\RPG\Actions\GetDirtyWater.sqf"];
	_array pushBack["Drink dirty water","DMP\Scripts\RPG\Actions\DrinkDirtyWater.sqf"];
};
if(("dmpBottleFullDirty"call dmp_fnc_HasItem)OR("dmpCanteenDirty"call dmp_fnc_HasItem))then{
	_array pushBack["Empty dirty water","DMP\Scripts\RPG\Actions\EmptyDirtyWater.sqf"];
};
// Actions
_index=0;
_action="";
{
_action=_array select _index;
_list lbAdd format["%1",_action select 0];
_list lbSetData[_index,_action select 1];
_index=_index+1;
}forEach _array;

// Player skills
//ctrlShow[10000,TRUE];
_list=(findDisplay 10000)displayCtrl 10001;
lbClear _list;
_index=0;
_array=[]+dmpPlayerSkills;
{
_list lbAdd format["%1",_x];
_list lbSetData[_index,_x];
_index=_index+1;
}forEach _array;

// Available skills
//ctrlShow[10000,TRUE];
_list=(findDisplay 10000)displayCtrl 10002;
lbClear _list;
_index=0;
_array=[]+dmpSkills;
_array=_array-dmpPlayerSkills;
{
_list lbAdd format["%1",_x];
_list lbSetData[_index,_x];
_index=_index+1;
}forEach _array;

_skillPointText="";
_colour='#fffff';
if(dmpPlayerSkillPoints>0)then{_skillPointText=format["    Skill points: %1",dmpPlayerSkillPoints];_colour='#008744'};
((findDisplay 10000)displayCtrl 10003)ctrlSetStructuredText parseText format["<t color='%1'>Level: %2   XP: %3/%4%5</t>",_colour,dmpPlayerLevel,dmpPlayerXP,dmpPlayerXPnextLevel,_skillPointText];