//Arma 3 Music Script
//Made by Niklas Brettschneider

//Events zum überprüfen des Kampfes adden
//Bekommt alle Schüsse innerhalb von ca. 69Meter Reichweite mit.
_eventForShotFiredNear = player addEventHandler ["FiredNear", {_this execVM "sounds\musicHandler_Vietnam\shotFiredNear.sqf"}];
_eventForTakingDamage = player addEventHandler ["Dammaged", {_this execVM "sounds\musicHandler_Vietnam\damageTaken.sqf"}];

//musicAction = player addAction ["Deactivate Music", "sounds\musicHandler_Vietnam\musicController.sqf"];
_eventForExplosionsNearby = player addEventHandler ["Explosion", {_this execVM "sounds\musicHandler_Vietnam\explosionNear.sqf"}];
_eventForMissileIncoming = player addEventHandler ["IncomingMissile", {_this execVM "sounds\musicHandler_Vietnam\missileIncoming.sqf"}];

//Auskommentiert, da nur nahe schüsse aufgenommen werden sollen.
//_eventForShotFired = player addEventHandler ["Fired", {_this execVM "shotFiredNear.sqf"}];



//todo: noch sowas wie lange fahrzeugfahrten beachten, vllt auch bei den Spielern ein Menü einblenden...