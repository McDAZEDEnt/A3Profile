private["_dialog","_list","_index"];
disableSerialization;
//if(dialog)exitWith{closeDialog 0};
if(!dialog)then{createDialog"dmp_AdminDialog"};
//ctrlEnable[30111,false];
sleep .1;
dmpAdminGroups=[];
{
if((side _x)==dmpAdminSide)then{
	if(_x call dmp_fnc_GroupIsAlive)then{dmpAdminGroups pushBack _x};
};
}forEach allGroups;

_dialog=findDisplay 900;
_list=_dialog displayCtrl 901;
_index=0;
lbClear _list;
{
_list lbAdd(format["%1",_x]);
_list lbSetValue[(lbSize _list)-1,_index];
_index=_index+1;
}forEach dmpAdminGroups;

_dialog=findDisplay 900;
_list=_dialog displayCtrl 903;
lbClear _list;
{
_list lbAdd _x;
_list lbSetData[(lbSize _list)-1,_x];
}forEach["Delete Campaign","Force Win","Force Lose","Teleport","Heal","Kill","Kill Side","Delete","Mark","Fly","End Mission","Abort Mission"];