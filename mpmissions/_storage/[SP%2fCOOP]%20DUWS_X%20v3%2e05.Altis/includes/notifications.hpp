class CfgNotifications
{
    class Default
    {
        title = ""; // Tile displayed as text on black background. Filled by arguments.
        iconPicture = ""; // Small icon displayed in left part. Colored by "color", filled by arguments.
        iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
        description = ""; // Brief description displayed as structured text. Colored by "color", filled by arguments.
        color[] = {1,1,1,1}; // Icon and text color
        duration = 5; // How many seconds will the notification be displayed
        priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
        difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
    };

    // Examples

    class ScoreAdded
    {
        title = "$STR_DUWS_X_668shcf1";
        iconText = "+%2";
        description = "%1";
        color[] = {0.5,1,1,1};
        priority = 0;
        difficulty[] = {"netStats"};
    };

    class Location_enter
    {
        title = "$STR_DUWS_X_zjxh0fh4"; // Tile displayed as text on black background. Filled by arguments.
        iconPicture = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
        iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
        description = "$STR_DUWS_X_l843uwpu"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
        color[] = {1,1,1,1}; // Icon and text color
        duration = 5; // How many seconds will the notification be displayed
        priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
        difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
    };

    class Location_leave
    {
        title = "$STR_DUWS_X_zjxh0fh4"; // Tile displayed as text on black background. Filled by arguments.
        iconPicture = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
        iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
        description = "$STR_DUWS_X_aibgwt2g"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
        color[] = {1,1,1,1}; // Icon and text color
        duration = 5; // How many seconds will the notification be displayed
        priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
        difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
    };

    class US_takencontrol
    {
        title = "$STR_DUWS_X_drq88qxs"; // Tile displayed as text on black background. Filled by arguments.
        iconPicture = "\A3\ui_f\data\map\markers\military\flag_CA.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
        iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
        description = "$STR_DUWS_X_4qpf7a88"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
        color[] = {0,1,0,1}; // Icon and text color
        duration = 5; // How many seconds will the notification be displayed
        priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
        difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
    };

    class US_lostcontrol
    {
        title = "$STR_DUWS_X_q0seuzgl"; // Tile displayed as text on black background. Filled by arguments.
        iconPicture = "\A3\ui_f\data\map\markers\military\warning_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
        iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
        description = "$STR_DUWS_X_ztgsrx05"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
        color[] = {1,0,0,1}; // Icon and text color
        duration = 5; // How many seconds will the notification be displayed
        priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
        difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
    };

    class task_echec
    {
        title = "$STR_DUWS_X_1efzglbh"; // Tile displayed as text on black background. Filled by arguments.
        iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
        iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
        description = "%1"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
        color[] = {1,0.3,0.2,1};
        duration = 5; // How many seconds will the notification be displayed
        priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
        difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
    };

    class CPadded
    {
        title = "$STR_DUWS_X_k1glh3eb";
        iconText = "+%1";
        description = "$STR_DUWS_X_2x9bb19m";
        color[] = {0.5,1,1,1};
        priority = 0;
        difficulty[] = {};
    };

    class CPadded_retaken
    {
        title = "$STR_DUWS_X_arxufadx";
        iconText = "+%1";
        description = "$STR_DUWS_X_ey0lpqcb";
        color[] = {0.5,1,1,1};
        priority = 0;
        difficulty[] = {};
    };

    class CPaddedmission
    {
        title = "$STR_DUWS_X_elszwwpc";
        iconText = "+%1";
        description = "$STR_DUWS_X_zcxhmft5";
        color[] = {0.5,1,1,1};
        priority = 0;
        difficulty[] = {};
    };

    class CPzonehold
    {
        title = "$STR_DUWS_X_xcp0muo6";
        iconText = "+%1";
        description = "$STR_DUWS_X_08rz2z3k";
        color[] = {0.5,1,1,1};
        priority = 0;
        difficulty[] = {};
    };

    class info
    {
        title = "%1"; // Tile displayed as text on black background. Filled by arguments.
        iconPicture = "\A3\ui_f\data\map\markers\military\warning_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
        iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
        description = "%2 %3"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
        color[] = {0,0.7,1,1}; // Icon and text color
        duration = 8; // How many seconds will the notification be displayed
        priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
        difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
    };

    class info2
    {
        title = "$STR_DUWS_X_gwn85uxh"; // Tile displayed as text on black background. Filled by arguments.
        iconPicture = "\A3\ui_f\data\map\markers\military\warning_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
        iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
        description = "%1 %2"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
        color[] = {0,0.7,1,1}; // Icon and text color
        duration = 8; // How many seconds will the notification be displayed
        priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
        difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
    };

    class artyicon
    {
        title = "%1"; // Tile displayed as text on black background. Filled by arguments.
        iconPicture = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\artillery_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
        iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
        description = "%2"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
        color[] = {1,1,1,1}; // Icon and text color
        duration = 8; // How many seconds will the notification be displayed
        priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
        difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
    };

    class sitrepinfo
    {
        title = "%1"; // Tile displayed as text on black background. Filled by arguments.
        iconPicture = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
        iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
        description = "%2"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
        color[] = {1,1,1,1}; // Icon and text color
        duration = 8; // How many seconds will the notification be displayed
        priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
        difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
    };

    class armory
    {
        title = "%1"; // Tile displayed as text on black background. Filled by arguments.
        iconPicture = "\a3\ui_f\data\gui\cfg\hints\Sniper_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
        iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
        description = "%2"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
        color[] = {1,1,1,1}; // Icon and text color
        duration = 8; // How many seconds will the notification be displayed
        priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
        difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
    };

    class halo
    {
        title = "%1"; // Tile displayed as text on black background. Filled by arguments.
        iconPicture = "\A3\ui_f\data\Map\VehicleIcons\iconParachute_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
        iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
        description = "%2"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
        color[] = {1,1,1,1}; // Icon and text color
        duration = 8; // How many seconds will the notification be displayed
        priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
        difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
    };

    class pflir
    {
        title = "%1"; // Tile displayed as text on black background. Filled by arguments.
        iconPicture = "\a3\ui_f\data\gui\cfg\hints\Thermal_imaging_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
        iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
        description = "%2"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
        color[] = {1,1,1,1}; // Icon and text color
        duration = 8; // How many seconds will the notification be displayed
        priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
        difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
    };

    class veh_refit_hint
    {
        title = "%1"; // Tile displayed as text on black background. Filled by arguments.
        iconPicture = "\A3\ui_f\data\Map\MapControl\fuelstation_CA.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
        iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
        description = "%2"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
        color[] = {1,1,1,1}; // Icon and text color
        duration = 8; // How many seconds will the notification be displayed
        priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
        difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
    };

    class new_ability
    {
        title = "%1"; // Tile displayed as text on black background. Filled by arguments.
        iconPicture = "\a3\ui_f\data\gui\cfg\hints\Commanding_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
        iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
        description = "%2"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
        color[] = {0.67,0.87,0,1}; // Icon and text color
        duration = 8; // How many seconds will the notification be displayed
        priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
        difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
    };

    class inf_training
    {
        title = "%1"; // Tile displayed as text on black background. Filled by arguments.
        iconPicture = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
        iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
        description = "%2"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
        color[] = {1,1,1,1}; // Icon and text color
        duration = 8; // How many seconds will the notification be displayed
        priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
        difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
    };	

    class operator_healed
    {
        title = "$STR_DUWS_X_55g6poab"; // Tile displayed as text on black background. Filled by arguments.
        iconPicture = "\a3\ui_f\data\gui\cfg\hints\BasicStances_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
        iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
        description = "$STR_DUWS_X_ze9vuqvj"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
        color[] = {0.39,0.82,0.96,1}; // Icon and text color
        duration = 8; // How many seconds will the notification be displayed
        priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
        difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
    };	
};