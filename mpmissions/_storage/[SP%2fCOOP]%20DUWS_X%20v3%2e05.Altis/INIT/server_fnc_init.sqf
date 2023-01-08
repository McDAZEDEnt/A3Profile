
// SERVER FUNCTIONS

// STARTUP FUNCTIONS
fnc_BluHQinit = compile preprocessFileLineNumbers "functions\initHQ\fnc_BluHQinit.sqf";
switch (VERSION_X) do {
	case "MODERN": {
		fnc_factions_check = compile preprocessFileLineNumbers "functions\misc\fnc_factions_check_modern.sqf";
	};
	case "WW2": {
		fnc_factions_check = compile preprocessFileLineNumbers "functions\misc\fnc_factions_check_ww2.sqf";
	};
	case "VIETNAM": {
		fnc_factions_check = compile preprocessFileLineNumbers "functions\misc\fnc_factions_check_vietnam.sqf";
	};
};
// SERVER INIT FUNCTIONS
fnc_init_OPFOR_WARCOM = compile preprocessFileLineNumbers "functions\WARCOM\fnc_init_OPFOR_WARCOM.sqf";
fnc_OPFOR_faction_init = compile preprocessFileLineNumbers "functions\WARCOM\fnc_OPFOR_faction_init.sqf";
fnc_OPFOR_squad_init = compile preprocessFileLineNumbers "functions\WARCOM\fnc_OPFOR_squad_init.sqf";
fnc_repetitive_cleanup = compile preprocessFileLineNumbers "functions\misc\fnc_repetitive_cleanup.sqf";
fnc_capture_zones_task = compile preprocessFileLineNumbers "functions\misc\fnc_capture_zones_task.sqf";
fnc_AI_Master_Control = compile preprocessFileLineNumbers "functions\misc\fnc_AI_Master_Control.sqf";
fnc_weather = compile preprocessFileLineNumbers "functions\dialog\fnc_weather.sqf";
fnc_zeus_objects_init = compile preprocessFileLineNumbers "functions\misc\fnc_zeus_objects_init.sqf";
fnc_handleDisconnect = compile preprocessFileLineNumbers "functions\misc\fnc_handleDisconnect.sqf";
fnc_usableBuildings = compile preprocessFileLineNumbers "functions\misc\fnc_usableBuildings.sqf";
fnc_fob_destroyed = compile preprocessFileLineNumbers "functions\misc\fnc_fob_destroyed.sqf";
fnc_missionLocator = compile preprocessFileLineNumbers "functions\missions\fnc_missionLocator.sqf";
fnc_create_ammo_lists = compile preprocessFileLineNumbers "functions\misc\fnc_create_ammo_lists.sqf";
fnc_basic_ammo_lists = compile preprocessFileLineNumbers "functions\misc\fnc_basic_ammo_lists.sqf";
fnc_warcrimes_script = compile preprocessFileLineNumbers "functions\misc\fnc_warcrimes_script.sqf";


// SIDE MISSION FUNCTIONS
fnc_mission_cancel = compile preprocessFileLineNumbers "functions\missions\fnc_mission_cancel.sqf";
fnc_mission_reward = compile preprocessFileLineNumbers "functions\missions\fnc_mission_reward.sqf";
fnc_missionTimer = compile preprocessFileLineNumbers "functions\missions\fnc_missionTimer.sqf";
fnc_missionTargetPos = compile preprocessFileLineNumbers "functions\missions\fnc_missionTargetPos.sqf";
fnc_missionMarkerData = compile preprocessFileLineNumbers "functions\missions\fnc_missionMarkerData.sqf";
fnc_missionPatrols = compile preprocessFileLineNumbers "functions\missions\fnc_missionPatrols.sqf";
fnc_mission_cleanup = compile preprocessFileLineNumbers "functions\missions\fnc_mission_cleanup.sqf";

