//Arma 3 Music Script
//Made by Niklas Brettschneider

/*_playlist = ["Track01_Proteus","Track02_SolarPower","Track03_OnTheRoad",
"Track04_Underwater1","Track05_Underwater2","Track06_CarnHeli","Track07_ActionDark", 
"Track08_Night_ambient", "Track09_Night_percussions", "Track10_StageB_action", 
"Track11_StageB_stealth", "Track12_StageC_action", "Track13_StageC_negative",
"Track14_MainMenu", "Track15_MainTheme"];
_durationList = [94,114,88,96,96,111,111,204,194,96,184, 204, 194, 96, 184, 96, 184, 128, 162];*/


_safeTracks = ["adaggio_short", "FMJ_sniper", "leonard", "niceday", "telegrams", "troops_line", "whatiswar", "sgt_mackenzie", "iwillgo", "montage", "under_cover", "illumination", "the_knoll"];
_safeDurations = [356, 196, 358, 163, 82, 70, 214, 171, 77, 151, 83, 117, 68];


_combatTracks = ["ruins", "FMJ_attack", "finalbattle_cut", "the_target", "first_step", "snake2", "ruins"];
_combatDurations = [128, 123, 215, 55, 125, 56, 128];


_stealthTracks = ["adaggio_short", "FMJ_sniper", "leonard", "iwillgo", "montage", "under_cover", "photographer", "horrors", "illumination", "the_knoll"];
_stealthDurations = [356, 196, 358, 77, 151, 83, 64, 87, 117, 68];


_movingFastTracks = ["adaggio_short", "troops_line", "montage", "final_battle1", "training"];
_movingFastDurations = [356, 70, 151, 512, 98];


//schauen ob das Lied zu ende ist
durationSinceTrackWasStarted = durationSinceTrackWasStarted + 0.2;
if(durationSinceTrackWasStarted > duration - 5) then
{
	2 fadeMusic 0;
};
if(durationSinceTrackWasStarted > duration - 2) then
{
	isMusicCurrentlyPlaying = 0;
};
	


