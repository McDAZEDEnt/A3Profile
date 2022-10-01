class dmp_DialogTerminal{
	idd = 7000;
	name= "dmp_dialogTerminal";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";
	class controls
	{
		class dmp_Frame: dce_RscText {
			colorBackground[]={0.2,0.2,0.2,.7};
			idc=-1;
			x=dce_COL+(dce_COLINC*0);
			y=dce_ROW+(dce_ROWINC*0);
			w=dce_BUTTON_W+(dce_COLINC*7);
			h=dce_BUTTON_H+(dce_ROWINC*0);
		};
		
		class dmp_TextTerminalName : dce_RscText
		{
			idc = 7001;
			text = "";
			x = dce_COL;
			y = dce_ROW+(dce_ROWINC*0);
			w = dce_BUTTON_W+(dce_COLINC*4);
			h = dce_BUTTON_H;
		};
		
		class dmp_ActiveTextTerminal : dce_ActiveText
		{
			idc=7002;
			text="";
			action="execVM'DMP\Scripts\Terminals\Mode.sqf'";
			x = dce_COL+(dce_COLINC*7);
			y = dce_ROW+(dce_ROWINC*0);
			w=dce_BUTTON_W*2;
			h=dce_BUTTON_H;
		};

		class dmp_List1 : dce_RscListBox 
		{
			idc = 7010;
			text = "";
			onLBSelChanged = "false execVM 'DMP\Scripts\Terminals\Select.sqf'";
			x = dce_COL+(dce_COLINC*0);
			y = dce_ROW+(dce_ROWINC*1);
			w = dce_BUTTON_W+(dce_COLINC*4);
			h = dce_BUTTON_H+(dce_ROWINC*6);
		};
		
		class dmp_List2 : dce_RscListBox 
		{
			idc = 7011;
			text = "";
			onLBSelChanged = "execVM'DMP\Scripts\Terminals\Select2.sqf'";
			x = dce_COL+(dce_COLINC*5);
			y = dce_ROW+(dce_ROWINC*1);
			w = dce_BUTTON_W+(dce_COLINC*2);
			h = dce_BUTTON_H+(dce_ROWINC*6);
		};
		
		class dmp_Frame2: dce_RscText {
			colorBackground[]={0.2,0.2,0.2,.7};
			idc=7020;
			x=dce_COL+(dce_COLINC*0);
			y=dce_ROW+(dce_ROWINC*1);
			w=dce_BUTTON_W+(dce_COLINC*7);
			h=dce_BUTTON_H+(dce_ROWINC*6);
			text="";
		};
		
		class dmp_PasswordInput : dce_RscEdit
		{
			idc = 7021;
			text = "";
			x = dce_COL+(dce_COLINC*2);
			y = dce_ROW+(dce_ROWINC*3);
			w = dce_BUTTON_W+(dce_COLINC*3);
			h = dce_BUTTON_H;
		};
		
		class dmp_ButtonOK : dce_RscButtonMenu
		{
			idc=7022;
			text="OK";
			onButtonClick="execVM'DMP\Scripts\Terminals\EnterPassword.sqf'";
			x=dce_COL+(dce_COLINC*3.5);
			y=dce_ROW+(dce_ROWINC*4);
			w=dce_BUTTON_W;
			h=dce_BUTTON_H;
		};
	};
};