// SIDE MISSION THREADS
fnc_rescue_squad_mission = compile preprocessFileLineNumbers "functions\missions\mission_threads\rescue_squad\fnc_rescue_squad_mission.sqf";
fnc_rescue_squad_success = compile preprocessFileLineNumbers "functions\missions\mission_threads\rescue_squad\fnc_rescue_squad_success.sqf";
fnc_steal_supply_mission = compile preprocessFileLineNumbers "functions\missions\mission_threads\steal_supply\fnc_steal_supply_mission.sqf";
fnc_target_hvt_mission = compile preprocessFileLineNumbers "functions\missions\mission_threads\target_hvt\fnc_target_hvt_mission.sqf";
fnc_destroy_tower_mission = compile preprocessFileLineNumbers "functions\missions\mission_threads\destroy_tower\fnc_destroy_tower_mission.sqf";
fnc_rescue_pilot_mission = compile preprocessFileLineNumbers "functions\missions\mission_threads\rescue_pilot\fnc_rescue_pilot_mission.sqf";
fnc_target_sniper_mission = compile preprocessFileLineNumbers "functions\missions\mission_threads\target_sniper\fnc_target_sniper_mission.sqf";
fnc_steal_builder_mission = compile preprocessFileLineNumbers "functions\missions\mission_threads\steal_builder\fnc_steal_builder_mission.sqf";
fnc_target_armor_mission = compile preprocessFileLineNumbers "functions\missions\mission_threads\target_armor\fnc_target_armor_mission.sqf";
fnc_sabotage_laptop_mission = compile preprocessFileLineNumbers "functions\missions\mission_threads\sabotage_laptop\fnc_sabotage_laptop_mission.sqf";
fnc_sabotage_laptop_success = compile preprocessFileLineNumbers "functions\missions\mission_threads\sabotage_laptop\fnc_sabotage_laptop_success.sqf";
fnc_destroy_cache_mission = compile preprocessFileLineNumbers "functions\missions\mission_threads\destroy_cache\fnc_destroy_cache_mission.sqf";
fnc_vietnam_destroy_cache_mission = compile preprocessFileLineNumbers "functions\missions\mission_threads\destroy_cache\fnc_vietnam_destroy_cache_mission.sqf";
fnc_destroy_radar_mission = compile preprocessFileLineNumbers "functions\missions\mission_threads\destroy_radar\fnc_destroy_radar_mission.sqf";
fnc_vietnam_destroy_radar_mission = compile preprocessFileLineNumbers "functions\missions\mission_threads\destroy_radar\fnc_vietnam_destroy_radar_mission.sqf";
fnc_destroy_sam_mission = compile preprocessFileLineNumbers "functions\missions\mission_threads\destroy_sam\fnc_destroy_sam_mission.sqf";


// CIVILIAN FUNCTIONS
fnc_civ_init_Tomata = compile preprocessFileLineNumbers "functions\misc\fnc_civ_init_Tomata.sqf";
fnc_civ_locator_Tomata = compile preprocessFileLineNumbers "functions\misc\fnc_civ_locator_Tomata.sqf";
fnc_civ_wp_Tomata = compile preprocessFileLineNumbers "functions\misc\fnc_civ_wp_Tomata.sqf";
fnc_civ_rep_Tomata = compile preprocessFileLineNumbers "functions\misc\fnc_civ_rep_Tomata.sqf";
fnc_civ_informant_wp_Tomata = compile preprocessFileLineNumbers "functions\misc\fnc_civ_informant_wp_Tomata.sqf";


// WARCOM FUNCTIONS
fnc_WARCOM_init = compile preprocessFileLineNumbers "functions\WARCOM\fnc_WARCOM_init.sqf";
fnc_WARCOM_wp_blu_assault = compile preprocessFileLineNumbers "functions\WARCOM\fnc_WARCOM_wp_blu_assault.sqf";
fnc_WARCOM_blu_patrol = compile preprocessFileLineNumbers "functions\WARCOM\fnc_WARCOM_blu_patrol.sqf";
fnc_WARCOM_wp_blu_patrol = compile preprocessFileLineNumbers "functions\WARCOM\fnc_WARCOM_wp_blu_patrol.sqf";
fnc_WARCOM_opf_patrol = compile preprocessFileLineNumbers "functions\WARCOM\fnc_WARCOM_opf_patrol.sqf";
fnc_WARCOM_wp_opf_patrol = compile preprocessFileLineNumbers "functions\WARCOM\fnc_WARCOM_wp_opf_patrol.sqf";
fnc_WARCOM_opf_assault = compile preprocessFileLineNumbers "functions\WARCOM\fnc_WARCOM_opf_assault.sqf";
fnc_WARCOM_wp_opf_assault = compile preprocessFileLineNumbers "functions\WARCOM\fnc_WARCOM_wp_opf_assault.sqf";
fnc_WARCOM_wp_opf_qrf = compile preprocessFileLineNumbers "functions\WARCOM\fnc_WARCOM_wp_opf_qrf.sqf";
fnc_WARCOM_opf_air = compile preprocessFileLineNumbers "functions\WARCOM\fnc_WARCOM_opf_air.sqf";
fnc_random_veh_blu_patrol = compile preprocessFileLineNumbers "functions\WARCOM\fnc_random_veh_blu_patrol.sqf";
fnc_random_veh_opf_patrol = compile preprocessFileLineNumbers "functions\WARCOM\fnc_random_veh_opf_patrol.sqf";
fnc_WARCOM_gps_marker = compile preprocessFileLineNumbers "functions\WARCOM\fnc_WARCOM_gps_marker.sqf";

