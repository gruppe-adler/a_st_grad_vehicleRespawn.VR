params ["_vehicle", "_pos"];

private _return = true;
private _nearVehiclesOfSame = nearestObjects [_pos, [typeOf _vehicle], (sizeOf typeOf _vehicle), true];

hintsilent format ["found vehicles %1", _nearVehiclesOfSame];

if (count _nearVehiclesOfSame > 0) then {
	{
		if (!alive _x) then { 
			deleteVehicle _x; 
		} else { 
			_return = false; 
		};
	} forEach _nearVehiclesOfSame;
};

_return