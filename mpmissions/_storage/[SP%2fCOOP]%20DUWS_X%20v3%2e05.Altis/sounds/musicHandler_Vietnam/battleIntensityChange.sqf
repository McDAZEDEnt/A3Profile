//Arma 3 Music Script
//Made by Niklas Brettschneider

//Hier wird die Änderung der Battleintensity überwacht

_changer = _this select 0; // um zu wissen wieviel sich die battleIntensity ändert
_how = _this select 1;

if(battleIntensity <= maxBattleIntensity) then
{
	//wenn der Changer positiv ist
	if(_changer >= 0) then
	{
		//schauen das der Wert nicht zu groß wird.
		if(battleIntensity + _changer <= maxBattleIntensity) then
		{
			battleIntensity = battleIntensity + _changer;
		};
	
		if(battleIntensity + _changer > maxBattleIntensity) then
		{
			battleIntensity = maxBattleIntensity;
		};
	}
	else //wenn der Changer negativ ist.
	{
		//schauen das der Wert nicht zu klein wird
		if(battleIntensity + _changer >= 0) then
		{
			battleIntensity = battleIntensity + _changer;
		};
		
		if(battleIntensity + _changer < 0) then
		{
			battleIntensity = 0;
		};
	};
}
else
{
	battleIntensity = maxBattleIntensity;
};