// ZONE FUNCTIONS
fnc_zonesundercontrol = compile preprocessFileLineNumbers "functions\misc\fnc_zonesundercontrol.sqf";
fnc_locatorZones_random = compile preprocessFileLineNumbers "functions\initZones\fnc_locatorZones_random.sqf";
fnc_captured = compile preprocessFileLineNumbers "functions\initZones\fnc_captured.sqf";
fnc_blufor_cap = compile preprocessFileLineNumbers "functions\initZones\fnc_blufor_cap.sqf";
fnc_opfor_cap = compile preprocessFileLineNumbers "functions\initZones\fnc_opfor_cap.sqf";
fnc_enterlocation = compile preprocessFileLineNumbers "functions\misc\fnc_enterlocation.sqf";
fnc_spawnWait = compile preprocessFileLineNumbers "functions\initZones\fnc_spawnWait.sqf";
fnc_createopfortified = compile preprocessFileLineNumbers "functions\initZones\fnc_createopfortified.sqf";
fnc_createoppatrol_sniper = compile preprocessFileLineNumbers "functions\initZones\fnc_createoppatrol_sniper.sqf";
fnc_createoppatrol2 = compile preprocessFileLineNumbers "functions\initZones\fnc_createoppatrol2.sqf";
fnc_createopteam = compile preprocessFileLineNumbers "functions\initZones\fnc_createopteam.sqf";
fnc_createopteam2 = compile preprocessFileLineNumbers "functions\initZones\fnc_createopteam2.sqf";
fnc_createopwpteam = compile preprocessFileLineNumbers "functions\initZones\fnc_createopwpteam.sqf";
fnc_random_veh = compile preprocessFileLineNumbers "functions\initZones\fnc_random_veh.sqf";
fnc_zone_reveal = compile preprocessFileLineNumbers "functions\initZones\fnc_zone_reveal.sqf";
fnc_zone_spawn_sizes = compile preprocessFileLineNumbers "functions\initZones\fnc_zone_spawn_sizes.sqf";

//////////////////
// ZONE PREFABS
//////////////////

switch (VERSION_X) do {
	case "MODERN": {
		fnc_modern_CommStation = compile preprocessFileLineNumbers "functions\initZones\prefabs\modern\fnc_modern_CommStation.sqf";
		fnc_modern_outpost1 = compile preprocessFileLineNumbers "functions\initZones\prefabs\modern\fnc_modern_outpost1.sqf";
		fnc_modern_Outpost2 = compile preprocessFileLineNumbers "functions\initZones\prefabs\modern\fnc_modern_Outpost2.sqf";
		fnc_modern_reconOutpost = compile preprocessFileLineNumbers "functions\initZones\prefabs\modern\fnc_modern_reconOutpost.sqf";
		fnc_modern_simple_zone = compile preprocessFileLineNumbers "functions\initZones\prefabs\modern\fnc_modern_simple_zone.sqf";
		fnc_modern_StorageBunker = compile preprocessFileLineNumbers "functions\initZones\prefabs\modern\fnc_modern_StorageBunker.sqf";
		fnc_modern_vehfittingstation = compile preprocessFileLineNumbers "functions\initZones\prefabs\modern\fnc_modern_vehfittingstation.sqf";
	};
	case "WW2": {
		fnc_ww2_CommStation = compile preprocessFileLineNumbers "functions\initZones\prefabs\ww2\fnc_ww2_CommStation.sqf";
		fnc_ww2_Outpost = compile preprocessFileLineNumbers "functions\initZones\prefabs\ww2\fnc_ww2_Outpost.sqf";
		fnc_ww2_Checkpoint = compile preprocessFileLineNumbers "functions\initZones\prefabs\ww2\fnc_ww2_Checkpoint.sqf";
		fnc_ww2_FieldHospital = compile preprocessFileLineNumbers "functions\initZones\prefabs\ww2\fnc_ww2_FieldHospital.sqf";
		fnc_ww2_simple_zone = compile preprocessFileLineNumbers "functions\initZones\prefabs\ww2\fnc_ww2_simple_zone.sqf";
		fnc_ww2_Bunker = compile preprocessFileLineNumbers "functions\initZones\prefabs\ww2\fnc_ww2_Bunker.sqf";
		fnc_ww2_vehfittingstation = compile preprocessFileLineNumbers "functions\initZones\prefabs\ww2\fnc_ww2_vehfittingstation.sqf";
	};
	case "VIETNAM": {
		fnc_vietnam_vehfittingstation = compile preprocessFileLineNumbers "functions\initZones\prefabs\vietnam\fnc_vietnam_vehfittingstation.sqf";
		fnc_vietnam_FieldHospital = compile preprocessFileLineNumbers "functions\initZones\prefabs\vietnam\fnc_vietnam_FieldHospital.sqf";
		fnc_vietnam_CommStation = compile preprocessFileLineNumbers "functions\initZones\prefabs\vietnam\fnc_vietnam_CommStation.sqf";
		fnc_vietnam_simple_zone = compile preprocessFileLineNumbers "functions\initZones\prefabs\vietnam\fnc_vietnam_simple_zone.sqf";
		fnc_vietnam_StorageBunker = compile preprocessFileLineNumbers "functions\initZones\prefabs\vietnam\fnc_vietnam_StorageBunker.sqf";
		fnc_vietnam_Outpost1 = compile preprocessFileLineNumbers "functions\initZones\prefabs\vietnam\fnc_vietnam_Outpost1.sqf";
		fnc_vietnam_Outpost2 = compile preprocessFileLineNumbers "functions\initZones\prefabs\vietnam\fnc_vietnam_Outpost2.sqf";
	};	
};



