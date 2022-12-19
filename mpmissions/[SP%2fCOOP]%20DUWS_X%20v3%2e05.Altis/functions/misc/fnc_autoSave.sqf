
// Super simple auto-save script.
// this enables manual save
//enableSaving false;
if (!savingEnabled) then {
	hint localize "STR_DUWS_X_vmhut3p1";
	enableSaving true;
};
sleep 0.1;
saveGame;
