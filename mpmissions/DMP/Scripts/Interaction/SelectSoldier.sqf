private["_index","_action","_man","_side","_text","_array"];
disableSerialization;
_man=_this select 0;
_action=_this select 1;
_text="";
_array=[];
_text=[_man,_action]call DMP_fnc_GetResponseSoldier;
if(_action=="DELETE")exitWith{closeDialog 0;deleteVehicle _man};
if(_action=="DISARM")exitWith{
	closeDialog 0;
	if((animationState _man)=="Acts_AidlPsitMstpSsurWnonDnon_loop")exitWith{hint"Captive is bound and can not disarm"};
	[[_man],"DMP\Scripts\Interaction\Disarm.sqf"]remoteExec["execVM"];
	//[_man]remoteExec["DMP_fnc_Disarm"];
};
if(_action=="DETAIN")exitWith{
	closeDialog 0;
	if((animationState _man)=="AmovPercMstpSsurWnonDnon")then{[_man,"AidlPercMstpSnonWnonDnon_AI"]remoteExec["switchMove"];sleep 1};
	if((animationState _man)=="Acts_AidlPsitMstpSsurWnonDnon_loop")then{
		[_man,"Acts_AidlPsitMstpSsurWnonDnon_out"]remoteExec["playMove"];
		{[_man,_x]remoteExec["enableAI"]}forEach["MOVE","TARGET","AUTOTARGET","WEAPONAIM","FSM","AUTOCOMBAT"];
	}else{
		[_man,"Acts_AidlPsitMstpSsurWnonDnon_loop"]remoteExec["playMove"];
		{[_man,_x]remoteExec["disableAI"]}forEach["MOVE","TARGET","AUTOTARGET","WEAPONAIM","FSM","AUTOCOMBAT"];
	};
};
((findDisplay 7000)displayCtrl 7001)ctrlSetStructuredText parseText _text;