//////////////////////////////
// GLOBAL FUNCTIONS
//////////////////////////////

fnc_radiochatter = compile preprocessFileLineNumbers "functions\sounds\fnc_radiochatter.sqf";publicVariable "fnc_radiochatter";
fnc_dyn_music_init = compile preprocessFileLineNumbers "functions\sounds\fnc_dyn_music_init.sqf";publicVariable "fnc_dyn_music_init";
fnc_ambient_musicloop = compile preprocessFileLineNumbers "functions\sounds\fnc_ambient_musicloop.sqf";publicVariable "fnc_ambient_musicloop";
fnc_duws_Arsenal = compile preprocessFileLineNumbers "functions\misc\fnc_duws_Arsenal.sqf";publicVariable "fnc_duws_Arsenal";
fnc_ghst_halo = compile preprocessFileLineNumbers "functions\misc\fnc_ghst_halo.sqf";publicVariable "fnc_ghst_halo";
fnc_WARCOM_blu_assault = compile preprocessFileLineNumbers "functions\WARCOM\fnc_WARCOM_blu_assault.sqf";publicVariable "fnc_WARCOM_blu_assault";
fnc_random_name = compile preprocessFileLineNumbers "functions\misc\fnc_random_name.sqf";publicVariable "fnc_random_name";
fnc_BLUFOR_squad_init = compile preprocessFileLineNumbers "functions\initHQ\fnc_BLUFOR_squad_init.sqf";publicVariable "fnc_BLUFOR_squad_init";
fnc_BLUFOR_faction_init = compile preprocessFileLineNumbers "functions\initHQ\fnc_BLUFOR_faction_init.sqf";publicVariable "fnc_BLUFOR_faction_init";
fnc_HQguards = compile preprocessFileLineNumbers "functions\initHQ\fnc_HQguards.sqf";publicVariable "fnc_HQguards";
fnc_fortifyHQ = compile preprocessFileLineNumbers "functions\initHQ\fnc_fortifyHQ.sqf";publicVariable "fnc_fortifyHQ";
fnc_patrolHQ = compile preprocessFileLineNumbers "functions\initHQ\fnc_patrolHQ.sqf";publicVariable "fnc_patrolHQ";
fnc_reguardHQ = compile preprocessFileLineNumbers "functions\initHQ\fnc_reguardHQ.sqf";publicVariable "fnc_reguardHQ";
fnc_refortifyHQ = compile preprocessFileLineNumbers "functions\initHQ\fnc_refortifyHQ.sqf";publicVariable "fnc_refortifyHQ";
fnc_fortifyFOB = compile preprocessFileLineNumbers "functions\initHQ\fnc_fortifyFOB.sqf";publicVariable "fnc_fortifyFOB";
fnc_refortifyFOB = compile preprocessFileLineNumbers "functions\initHQ\fnc_refortifyFOB.sqf";publicVariable "fnc_refortifyFOB";
fnc_guardsFOB = compile preprocessFileLineNumbers "functions\initHQ\fnc_guardsFOB.sqf";publicVariable "fnc_guardsFOB";
fnc_reguardFOB = compile preprocessFileLineNumbers "functions\initHQ\fnc_reguardFOB.sqf";publicVariable "fnc_reguardFOB";
fnc_createpatrolFOB = compile preprocessFileLineNumbers "functions\initHQ\fnc_createpatrolFOB.sqf";publicVariable "fnc_createpatrolFOB";
fnc_locatorZones_manual = compile preprocessFileLineNumbers "functions\initZones\fnc_locatorZones_manual.sqf";publicVariable "fnc_locatorZones_manual";
fnc_createZone = compile preprocessFileLineNumbers "functions\initZones\fnc_createZone.sqf";publicVariable "fnc_createZone";
fnc_found_intel = compile preprocessFileLineNumbers "functions\misc\fnc_found_intel.sqf";publicVariable "fnc_found_intel";


