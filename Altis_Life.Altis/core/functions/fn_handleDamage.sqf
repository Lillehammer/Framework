#include "..\..\script_macros.hpp"
/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep"];
_unit = SEL(_this,0);
_part = SEL(_this,1);
_damage = SEL(_this,2);
_source = SEL(_this,3);
_projectile = SEL(_this,4);

if(!isNull _source) then {
	if(_source != _unit) then {
		_curWep = currentWeapon _source;

		//
		// tazer pistol
		//
		if(_curWep == "hgun_P07_snds_F") then {
			private["_distance"];
			_distance = 35;
			
			_damage = false;
			
			if(_unit distance _source < _distance) then {
				if(!life_istazed && !life_isknocked && !(_unit GVAR ["restrained",false])) then {
					if (vehicle player != player) then {
						if (typeOf (vehicle player) == "B_Quadbike_01_F") then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
						};
					} else {
						[_unit,_source] spawn life_fnc_tazed;
					};
				};
			};
		};
		
		//
		// Stun rifle
		//
		if(_curWep == "srifle_DMR_06_olive_F") then {
			private["_distance"];
			_distance = 350;
			
			_damage = false;
			
			if(_unit distance _source < _distance) then {
				if(!life_istazed && !life_isknocked && !(_unit GVAR ["restrained",false])) then {
					if (vehicle player != player) then {
						if (typeOf (vehicle player) == "B_Quadbike_01_F") then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_stunned;
						};
					} else {
						[_unit,_source] spawn life_fnc_stunned;
					};
				};
			};
		};
	};
};

[] call life_fnc_hudUpdate;
_damage;
