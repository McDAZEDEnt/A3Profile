class dmp_AdminDialog {
	idd = 900;
	name = "dmp_Admin";
	movingEnable = 0;
	enableSimulation = 1;
	onLoad = "";
	//class Objects{class dmp_tabletAttach : dce_tablet{};};
	
	class controls
	{
		
		class dmp_FrameAdmin: dce_RscText {
			//colorBackground[]={0, 0, 0, 0.7};
			colorBackground[]={0.2,0.2,0.2,.7};
			idc=-1;
			x=dce_COL+(dce_COLINC*0);
			y=dce_ROW+(dce_ROWINC*0);
			w=dce_BUTTON_W+(dce_COLINC*7);
			h=dce_BUTTON_H+(dce_ROWINC*10);
		};

		class dmp_West : dce_ActiveText
		{
			action="WEST execVM""DMP\Scripts\Admin\Side.sqf""";
			text="West";
			x = dce_COL + (dce_COLINC * 0);
			y = dce_ROW;
			w = dce_BUTTON_W;
			h = dce_BUTTON_H;
		};
		class dmp_East : dmp_West
		{
			action="EAST execVM""DMP\Scripts\Admin\Side.sqf""";
			text="East";
			x = dce_COL + (dce_COLINC * 1);
		};
		class dmp_Res : dmp_West
		{
			action="RESISTANCE execVM""DMP\Scripts\Admin\Side.sqf""";
			text="Res";
			x = dce_COL + (dce_COLINC * 2);
		};
		class dmp_Civ : dmp_West
		{
			action="CIVILIAN execVM""DMP\Scripts\Admin\Side.sqf""";
			text="Civ";
			x = dce_COL + (dce_COLINC * 3);
		};
		class dmp_Enemy : dmp_West
		{
			action="ENEMY execVM""DMP\Scripts\Admin\Side.sqf""";
			text="Enemy";
			x = dce_COL + (dce_COLINC * 4);
		};

		class dmp_ListGroups : dce_RscListBox 
		{
			idc = 901;
			text = "";
			onLBSelChanged = "execVM 'DMP\Scripts\Admin\SelectGroup.sqf'";
			x = dce_COL;
			y = dce_ROW + (dce_ROWINC * 1);
			w = dce_BUTTON_W + (dce_COLINC * 2);
			h = dce_BUTTON_H + (dce_ROWINC * 6);
		};
/*
		class dmp_ListMembers : dce_RscListBox 
		{
			idc = 902;
			text = "";
			onLBSelChanged = "execVM 'DMP\Scripts\Admin\SelectMember.sqf'";
			x = dce_COL + (dce_COLINC * 1);
			y = dce_ROW + (dce_ROWINC * 6);
			w = dce_BUTTON_W + (dce_COLINC * 2);
			h = dce_BUTTON_H + (dce_ROWINC * 4);
		};
*/	
		class dmp_ListActions : dce_RscListBox 
		{
			idc = 903;
			text = "";
			onLBSelChanged = "execVM 'DMP\Scripts\Admin\SelectActionHelp.sqf'";
			onLBDblClick = "execVM 'DMP\Scripts\Admin\SelectAction.sqf'";
			x = dce_COL + (dce_COLINC * 3);
			y = dce_ROW + (dce_ROWINC * 1);
			w = dce_BUTTON_W + (dce_COLINC * 2);
			h = dce_BUTTON_H + (dce_ROWINC * 6);
		};

		class dmp_EditCode : dce_RscEdit
		{
			idc = 904;
			tooltip="Code to execute";
			x = dce_COL + (dce_COLINC * 0);
			y = dce_ROW + (dce_ROWINC * 9);
			w = (dce_BUTTON_W * 6);
			h = dce_BUTTON_H;
			text = "";
		};

		class dmp_ExecuteCode : dce_RscButtonMenu
		{
			idc = 905;
			text = "Execute";
			tooltip="Execute code";
			onButtonClick = "execVM 'DMP\Scripts\Admin\Code.sqf'";
			x = dce_COL + (dce_COLINC * 7);
			y = dce_ROW + (dce_ROWINC * 9);
			w = dce_BUTTON_W;
			h = dce_BUTTON_H;
		};

		//class dce_BUTTONExitTabletAttach : dce_ButtonExitTablet{};
	};
};