//im Kampf
if(battleIntensity > 10 ) then
{
	//Wenn vorher kein kampf war oder Musik zu ende ist, neue Spielen
	if(currentMusicState != "combat" || isMusicCurrentlyPlaying == 0) then
	{
		currentMusicState = "combat";
		if(vehicle player != player) then
		{
			//Kampf im Fahrzeug
			_selecter = floor(random count _movingFastTracks);// Track02_SolarPower
			playMusic (_movingFastTracks select _selecter); 
			duration = (_movingFastDurations select _selecter);
			currentTrack = (_movingFastTracks select _selecter);
			
			if(debugging == 1) then
			{
				hint format ["Changed music to InVehicleFightMusic Trackname: %1", (_movingFastTracks select _selecter)];
			};
		}
		else
		{
			//Kampf zu fuﬂ
			wasInCarBefore = 0;
			_selecter = floor(random count _combatTracks); //Track07_ActionDark
			playMusic (_combatTracks select _selecter); 
			duration = (_combatDurations select _selecter);
			currentTrack = (_combatTracks select _selecter);
			
			if(debugging == 1) then
			{
				hint format ["Changed music to NormalFightMusic Trackname: %1", (_combatTracks select _selecter)];
			};
		};
		2 fadeMusic Volume;
		isMusicCurrentlyPlaying = 1;
		durationSinceTrackWasStarted = 0;
	};
	if(vehicle player != player && wasInCarBefore == 0) then
	{	
		VehicleIamIn = vehicle player;
		//wechsel ins Fahrzeug
		if(debugging == 1) then
		{
			hint "adding event handler for vehicle";
		};
		_eventForShotFiredNear = VehicleIamIn addEventHandler ["FiredNear", {_this execVM "sounds\musicHandler_Vietnam\shotFiredNear.sqf"}];
		_eventForTakingDamage = VehicleIamIn addEventHandler ["Dammaged", {_this execVM "sounds\musicHandler_Vietnam\damageTaken.sqf"}];
		_eventForExplosionsNearby = VehicleIamIn addEventHandler ["Explosion", {_this execVM "sounds\musicHandler_Vietnam\explosionNear.sqf"}];
		_eventForMissileIncoming = VehicleIamIn addEventHandler ["IncomingMissile", {_this execVM "sounds\musicHandler_Vietnam\missileIncoming.sqf"}];
		 
		 _getOut = VehicleIamIn addEventHandler["GetOut",{
			if(debugging == 1) then
			{
				hint "removing event handler for vehicle";
			};
				_eventForShotFiredNear = (_this select 0) removeEventHandler ["FiredNear", {_this execVM "sounds\musicHandler_Vietnam\shotFiredNear.sqf"}];
				_eventForTakingDamage = (_this select 0) removeEventHandler ["Dammaged", {_this execVM "sounds\musicHandler_Vietnam\damageTaken.sqf"}];
				_eventForExplosionsNearby = (_this select 0) removeEventHandler ["Explosion", {_this execVM "sounds\musicHandler_Vietnam\explosionNear.sqf"}];
				_eventForMissileIncoming = (_this select 0) removeEventHandler ["IncomingMissile", {_this execVM "sounds\musicHandler_Vietnam\missileIncoming.sqf"}];
		 }];
		
		wasInCarBefore = 1;
		//Kampf im Fahrzeug
		_selecter = floor(random count _movingFastTracks);// Track02_SolarPower
		playMusic (_movingFastTracks select _selecter); 
		duration = (_movingFastDurations select _selecter);
		currentTrack = (_movingFastTracks select _selecter);
		if(debugging == 1) then
		{
			hint format ["Changed music to InVehicleFightMusic Because a Vehicle was entered Trackname: %1", (_movingFastTracks select _selecter)];
		};
	};
	if(vehicle player == player && wasInCarBefore == 1) then
	{
		//wechsel aus Fahrzeug raus
		wasInCarBefore = 0;
		
		//Kampf zu fuﬂ
		_selecter = floor(random count _combatTracks); //Track07_ActionDark
		playMusic (_combatTracks select _selecter); 
		duration = (_combatDurations select _selecter);
		currentTrack = (_combatTracks select _selecter);
		
		if(debugging == 1) then
		{
			hint format ["Changed music to NormalFightMusic Because a Vehicle was Left Trackname: %1", (_combatTracks select _selecter)];
		};
	};
}
else 
{//auﬂerhalb vom Kampf
	_selecter = 0;
	if(battleIntensity <= 10) then
	{
		//Wenn vorher kampf war oder Musik zu ende ist, neue Spielen
		if(currentMusicState != "nonCombat" || isMusicCurrentlyPlaying == 0) then
		{
			currentMusicState = "nonCombat";
			2 fadeMusic volume;
			if(isDay == 0)then
			{
				//nachts stealth musik spielen
				_selecter = floor(random count _stealthTracks);
				playMusic (_stealthTracks select _selecter); 
				duration = (_stealthDurations select _selecter);
				currentTrack = (_stealthTracks select _selecter);
				
				if(debugging == 1) then
				{
					hint format ["Changed music to StealthMusic Trackname: %1", (_stealthTracks select _selecter)];
				};
				
			};
			if(isDay == 1) then
			{
				//Tags¸ber ohne kampf safe musik Spielen
				_selecter = floor(random count _safeTracks);
				playMusic (_safeTracks select _selecter); 
				duration = (_safeDurations select _selecter);
				currentTrack = (_safeTracks select _selecter);
				
				if(debugging == 1) then
				{
					hint format["Changed music to NormalMusic Trackname: %1", (_safeTracks select _selecter)];
				};
			};
			
			isMusicCurrentlyPlaying = 1;
			durationSinceTrackWasStarted = 0;
		};
		
		//Einstieg ins Fahrzeug ohne Kampf
		if(vehicle player != player && wasInCarBefore == 0) then
		{	
			VehicleIamIn = vehicle player;
			//wechsel ins Fahrzeug
			
			if(debugging == 1) then
			{
				hint "adding event handler for vehicle";
			};
			_eventForShotFiredNear = VehicleIamIn addEventHandler ["FiredNear", {_this execVM "sounds\musicHandler_Vietnam\shotFiredNear.sqf"}];
			_eventForTakingDamage = VehicleIamIn addEventHandler ["Dammaged", {_this execVM "sounds\musicHandler_Vietnam\damageTaken.sqf"}];
			_eventForExplosionsNearby = VehicleIamIn addEventHandler ["Explosion", {_this execVM "sounds\musicHandler_Vietnam\explosionNear.sqf"}];
			_eventForMissileIncoming = VehicleIamIn addEventHandler ["IncomingMissile", {_this execVM "sounds\musicHandler_Vietnam\missileIncoming.sqf"}];
			 
			 _getOut = VehicleIamIn addEventHandler["GetOut",{
				if(debugging == 1) then
				{
					hint "removing event handler for vehicle";
				};
				_eventForShotFiredNear = (_this select 0) removeEventHandler ["FiredNear", {_this execVM "sounds\musicHandler_Vietnam\shotFiredNear.sqf"}];
				_eventForTakingDamage = (_this select 0) removeEventHandler ["Dammaged", {_this execVM "sounds\musicHandler_Vietnam\damageTaken.sqf"}];
				_eventForExplosionsNearby = (_this select 0) removeEventHandler ["Explosion", {_this execVM "sounds\musicHandler_Vietnam\explosionNear.sqf"}];
				_eventForMissileIncoming = (_this select 0) removeEventHandler ["IncomingMissile", {_this execVM "sounds\musicHandler_Vietnam\missileIncoming.sqf"}];
			 }];
			
			wasInCarBefore = 1;
		};
		if(vehicle player == player && wasInCarBefore == 1) then
		{
			//wechsel aus Fahrzeug raus
			wasInCarBefore = 0;
		};
	};
};





















