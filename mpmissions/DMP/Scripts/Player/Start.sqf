if(dmpDebug)then{systemChat format["Admin bound to %1 (Options > Controls > Custom controls)",dmpAdminKey]};
dmpPlayerCash=0;
// The useraction slot we'll use for this key (you'll also need to bind a key to it in Arma's keybind menu)
dmpKeyCode=10;
dmpKey=format["User%1",dmpKeyCode];
dmp_fnc_dmpKey=compile preprocessFile"DMP\Scripts\Player\InteractKey.sqf";
if(isNil{profileNamespace getVariable"dmpKey"})then{profileNamespace setVariable["dmpKey",dmpKey]}
else{dmpKey=profileNamespace getVariable"dmpKey"};
if(dmpDebug)then{systemChat format["Interact bound to %1 (Options > Controls > Custom controls)",dmpKey]};
dmpAntiSpam=FALSE;
execVM"DMP\Scripts\Player\TaskCheck.sqf";

dmpAdminKeyHandle=[]spawn{
    while{TRUE}do{
		if((inputaction dmpAdminKey)>.3)then{if(dmpAntiSpam)exitWith{};dmpAntiSpam=TRUE;execVM"DMP\Scripts\Admin\Start.sqf"};
		sleep .1;
    };
};

if!(dmpUseInteractKey)exitWith{};
dmpKeyHandle=[]spawn{
    while{TRUE}do{
		if((inputaction dmpKey)>.3)then{if(dmpAntiSpam)exitWith{};dmpAntiSpam=TRUE;[]spawn dmp_fnc_dmpKey};
		sleep .1;
    };
};