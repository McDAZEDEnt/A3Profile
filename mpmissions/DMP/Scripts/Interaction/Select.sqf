private["_index","_action","_man","_side","_text","_array"];
disableSerialization;
_index=lbCurSel 7010;
_action=lbData[7010,_index];
_man=dmpCurrentTalker;
_side=_man call DMP_fnc_GetSide;
if!(_side==CIVILIAN)exitWith{[_man,_action]execVM"DMP\Scripts\Interaction\SelectSoldier.sqf"};
_text="";
_array=[];
_text=[_man,_action]call DMP_fnc_GetResponseCiv;
if(_action=="DETAIN")exitWith{
	closeDialog 0;
	if((animationState _man)=="Acts_AidlPsitMstpSsurWnonDnon_loop")then{
		[_man ,"Acts_AidlPsitMstpSsurWnonDnon_out"]remoteExec["playMove"];
		{[_man,_x]remoteExec["enableAI"]}forEach["MOVE","TARGET","AUTOTARGET","WEAPONAIM","FSM","AUTOCOMBAT"];
		[side player,_man]call DMP_fnc_DetainPenalty;
	}else{
		[_man ,"Acts_AidlPsitMstpSsurWnonDnon_loop"]remoteExec["playMove"];
		{[_man,_x]remoteExec["disableAI"]}forEach["MOVE","TARGET","AUTOTARGET","WEAPONAIM","FSM","AUTOCOMBAT"];
	};
};
((findDisplay 7000)displayCtrl 7001)ctrlSetStructuredText parseText _text;

