private["_enemy","_breakpoint"];
// Wait for side to spawn in
if(dmpDFCdebug)then{hintSilent"Breakpoint started"};
sleep 120;
_enemy=[];
{
if((side _x)==dmpDFCenemySide)then{
	if(_x isKindOf"Man")then{_enemy pushBackUnique _x};
};
}forEach allUnits;

if(dmpDFCbreakpoint>100)then{dmpDFCbreakpoint=100};
if(dmpDFCbreakpoint<0)then{dmpDFCbreakpoint=0};
_modifier=(100-dmpDFCbreakpoint)/100;
_breakpoint=(count _enemy)*_modifier;
if(dmpDFCbattleType=="DEFENCE")then{
	if(dmpDFCdefendBreakpoint>100)then{dmpDFCdefendBreakpoint=100};
	if(dmpDFCdefendBreakpoint<0)then{dmpDFCdefendBreakpoint=0};
	_modifier=(100-dmpDFCdefendBreakpoint)/100;
	_breakpoint=(count _enemy)*_modifier;
};
//_breakpoint=(count _enemy)*(dmpDFCbreakpoint/100);
//if(dmpDFCbattleType=="DEFENCE")then{_breakpoint=(count _enemy)*(dmpDFCdefendBreakpoint/100)};
dmpDFCenemyBroken=FALSE;

if(dmpDFCdebug)then{hintSilent format["Breakpoint: %1\n\nEnemy:%2",_breakpoint,(count _enemy)]};

while{TRUE}do{
	{if!(alive _x)then{_enemy=_enemy-[_x]}}forEach _enemy;
	if((count _enemy)<_breakpoint)exitWith{dmpDFCenemyBroken=TRUE;publicVariable"dmpDFCenemyBroken"};
	sleep 5;
};

if(dmpDFCdebug)then{hintSilent"Enemy broken"};

// Fight to the bitter end
if((random 100)<25)exitWith{};

// Everyone flee
if((random 100)>50)exitWith{
	{_x allowFleeing 1;_x enableAI"move";_x forceSpeed 1;_x setSkill["courage",0]}forEach _enemy;
};

// Scattered fleeing
{
// Allow them to leave buildings
_x enableAI"move";_x forceSpeed 1;
if((random 100)<50)then{
	_x allowFleeing 1;_x setSkill["courage",0];
};
}forEach _enemy;