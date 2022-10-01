class dmpDialogSkipTime{
	idd=11000;
	name= "dmpDialogSkipTime";
	movingEnable=false;
	enableSimulation=true;
	onLoad="";
	class controls
	{
		class dmpSkipTimeBackground : dce_BackGround
		{
			x=dce_COL+(dce_COLINC*2);
			y=dce_ROW+(dce_ROWINC*0);
			w=(dce_BUTTON_W*4);
			h=dce_BUTTON_H+(dce_ROWINC*3);
		};
		class dmpEditSkipTimeHours : dce_RscEdit
		{
			idc=11000;
			x=dce_COL+(dce_COLINC*3.5);
			y=dce_ROW+(dce_ROWINC*1);
			w=(dce_BUTTON_W/2);
			h=dce_BUTTON_H;
			text="1";
		};
		class dmp_TextSkipTimeHours : dce_RscText
		{
			idc=-1;
			text="hours";
			x=dce_COL+(dce_COLINC*4);
			y=dce_ROW+(dce_ROWINC*1);
			w=dce_BUTTON_W+(dce_COLINC*2);
			h=dce_BUTTON_H;
		};
		class dmpButtonSkipTime : dce_RscButtonMenu
		{
			idc=-1;
			text="Skip Time";
			onButtonClick="execVM'DMP\Scripts\Skiptime\SkipTime.sqf'";
			x=dce_COL+(dce_COLINC*3);
			y=dce_ROW+(dce_ROWINC*2);
			w=dce_BUTTON_W +(dce_COLINC*1);
			h=dce_BUTTON_H;
		};
	};
};