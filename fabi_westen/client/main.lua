
RegisterCommand("medikitziehen", function()
    TriggerServerEvent('fabi_medikit:ziehen')
end, false)

RegisterCommand("westeziehen", function()
    TriggerServerEvent('fabi_weste:ziehen')
end, false)

RegisterNetEvent("fabi_weste:finish")
AddEventHandler("fabi_weste:finish", function()
    exports["b-progressbar"]:Progressbar("Weste Ziehen", 5000)
    taskAnimation(Config.Animations.dict, Config.Animations.anim, Config.Animations.time * 1000)
end)

RegisterNetEvent("fabi_medi:finish")
AddEventHandler("fabi_medi:finish", function()
    local playerPed = PlayerPedId()

    exports["b-progressbar"]:Progressbar("Medikit benutzen", 5000)
    taskAnimation(Config.Animations.dict, Config.Animations.anim, Config.Animations.time * 1000)
    TriggerEvent('esx_ambulancejob:heal', 'big', true)
end)

RegisterNetEvent("fabi_weste:giveWeste")
AddEventHandler("fabi_weste:giveWeste", function()
    local playerPed = PlayerPedId()
    local armor = GetPedArmour(playerPed)
    
    print("armor" .. armor)
    if armor == 100 then
        TriggerServerEvent("fabi_weste:givebackweste")
    end
end)


-- AddEventHandler('fabi_weste:anim', function()

--     taskAnimation(Config.Animations.dict, Config.Animations.anim, Config.Animations.time * 1000)
-- end)

taskAnimation = function(dict, anim, time)
    local playerPed = PlayerPedId()
    print(playerPed)

    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end

    -- Freeze the player
    FreezeEntityPosition(playerPed, true)

    -- TaskPlayAnim(playerPed, dict, anim, 8.0, -8, -1, 32, 0, false, false, false) -- Kneeing with loop and uninterruptible
    TaskPlayAnim(playerPed, dict, anim, 8.0, 8.0, time, 1, 1, 0, 0, 0)

    Wait(time)
    ClearPedTasks(playerPed)
    RemoveAnimDict(dict)
    -- Unfreeze the player
    FreezeEntityPosition(playerPed, false)
end


RegisterKeyMapping("medikitziehen", 'Medikit Ziehen', "keyboard", 'PAGEUP')
RegisterKeyMapping("westeziehen", 'Weste Ziehen', "keyboard", 'PAGEDOWN')