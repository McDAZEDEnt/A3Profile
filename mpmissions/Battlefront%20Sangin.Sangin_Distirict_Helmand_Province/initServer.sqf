// Initialize variables
civsKilledByPlayer = 0;
enemiesKilledByPlayer = 0;
intelLevel = 1;

// Add Respawn Tickets for BLUFOR
[west, ["startingRespawnTickets", 10] call BIS_fnc_getParamValue] call BIS_fnc_respawnTickets;

// Add Mobile Respawn Points (vehicles) for BLUFOR side
[west, westMobileRespawn1, "Mobile Respawn Vehicle 1"] call BIS_fnc_addRespawnPosition;
[west, westMobileRespawn2, "Mobile Respawn Vehicle 2"] call BIS_fnc_addRespawnPosition;


// Set mission's time multiplier
setTimeMultiplier (["timeMultiplier", 8] call BIS_fnc_getParamValue);


// Add a mission event handler to check if players killed enemies or civilians & friendlies and add or subtract respawn tickets
addMissionEventHandler ["EntityKilled",{
  params ["_killed", "_killer", "_instigator"];


  if (isPlayer _killer) then
    {

      if (((side (group _killed)) isEqualTo civilian) or (((side (group _killed) isEqualTo west)) && (!isPlayer _killed))) then
        {
          civsKilledByPlayer = civsKilledByPlayer + 1;

          if (civsKilledByPlayer == ["civCountPenalty", 20] call BIS_fnc_getParamValue) then
            {
              [(side (group _killer)),-(["killPenalty", 1] call BIS_fnc_getParamValue), false] call BIS_fnc_respawnTickets;
              civsKilledByPlayer = 0;
              [format ["You lost a Repsawn Ticket. %1 left",[side _killer] call BIS_fnc_respawnTickets]] remoteExec ["hint", side _killer, false];
            };
        } else {
              enemiesKilledByPlayer = enemiesKilledByPlayer + 1;
              if (enemiesKilledByPlayer == (["enemyCountReward", 20] call BIS_fnc_getParamValue)) then
                {
                  [(side (group _killer)), (["killReward", 1] call BIS_fnc_getParamValue), false] call BIS_fnc_respawnTickets;
                  enemiesKilledByPlayer = 0;
                  [format ["You earned a Repsawn Ticket. Now you have %1", [side _killer] call BIS_fnc_respawnTickets]] remoteExec ["hint", side _killer, false];
                };
            };
        };
    }];



// Randomize enemy commander's (main objective) position
private _randomOcp = getPos (selectRandom [ocp1,ocp2,ocp3,ocp4,ocp5,ocp6,ocp7,ocp8]);
opforCommander setPos _randomOcp;


// Create the hold action that players can buy intel for enemy commander!
[intelMachine] execVM "scripts\buyIntel.sqf";
[recruitMachine] execVM "scripts\recruitOperator.sqf";
[recruitMachine] execVM "scripts\recruitGrenadier.sqf";
[recruitMachine] execVM "scripts\killAITeamMembers.sqf";



// Add Respawn inventories
[missionNamespace, ["operator", -1, -1]] call BIS_fnc_addRespawnInventory;
[missionNamespace, ["grenadier", 2, -1]] call BIS_fnc_addRespawnInventory;
[missionNamespace, ["medic", 1, -1]] call BIS_fnc_addRespawnInventory;
[missionNamespace, ["engineer", 1, -1]] call BIS_fnc_addRespawnInventory;
[missionNamespace, ["marksman", 1, -1]] call BIS_fnc_addRespawnInventory;
[missionNamespace, ["patrolCommander", 1, -1]] call BIS_fnc_addRespawnInventory;
[missionNamespace, ["doomMarksman", -1, -1]] call BIS_fnc_addRespawnInventory;
[missionNamespace, ["doomRifleman", -1, -1]] call BIS_fnc_addRespawnInventory;
[missionNamespace, ["doomAT", -1, -1]] call BIS_fnc_addRespawnInventory;
[missionNamespace, ["doomHMG", -1, -1]] call BIS_fnc_addRespawnInventory;
