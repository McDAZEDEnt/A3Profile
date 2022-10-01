private["_man"];
_man=_this;
if(isServer)then{_man addMPEventHandler["mpkilled",{_this execVM"DMP\Scripts\Defend\Killed.sqf"}]};