// MISSION FUNCTIONS
fnc_stratmap = compile preprocessFileLineNumbers "functions\missions\fnc_stratmap.sqf";publicVariable "fnc_stratmap";
fnc_mission_cancel_action = compile preprocessFileLineNumbers "functions\missions\fnc_mission_cancel_action.sqf";publicVariable "fnc_mission_cancel_action";
fnc_missionLocator = compile preprocessFileLineNumbers "functions\missions\fnc_missionLocator.sqf";publicVariable "fnc_missionLocator";


// DIALOG FUNCTIONS
fnc_HQ_faction_dialog = compile preprocessFileLineNumbers "functions\dialog\fnc_HQ_faction_dialog.sqf";publicVariable "fnc_HQ_faction_dialog";
fnc_HQ_manual_place = compile preprocessFileLineNumbers "functions\dialog\fnc_HQ_manual_place.sqf";publicVariable "fnc_HQ_manual_place";
fnc_HQ_random_place = compile preprocessFileLineNumbers "functions\dialog\fnc_HQ_random_place.sqf";publicVariable "fnc_HQ_random_place";
fnc_HQ_endCampaign = compile preprocessFileLineNumbers "functions\dialog\fnc_HQ_endCampaign.sqf";publicVariable "fnc_HQ_endCampaign";
fnc_enviro_menu = compile preprocessFileLineNumbers "functions\dialog\fnc_enviro_menu.sqf";publicVariable "fnc_enviro_menu";
fnc_campaign_menu = compile preprocessFileLineNumbers "functions\dialog\fnc_campaign_menu.sqf";publicVariable "fnc_campaign_menu";
fnc_process_campaign_menu = compile preprocessFileLineNumbers "functions\dialog\fnc_process_campaign_menu.sqf";publicVariable "fnc_process_campaign_menu";
fnc_process_enviro_menu = compile preprocessFileLineNumbers "functions\dialog\fnc_process_enviro_menu.sqf";publicVariable "fnc_process_enviro_menu";
fnc_startup_closed = compile preprocessFileLineNumbers "functions\dialog\fnc_startup_closed.sqf";publicVariable "fnc_startup_closed";
fnc_startup_manual_zones = compile preprocessFileLineNumbers "functions\dialog\fnc_startup_manual_zones.sqf";publicVariable "fnc_startup_manual_zones";
fnc_startup_random_zones = compile preprocessFileLineNumbers "functions\dialog\fnc_startup_random_zones.sqf";publicVariable "fnc_startup_random_zones";
fnc_request_unit = compile preprocessFileLineNumbers "functions\dialog\fnc_request_unit.sqf";publicVariable "fnc_request_unit";
fnc_request_squad = compile preprocessFileLineNumbers "functions\dialog\fnc_request_squad.sqf";publicVariable "fnc_request_squad";
fnc_request_vehicle = compile preprocessFileLineNumbers "functions\dialog\fnc_request_vehicle.sqf";publicVariable "fnc_request_vehicle";
fnc_request_support = compile preprocessFileLineNumbers "functions\dialog\fnc_request_support.sqf";publicVariable "fnc_request_support";
fnc_convertAPtoCP = compile preprocessFileLineNumbers "functions\dialog\fnc_convertAPtoCP.sqf";publicVariable "fnc_convertAPtoCP";
fnc_request_unit_fob = compile preprocessFileLineNumbers "functions\dialog\fnc_request_unit_fob.sqf";publicVariable "fnc_request_unit_fob";
fnc_request_squad_fob = compile preprocessFileLineNumbers "functions\dialog\fnc_request_squad_fob.sqf";publicVariable "fnc_request_squad_fob";
fnc_request_vehicle_fob = compile preprocessFileLineNumbers "functions\dialog\fnc_request_vehicle_fob.sqf";publicVariable "fnc_request_vehicle_fob";
fnc_custom_faction_capture = compile preprocessFileLineNumbers "functions\dialog\fnc_custom_faction_capture.sqf";publicVariable "fnc_custom_faction_capture";
fnc_custom_faction_init = compile preprocessFileLineNumbers "functions\dialog\fnc_custom_faction_init.sqf";publicVariable "fnc_custom_faction_init";
fnc_HQ_Request_Menu = compile preprocessFileLineNumbers "functions\dialog\fnc_HQ_Request_Menu.sqf";publicVariable "fnc_HQ_Request_Menu";
fnc_FOB_Request_Menu = compile preprocessFileLineNumbers "functions\dialog\fnc_FOB_Request_Menu.sqf";publicVariable "fnc_FOB_Request_Menu";
fnc_squad_manage = compile preprocessFileLineNumbers "functions\dialog\fnc_squad_manage.sqf";publicVariable "fnc_squad_manage";
fnc_dismissHC = compile preprocessFileLineNumbers "functions\dialog\fnc_dismissHC.sqf";publicVariable "fnc_dismissHC";
fnc_dismiss_playerAI = compile preprocessFileLineNumbers "functions\dialog\fnc_dismiss_playerAI.sqf";publicVariable "fnc_dismiss_playerAI";
fnc_squad_rename = compile preprocessFileLineNumbers "functions\dialog\fnc_squad_rename.sqf";publicVariable "fnc_squad_rename";
fnc_groupReset = compile preprocessFileLineNumbers "functions\dialog\fnc_groupReset.sqf";publicVariable "fnc_groupReset";
fnc_loadout_transfer = compile preprocessFileLineNumbers "functions\dialog\fnc_loadout_transfer.sqf";publicVariable "fnc_loadout_transfer";
fnc_rest_heal = compile preprocessFileLineNumbers "functions\dialog\fnc_rest_heal.sqf";publicVariable "fnc_rest_heal";
fnc_FOBmanager = compile preprocessFileLineNumbers "functions\dialog\fnc_FOBmanager.sqf";publicVariable "fnc_FOBmanager";
fnc_FOB_remove = compile preprocessFileLineNumbers "functions\dialog\fnc_FOB_remove.sqf";publicVariable "fnc_FOB_remove";
fnc_FOB_cleanup = compile preprocessFileLineNumbers "functions\dialog\fnc_FOB_cleanup.sqf";publicVariable "fnc_FOB_cleanup";
fnc_FOB_fast_travel = compile preprocessFileLineNumbers "functions\dialog\fnc_FOB_fast_travel.sqf";publicVariable "fnc_FOB_fast_travel";
fnc_AI_loadout_manager = compile preprocessFileLineNumbers "functions\dialog\fnc_AI_loadout_manager.sqf";publicVariable "fnc_AI_loadout_manager";
fnc_MHQ_select = compile preprocessFileLineNumbers "functions\dialog\fnc_MHQ_select.sqf";publicVariable "fnc_MHQ_select";
fnc_MHQ_addActions = compile preprocessFileLineNumbers "functions\dialog\fnc_MHQ_addActions.sqf";publicVariable "fnc_MHQ_addActions";
fnc_MHQ_deploy = compile preprocessFileLineNumbers "functions\dialog\fnc_MHQ_deploy.sqf";publicVariable "fnc_MHQ_deploy";
fnc_MHQ_undeploy = compile preprocessFileLineNumbers "functions\dialog\fnc_MHQ_undeploy.sqf";publicVariable "fnc_MHQ_undeploy";
fnc_MHQ_destroyed = compile preprocessFileLineNumbers "functions\dialog\fnc_MHQ_destroyed.sqf";publicVariable "fnc_MHQ_destroyed";
fnc_actionRotary = compile preprocessFileLineNumbers "functions\dialog\fnc_actionRotary.sqf";publicVariable "fnc_actionRotary";


