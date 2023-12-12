------------------------------------------
--	iEnsomatic RealisticVehicleFailure  --
------------------------------------------
--
--	Created by Jens Sandalgaard modified/ modernized by Josh F and Shawn V
--
--	This work is licensed by Valencia Networks
--
--	OG Credit: https://github.com/iEns/RealisticVehicleFailure
--

RegisterNetEvent("VN_Repair:pay", function(amount)
    local src = source
    local player = NDCore.getPlayer(src)

    if player.cash >= math.floor(amount) then
        local success = player.deductMoney("cash", math.floor(amount))

        if success then
            -- Trigger a success notification directly on the server side
            player.notify({
                title = "Payment Successful",
                description = "Charged: $" .. string.format("%.2f", amount) .. " for repair.",
                type = "success",
                duration = 8000,
                position = "bottom"
            })
        else
            -- Trigger an error notification directly on the server side
            player.notify({
                title = "Error",
                description = "An error occurred during payment. Please try again.",
                type = "error",
                duration = 8000,
                position = "bottom"
            })
        end
    else
        -- Trigger an error notification directly on the server side
        player.notify({
            title = "Insufficient Funds",
            description = "The Mechanic refuses to fix your vehicle! You need money, services aren't free!",
            type = "error",
            duration = 8000,
            position = "bottom"
        })
    end
end)

AddEventHandler('chatMessage', function(source, _, message)
	local msg = string.lower(message)
	local identifier = GetPlayerIdentifiers(source)[1]
	if msg == "/repair" then
		CancelEvent()
		TriggerClientEvent('vn:repair', source)
	end
end)

AddEventHandler('chatMessage', function(source, _, message)
	local msg = string.lower(message)
	local identifier = GetPlayerIdentifiers(source)[1]
	if msg == "/mrepair" then
		CancelEvent()
		TriggerClientEvent('vn:mechanic', source)
	end
end)

-- Notify the player when they cant afford to fix the car.
RegisterServerEvent('vn:insufficientFunds')
AddEventHandler('vn:insufficientFunds', function(src)
    local player = NDCore.getPlayer(src)
    player.notify({
        title = "Insufficient Funds",
        description = "The Mechanic refuses to fix your vehicle! You need money, services aren't free! You need $" .. string.format("%.2f", newCost - playerCash) .. " more.",
        type = "error",
        duration = 8000,
        position = "bottom"
    })
end)
