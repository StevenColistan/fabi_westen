ESX = exports["es_extended"]:getSharedObject()
local aktiv = false



ESX.RegisterUsableItem('bulletproof', function (source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerPed = GetPlayerPed(xPlayer.source)
    local model = GetEntityModel(playerPed)

    if xPlayer.hasItem("bulletproof", 1) then
        if not aktiv then
            xPlayer.triggerEvent("fabi_weste:finish")
            aktiv = true
            if model == GetHashKey("mp_m_freemode_01") then
                Wait(5000)
                aktiv = false
                if not Config.Clothing[xPlayer.job.name] then
                    SetPedComponentVariation(playerPed, 9, 10, 1, 2)
                    xPlayer.removeInventoryItem('bulletproof', 1)
                    SetPedArmour(xPlayer.source, 100)
                    TriggerClientEvent('brutal_notify:SendAlert', xPlayer.source, 'Weste', 'Du hast dir eine Schutzweste angezogen.', 5000, 'success')
                else
                    SetPedComponentVariation(playerPed, 9, Config.Clothing[xPlayer.job.name]["clothes"]["M"]["bproof_1"], Config.Clothing[xPlayer.job.name]["clothes"]["M"]["bproof_2"], 2)
                    xPlayer.removeInventoryItem('bulletproof', 1)
                    SetPedArmour(xPlayer.source, 100)
                    TriggerClientEvent('brutal_notify:SendAlert', xPlayer.source, 'Weste', 'Du hast dir eine Schutzweste angezogen.', 5000, 'success')
                end

            elseif model == GetHashKey("mp_f_freemode_01") then
                Wait(5000)
                aktiv = false
                if not Config.Clothing[xPlayer.job.name] then
                    SetPedComponentVariation(playerPed, 9, 6, 1, 2)
                    xPlayer.removeInventoryItem('bulletproof', 1)
                    SetPedArmour(xPlayer.source, 100)
                    TriggerClientEvent('brutal_notify:SendAlert', xPlayer.source, 'Weste', 'Du hast dir eine Schutzweste angezogen.', 5000, 'success')
                else
                    SetPedComponentVariation(playerPed, 9, Config.Clothing[xPlayer.job.name]["clothes"]["F"]["bproof_1"], Config.Clothing[xPlayer.job.name]["clothes"]["F"]["bproof_2"], 2)
                    xPlayer.removeInventoryItem('bulletproof', 1)
                    SetPedArmour(xPlayer.source, 100)
                    TriggerClientEvent('brutal_notify:SendAlert', xPlayer.source, 'Weste', 'Du hast dir eine Schutzweste angezogen.', 5000, 'success')
                end

            else 
                TriggerClientEvent('brutal_notify:SendAlert', xPlayer.source, 'Weste', 'Du kannst in dem Ped keine Weste ziehen.', 5000, 'error')
            end
        else    
            TriggerClientEvent('brutal_notify:SendAlert', xPlayer.source, 'Weste', 'Du kannst nur eine Weste gleichzeitig Ziehen!', 5000, 'error')
        end 
    else
        TriggerClientEvent('brutal_notify:SendAlert', xPlayer.source, 'Weste', 'Du hast keine Schutzwesten mehr!', 5000, 'error')
    end
end)

RegisterNetEvent('fabi_weste:ziehen')
AddEventHandler('fabi_weste:ziehen', function()
    local playerPed = GetPlayerPed(source)
    local model = GetEntityModel(playerPed)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.hasItem("bulletproof", 1) then
        if not aktiv then
            xPlayer.triggerEvent("fabi_weste:finish")
            aktiv = true
            if model == GetHashKey("mp_m_freemode_01") then
                Wait(5000)
                aktiv = false
                if not Config.Clothing[xPlayer.job.name] then
                    SetPedComponentVariation(playerPed, 9, 10, 1, 2)
                    xPlayer.removeInventoryItem('bulletproof', 1)
                    SetPedArmour(xPlayer.source, 100)
                    TriggerClientEvent('brutal_notify:SendAlert', xPlayer.source, 'Weste', 'Du hast dir eine Schutzweste angezogen.', 5000, 'success')
                else
                    SetPedComponentVariation(playerPed, 9, Config.Clothing[xPlayer.job.name]["clothes"]["M"]["bproof_1"], Config.Clothing[xPlayer.job.name]["clothes"]["M"]["bproof_2"], 2)
                    xPlayer.removeInventoryItem('bulletproof', 1)
                    SetPedArmour(xPlayer.source, 100)
                    TriggerClientEvent('brutal_notify:SendAlert', xPlayer.source, 'Weste', 'Du hast dir eine Schutzweste angezogen.', 5000, 'success')
                end

            elseif model == GetHashKey("mp_f_freemode_01") then
                Wait(5000)
                aktiv = false
                if not Config.Clothing[xPlayer.job.name] then
                    SetPedComponentVariation(playerPed, 9, 6, 1, 2)
                    xPlayer.removeInventoryItem('bulletproof', 1)
                    SetPedArmour(xPlayer.source, 100)
                    TriggerClientEvent('brutal_notify:SendAlert', xPlayer.source, 'Weste', 'Du hast dir eine Schutzweste angezogen.', 5000, 'success')
                else
                    SetPedComponentVariation(playerPed, 9, Config.Clothing[xPlayer.job.name]["clothes"]["F"]["bproof_1"], Config.Clothing[xPlayer.job.name]["clothes"]["F"]["bproof_2"], 2)
                    xPlayer.removeInventoryItem('bulletproof', 1)
                    SetPedArmour(xPlayer.source, 100)
                    TriggerClientEvent('brutal_notify:SendAlert', xPlayer.source, 'Weste', 'Du hast dir eine Schutzweste angezogen.', 5000, 'success')
                end

            else 
                TriggerClientEvent('brutal_notify:SendAlert', xPlayer.source, 'Weste', 'Du kannst in dem Ped keine Weste ziehen.', 5000, 'error')
            end
        else    
            TriggerClientEvent('brutal_notify:SendAlert', xPlayer.source, 'Weste', 'Du kannst nur eine Weste gleichzeitig Ziehen!', 5000, 'error')
        end 
    else
        TriggerClientEvent('brutal_notify:SendAlert', xPlayer.source, 'Weste', 'Du hast keine Schutzwesten mehr!', 5000, 'error')
    end
end)

------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------MEDIKIT------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------


ESX.RegisterUsableItem('medikit', function (source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerPed = GetPlayerPed(xPlayer.source)
    local model = GetEntityModel(playerPed)

    if xPlayer.hasItem("medikit", 1) then
        if not aktiv then
        xPlayer.triggerEvent("fabi_medi:finish")
            aktiv = true
            Wait(5000)
            aktiv = false
            xPlayer.removeInventoryItem('medikit', 1)
            TriggerClientEvent('brutal_notify:SendAlert', xPlayer.source, 'Medikit', 'Du hast ein Medikit benutzt.', 5000, 'success')
        else    
            TriggerClientEvent('brutal_notify:SendAlert', xPlayer.source, 'Medikit', 'Du kannst nur ein Medikit gleichzeitig Ziehen!', 5000, 'error')
        end 
    else
        TriggerClientEvent('brutal_notify:SendAlert', xPlayer.source, 'Medikit', 'Du hast keine Medikits mehr!', 5000, 'error')
    end
end)

RegisterNetEvent('fabi_medikit:ziehen')
AddEventHandler('fabi_medikit:ziehen', function()
    local playerPed = GetPlayerPed(source)
    local model = GetEntityModel(playerPed)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.hasItem("medikit", 1) then
        if not aktiv then
        xPlayer.triggerEvent("fabi_medi:finish")
            aktiv = true
            Wait(5000)
            aktiv = false
            xPlayer.removeInventoryItem('medikit', 1)
            TriggerClientEvent('brutal_notify:SendAlert', xPlayer.source, 'Medikit', 'Du hast ein Medikit benutzt.', 5000, 'success')
        else    
            TriggerClientEvent('brutal_notify:SendAlert', xPlayer.source, 'Medikit', 'Du kannst nur ein Medikit gleichzeitig Ziehen!', 5000, 'error')
        end 
    else
        TriggerClientEvent('brutal_notify:SendAlert', xPlayer.source, 'Medikit', 'Du hast keine Medikits mehr!', 5000, 'error')
    end
end)