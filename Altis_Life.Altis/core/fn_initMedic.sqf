#include "..\script_macros.hpp"
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((FETCH_CONST(life_medicLevel)) < 1 && (FETCH_CONST(life_adminlevel) == 0)) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};

if(EQUAL(LIFE_SETTINGS(getNumber,"allow_medic_weapons"),0)) then
{
	[] spawn
	{
		while {true} do
		{
			waitUntil {sleep 3; currentWeapon player != ""};
			removeAllWeapons player;
		};
	};
};

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] spawn life_fnc_IntroCam;

//
// BACKPACKS
//
[] spawn {
	while {true} do {
		waitUntil {backpack player == "B_Kitbag_sgg"};
		(unitBackpack player) setObjectTextureGlobal [0, "#(rgb,8,8,3)color(1,0,0,1)"];
		waitUntil {backpack player != "B_Kitbag_sgg"};
	};
};

[] spawn {
	while {true} do {
		waitUntil {backpack player == "B_Kitbag_cbr"};
		(unitBackpack player) setObjectTextureGlobal [0, "#(rgb,8,8,3)color(1,1,0,1)"];
		waitUntil {backpack player != "B_Kitbag_cbr"};
	};
};

[] spawn {
	while {true} do {
		waitUntil {backpack player == "B_Carryall_oucamo"};
		(unitBackpack player) setObjectTextureGlobal [0, "#(rgb,8,8,3)color(1,1,1,1)"];
		waitUntil {backpack player != "B_Carryall_oucamo"};
	};
};

//
// UNIFORMS
//
[] spawn {
	while {true} do {
		waitUntil {uniform player == "U_B_HeliPilotCoveralls"};
		player setObjectTextureGlobal [0, "textures\clothing\med\adac_uniform.jpg"];
		waitUntil {uniform player != "U_B_HeliPilotCoveralls"};
	};
};

[] execVM "IgiLoad\IgiLoadInit.sqf";

[] execVM "custom\scripts\depleteVehicleFuel.sqf";