// Check to see if the loading system is being used and thus a module should not run
if(count(entities"DMP_Persistence")<1)exitWith{TRUE};
waitUntil{!(isNil"dmpPersistenceReady")};
waitUntil{dmpPersistenceReady};
waitUntil{!(isNil"dmpLoadGame")};
if(dmpLoadGame)exitWith{FALSE};
TRUE