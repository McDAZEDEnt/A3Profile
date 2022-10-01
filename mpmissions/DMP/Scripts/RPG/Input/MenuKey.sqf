if((count dmpMenuActions)==0)exitWith{if(dmpDebug)then{systemChat"No entries in dmpMenuActions"}};
if(dialog)then{closeDialog 0;sleep .5};
execVM"DMP\Scripts\RPG\Dialog\ShowDialog.sqf";sleep .5;dmpAntiSpam=FALSE;