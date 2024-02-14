local util = require("util")
local crash_site = require("crash-site")

local modEnabled = true

local function spawn_entity(entity_name, relative_position, center, surface, extra_options, force)
    -- local entity_name = expressions.entity(entity, vars)

    -- if not prototypes[entity_name] then
    --     util.debugprint("entity " .. entity_name .. " does not exist")
    --     return
    -- end

    local recipe
    if extra_options.recipe then
        if not game.recipe_prototypes[extra_options.recipe] then
            util.debugprint("recipe " .. extra_options.recipe .. " does not exist")
        else
            recipe = extra_options.recipe
        end
    end

    local e = surface.create_entity {
        name = entity_name,
        position = {center.x + relative_position.x, center.y + relative_position.y},
        direction = defines.direction[extra_options.dir] or defines.direction.north,
        force = force,
        raise_built = true,
        create_build_effect_smoke = false,
        recipe = recipe
    }
    if extra_options.items then
        local items = {}
        for _, v in pairs(extra_options.items) do
            local name = v[1]

            local count = v[2]

            if count > 0 then
                items[name] = count
            end
        end
        util.insert_safe(e, items)
    end
end

local function clear_area(area, surface)
    -- exclude tiles that we shouldn't spawn on
    if surface.count_tiles_filtered {
        area = area,
        --limit = 10000,
        collision_mask = {"item-layer", "object-layer"}
    } == 0 then
        return false
    end

    for _, entity in pairs(surface.find_entities_filtered({
        area = area,
        -- type = {"resource"},
        invert = true
    })) do
        if (entity.valid) then
            entity.destroy({
                do_cliff_correction = true,
                raise_destroy = true
            })
        end
    end

    return true
end

local function create_roboport(center, surface, player)
    local entities =
    {
        {"substation", {y = 0.5,x = -0.5}, {}},
        {"accumulator", {y = -1.5,x = -0.5}, {}},
        {"accumulator", {y = -1.5,x = 1.5}, {}},
        {"accumulator", {y = 0.5,x = 1.5}, {}},
        {"iron-storage-chest", {y = -2,x = 3},
            {
                items =
                {
                    {"roboport", 5},
                    {"repair-turret", 15},
                    {"electric-mining-drill", 10},
                    {"transport-belt", 100},
                    {"big-electric-pole", 10},
                    {"small-electric-pole", 20},
                    {"power-switch", 5},
                    {"iron-active-provider-chest", 10},
                    {"iron-buffer-chest", 20},
                    {"iron-passive-provider-chest", 50},
                    {"iron-requester-chest", 50},
                    {"iron-storage-chest", 50},
					{"inserter", 50},
					{"stone-furnace", 50}
                }
        }},
        {"iron-storage-chest", {y = -2,x = 4}, {}},
        {"iron-storage-chest", {y = -2,x = 5}, {}},
        {"roboport", {y = -0.5,x = -3.5},
            {
                items =
                {
                    {"early-construction-robot", 20},
                    {"early-logistic-robot", 10},
                    {"repair-pack", 50}
                }
        }},
        {"assembling-machine-1", {y = 0,x = 4}, {}},
        {"inserter", {y = -1,x = 6}, {dir = "west"}},
        {"inserter", {y = 1,x = 6}, {dir = "east"}},
        {"iron-passive-provider-chest", {y = -1,x = 7}, {}},
        {"iron-requester-chest", {y = 1,x = 7}, {}},
        {"solar-panel", {y = 3,x = 6}, {}},
        {"solar-panel", {y = 3,x = 3}, {}},
        {"solar-panel", {y = 3,x = 0}, {}},
        {"solar-panel", {y = 3,x = -3}, {}},
        {"solar-panel", {y = 3,x = -6}, {}},
        {"solar-panel", {y = 6,x = 6}, {}},
        {"solar-panel", {y = 6,x = 3}, {}},
        {"solar-panel", {y = 6,x = 0}, {}},
        {"solar-panel", {y = 6,x = -3}, {}},
        {"solar-panel", {y = 6,x = -6}, {}},
        {"solar-panel", {y = 9,x = 6}, {}},
        {"solar-panel", {y = 9,x = 3}, {}},
        {"solar-panel", {y = 9,x = 0}, {}},
        {"solar-panel", {y = 9,x = -3}, {}},
        {"solar-panel", {y = 9,x = -6}, {}},
        {"solar-panel", {y = -4,x = 6}, {}},
        {"solar-panel", {y = -4,x = 3}, {}},
        {"solar-panel", {y = -4,x = 0}, {}},
        {"solar-panel", {y = -4,x = -3}, {}},
        {"solar-panel", {y = -4,x = -6}, {}},
        {"solar-panel", {y = -7,x = 6}, {}},
        {"solar-panel", {y = -7,x = 3}, {}},
        {"solar-panel", {y = -7,x = 0}, {}},
        {"solar-panel", {y = -7,x = -3}, {}},
        {"solar-panel", {y = -7,x = -6}, {}},
        {"accumulator", {y = 0.5,x = -6.5}, {}},
        {"accumulator", {y = -1.5,x = -6.5}, {}}
    }

    for _, v in pairs(entities) do
        local name = v[1]
        local pos = v[2]
        local extra = v[3]
        spawn_entity(name, pos, center, surface, extra, player.force)
    end
