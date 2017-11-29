params ["_vehicle", "_minTime", "_count", "_forced"];

// safety net
if (!isServer) exitWith {};

private _pos = getPos _vehicle;
private _dir = getDir _vehicle;
private _initialTime = CBA_missionTime;

if (isNil "GRAD_vehicleRespawnVehicles") then {
	GRAD_vehicleRespawnVehicles = [];
	GRAD_vehicleRespawnVehicles append [[_vehicle, _pos, _dir, _initialTime, _minTime, _count, _forced]];
} else {
	GRAD_vehicleRespawnVehicles append [[_vehicle, _pos, _dir, _initialTime, _minTime, _count, _forced]];
};


diag_log format ["GRAD_vehicleRespawnVehicles: %1", GRAD_vehicleRespawnVehicles];