if Shared.UseESX == true then
    ESX = exports["es_extended"]:getSharedObject()
end

local interactions = {}

AddEventHandler('onClientResourceStop', function (resourceName)
    interactions[resourceName] = nil
end)

CreateThread(function()

	RequestStreamedTextureDict('texture', 'e-key', 0, 0, 0.021, 0.021, 0, 255, 255,255, 100, true)
    RequestStreamedTextureDict('shared', 'emptydot_32', 0, 0, 0.021, 0.021, 0, 255, 255,255, 255, true)

    local text_scale = Shared.TextScale
    local circlecolor = Shared.CircleColor

    while true do
        local sleep = true
        if next(interactions, nil) == nil then Wait(2000) else
            for index, v in pairs(interactions) do
                for ix, value in ipairs(v) do
                local coords = nil

                if value.coords ~= nil then 
                    coords = value.coords
                elseif value.entity ~= nil then
                    coords = GetEntityCoords(value.entity)
                end

                if value.job == nil or ESX.GetPlayerData().job.name == value.job and Shared.UseESX == true then

                if value.canInteract == nil or value.canInteract() == true then

                local pcoords = GetEntityCoords(PlayerPedId())
                local dist = #(vec3(coords[1], coords[2], coords[3]) - pcoords)
                local meters = math.ceil(dist * 1)
                local onScreen, screenX, screenY = GetScreenCoordFromWorldCoord(coords[1], coords[2], coords[3] + 0.5)
        
                if meters <= Shared.DrawDistance then
                    sleep = false
                    DrawSprite('shared', 'emptydot_32', screenX, screenY + 0.1, 0.021, 0.030, 0, circlecolor[1], circlecolor[2], circlecolor[3], 500)
                    ClearDrawOrigin()
        
                    if meters <= Shared.InteractionDistance then
                        DrawSprite('texture', 'e-key', screenX, screenY - 0.020, 0.021, 0.030, 0, 255, 255, 255, 255)
                        SetTextCentre(true)
                        SetTextScale(0.0, text_scale)
                        SetTextEntry("STRING")
                        AddTextComponentString(value.label)
                        DrawText(screenX, screenY)
                        circlecolor = Shared.ActiveCircleColor
        
                        if IsControlJustPressed(0, 38) then
                            value.action()
                        end
                    else
                        circlecolor = Shared.CircleColor
                    end
                end
                else
                end
            end
        end
            end
        end
            Wait(0)
            if sleep then Wait(1000) end
    end

end)



exports('createInteraction', function(tabela)

    if interactions[GetInvokingResource()] == nil then interactions[GetInvokingResource()] = {} end
    table.insert(interactions[GetInvokingResource()], tabela)

end)

exports('removeEntity', function(entity)
    for _, v in pairs(interactions) do
        for i, w in pairs(interactions[_]) do
            if w.entity == entity then
                table.remove(interactions[_], i)
            end
        end
    end
end)


exports('removeInteraction', function(coords)
    for _, v in pairs(interactions) do
        for i, w in pairs(interactions[_]) do
            if w.coords == coords then
                table.remove(interactions[_], i)
            end
        end
    end
end)



-- -- Used in preview

-- local test = false

-- RegisterCommand('odblokujInterakcje' ,function ()
--     test = true
-- end)

-- CreateThread(function ()
--     NPC = CreatePed(0, 'mp_m_freemode_01', -332.98352050781, -1514.1364746094, 26.569173812866, 182.41575622559, false, false)
--     FreezeEntityPosition(NPC, true)
--     SetEntityInvincible(NPC, true)
--     SetBlockingOfNonTemporaryEvents(NPC, true)
--     TaskStartScenarioInPlace(NPC,'WORLD_HUMAN_STAND_IMPATIENT', 0, false)

--     Item = CreateObject('prop_cementmixer_01a', -329.19607543945, -1514.3118896484, 27.562559127808 -0.95, 30.77030944824, true, true, true)
--     PlaceObjectOnGroundProperly(Item)
--     SetEntityInvincible(Item)
--     SetEntityAsMissionEntity(Item, true, true)

--     exports['shx_interactions']:createInteraction(
--         {
--             entity = Item,
--             action = function ()
--                 TriggerEvent('esx:showNotification', 'Mieszaj Beton')
--             end,
--             label = 'Mieszkaj Beton',
--             canInteract = function ()
--                 return test
--             end
--         }
--     )

--     exports['shx_interactions']:createInteraction(
--         {
--             entity = NPC,
--             action = function ()
--                 TriggerEvent('esx:showNotification', 'Powinno usunąć')
--                 exports['shx_interactions']:removeEntity(NPC)
--             end,
--             label = 'Porozmawiaj',
--         }
--     )

--     exports['shx_interactions']:createInteraction(
--         {
--             coords = {-324.62585449219, -1514.4627685547, 27.56467628479, 293.38525390625},
--             action = function ()
--                 TriggerEvent('esx:showNotification', 'I co?')
--             end,
--             label = 'Tutaj nic nie ma',
--             job = 'police'
--         }
--     )
-- end)