end

local function insertItem(player,item,count)
    if player.can_insert{name = item, count = count} then player.insert{name = item, count = count} end
end

local function updateInventory ()
    if not modEnabled then
        return
    end
    for _, pl in pairs(game.players) do
        --p = game.get_player(1)
        local player = game.get_player(pl.name)
        local inventory = player.get_main_inventory()
        inventory.clear()
        for i=1,15 do
            local filter_name = ""
            inventory.set_filter(i, nil) 
            if i <= 3 then
                filter_name = "blueprint" -- Blueprints
            elseif i <= 6 then
                filter_name = "blueprint-book" -- Books
            elseif i <= 9 then
                filter_name = "deconstruction-planner" -- Deconstruction
            elseif i <= 12 then
                filter_name = "upgrade-planner"
            elseif i <= 13 then
                filter_name = "green-wire" -- Deconstruction
            elseif i <= 14 then
                filter_name = "red-wire" -- Deconstruction
            elseif i <= 15 then
                filter_name = "copper-cable" -- Deconstruction
            end
            inventory.set_filter(i, filter_name) 
        end
        insertItem(player,"green-wire",200)
        insertItem(player,"red-wire",200)
        insertItem(player,"copper-cable",200)
        while player.can_insert{name = "inventory-blocker", count = 1} do
            player.insert{name = "inventory-blocker", count = 1}
        end
    end
end

local function addWires(event)
    if not modEnabled then
        return
    end
    local player = game.get_player(event.player_index)
    while player.can_insert{name = "green-wire", count = 1} do
        player.insert{name = "green-wire", count = 1}
    end
    while player.can_insert{name = "red-wire", count = 1} do
        player.insert{name = "red-wire", count = 1}
    end
    while player.can_insert{name = "copper-cable", count = 1} do
        player.insert{name = "copper-cable", count = 1}
    end
end

-- This function is copied from Wube's freeplay.lua, and modified.
local function on_player_created(event)
    -- unregister. we only get called once.
    --script.on_event(defines.events.on_player_created, nil)

    -- vars the freeplay.lua snippit had
    local crashed_ship_items = remote.call("freeplay", "get_ship_items")
    local crashed_debris_items = remote.call("freeplay", "get_debris_items")

    local player = game.get_player(event.player_index)
    local character = player.character

    local group = player.permission_group or game.permissions.create_group("NO_INVENTORY")
    group.set_allows_action(defines.input_action.craft,false)
    --group.set_allows_action(defines.input_action.destroy_item,false)
    --group.set_allows_action(defines.input_action.destroy_opened_item,false)
    group.set_allows_action(defines.input_action.drop_item,false)
    group.set_allows_action(defines.input_action.inventory_transfer,false)
    group.set_allows_action(defines.input_action.inventory_split,false)
    group.set_allows_action(defines.input_action.cursor_transfer,false)
    group.set_allows_action(defines.input_action.cursor_split,false)
    group.set_allows_action(defines.input_action.fast_entity_split,false)
    group.set_allows_action(defines.input_action.fast_entity_transfer,false)
    group.set_allows_action(defines.input_action.stack_split,false)
    group.set_allows_action(defines.input_action.stack_transfer,false)
    --group.set_allows_action(defines.input_action.use_item,false)
    group.set_allows_action(defines.input_action.begin_mining,false)
    group.set_allows_action(defines.input_action.begin_mining_terrain,false)
    --group.set_allows_action(defines.input_action.smart_pipette,false)
    group.name = "NO_INVENTORY"
    group.add_player(player)
    --player.print(player.permission_group.allows_action(defines.input_action.inventory_transfer))

    --player.get_main_inventory().resize(0)


    local center = player.character.position
    player.character = nil
    if character then
        character.destroy()
    end

    -- our settings
    local disable_crashsite = true
    local skip_cutscene = true

    -- add a crash site
    local surface = player.surface
    -- surface.daytime = 0.7
    crash_site.create_crash_site(surface, {-20, -13}, util.copy(crashed_ship_items), util.copy(crashed_debris_items))
    util.remove_safe(player, crashed_ship_items)
    util.remove_safe(player, crashed_debris_items)
    -- player.get_main_inventory().sort_and_merge()

    -- player.character.destroy()
    -- player.character = nil
    -- crash_site.create_cutscene(player, {-5, -4})

    -- while player.can_insert{name = "inventory-blocker", count = 1} do
    --     player.insert{name = "inventory-blocker", count = 1}
    -- end
    updateInventory()
    local area = {{center.x + 10, center.y + 15}, {center.x - 10, center.y - 15}}
    clear_area(area, surface)
    create_roboport(center, surface, player)
end

local function on_init()
    if not remote.interfaces.freeplay then
        -- The mod was loaded in something not freeplay: sandbox, tutorial, etc. Do nothing.
        modEnabled = false
        return
    end
    --game.on_load()

    remote.call("freeplay", "set_disable_crashsite", true)
    script.on_event(defines.events.on_player_created, on_player_created)

end



script.on_init(on_init)

script.on_event(defines.events.on_player_main_inventory_changed, addWires)
script.on_configuration_changed(updateInventory)
