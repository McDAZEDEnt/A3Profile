
// Use this to decide how to transmit chat messages
// WW2 units do not have radios.  Use GlobalChat instead of SideChat.

params ["_message"];

if ("ItemRadio" in assignedItems Player1) then {
	[[West,"HQ"], _message] remoteExec ["sideChat", [0,-2] select isDedicated, false];
	// Include a short radio message
	[(selectRandom ShortRadioChatter),{playMusic _this}] remoteExec ['BIS_fnc_Spawn', [0,-2] select isDedicated,false];
} else {
	[hq_blu1, _message] remoteExec ["globalChat", [0,-2] select isDedicated, false];
};

