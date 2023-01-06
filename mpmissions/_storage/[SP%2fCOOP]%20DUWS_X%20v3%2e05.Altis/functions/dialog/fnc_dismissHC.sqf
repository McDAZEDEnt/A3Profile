for "_timer" from 10 to 1 step -1 do {
    hint format[localize "STR_DUWS_X_1bntq9ke",_timer];
    sleep 1;
};

_selectedGroup = hcSelected player;
if (count _selectedGroup<1) exitWith {hint localize "STR_DUWS_X_57syrjor"};
if (count _selectedGroup>1) exitWith {hint localize "STR_DUWS_X_dzkot1hm"};

_group = _selectedGroup select 0;

player hcRemoveGroup _group;
units _group joinSilent player;

hint localize "STR_DUWS_X_gj4ue2bf";