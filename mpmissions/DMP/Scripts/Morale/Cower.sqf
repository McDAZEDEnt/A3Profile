private["_man","_anim"];
_man=_this;
_anim=selectRandom["Acts_CivilHiding_1","Acts_CivilHiding_2","ApanPpneMstpSnonWnonDnon","ApanPpneMstpSnonWnonDnon"];
[_man,_anim]remoteExec["playMove"];
sleep 3;
sleep(random dmpCowerDuration);
if!(alive _man)exitWith{};
_anim="AmovPknlMstpSlowWrflDnon";
[_man,_anim]remoteExec["playMove"];