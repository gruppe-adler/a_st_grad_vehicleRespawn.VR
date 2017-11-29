[{

  {
    // _x params ["_vehicle", "_pos", "_dir", "_initialTime","_minTime", "_countLeft", ,"_forced"];
    
    _vehicle = _x select 0;
    _pos = _x select 1;
    _dir = _x select 2;
    _initialTime = _x select 3;
    _minTime = _x select 4;
    _countLeft = _x select 5;
    _forced = _x select 6;
    

    if (_countLeft < 1) exitWith { diag_log format ["GRAD_vehicleRespawnVehicles: no more vehicles available for : %1", _x]};
    
    private _exists = !isNull _vehicle;
    private _cantMove = canMove _vehicle;
    private _destroyed = alive _vehicle;

    hintSilent format ["%1, %2, %3, %4", _exists, _cantMove, _destroyed, nearestObjects [_pos, [typeOf _vehicle], (sizeOf typeOf _vehicle)/2, true]];
    // hintSilent format ["time to respawn: %1, current time: %2", _initialTime + _minTime, CBA_missionTime];

    if (_exists && CBA_missionTime > 10) then {
        if (_cantMove || _destroyed || _forced) then {
            if (_initialTime + _minTime < CBA_missionTime) then {
                [_vehicle, _pos, _dir, _minTime, _countLeft - 1] call GRAD_vehicleRespawn_fnc_respawnVehicleNow;
            };
        };
    };

  } forEach GRAD_vehicleRespawnVehicles;

}, 1, []] call CBA_fnc_addPerFrameHandler;