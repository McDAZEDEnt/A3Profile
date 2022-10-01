private["_stopVoices","_magazines","_items","_aItems","_r","_r2","_vests","_uniforms","_masks","_goggles","_hats","_headGear"];
sleep(random 0.3);
if!(local _this)exitWith{};
if(time<10)then{enableSentences false;enableRadio false};

_magazines=magazines _this;
_items=items _this;
_aItems=assignedItems _this;
removeAllItems _this;
removeHeadgear _this;
removeVest _this;
removeUniform _this;
removeGoggles _this;

_vests=[
"V_HarnessO_brn",
"V_HarnessO_gry",
"V_HarnessO_brn",
"V_HarnessO_gry",
"V_TacVest_blk",
"V_TacVest_brn",
"V_TacVest_camo",
"V_TacVest_khk",
"V_TacVest_oli",
"V_TacChestrig_cbr_F",
"V_TacChestrig_grn_F",
"V_TacChestrig_oli_F"
];

_this addVest(selectRandom _vests);

_uniforms=[
"U_B_CombatUniform_mcam_tshirt",
"U_I_G_resistanceLeader_F",
"U_BG_Guerilla2_1",
"U_BG_Guerilla2_3",
"U_B_survival_uniform",
"U_I_E_Uniform_01_sweater_F",
"U_B_CombatUniform_tshirt_mcam_wdL_f",
"U_O_R_Gorka_01_F",
"U_O_R_Gorka_01_brown_F",
"U_O_R_Gorka_01_camo_F",
"U_I_L_Uniform_01_deserter_F",
"U_I_E_Uniform_01_tanktop_F",
"U_I_E_Uniform_01_sweater_F",
"U_I_C_Soldier_Camo_F",
"U_I_C_Soldier_Para_1_F",
"U_I_C_Soldier_Para_4_F",
"U_I_C_Soldier_Para_3_F",
"U_I_C_Soldier_Para_2_F",
"U_O_PilotCoveralls"
];
_uniform="";
while{((uniform _this)=="")}do{
	_count=count _uniforms;
	_uniform=selectRandom _uniforms;
	_this forceAddUniform _uniform;
	sleep 0.1;
};

{_this addItem _x}forEach _items;
{_this addMagazine _x}forEach _magazines;
{_this assignItem _x}forEach _aItems;
//_this unassignItem"NVGoggles_OPFOR";
//_this removeItem"NVGoggles_OPFOR";
enableSentences true;enableRadio true;

if((random 10)>5)exitWith{
	_this addHeadgear(selectRandom ["H_Shemag_olive","H_ShemagOpen_tan","H_ShemagOpen_khk","H_Cap_blk","H_Cap_grn","H_Cap_oli","H_Watchcap_blk","H_Watchcap_khk","H_Booniehat_khk"]);
};

_this addGoggles(selectRandom ["G_Balaclava_oli","G_Balaclava_blk","G_Balaclava_blk","G_Balaclava_blk"]);
