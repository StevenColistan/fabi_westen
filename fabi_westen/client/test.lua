local isSpeedSet = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		
		while not IsPedInAnyVehicle(PlayerPedId(), false)
		do
			Citizen.Wait(2500)
		end

		local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local currentSpeed = GetEntitySpeed(vehicle)
		local vehHash = GetVehicleClassFromName(vehicle)

		if (currentSpeed == 0) then
			Citizen.Wait(2000)
		end

		if vehicle ~= nil then
			isSpeedSet = false
			setSpeed(vehicle)
			print("Auto:" ..vehHash)
		end
		
		while isSpeedSet and IsPedInAnyVehicle(PlayerPedId(), false)
		do
			local currentVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			if currentVeh ~= vehicle then
				setSpeed(currentVeh)
			end
			Citizen.Wait(2500)
		end
	end
end)

function setSpeed(vehicle)
	local vehName = GetVehicleClassFromName(vehicle)
	print("11111")
	print(vehicle)
	if (Config.vehHash == vehicle) then
		print(22222)
		local speed = Config.maxSpeed;

		speed = Config.vehHash[vehName].maxSpeed;
		print(speed)
		if Config.kmh then
			speed = speed / Config.kmhValue
		else
			speed = speed / Config.mphValue
		end

		SetVehicleMaxSpeed(vehicle, speed)
		isSpeedSet = true
	end
end