// HQ & FOB FUNCTIONS
fnc_draw_HQicon = compile preprocessFileLineNumbers "functions\initHQ\fnc_draw_HQicon.sqf";publicVariable "fnc_draw_HQicon";
fnc_HQaddactions = compile preprocessFileLineNumbers "functions\initHQ\fnc_HQaddactions.sqf";publicVariable "fnc_HQaddactions";
fnc_FOBactions = compile preprocessFileLineNumbers "functions\supports\fnc_FOBactions.sqf";publicVariable "fnc_FOBactions";
fnc_fob_server = compile preprocessFileLineNumbers "functions\supports\fnc_fob_server.sqf";publicVariable "fnc_fob_server";


// SUPPORTS FUNCTIONS
fnc_ammobox = compile preprocessFileLineNumbers "functions\supports\fnc_ammobox.sqf";publicVariable "fnc_ammobox";
fnc_arty = compile preprocessFileLineNumbers "functions\supports\fnc_arty.sqf";publicVariable "fnc_arty";
fnc_mapclickarty = compile preprocessFileLineNumbers "functions\supports\fnc_mapclickarty.sqf";publicVariable "fnc_mapclickarty";
fnc_mapclickuav = compile preprocessFileLineNumbers "functions\supports\fnc_mapclickuav.sqf";publicVariable "fnc_mapclickuav";
fnc_uav_scanner = compile preprocessFileLineNumbers "functions\supports\fnc_uav_scanner.sqf";publicVariable "fnc_uav_scanner";
fnc_paradrop = compile preprocessFileLineNumbers "functions\supports\fnc_paradrop.sqf";publicVariable "fnc_paradrop";
fnc_veh_refit = compile preprocessFileLineNumbers "functions\supports\fnc_veh_refit.sqf";publicVariable "fnc_veh_refit";
fnc_veh_refit_server = compile preprocessFileLineNumbers "functions\supports\fnc_veh_refit_server.sqf";publicVariable "fnc_veh_refit_server";
fnc_veh_refit_script = compile preprocessFileLineNumbers "functions\supports\fnc_veh_refit_script.sqf";publicVariable "fnc_veh_refit_script";
fnc_request_fob = compile preprocessFileLineNumbers "functions\supports\fnc_request_fob.sqf";publicVariable "fnc_request_fob";
fnc_request_hcATTchop = compile preprocessFileLineNumbers "functions\supports\fnc_request_hcATTchop.sqf";publicVariable "fnc_request_hcATTchop";
fnc_request_hcCAS = compile preprocessFileLineNumbers "functions\supports\fnc_request_hcCAS.sqf";publicVariable "fnc_request_hcCAS";
fnc_request_hcCAP = compile preprocessFileLineNumbers "functions\supports\fnc_request_hcCAP.sqf";publicVariable "fnc_request_hcCAP";
fnc_sitrep_support = compile preprocessFileLineNumbers "functions\supports\fnc_sitrep_support.sqf";publicVariable "fnc_sitrep_support";
fnc_veh_drop = compile preprocessFileLineNumbers "functions\supports\fnc_veh_drop.sqf";publicVariable "fnc_veh_drop";
fnc_helotaxi = compile preprocessFileLineNumbers "functions\supports\taxi\fnc_helotaxi.sqf";publicVariable "fnc_helotaxi";
fnc_mapclickhelo = compile preprocessFileLineNumbers "functions\supports\taxi\fnc_mapclickhelo.sqf";publicVariable "fnc_mapclickhelo";
fnc_boattaxi = compile preprocessFileLineNumbers "functions\supports\taxi\fnc_boattaxi.sqf";publicVariable "fnc_boattaxi";
fnc_mapclickboat = compile preprocessFileLineNumbers "functions\supports\taxi\fnc_mapclickboat.sqf";publicVariable "fnc_mapclickboat";
fnc_taxi_music = compile preprocessFileLineNumbers "functions\supports\taxi\fnc_taxi_music.sqf";publicVariable "fnc_taxi_music";


