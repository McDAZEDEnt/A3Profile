
// Create help for DUWS
_index = player createDiarySubject ["help",localize "STR_DUWS_X_3feql12c"]; 
player createDiaryRecord ["help", [localize "STR_DUWS_X_getwuiuy", localize "STR_DUWS_X_6ku0lc19"]];  //bugs
player createDiaryRecord ["help", [localize "STR_DUWS_X_7vfkrl61", localize "STR_DUWS_X_zho04a1k"]];  //credits

player createDiaryRecord ["help", [localize "STR_DUWS_X_auhmznp6", localize "STR_DUWS_X_m267zqr7"]];  //operatives
player createDiaryRecord ["help", [localize "STR_DUWS_X_ty006zz4", localize "STR_DUWS_X_8o0fomss"]];  //saving
player createDiaryRecord ["help", [localize "STR_DUWS_X_ojav7yf4", localize "STR_DUWS_X_d38s8oac"]];  //hardcore
player createDiaryRecord ["help", [localize "STR_DUWS_X_ulm497s5", localize "STR_DUWS_X_16wnqdrz"]];  //taskforces
player createDiaryRecord ["help", [localize "STR_DUWS_X_g12m5x3q", localize "STR_DUWS_X_8wqz09va"]];  //refit
player createDiaryRecord ["help", [localize "STR_DUWS_X_i247bl4y", localize "STR_DUWS_X_f65bkdqs"]];  //loadouts
player createDiaryRecord ["help", [localize "STR_DUWS_X_4yxb8s2k", localize "STR_DUWS_X_4elv35h6"]];  //fob
player createDiaryRecord ["help", [localize "STR_DUWS_X_ryhnop2g", localize "STR_DUWS_X_617kjc41"]];  //missions
player createDiaryRecord ["help", [localize "STR_DUWS_X_o31d875x", localize "STR_DUWS_X_3c1ygiga"]];  //supports
player createDiaryRecord ["help", [localize "STR_DUWS_X_g4orlwp1", localize "STR_DUWS_X_t6bei9tk"]];  //request
player createDiaryRecord ["help", [localize "STR_DUWS_X_n4yjyv9x", localize "STR_DUWS_X_m204wqqq"]];  //reputation
player createDiaryRecord ["help", [localize "STR_DUWS_X_x4vt0je3", localize "STR_DUWS_X_xs3zn5m2"]];  //ap
player createDiaryRecord ["help", [localize "STR_DUWS_X_uzx258em", localize "STR_DUWS_X_r3x8czon"]];  //cp
player createDiaryRecord ["help", [localize "STR_DUWS_X_0f4f5uo2", localize "STR_DUWS_X_q4wns5y7"]];  //victory

// Operatives
//_index = player createDiarySubject ["operativehelp","Special operatives"];
//player createDiaryRecord ["operativehelp", ["Skills", "<font color='#FF0000'>Aiming:</font color><br />Pretty self explanatory, how well the operative can aim, lead a target, compensante for bullet drop and manage recoil.<br /><br /><font color='#FF0000'>Reflexes:</font color><br />How fast the operator can react to a new threat and stabilize its aim.<br /><br /><font color='#FF0000'>Spotting:</font color><br />The operative ability to spot targets within it's visual or audible range, and how accurately he can spot targets.<br /><br /><font color='#FF0000'>Courage:</font color><br />Affects the morale of subordinates units of the operative, how likely they will flee, depending on what is in front of them and the squad status.<br /><br /><font color='#FF0000'>Communications:</font color><br />How quickly recognized targets are shared with the squad.<br /><br /><font color='#FF0000'>Reload speed:</font color><br />The operator's ability to switch weapon or reload quickly."]];
//player createDiaryRecord ["operativehelp", ["Recruiting Operatives", "Operatives can be recruited at the HQ and FOBs, inside the ""request unit"" menu. When you recruit someone for the first time, you'll have to spend 5 CP. However, once an operative has been recruited, if ""injured""(killed) in battle, you can recruit it again for only 2 CP after a delay between 20 and 80 minutes."]];
//player createDiaryRecord ["operativehelp", ["Overview", "You can recruit special operatives that will stay and progress with you for all the duration of the campaign. These are SpecOps units from various factions. Their skills will increase each time a zone is captured or a mission is accomplished, whether they're in your squad or not. However, when an operative is actually in the game, he will gain 10 spendable points wich can be assigned freely in any skill at the operative menu."]];

// MP Diary
if (isMultiplayer) then {
    player createDiaryRecord ["help", [localize "STR_DUWS_X_ljw9ndqz", localize "STR_DUWS_X_nk0wa9zo"]];
};
