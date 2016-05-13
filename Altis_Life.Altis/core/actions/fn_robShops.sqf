/*
    Raub Anfrage an den Server 
*/
private["_shop","_robber"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_action = [_this,2] call BIS_fnc_param;

if(isNull _shop OR isNull _robber) exitWith {};

if(side _robber != civilian) exitWith { hint "So gehts aber nich!" }; 

if (vehicle player != _robber) exitWith { hint "Steig erstmal aus bevor Du ausraubst!" };

if (currentWeapon _robber == "") exitWith { hint "Nicht ohne Waffe Du Scherzbold." }; 

if(_robber distance _shop > 3) exitWith { hint "Du bist zu weit weg!" };

[[_shop,_robber,_action],"TON_fnc_robShops",false,false] spawn life_fnc_MP; 
