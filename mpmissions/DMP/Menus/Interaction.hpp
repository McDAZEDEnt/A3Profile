class dmp_DialogInteraction{
	idd = 7000;
	name= "dmp_dialogInteraction";
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
		
		class dmp_TextSpeakerName : dce_RscText
		{
			idc = 7000;
			text = "";
			x = dce_COL;
			y = dce_ROW+(dce_ROWINC*0);
			w = dce_BUTTON_W+(dce_COLINC*4);
			h = dce_BUTTON_H;
		};

		class dmp_sTextSpeaker :dce_StructuredText
		{
			idc = 7001;
			colorBackground[]={0.2,0.2,0.2,.7};
			text = "";
			x = dce_COL+(dce_COLINC*0);
			y = dce_ROW+(dce_ROWINC*1);
			w = dce_BUTTON_W+(dce_COLINC*7);
			h = dce_BUTTON_H+(dce_ROWINC*4);
		};
		
		class dmp_List1 : dce_RscListBox 
		{
			idc = 7010;
			text = "";
			onLBSelChanged = "false execVM 'DMP\Scripts\Interaction\Select.sqf'";
			x = dce_COL+(dce_COLINC*0);
			y = dce_ROW+(dce_ROWINC*6);
			w = dce_BUTTON_W+(dce_COLINC*7);
			h = dce_BUTTON_H+(dce_ROWINC*6);
		};
/*		
		class dce_ActiveTextReply1 : dce_ActiveText
		{
			idc = 7010;
			text = "";
			action = "1 execVM'Interaction\Reply.sqf'";
			x = dce_COL+(dce_COLINC*0.5);
			y = dce_ROW+(dce_ROWINC*8);
			w = dce_BUTTON_W+(dce_COLINC*6);
			h = dce_BUTTON_H;
		};

		class dce_ActiveTextReply2 : dce_ActiveText
		{
			idc = 7011;
			text = "";
			action = "2 execVM'Interaction\Reply.sqf'";
			x = dce_COL+(dce_COLINC*0.5);
			y = dce_ROW+(dce_ROWINC*9);
			w = dce_BUTTON_W+(dce_COLINC*6);
			h = dce_BUTTON_H;
		};

		class dce_ActiveTextReply3 : dce_ActiveText
		{
			idc = 7012;
			text = "";
			action = "3 execVM'Interaction\Reply.sqf'";
			x = dce_COL+(dce_COLINC*0.5);
			y = dce_ROW+(dce_ROWINC*10);
			w = dce_BUTTON_W+(dce_COLINC*6);
			h = dce_BUTTON_H;
		};
		class dce_ActiveTextReply4 : dce_ActiveText
		{
			idc = 7013;
			text = "";
			action = "4 execVM'Interaction\Reply.sqf'";
			x = dce_COL+(dce_COLINC*0.5);
			y = dce_ROW+(dce_ROWINC*11);
			w = dce_BUTTON_W+(dce_COLINC*6);
			h = dce_BUTTON_H;
		};
		class dce_ActiveTextReply5 : dce_ActiveText
		{
			idc = 7014;
			text = "";
			action = "5 execVM'Interaction\Reply.sqf'";
			x = dce_COL+(dce_COLINC*0.5);
			y = dce_ROW+(dce_ROWINC*12);
			w = dce_BUTTON_W+(dce_COLINC*6);
			h = dce_BUTTON_H;
		};
*/
	};
};