params ["_vehicle"];

private _return = true;
private _nearVehiclesOfSame = nearestObjects [_vehicle, [typeOf _vehicle], (sizeOf typeOf _vehicle)/2, true];

hintsilent format ["found vehicles %1", _nearVehiclesOfSame];

if (count _nearVehiclesOfSame > 0) then {
	_return = false;

	private _vehicleOnSpawn = _nearVehiclesOfSame select 0;

	if ((count crew _vehicleOnSpawn) isEqualTo 0) then {
		deleteVehicle _vehicleOnSpawn;
		_return = true;
	};
};

_return