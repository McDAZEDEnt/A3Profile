if(r_alertOn)then{r_p call r_alert};[0,((allPlayers)-[r_p]select{_x distance r_p<=99})]call r_d;
private _eh=["KeyUp","if(!r_up_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkDirect'+actionKeys'pushToTalkGroup'+actionKeys'pushToTalkVehicle'+actionKeys'pushToTalkSide'+actionKeys'pushToTalkCommand'))then{call r_up}"];
kpUp=(findDisplay 46)displayAddEventHandler _eh;kpUpZ=(findDisplay 312)displayAddEventHandler _eh