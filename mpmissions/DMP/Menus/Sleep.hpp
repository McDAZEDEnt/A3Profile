class dmpDialogSleep{
	idd=11000;
	name= "dmpDialogSleep";
	movingEnable=false;
	enableSimulation=true;
	onLoad="";
	class controls
	{
		class dmpRPGSleepBackground : dce_BackGround
		{
			x=dce_COL+(dce_COLINC*2);
			y=dce_ROW+(dce_ROWINC*0);
			w=(dce_BUTTON_W*4);
			h=dce_BUTTON_H+(dce_ROWINC*6);
		};
		class dmpRPGEditSleepHours : dce_RscEdit
		{
			idc=11000;
			x=dce_COL+(dce_COLINC*3.5);
			y=dce_ROW+(dce_ROWINC*1);
			w=(dce_BUTTON_W/2);
			h=dce_BUTTON_H;
			text="1";
		};
		class dmpRPG_TextSleepHours : dce_RscText
		{
			idc=-1;
			text="hours";
			x=dce_COL+(dce_COLINC*4);
			y=dce_ROW+(dce_ROWINC*1);
			w=dce_BUTTON_W+(dce_COLINC*2);
			h=dce_BUTTON_H;
		};
		class dmp_TextSleepInside : dce_RscText
		{
			idc=11001;
			text="Not inside";
			x=dce_COL+(dce_COLINC*2);
			y=dce_ROW+(dce_ROWINC*3);
			w=dce_BUTTON_W+(dce_COLINC*2);
			h=dce_BUTTON_H;
		};
		class dmp_TextSleepTent : dce_RscText
		{
			idc=11002;
			text="No tent";
			x=dce_COL+(dce_COLINC*2);
			y=dce_ROW+(dce_ROWINC*4);
			w=dce_BUTTON_W+(dce_COLINC*2);
			h=dce_BUTTON_H;
		};
		class dmp_TextSleepBed : dce_RscText
		{
			idc=11003;
			text="No bed/sleeping bag";
			x=dce_COL+(dce_COLINC*2);
			y=dce_ROW+(dce_ROWINC*5);
			w=dce_BUTTON_W+(dce_COLINC*2);
			h=dce_BUTTON_H;
		};
		class dmpButtonSleep : dce_RscButtonMenu
		{
			idc=-1;
			text="Sleep";
			onButtonClick="execVM'DMP\Scripts\RPG\Player\Sleep.sqf'";
			x=dce_COL+(dce_COLINC*3);
			y=dce_ROW+(dce_ROWINC*2);
			w=dce_BUTTON_W +(dce_COLINC*1);
			h=dce_BUTTON_H;
		};
	};
};