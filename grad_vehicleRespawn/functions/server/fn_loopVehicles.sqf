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
    if (!isNull _vehicle && {!canMove _vehicle} || {!alive _vehicle} || {_forced}) then {

        if (_initialTime + _minTime < CBA_missionTime && {[_vehicle] call GRAD_vehicleRespawn_fnc_isSpawnFree}) then {
            [typeOf _vehicle, _pos, _dir, _minTime, _countLeft - 1] call GRAD_vehicleRespawn_fnc_respawnVehicleNow;
            GRAD_vehicleRespawnVehicles deleteAt _forEachIndex;
        };
    };

    hintSilent format ["time to respawn: %1, current time: %2", _initialTime + _minTime, CBA_missionTime];
    // hintsilent format ["GRAD_vehicleRespawnVehicles : %1", GRAD_vehicleRespawnVehicles];

  } forEach GRAD_vehicleRespawnVehicles;

}, 5, []] call CBA_fnc_addPerFrameHandler;