// MISC FUNCTIONS
fnc_moreUrban_locations = compile preprocessFileLineNumbers "functions\misc\fnc_moreUrban_locations.sqf";publicVariable "fnc_moreUrban_locations";
fnc_hc_init = compile preprocessFileLineNumbers "functions\misc\fnc_hc_init.sqf";publicVariable "fnc_hc_init";
fnc_player_faction_loadout = compile preprocessFileLineNumbers "functions\misc\fnc_player_faction_loadout.sqf";publicVariable "fnc_player_faction_loadout";
fnc_zones_bonus = compile preprocessFileLineNumbers "functions\misc\fnc_zones_bonus.sqf";publicVariable "fnc_zones_bonus";
fnc_kndr_unit_markers = compile preprocessFileLineNumbers "functions\misc\fnc_kndr_unit_markers.sqf";publicVariable "fnc_kndr_unit_markers";
fnc_player_markers = compile preprocessFileLineNumbers "functions\misc\fnc_player_markers.sqf";publicVariable "fnc_player_markers";
fnc_earplugs = compile preprocessFileLineNumbers "functions\misc\fnc_earplugs.sqf";publicVariable "fnc_earplugs";
fnc_duws_help = compile preprocessFileLineNumbers "functions\misc\fnc_duws_help.sqf";publicVariable "fnc_duws_help";
fnc_bottom_right_message = compile preprocessFileLineNumbers "functions\misc\fnc_bottom_right_message.sqf";publicVariable "fnc_bottom_right_message";
fnc_autoSave = compile preprocessFileLineNumbers "functions\misc\fnc_autoSave.sqf";publicVariable "fnc_autoSave";
fnc_ai_rearm = compile preprocessFileLineNumbers "functions\misc\fnc_ai_rearm.sqf";publicVariable "fnc_ai_rearm";
fnc_playerTF_spawn = compile preprocessFileLineNumbers "functions\misc\fnc_playerTF_spawn.sqf";publicVariable "fnc_playerTF_spawn";
fnc_sideChat_filter = compile preprocessFileLineNumbers "functions\misc\fnc_sideChat_filter.sqf";publicVariable "fnc_sideChat_filter";
fnc_sitrep_display = compile preprocessFileLineNumbers "functions\misc\fnc_sitrep_display.sqf";publicVariable "fnc_sitrep_display";
fnc_fill_ammobox = compile preprocessFileLineNumbers "functions\misc\fnc_fill_ammobox.sqf";publicVariable "fnc_fill_ammobox";
fnc_delete_napalm = compile preprocessFileLineNumbers "functions\misc\fnc_delete_napalm.sqf";publicVariable "fnc_delete_napalm";

