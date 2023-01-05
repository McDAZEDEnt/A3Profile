private _category = [LELSTRING(common,categoryUncategorized), QUOTE(COMPONENT_BEAUTIFIED)];

[
    QGVAR(minDamageToTrigger), "SLIDER",
    LSTRING(minDamageToTrigger_displayName),
    _category,
    [-1, 1, 0.01, 2],
    1
] call CBA_fnc_addSetting;
