
//  AMMO TYPES:  Arty (Sh_155mm_AMOS) / Laser (Bo_Mk82) / Mortar(Sh_82mm_AMOS) / JDAM (Bo_Mk82) / Cluster(R_60mm_HE)
//  SUPPORT TYPE: 1 = arty, 2 = mortar, 3 = jdam, 4 = laser, 5 = cluster, 6 = napalm

class CfgCommunicationMenu
{
    class artillery
    {
        text = "$STR_DUWS_X_q3roy1kl"; // Text displayed in the menu and in a notification
        submenu = ""; // Submenu opened upon activation
		//_null = [salvos, radius, interval between salvos(in seconds), rounds per salvo, support type, CP cost, ammotype]
        expression = "[6, 100, 8, 3, 1, 4, 'Sh_155mm_AMOS'] spawn fnc_mapclickarty"; // Code executed upon activation (ignored when the submenu is not empty)   Sh_155mm_AMOS
        icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\artillery_ca.paa"; // Icon displayed permanently next to the command menu
        cursor = "\a3\Ui_f\data\IGUI\Cfg\Cursors\iconCursorSupport_ca.paa"; // Custom cursor displayed when the item is selected
        enable = "1"; // Simple expression condition for enabling the item
        removeAfterExpressionCall = 1; // 1 to remove the item after calling
    };
    class mortar
    {
        text = "$STR_DUWS_X_d0x7zj1h"; // Text displayed in the menu and in a notification
        submenu = ""; // Submenu opened upon activation
		//_null = [salvos, radius, interval between salvos(in seconds), rounds per salvo, support type, CP cost, ammotype]
        expression = "[8, 50, 5, 3, 2, 2, 'Sh_82mm_AMOS'] spawn fnc_mapclickarty"; // Code executed upon activation (ignored when the submenu is not empty)
        icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\mortar_ca.paa";
        cursor = "\a3\Ui_f\data\IGUI\Cfg\Cursors\iconCursorSupport_ca.paa"; // Custom cursor displayed when the item is selected
        enable = "1"; // Simple expression condition for enabling the item
        removeAfterExpressionCall = 1; // 1 to remove the item after calling
    };
    class jdam
    {
        text = "$STR_DUWS_X_wcohwh4p"; // Text displayed in the menu and in a notification
        submenu = ""; // Submenu opened upon activation
		//_null = [salvos, radius, interval between salvos(in seconds), rounds per salvo, support type, CP cost, ammotype]
        expression = "[1, 2, 1, 1, 3, 5, 'Bo_Mk82'] spawn fnc_mapclickarty"; // Code executed upon activation (ignored when the submenu is not empty)
        icon = "\a3\ui_f\data\gui\cfg\CommunicationMenu\cas_ca.paa";
        cursor = "\a3\Ui_f\data\IGUI\Cfg\Cursors\iconCursorSupport_ca.paa"; // Custom cursor displayed when the item is selected
        enable = "1"; // Simple expression condition for enabling the item
        removeAfterExpressionCall = 1; // 1 to remove the item after calling
    };
    class laser
    {
        text = "$STR_DUWS_X_ifnnl0j7"; // Text displayed in the menu and in a notification
        submenu = ""; // Submenu opened upon activation
		//_null = [salvos, radius, interval between salvos(in seconds), rounds per salvo, support type, CP cost, ammotype]
        expression = "[1, 50, 1, 1, 4, 5, 'Laser'] spawn fnc_mapclickarty"; // Code executed upon activation (ignored when the submenu is not empty)
        icon = "\a3\ui_f\data\gui\cfg\hints\Head_ca.paa";
        cursor = "\a3\Ui_f\data\IGUI\Cfg\Cursors\iconCursorSupport_ca.paa"; // Custom cursor displayed when the item is selected
        enable = "1"; // Simple expression condition for enabling the item
        removeAfterExpressionCall = 1; // 1 to remove the item after calling
    };
    class cluster
    {
        text = "$STR_DUWS_X_jznptb3c"; // Text displayed in the menu and in a notification
        submenu = ""; // Submenu opened upon activation
		//_null = [salvos, radius, interval between salvos(in seconds), rounds per salvo, support type, CP cost, ammotype]
        expression = "[1, 175, 1, 90, 5, 10, 'Cluster'] spawn fnc_mapclickarty"; 
        icon = "\a3\ui_f\data\gui\cfg\hints\Death_ca.paa";
        cursor = "\a3\Ui_f\data\IGUI\Cfg\Cursors\iconCursorSupport_ca.paa"; // Custom cursor displayed when the item is selected
        enable = "1"; // Simple expression condition for enabling the item
        removeAfterExpressionCall = 1; // 1 to remove the item after calling
    };
    class napalm
    {
        text = "$STR_DUWS_X_bhmydfkv"; // Text displayed in the menu and in a notification
        submenu = ""; // Submenu opened upon activation
		//_null = [salvos, radius, interval between salvos(in seconds), rounds per salvo, support type, CP cost, ammotype]
        expression = "[1, 50, 1, 8, 6, 10, 'Napalm'] spawn fnc_mapclickarty"; 
        icon = "\a3\ui_f\data\gui\cfg\hints\Death_ca.paa";
        cursor = "\a3\Ui_f\data\IGUI\Cfg\Cursors\iconCursorSupport_ca.paa"; // Custom cursor displayed when the item is selected
        enable = "1"; // Simple expression condition for enabling the item
        removeAfterExpressionCall = 1; // 1 to remove the item after calling
    };
    class SITREP
    {
        text = "$STR_DUWS_X_puy8tdeb"; // Text displayed in the menu and in a notification
        submenu = ""; // Submenu opened upon activation
        expression = "[] spawn fnc_sitrep_support"; // Code executed upon activation (ignored when the submenu is not empty)
        icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa"; // Icon displayed permanently next to the command menu
        cursor = ""; // Custom cursor displayed when the item is selected
        enable = "1"; // Simple expression condition for enabling the item
        removeAfterExpressionCall = 0; // 1 to remove the item after calling
    };
    class ammo
    {
        text = "$STR_DUWS_X_32rh9x5x"; // Text displayed in the menu and in a notification
        submenu = ""; // Submenu opened upon activation
        expression = "[player, 5] spawn fnc_ammobox"; 
        icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\supplydrop_ca.paa"; // Icon displayed permanently next to the command menu
        cursor = ""; // Custom cursor displayed when the item is selected
        enable = "1"; // Simple expression condition for enabling the item
        removeAfterExpressionCall = 0; // 1 to remove the item after calling
    };
    class veh_drop
    {
        text = "$STR_DUWS_X_cwflheuj"; // Text displayed in the menu and in a notification
        submenu = ""; // Submenu opened upon activation
        expression = "[player, 5] spawn fnc_veh_drop"; 
        icon = "\A3\ui_f\data\Map\VehicleIcons\iconParachute_ca.paa"; // Icon displayed permanently next to the command menu
        cursor = ""; // Custom cursor displayed when the item is selected
        enable = "1"; // Simple expression condition for enabling the item
        removeAfterExpressionCall = 0; // 1 to remove the item after calling
    };
    class paradrop
    {
        text = "$STR_DUWS_X_nafdmcoy"; // Text displayed in the menu and in a notification
        submenu = ""; // Submenu opened upon activation
        expression = "[player, 25] spawn fnc_paradrop"; 
        icon = "\a3\ui_f\data\gui\cfg\hints\BasicStances_ca.paa";
        cursor = ""; // Custom cursor displayed when the item is selected
        enable = "1"; // Simple expression condition for enabling the item
        removeAfterExpressionCall = 0; // 1 to remove the item after calling
    };
    class uav_recon
    {
        text = "$STR_DUWS_X_n17vw60y"; // Text displayed in the menu and in a notification
        submenu = ""; // Submenu opened upon activation
        expression = "[5] spawn fnc_mapclickuav"; 
        icon = "\a3\ui_f\data\gui\cfg\hints\Radar_ca.paa";
        cursor = ""; // Custom cursor displayed when the item is selected
        enable = "1"; // Simple expression condition for enabling the item
        removeAfterExpressionCall = 1; // 1 to remove the item after calling
    };
    class vehicle_refit
    {
        text = "$STR_DUWS_X_ryw9b7gv"; // Text displayed in the menu and in a notification
        submenu = ""; // Submenu opened upon activation
        expression = "[getpos player, 5] spawn fnc_veh_refit"; 
        icon = "\A3\ui_f\data\Map\MapControl\fuelstation_CA.paa";
        cursor = ""; // Custom cursor displayed when the item is selected
        enable = "1"; // Simple expression condition for enabling the item
        removeAfterExpressionCall = 1; // 1 to remove the item after calling
    };
    class fob_support
    {
        text = "$STR_DUWS_X_h3uo0102"; // Text displayed in the menu and in a notification
        submenu = ""; // Submenu opened upon activation
        expression = "[getpos player, 500, 10] spawn fnc_request_fob"; 
        icon = "\a3\ui_f\data\gui\cfg\hints\Commanding_ca.paa";
        cursor = ""; // Custom cursor displayed when the item is selected
        enable = "1"; // Simple expression condition for enabling the item
        removeAfterExpressionCall = 1; // 1 to remove the item after calling
    };
    class helo_taxi
    {
        text = "$STR_DUWS_X_1ptvv5b1"; // Text displayed in the menu and in a notification
        submenu = ""; // Submenu opened upon activation
        expression = "[getpos player,100, 2] spawn fnc_helotaxi"; 
        icon = "\A3\ui_f\data\Map\VehicleIcons\iconHelicopter_ca.paa";
        cursor = ""; // Custom cursor displayed when the item is selected
        enable = "1"; // Simple expression condition for enabling the item
        removeAfterExpressionCall = 1; // 1 to remove the item after calling
    };
    class boat_taxi
    {
        text = "$STR_DUWS_X_evqwlyhz"; // Text displayed in the menu and in a notification
        submenu = ""; // Submenu opened upon activation
        expression = "[getpos player,10, 1] spawn fnc_boattaxi"; 
        icon = "\A3\ui_f\data\Map\VehicleIcons\iconShip_ca.paa";
        cursor = ""; // Custom cursor displayed when the item is selected
        enable = "1"; // Simple expression condition for enabling the item
        removeAfterExpressionCall = 1; // 1 to remove the item after calling
    };
	class hc_ATTchop
    {
        text = "$STR_DUWS_X_9bxjbidl"; // Text displayed in the menu and in a notification
        submenu = ""; // Submenu opened upon activation
        expression = "[10] spawn fnc_request_hcATTchop"; 
        icon = "\A3\ui_f\data\Map\Markers\NATO\b_air.paa";
        cursor = ""; // Custom cursor displayed when the item is selected
        enable = "1"; // Simple expression condition for enabling the item
        removeAfterExpressionCall = 1; // 1 to remove the item after calling
    };

	class hc_CAS
    {
        text = "$STR_DUWS_X_f5y7ue87"; // Text displayed in the menu and in a notification
        submenu = ""; // Submenu opened upon activation
        expression = "[15] spawn fnc_request_hcCAS"; 
        icon = "\A3\ui_f\data\Map\Markers\NATO\b_plane.paa";
        cursor = ""; // Custom cursor displayed when the item is selected
        enable = "1"; // Simple expression condition for enabling the item
        removeAfterExpressionCall = 1; // 1 to remove the item after calling
    };
	
	class mobile_HQ
    {
        text = "$STR_DUWS_X_ooi6w4yh"; // Text displayed in the menu and in a notification
        submenu = ""; // Submenu opened upon activation
        expression = "[30] spawn fnc_MHQ_select"; 
        icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\attack_ca.paa"; // Icon displayed permanently next to the command menu
        cursor = ""; // Custom cursor displayed when the item is selected
        enable = "1"; // Simple expression condition for enabling the item
        removeAfterExpressionCall = 1; // 1 to remove the item after calling
    };

};                             



