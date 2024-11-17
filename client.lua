local locations = {
    {
        entry = vector3(0.0, 0.0, 0.0), -- Change this to your desired entry coordinates
        exit = vector3(0.0, 0.0, 0.0), -- Change this to your desired exit coordinates
        headingEnter = 0.0, -- Change this to your desired heading when entering
        headingExit = 0.0,     -- Change this to your desired heading when exiting
        name = "Hidden Location" -- Change this to whatever name u want
    },
    {
        entry = vector3(0.0, 0.0, 0.0),    -- Change this to your desired entry coordinates
        exit = vector3(0.0, 0.0, 0.0),   -- Change this to your desired exit coordinates
        headingEnter = 0.0,  -- Change this to your desired heading when entering
        headingExit = 0.0,    -- Change this to your desired heading when exiting
        name = "Hidden Location" -- Change this to whatever name u want
    },
    --[[
    {
        entry = vector3(0.0, 0.0, 0.0),   -- Change this to your desired entry coordinates
        exit = vector3(0.0, 0.0, 0.0),  -- Change this to your desired exit coordinates
        headingEnter = 45.0,   -- Change this to your desired heading when entering
        headingExit = 225.0     -- Change this to your desired heading when exiting
    }
    ]]-- Add more locations here as needed
}


for i, location in ipairs(locations) do
    exports['ox_target']:addBoxZone({
        coords = location.entry,
        size = vec3(1, 1, 2), -- Adjust the size (x, y, z)
        rotation = 0,
        debug = false,
        options = {
            {
                name = 'enter_location_' .. i, -- Unique name for each entry point
                icon = 'fas fa-door-open',
                label = 'Enter Location ',
                onSelect = function(data)
                    TriggerEvent('faded:enterLocation', i) -- Trigger the event to enter the location with index
                end
            }
        }
    })

    exports['ox_target']:addBoxZone({
        coords = location.exit,
        size = vec3(1, 1, 2), -- Adjust the size (x, y, z)
        rotation = 0,
        debug = false,
        options = {
            {
                name = 'exit_location_' .. i, -- Unique name for each exit point
                icon = 'fas fa-door-closed',
                label = 'Exit Location ',
                onSelect = function(data)
                    TriggerEvent('faded:exitLocation', i) -- Trigger the event to exit the location with index
                end
            }
        }
    })
end


RegisterNetEvent('faded:enterLocation', function(index)
    local playerPed = PlayerPedId()
    local location = locations[index]

    SetEntityCoords(playerPed, location.exit.x, location.exit.y, location.exit.z, false, false, false, true)
    SetEntityHeading(playerPed, location.headingEnter)
    TriggerEvent('QBCore:Notify', "You entered " .. location.name, 'success')
end)


RegisterNetEvent('faded:exitLocation', function(index)
    local playerPed = PlayerPedId()
    local location = locations[index]

    SetEntityCoords(playerPed, location.entry.x, location.entry.y, location.entry.z, false, false, false, true)
    SetEntityHeading(playerPed, location.headingExit)
    TriggerEvent('QBCore:Notify', "You exited " .. location.name, 'success')
end)
