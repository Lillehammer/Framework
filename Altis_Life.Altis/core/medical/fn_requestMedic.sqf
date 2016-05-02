#include "..\..\script_macros.hpp"
/*
	File: fn_requestMedic.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	N/A
*/
private "_medicsOnline","_Timer";
_medicsOnline = {_x != player && {side _x == independent} && {alive _x}} count playableUnits > 0; //Check if medics (indep) are in the room.

life_corpse SVAR ["Revive",false,true]; //Set the corpse to a revivable state.
if(_medicsOnline) then {
	//There is medics let's send them the request.
	[life_corpse,profileName] remoteExecCall ["life_fnc_medicRequest",independent];

	_Timer = ((findDisplay 7300) displayCtrl 7301);
	_Timer ctrlSetText localize"STR_Medic_RespawnWait";
	
	[] spawn  {
		((findDisplay 7300) displayCtrl 7302) ctrlEnable false;
		sleep (300);
		((findDisplay 7300) displayCtrl 7302) ctrlEnable true;
	};
};

[] spawn  {
	((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
	sleep (20);
	((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
};