// WARCOM FUNCTIONS
fnc_WARCOM_mapclick_assault = compile preprocessFileLineNumbers "functions\WARCOM\fnc_WARCOM_mapclick_assault.sqf";publicVariable "fnc_WARCOM_mapclick_assault";

// OPERATOR FUNCTIONS
switch (VERSION_X) do {
	case "MODERN": {
		fnc_lbselected = compile preprocessFileLineNumbers "operative\modern\fnc_lbselected.sqf";publicVariable "fnc_lbselected";
		fnc_operative_mission_complete = compile preprocessFileLineNumbers "operative\modern\fnc_operative_mission_complete.sqf";publicVariable "fnc_operative_mission_complete";
		fnc_operator_init = compile preprocessFileLineNumbers "operative\modern\fnc_operator_init.sqf";publicVariable "fnc_operator_init";
		fnc_operator_open = compile preprocessFileLineNumbers "operative\modern\fnc_operator_open.sqf";publicVariable "fnc_operator_open";
		fnc_operator_recruit = compile preprocessFileLineNumbers "operative\modern\fnc_operator_recruit.sqf";publicVariable "fnc_operator_recruit";
	};
	case "WW2": {
		fnc_lbselected = compile preprocessFileLineNumbers "operative\ww2\fnc_lbselected.sqf";publicVariable "fnc_lbselected";
		fnc_operative_mission_complete = compile preprocessFileLineNumbers "operative\ww2\fnc_operative_mission_complete.sqf";publicVariable "fnc_operative_mission_complete";
		fnc_operator_init = compile preprocessFileLineNumbers "operative\ww2\fnc_operator_init.sqf";publicVariable "fnc_operator_init";
		fnc_operator_open = compile preprocessFileLineNumbers "operative\ww2\fnc_operator_open.sqf";publicVariable "fnc_operator_open";
		fnc_operator_recruit = compile preprocessFileLineNumbers "operative\ww2\fnc_operator_recruit.sqf";publicVariable "fnc_operator_recruit";
	};
	case "VIETNAM": {
		fnc_lbselected = compile preprocessFileLineNumbers "operative\vietnam\fnc_lbselected.sqf";publicVariable "fnc_lbselected";
		fnc_operative_mission_complete = compile preprocessFileLineNumbers "operative\vietnam\fnc_operative_mission_complete.sqf";publicVariable "fnc_operative_mission_complete";
		fnc_operator_init = compile preprocessFileLineNumbers "operative\vietnam\fnc_operator_init.sqf";publicVariable "fnc_operator_init";
		fnc_operator_open = compile preprocessFileLineNumbers "operative\vietnam\fnc_operator_open.sqf";publicVariable "fnc_operator_open";
		fnc_operator_recruit = compile preprocessFileLineNumbers "operative\vietnam\fnc_operator_recruit.sqf";publicVariable "fnc_operator_recruit";
	};
};
