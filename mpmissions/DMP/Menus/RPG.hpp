class dmpDialogRPG{
	idd=10000;
	name="dmpDialogRPG";
	movingEnable=false;
	enableSimulation=true;
	onLoad="";
	class controls
	{
		class dmp_Frame: dce_RscText {
			//colorBackground[]={0, 0, 0, 0.7};
			colorBackground[]={0.2,0.2,0.2,.7};
			idc=-1;
			x=dce_COL+(dce_COLINC*0);
			y=dce_ROW+(dce_ROWINC*0);
			w=dce_BUTTON_W+(dce_COLINC*8);
			h=dce_BUTTON_H+(dce_ROWINC*0);
		};
		
		class dmp_ListActionsRPG : dce_RscListBox 
		{
			idc=10000;
			text="";
			tooltip="Actions";
			onLBSelChanged="FALSE execVM'DMP\Scripts\RPG\Dialog\Select.sqf'";
			onLBDblClick="TRUE execVM'DMP\Scripts\RPG\Dialog\Select.sqf'";
			x=dce_COL+(dce_COLINC*0);
			y=dce_ROW+(dce_ROWINC*1);
			w=dce_BUTTON_W+(dce_COLINC*2);
			h=dce_BUTTON_H+(dce_ROWINC*8);
			colorBackground[]={0.2,0.2,0.2,.7};
		};
		
		class dmp_ListSkills : dce_RscListBox 
		{
			idc=10001;
			text="";
			tooltip="Your skills";
			onLBSelChanged="FALSE execVM'DMP\Scripts\RPG\Dialog\SelectSkill.sqf'";
			onLBDblClick="TRUE execVM'DMP\Scripts\RPG\Dialog\SelectSkill.sqf'";
			x=dce_COL+(dce_COLINC*3);
			y=dce_ROW+(dce_ROWINC*1);
			w=dce_BUTTON_W+(dce_COLINC*2);
			h=dce_BUTTON_H+(dce_ROWINC*8);
			colorBackground[]={0.2,0.2,0.2,.7};
		};
		
		class dmp_ListSkillsA : dce_RscListBox 
		{
			idc=10002;
			text="";
			tooltip="Skills you don't have";
			onLBSelChanged="FALSE execVM'DMP\Scripts\RPG\Dialog\SelectSkillA.sqf'";
			onLBDblClick="TRUE execVM'DMP\Scripts\RPG\Dialog\SelectSkillA.sqf'";
			x=dce_COL+(dce_COLINC*6);
			y=dce_ROW+(dce_ROWINC*1);
			w=dce_BUTTON_W+(dce_COLINC*2);
			h=dce_BUTTON_H+(dce_ROWINC*8);
			colorBackground[]={0.2,0.2,0.2,.7};
		};
		
		class dmp_TextXP : dce_StructuredText
		{
			idc=10003;
			text="";
			x=dce_COL+(dce_COLINC*3);
			y=dce_ROW+(dce_ROWINC*0);
			w=dce_BUTTON_W+(dce_COLINC*2);
			h=dce_BUTTON_H;
		};
		
		class dmp_TextCash : dce_StructuredText
		{
			idc=10004;
			text="";
			x=dce_COL+(dce_COLINC*0);
			y=dce_ROW+(dce_ROWINC*0);
			w=dce_BUTTON_W+(dce_COLINC*2);
			h=dce_BUTTON_H;
		};
		
		class dmp_ButtonSave : dce_RscButtonMenu
		{
			idc=-1;
			text="SAVE";
			tooltip="";
			onButtonClick="'SAVE' execVM 'DMP\Scripts\RPG\Player\SaveLoad.sqf'";
			x=dce_COL+(dce_COLINC*0);
			y=dce_ROW+(dce_ROWINC*10);
			w=dce_BUTTON_W;
			h=dce_BUTTON_H;
		};
		
		class dmp_ButtonLoad : dce_RscButtonMenu
		{
			idc=10010;
			text="LOAD";
			tooltip="";
			onButtonClick="'LOAD' execVM 'DMP\Scripts\RPG\Player\SaveLoad.sqf'";
			x=dce_COL+(dce_COLINC*1);
			y=dce_ROW+(dce_ROWINC*10);
			w=dce_BUTTON_W;
			h=dce_BUTTON_H;
		};
		
		class dmp_ButtonMute : dce_RscButtonMenu
		{
			idc=-1;
			text="MUTE COLORS";
			tooltip="";
			onButtonClick="execVM'DMP\Scripts\RPG\Misc\Mute.sqf'";
			x=dce_COL+(dce_COLINC*3);
			y=dce_ROW+(dce_ROWINC*10);
			w=dce_BUTTON_W;
			h=dce_BUTTON_H;
		};
		
		class dmp_ButtonHint : dce_RscButtonMenu
		{
			idc=-1;
			text="TOGGLE HINTS";
			tooltip="";
			onButtonClick="execVM'DMP\Scripts\RPG\Misc\Hint.sqf'";
			x=dce_COL+(dce_COLINC*5);
			y=dce_ROW+(dce_ROWINC*10);
			w=dce_BUTTON_W;
			h=dce_BUTTON_H;
		};
		
		class dmp_ButtonEnd : dce_RscButtonMenu
		{
			idc=10011;
			text="END";
			tooltip="";
			onButtonClick="execVM'DMP\Scripts\RPGIC\EndMissionLocal.sqf'";
			x=dce_COL+(dce_COLINC*8);
			y=dce_ROW+(dce_ROWINC*10);
			w=dce_BUTTON_W;
			h=dce_BUTTON_H;
		};
		
		class dmp_ButtonDelete : dce_RscButtonMenu
		{
			idc=10012;
			text="Delete Character";
			tooltip="";
			onButtonClick="execVM'DMP\Scripts\RPG\Player\DeleteCharacter.sqf'";
			x=dce_COL+(dce_COLINC*4);
			y=dce_ROW+(dce_ROWINC*11);
			w=dce_BUTTON_W;
			h=dce_BUTTON_H;
		};
		
/*		class dmp_ActiveTextXP : dce_ActiveText
		{
			idc=10003;
			text="";
			action="drpgPlayerDialogMode='Missions';execVM'DRPG\Scripts\Dialog\Player.sqf'";
			x=dce_COL+(dce_COLINC*1);
			y=dce_ROW+(dce_ROWINC*7);
			w=dce_BUTTON_W+(dce_COLINC*1);
			h=dce_BUTTON_H;
		};*/
	};
};