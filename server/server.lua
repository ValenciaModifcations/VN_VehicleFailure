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

    local success = player.deductMoney("cash", math.floor(amount))

    if success then
        -- Trigger a success notification directly on the server side
        player.notify({
            title = "Payment Successful",
            description = "Charged: $" .. string.format("%.2f", amount) .. " for repair. Your vehicle is now repaired.",
            type = "success",
            duration = 8000,
            position = "bottom"
        })
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

-- Notify the player when they can't afford to fix the car.
RegisterServerEvent('vn:insufficientFunds')
AddEventHandler('vn:insufficientFunds', function(src, newCost, playerCash)
    local player = NDCore.getPlayer(src)
    player.notify({
        title = "Insufficient Funds",
        description = "The Mechanic refuses to fix your vehicle! You need money, services aren't free! You need $" .. string.format("%.2f", newCost - playerCash) .. " more.",
        type = "error",
        duration = 8000,
        position = "bottom"
    })
end)

RegisterCommand("repair", function(source, args, rawCommand)
    TriggerClientEvent('vn:combinedRepair', source)
end, false)
