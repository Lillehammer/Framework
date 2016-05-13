/*         
            file: fn_robShops2.sqf
            Author: MrKraken
            Made from MrKrakens bare-bones shop robbing tutorial on www.altisliferpg.com forums
            Description:
            Executes the rob shob action!
            Idea developed by PEpwnzya v2.0
            
*/ 
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip"];

_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_action = [_this,2] call BIS_fnc_param;

if !(alive _robber) exitWith {};
_rip = true;
_kassa = 15000 + round(random 30000);

[[_shop,_robber,_action,-1],"TON_fnc_shopState",false,false] spawn life_fnc_MP;

_chance = random(100);

if(_chance >= 25) then { hint "Die Alarmanlage hat die Polizei informiert!"; [[0,format["ALARM! - %1 wird ausgeraubt!", _shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; };

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Es wird ausgeraubt, bleib in der Nähe (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0;
if(_rip) then
{
    while{true} do
    {
        sleep 3;
		
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format["Es wird ausgeraubt, bleib in der Nähe (%1%2)...",round(_cP * 100),"%"];
        if(_cP >= 1) exitWith {};
        if(_robber distance _shop > 5) exitWith {};
        if!(alive _robber) exitWith {};
		if(_robber getVariable ["restrained",false]) exitWith {};
        
    }; // the loop continues til the progressbar is full, distance is exceeded or robber dies. 
    if!(alive _robber) exitWith { _rip = false; };
    if(_robber distance _shop > 5) exitWith { hint "Du warst zu weit weg! - Hier kannst du nicht mehr ausrauben."; 5 cutText ["","PLAIN"]; _rip = false; };
    5 cutText ["","PLAIN"];
    titleText[format["Du hast %1 geklaut, nichts wie weg hier, die Cops sind auf dem Weg!",[_kassa] call life_fnc_numberText],"PLAIN"];
    life_cash = life_cash + _kassa; 
    _rip = false;
    life_use_atm = false;
    sleep (60 + random(180)); //Clerk in the store takes between 60-240 seconds before he manages to warn the police about the robbery.
    life_use_atm = true; // Robber can not use the ATM at this point.
    if!(alive _robber) exitWith {};
    [[0,format["112 - %1 hat %2 ausgeraubt: $%3 gestohlen.",name _robber, _shop, [_kassa] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
    [[0,format["NEWS: %1 wurde gerade ausgeraubt: $%2 gestohlen.", _shop, [_kassa] call life_fnc_numberText]],"life_fnc_broadcast",civilian,false] spawn life_fnc_MP;
    [[getPlayerUID _robber,name _robber,"211A"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP; 
};
[[_shop,_robber,_action,0],"TON_fnc_shopState",false,false] spawn life_fnc_MP;