class AI_loadout_manager
{
	idd = -1;
	movingenable = true;
    //  onLoad = "_this call FRAME_01_Load";

    class controls
    {
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT START
        ////////////////////////////////////////////////////////
        class background_request: RscText
        {
            idc = 9745;
            x = 4.5 * GUI_GRID_W + GUI_GRID_X;
            y = 8 * GUI_GRID_H + GUI_GRID_Y;
            w = 30 * GUI_GRID_W;
            h = 10.5 * GUI_GRID_H;
            colorBackground[] = {0,0,0,0.3};
        };
        class mainframe_loadout_manager: RscFrame
        {
            idc = 1800;
            text = "$STR_DUWS_X_i247bl4y"; //--- ToDo: Localize;
            x = 5 * GUI_GRID_W + GUI_GRID_X;
            y = 8.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 29 * GUI_GRID_W;
            h = 9.5 * GUI_GRID_H;
            moving = 1;
        };
        class loadout_transfer_frame: RscFrame
        {
            idc = 1801;
            text = "$STR_DUWS_X_9963cjfi"; //--- ToDo: Localize;
            x = 5.5 * GUI_GRID_W + GUI_GRID_X;
            y = 9.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 28 * GUI_GRID_W;
            h = 3 * GUI_GRID_H;
            tooltip = "$STR_DUWS_X_nj0nmmky"; //--- ToDo: Localize;
        };
        class loadout_transfer_combo: RscCombo
        {
            idc = 2101;
            x = 19.5 * GUI_GRID_W + GUI_GRID_X;
            y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 13.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            tooltip = "$STR_DUWS_X_080k2jku"; //--- ToDo: Localize;
        };
        class loadout_transfer_button: RscButton
        {
            idc = 1600;
            text = "$STR_DUWS_X_ck8yvqjf"; //--- ToDo: Localize;
            x = 6.5 * GUI_GRID_W + GUI_GRID_X;
            y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 12 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            tooltip = "$STR_DUWS_X_xba4gu97"; //--- ToDo: Localize;
            action = "[] spawn fnc_loadout_transfer";
        };
        class frame_select_unit: RscFrame
        {
            idc = 1802;
            text = "$STR_DUWS_X_weozqdso"; //--- ToDo: Localize;
            x = 5.5 * GUI_GRID_W + GUI_GRID_X;
            y = 13 * GUI_GRID_H + GUI_GRID_Y;
            w = 28 * GUI_GRID_W;
            h = 3 * GUI_GRID_H;
            tooltip = "$STR_DUWS_X_weozqdso"; //--- ToDo: Localize;
        };
        /*class save_loadout_button: RscButton
        {
            idc = 1601;
            text = "Save Loadout"; //--- ToDo: Localize;
            x = 6.5 * GUI_GRID_W + GUI_GRID_X;
            y = 14 * GUI_GRID_H + GUI_GRID_Y;
            w = 12 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            action = "[] spawn fnc_NULL";
            tooltip = "Save Units loadout for Rearming"; //--- ToDo: Localize;
        };*/
        class select_unit_combo: RscCombo
        {
            idc = 2100;
            x = 19.5 * GUI_GRID_W + GUI_GRID_X;
            y = 14 * GUI_GRID_H + GUI_GRID_Y;
            w = 13.5 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            tooltip = "$STR_DUWS_X_weozqdso"; //--- ToDo: Localize;
        };
        class exit_button: RscButton
        {
            idc = 1602;
            text = "$STR_DUWS_X_n66cx0eh"; //--- ToDo: Localize;
            x = 13.5 * GUI_GRID_W + GUI_GRID_X;
            y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
            w = 12 * GUI_GRID_W;
            h = 1 * GUI_GRID_H;
            tooltip = "$STR_DUWS_X_tum2tblv"; //--- ToDo: Localize;
            action = "closeDialog 0";
        };
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT END
        ////////////////////////////////////////////////////////
    };
};