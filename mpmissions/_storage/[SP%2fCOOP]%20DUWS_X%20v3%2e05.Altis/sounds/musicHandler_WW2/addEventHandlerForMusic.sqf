//Arma 3 Music Script
//Made by Niklas Brettschneider

//Events zum überprüfen des Kampfes adden
//Bekommt alle Schüsse innerhalb von ca. 69Meter Reichweite mit.
_eventForShotFiredNear = player addEventHandler ["FiredNear", {_this execVM "sounds\musicHandler_WW2\shotFiredNear.sqf"}];
_eventForTakingDamage = player addEventHandler ["Dammaged", {_this execVM "sounds\musicHandler_WW2\damageTaken.sqf"}];

//musicAction = player addAction ["Musik Deaktivieren", "sounds\musicHandler_WW2\musicController.sqf"];
_eventForExplosionsNearby = player addEventHandler ["Explosion", {_this execVM "sounds\musicHandler_WW2\explosionNear.sqf"}];
_eventForMissileIncoming = player addEventHandler ["IncomingMissile", {_this execVM "sounds\musicHandler_WW2\missileIncoming.sqf"}];

//Auskommentiert, da nur nahe schüsse aufgenommen werden sollen.
//_eventForShotFired = player addEventHandler ["Fired", {_this execVM "shotFiredNear.sqf"}];



//todo: noch sowas wie lange fahrzeugfahrten beachten, vllt auch bei den Spielern ein Menü einblenden...