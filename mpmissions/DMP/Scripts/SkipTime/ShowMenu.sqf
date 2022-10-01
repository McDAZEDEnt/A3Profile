//if([player,100]call dmp_fnc_NearEnemies)exitWith{hintSilent"Can not skip time while enemies are nearby"};
closeDialog 0;
sleep .3;
if(!dialog)then{createDialog"dmpDialogSkipTime"};