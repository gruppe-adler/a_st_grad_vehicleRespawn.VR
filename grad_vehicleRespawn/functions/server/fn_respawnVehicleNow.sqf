params ["_classname", "_pos", "_dir", "_minTime", "_countLeft", "_forced"];

_vehicle = createVehicle [_classname, [0,0,0], [], 0, "CAN_COLLIDE"];
_vehicle setPos _pos;
_vehicle setDir _dir;

clearWeaponCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

if (_countLeft > 0) then {
    [_vehicle, _minTime, _countLeft, _forced] call GRAD_vehicleRespawn_fnc_addVehicleToRespawn;
} else {
    diag_log format ["GRAD_vehicleRespawnVehicles: no more vehicles for : %1", _classname];
};
