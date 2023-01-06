//Arma 3 Music Script
//Made by Niklas Brettschneider
isMusicActive = 1;
duration = 0;

debugging = 0;

durationSinceTrackWasStarted = 0;
wasInCarBefore = 0;
currentMusicState = "save";
isMusicCurrentlyPlaying = 0;

VehicleIamIn = -1;
//Läuft gerade etwas?
currentTrack = "";

//Wie intensiv ist der Kampf gerade?
battleIntensity = 0;
//Max Wert, damit hier nichts aus dem Ruder läuft
maxBattleIntensity = 60;

//um wie viel soll es jede Sekunde Sinken?
battleIntensityLowerer = -0.10;

//Ist es Tag? (nachts andere Tracks)
isDay = 1; 

//Lautstärke
Volume = 0.5;

ExecVm "sounds\musicHandler_WW2\addEventHandlerForMusic.sqf";

if(debugging == 1) then
{
	cutRsc ["DebugWindow","PLAIN"];
};

//Jede Sekunde
while{true} do
{//Main Loop
	if(isMusicActive == 1) then
	{
		//Check if day or night
		if(daytime > 19 || daytime < 6) then
		{
			isDay = 0;
			volume = 0.2;
		}
		else
		{
			isDay = 1;
			volume = 0.5;
		};
		
		//standart lower Battle intensity
		[battleIntensityLowerer] ExecVm "sounds\musicHandler_WW2\battleIntensityChange.sqf";
		
		//Debug Display Battle Intensity
		if(debugging == 1) then
		{
			((uiNamespace getVariable "TAG_DebugWindow") displayCtrl -1) ctrlSetText format["BI: %1 Track: %2", battleIntensity, currentTrack];
		};
		
		execVM "sounds\musicHandler_WW2\musicPlayer2.sqf";
		
	};
	sleep(0.2);
};