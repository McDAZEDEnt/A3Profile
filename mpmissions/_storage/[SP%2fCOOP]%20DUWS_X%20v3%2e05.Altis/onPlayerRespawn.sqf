
sleep 1;
player setUnitLoadout(player getVariable["Saved_Loadout",[]]);

if (staminaEnabled == true) then {
    player enableStamina true;
	player_fatigue = 1;
} else {
    player enableStamina false;
};
