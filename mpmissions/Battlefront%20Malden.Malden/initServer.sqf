// Initialize variables
civsKilledByPlayer = 0;
enemiesKilledByPlayer = 0;
intelLevel = 1;

// Add Respawn Tickets for BLUFOR
[west, ["startingRespawnTickets", 10] call BIS_fnc_getParamValue] call BIS_fnc_respawnTickets;

// Add Mobile Respawn Points (vehicles) for BLUFOR side
[west, westMobileRespawn1, "Mobile Respawn Vehicle 1"] call BIS_fnc_addRespawnPosition;
[west, westMobileRespawn2, "Mobile Respawn Vehicle 2"] call BIS_fnc_addRespawnPosition;
[west, westMobileRespawn3, "Mobile Respawn Vehicle 3"] call BIS_fnc_addRespawnPosition;


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
              [format ["Your side lost %1 Repsawn Tickets because you killed %2 Civilian(s)/Friendly-ies",["killPenalty", 30] call BIS_fnc_getParamValue, ["civCountPenalty", 1] call BIS_fnc_getParamValue]] remoteExec ["hint", side _killer, false];
            };
        } else {
              enemiesKilledByPlayer = enemiesKilledByPlayer + 1;
              if (enemiesKilledByPlayer == (["enemyCountReward", 20] call BIS_fnc_getParamValue)) then
                {
                  [(side (group _killer)), (["killReward", 1] call BIS_fnc_getParamValue), false] call BIS_fnc_respawnTickets;
                  enemiesKilledByPlayer = 0;
                  [format ["You earned %1 Repsawn Ticket(s) because you killed %2 enemy/ies.", ["killReward", 2] call BIS_fnc_getParamValue, ["enemyCountReward", 5] call BIS_fnc_getParamValue]] remoteExec ["hint", side _killer, false];
                };
            };
        };
    }];



// Randomize enemy commander's (main objective) position
private _randomOcp = getPos (selectRandom [ocp1,ocp2,ocp3,ocp4,ocp5,ocp6,ocp7,ocp8]);
opforCommander setPos _randomOcp;
_randomOcp = nil;


// Create the hold action that players can buy intel for enemy commander!
[intelObject] execVM "scripts\buyIntel.sqf";
[recruitObject] execVM "scripts\recruitOperator.sqf";
[recruitObject] execVM "scripts\recruitGrenadier.sqf";
[recruitObject] execVM "scripts\killAITeamMembers.sqf";
[ACELogisticsComputer] execVM "scripts\spawnWheelHoldAction.sqf";
[ACELogisticsComputer] execVM "scripts\spawnTrackHoldAction.sqf";

// Add Respawn inventories
[west, ["operator", -1, -1]] call BIS_fnc_addRespawnInventory;
[west, ["grenadier", 1, -1]] call BIS_fnc_addRespawnInventory;
[west, ["medic", 1, -1]] call BIS_fnc_addRespawnInventory;
[west, ["engineer", 1, -1]] call BIS_fnc_addRespawnInventory;
[west, ["marksman", 1, -1]] call BIS_fnc_addRespawnInventory;
[west, ["patrolCommander", 1, -1]] call BIS_fnc_addRespawnInventory;
[west, ["lmgGunner", 1, -1]] call BIS_fnc_addRespawnInventory;
