if((r_incap)&&(lifeState r_p=="INCAPACITATED"))then{2 enableChannel[false,false];setCurrentChannel 5}else{2 enableChannel r_cCH;{r_p remoteExecCall["r_out",_x]}forEach(allPlayers-[r_p]select{leader group _x==_x&&side _x==playerSide})};
if(r_vol>0)then{playSound("out"+str(call rVolu))};
_eh=["KeyDown","if(!r_dn_ && _this#1 in(actionKeys'pushToTalk'+actionKeys'pushToTalkDirect'+actionKeys'pushToTalkGroup'+actionKeys'pushToTalkVehicle'+actionKeys'pushToTalkSide'+actionKeys'pushToTalkCommand'))then{call r_dn}"];
kpDn=(findDisplay 46)displayAddEventHandler _eh;kpDnZ=(findDisplay 312)displayAddEventHandler _eh