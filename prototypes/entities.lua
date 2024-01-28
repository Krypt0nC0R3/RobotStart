require ("util")

local hit_effects = require("prototypes.entity.hit-effects")
local sounds = require("prototypes.entity.sounds")
local movement_triggers = require("prototypes.entity.movement-triggers")

local robot_animations = {}

robot_animations.logistic_robot =
{
  idle =
  {
    filename = "__RobotStart__/graphics/entity/logistic-robot/logistic-robot.png",
    priority = "high",
    line_length = 16,
    width = 41,
    height = 42,
    frame_count = 1,
    shift = util.by_pixel(0, -3),
    direction_count = 16,
    y = 42,
    hr_version =
    {
      filename = "__RobotStart__/graphics/entity/logistic-robot/hr-logistic-robot.png",
      priority = "high",
      line_length = 16,
      width = 80,
      height = 84,
      frame_count = 1,
      shift = util.by_pixel(0, -3),
      direction_count = 16,
      y = 84,
      scale = 0.5
    }
  },
  idle_with_cargo =
  {
    filename = "__RobotStart__/graphics/entity/logistic-robot/logistic-robot.png",
    priority = "high",
    line_length = 16,
    width = 41,
    height = 42,
    frame_count = 1,
    shift = util.by_pixel(0, -3),
    direction_count = 16,
    hr_version =
    {
      filename = "__RobotStart__/graphics/entity/logistic-robot/hr-logistic-robot.png",
      priority = "high",
      line_length = 16,
      width = 80,
      height = 84,
      frame_count = 1,
      shift = util.by_pixel(0, -3),
      direction_count = 16,
      scale = 0.5
    }
  },
  in_motion =
  {
    filename = "__RobotStart__/graphics/entity/logistic-robot/logistic-robot.png",
    priority = "high",
    line_length = 16,
    width = 41,
    height = 42,
    frame_count = 1,
    shift = util.by_pixel(0, -3),
    direction_count = 16,
    y = 126,
    hr_version =
    {
      filename = "__RobotStart__/graphics/entity/logistic-robot/hr-logistic-robot.png",
      priority = "high",
      line_length = 16,
      width = 80,
      height = 84,
      frame_count = 1,
      shift = util.by_pixel(0, -3),
      direction_count = 16,
      y = 252,
      scale = 0.5
    }
  },
  in_motion_with_cargo =
  {
    filename = "__RobotStart__/graphics/entity/logistic-robot/logistic-robot.png",
    priority = "high",
    line_length = 16,
    width = 41,
    height = 42,
    frame_count = 1,
    shift = util.by_pixel(0, -3),
    direction_count = 16,
    y = 84,
    hr_version =
    {
      filename = "__RobotStart__/graphics/entity/logistic-robot/hr-logistic-robot.png",
      priority = "high",
      line_length = 16,
      width = 80,
      height = 84,
      frame_count = 1,
      shift = util.by_pixel(0, -3),
      direction_count = 16,
      y = 168,
      scale = 0.5
    }
  },
  shadow_idle =
  {
    filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 58,
    height = 29,
    frame_count = 1,
    shift = util.by_pixel(32, 19.5),
    direction_count = 16,
    y = 29,
    draw_as_shadow = true,
    hr_version =
    {
      filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 115,
      height = 57,
      frame_count = 1,
      shift = util.by_pixel(31.75, 19.75),
      direction_count = 16,
      y = 57,
      scale = 0.5,
      draw_as_shadow = true
    }
  },
  shadow_idle_with_cargo =
  {
    filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 58,
    height = 29,
    frame_count = 1,
    shift = util.by_pixel(32, 19.5),
    direction_count = 16,
    draw_as_shadow = true,
    hr_version =
    {
      filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 115,
      height = 57,
      frame_count = 1,
      shift = util.by_pixel(31.75, 19.75),
      direction_count = 16,
      scale = 0.5,
      draw_as_shadow = true
    }
  },
  shadow_in_motion =
  {
    filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 58,
    height = 29,
    frame_count = 1,
    shift = util.by_pixel(32, 19.5),
    direction_count = 16,
    y = 29,
    draw_as_shadow = true,
    hr_version =
    {
      filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 115,
      height = 57,
      frame_count = 1,
      shift = util.by_pixel(31.75, 19.75),
      direction_count = 16,
      y = 57*3,
      scale = 0.5,
      draw_as_shadow = true
    }
  },
  shadow_in_motion_with_cargo =
  {
    filename = "__base__/graphics/entity/logistic-robot/logistic-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 58,
    height = 29,
    frame_count = 1,
    shift = util.by_pixel(32, 19.5),
    direction_count = 16,
    draw_as_shadow = true,
    hr_version =
    {
      filename = "__base__/graphics/entity/logistic-robot/hr-logistic-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 115,
      height = 57,
      frame_count = 1,
      shift = util.by_pixel(31.75, 19.75),
      direction_count = 16,
      y = 114,
      scale = 0.5,
      draw_as_shadow = true
    }
  }
}

robot_animations.construction_robot =
{

  idle =
  {
    filename = "__RobotStart__/graphics/entity/construction-robot/construction-robot.png",
    priority = "high",
    line_length = 16,
    width = 32,
    height = 36,
    frame_count = 1,
    shift = util.by_pixel(0,-4.5),
    direction_count = 16,
    hr_version =
    {
      filename = "__RobotStart__/graphics/entity/construction-robot/hr-construction-robot.png",
      priority = "high",
      line_length = 16,
      width = 66,
      height = 76,
      frame_count = 1,
      shift = util.by_pixel(0,-4.5),
      direction_count = 16,
      scale = 0.5
    }
  },
  in_motion =
  {
    filename = "__RobotStart__/graphics/entity/construction-robot/construction-robot.png",
    priority = "high",
    line_length = 16,
    width = 32,
    height = 36,
    frame_count = 1,
    shift = util.by_pixel(0, -4.5),
    direction_count = 16,
    y = 36,
    hr_version =
    {
      filename = "__RobotStart__/graphics/entity/construction-robot/hr-construction-robot.png",
      priority = "high",
      line_length = 16,
      width = 66,
      height = 76,
      frame_count = 1,
      shift = util.by_pixel(0, -4.5),
      direction_count = 16,
      y = 76,
      scale = 0.5
    }
  },
  shadow_idle =
  {
    filename = "__base__/graphics/entity/construction-robot/construction-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 53,
    height = 25,
    frame_count = 1,
    shift = util.by_pixel(33.5, 18.5),
    direction_count = 16,
    draw_as_shadow = true,
    hr_version =
    {
      filename = "__base__/graphics/entity/construction-robot/hr-construction-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 104,
      height = 49,
      frame_count = 1,
      shift = util.by_pixel(33.5, 18.75),
      direction_count = 16,
      scale = 0.5,
      draw_as_shadow = true
    }
  },
  shadow_in_motion =
  {
    filename = "__base__/graphics/entity/construction-robot/construction-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 53,
    height = 25,
    frame_count = 1,
    shift = util.by_pixel(33.5, 18.5),
    direction_count = 16,
    draw_as_shadow = true,
    hr_version =
    {
      filename = "__base__/graphics/entity/construction-robot/hr-construction-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 104,
      height = 49,
      frame_count = 1,
      shift = util.by_pixel(33.5, 18.75),
      direction_count = 16,
      scale = 0.5,
      draw_as_shadow = true
    }
  },
  working =
  {
    filename = "__RobotStart__/graphics/entity/construction-robot/construction-robot-working.png",
    priority = "high",
    line_length = 2,
    width = 28,
    height = 36,
    frame_count = 2,
    shift = util.by_pixel(-0.25, -5),
    direction_count = 16,
    animation_speed = 0.3,
    hr_version =
    {
      filename = "__RobotStart__/graphics/entity/construction-robot/hr-construction-robot-working.png",
      priority = "high",
      line_length = 2,
      width = 57,
      height = 74,
      frame_count = 2,
      shift = util.by_pixel(-0.25, -5),
      direction_count = 16,
      animation_speed = 0.3,
      scale = 0.5
    }
  },
  shadow_working =
  {
    filename = "__base__/graphics/entity/construction-robot/construction-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 53,
    height = 25,
    frame_count = 1,
    repeat_count = 2,
    shift = util.by_pixel(33.5, 18.5),
    direction_count = 16,
    draw_as_shadow = true,
    hr_version =
    {
      filename = "__base__/graphics/entity/construction-robot/hr-construction-robot-shadow.png",
      priority = "high",
      line_length = 16,
      width = 104,
      height = 49,
      frame_count = 1,
      repeat_count = 2,
      shift = util.by_pixel(33.5, 18.75),
      direction_count = 16,
      scale = 0.5,
      draw_as_shadow = true
    }
  }
}

data:extend{
    {
        type = "logistic-container",
        name = "iron-passive-provider-chest",
        icon = "__RobotStart__/graphics/items/iron-passive-provider-chest.png",
        icon_size = 64, icon_mipmaps = 4,
        flags = {"placeable-player", "player-creation"},
        minable = {mining_time = 0.1, result = "iron-passive-provider-chest"},
        max_health = 200,
        corpse = "iron-chest-remnants",
        dying_explosion = "iron-chest-explosion",
        open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.43 },
        close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.43 },
        resistances =
        {
          {
            type = "fire",
            percent = 80
          },
          {
            type = "impact",
            percent = 30
          }
        },
        collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        damaged_trigger_effect = hit_effects.entity(),
        fast_replaceable_group = "container",
        inventory_size = 32,
        vehicle_impact_sound = sounds.generic_impact,
        logistic_mode = "passive-provider",
        animation_sound = sounds.logistics_chest_open,
        vehicle_impact_sound = sounds.generic_impact,
        opened_duration = logistic_chest_opened_duration,
        picture =
        {
          layers =
          {
            {
              filename = "__RobotStart__/graphics/entity/iron-passive-provider-chest.png",
              priority = "extra-high",
              width = 34,
              height = 38,
              shift = util.by_pixel(0, -0.5),
              hr_version =
              {
                filename = "__RobotStart__/graphics/entity/hr-iron-passive-provider-chest.png",
                priority = "extra-high",
                width = 66,
                height = 76,
                shift = util.by_pixel(-0.5, -0.5),
                scale = 0.5
              }
            },
            {
              filename = "__base__/graphics/entity/iron-chest/iron-chest-shadow.png",
              priority = "extra-high",
              width = 56,
              height = 26,
              shift = util.by_pixel(10, 6.5),
              draw_as_shadow = true,
              hr_version =
              {
                filename = "__base__/graphics/entity/iron-chest/hr-iron-chest-shadow.png",
                priority = "extra-high",
                width = 110,
                height = 50,
                shift = util.by_pixel(10.5, 6),
                draw_as_shadow = true,
                scale = 0.5
              }
            }
          }
        },
        circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
        circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
        circuit_wire_max_distance = default_circuit_wire_max_distance
    },
    {
        type = "logistic-container",
        name = "iron-buffer-chest",
        icon = "__RobotStart__/graphics/items/iron-buffer-chest.png",
        icon_size = 64, icon_mipmaps = 4,
        flags = {"placeable-player", "player-creation"},
        minable = {mining_time = 0.1, result = "iron-buffer-chest"},
        max_health = 200,
        corpse = "iron-chest-remnants",
        dying_explosion = "iron-chest-explosion",
        open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.43 },
        close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.43 },
        resistances =
        {
          {
            type = "fire",
            percent = 80
          },
          {
            type = "impact",
            percent = 30
          }
        },
        collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        damaged_trigger_effect = hit_effects.entity(),
        fast_replaceable_group = "container",
        inventory_size = 32,
        vehicle_impact_sound = sounds.generic_impact,
        logistic_mode = "buffer",
        animation_sound = sounds.logistics_chest_open,
        vehicle_impact_sound = sounds.generic_impact,
        opened_duration = logistic_chest_opened_duration,
        picture =
        {
          layers =
          {
            {
              filename = "__RobotStart__/graphics/entity/iron-buffer-chest.png",
              priority = "extra-high",
              width = 34,
              height = 38,
              shift = util.by_pixel(0, -0.5),
              hr_version =
              {
                filename = "__RobotStart__/graphics/entity/hr-iron-buffer-chest.png",
                priority = "extra-high",
                width = 66,
                height = 76,
                shift = util.by_pixel(-0.5, -0.5),
                scale = 0.5
              }
            },
            {
              filename = "__base__/graphics/entity/iron-chest/iron-chest-shadow.png",
              priority = "extra-high",
              width = 56,
              height = 26,
              shift = util.by_pixel(10, 6.5),
              draw_as_shadow = true,
              hr_version =
              {
                filename = "__base__/graphics/entity/iron-chest/hr-iron-chest-shadow.png",
                priority = "extra-high",
                width = 110,
                height = 50,
                shift = util.by_pixel(10.5, 6),
                draw_as_shadow = true,
                scale = 0.5
              }
            }
          }
        },
        circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
        circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
        circuit_wire_max_distance = default_circuit_wire_max_distance
    },
    {
        type = "logistic-container",
        name = "iron-active-provider-chest",
        icon = "__RobotStart__/graphics/items/iron-active-provider-chest.png",
        icon_size = 64, icon_mipmaps = 4,
        flags = {"placeable-player", "player-creation"},
        minable = {mining_time = 0.1, result = "iron-active-provider-chest"},
        max_health = 200,
        corpse = "iron-chest-remnants",
        dying_explosion = "iron-chest-explosion",
        open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.43 },
        close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.43 },
        resistances =
        {
          {
            type = "fire",
            percent = 80
          },
          {
            type = "impact",
            percent = 30
          }
        },
        collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        damaged_trigger_effect = hit_effects.entity(),
        fast_replaceable_group = "container",
        inventory_size = 32,
        vehicle_impact_sound = sounds.generic_impact,
        logistic_mode = "active-provider",
        animation_sound = sounds.logistics_chest_open,
        vehicle_impact_sound = sounds.generic_impact,
        opened_duration = logistic_chest_opened_duration,
        picture =
        {
          layers =
          {
            {
              filename = "__RobotStart__/graphics/entity/iron-active-provider-chest.png",
              priority = "extra-high",
              width = 34,
              height = 38,
              shift = util.by_pixel(0, -0.5),
              hr_version =
              {
                filename = "__RobotStart__/graphics/entity/hr-iron-active-provider-chest.png",
                priority = "extra-high",
                width = 66,
                height = 76,
                shift = util.by_pixel(-0.5, -0.5),
                scale = 0.5
              }
            },
            {
              filename = "__base__/graphics/entity/iron-chest/iron-chest-shadow.png",
              priority = "extra-high",
              width = 56,
              height = 26,
              shift = util.by_pixel(10, 6.5),
              draw_as_shadow = true,
              hr_version =
              {
                filename = "__base__/graphics/entity/iron-chest/hr-iron-chest-shadow.png",
                priority = "extra-high",
                width = 110,
                height = 50,
                shift = util.by_pixel(10.5, 6),
                draw_as_shadow = true,
                scale = 0.5
              }
            }
          }
        },
        circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
        circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
        circuit_wire_max_distance = default_circuit_wire_max_distance
    },
    {
        type = "logistic-container",
        name = "iron-storage-chest",
        icon = "__RobotStart__/graphics/items/iron-storage-chest.png",
        icon_size = 64, icon_mipmaps = 4,
        flags = {"placeable-player", "player-creation"},
        minable = {mining_time = 0.1, result = "iron-storage-chest"},
        max_health = 200,
        corpse = "iron-chest-remnants",
        dying_explosion = "iron-chest-explosion",
        open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.43 },
        close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.43 },
        resistances =
        {
          {
            type = "fire",
            percent = 80
          },
          {
            type = "impact",
            percent = 30
          }
        },
        collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        damaged_trigger_effect = hit_effects.entity(),
        fast_replaceable_group = "container",
        inventory_size = 32,
        max_logistic_slots = 1,
        vehicle_impact_sound = sounds.generic_impact,
        logistic_mode = "storage",
        animation_sound = sounds.logistics_chest_open,
        vehicle_impact_sound = sounds.generic_impact,
        opened_duration = logistic_chest_opened_duration,
        picture =
        {
          layers =
          {
            {
              filename = "__RobotStart__/graphics/entity/iron-storage-chest.png",
              priority = "extra-high",
              width = 34,
              height = 38,
              shift = util.by_pixel(0, -0.5),
              hr_version =
              {
                filename = "__RobotStart__/graphics/entity/hr-iron-storage-chest.png",
                priority = "extra-high",
                width = 66,
                height = 76,
                shift = util.by_pixel(-0.5, -0.5),
                scale = 0.5
              }
            },
            {
              filename = "__base__/graphics/entity/iron-chest/iron-chest-shadow.png",
              priority = "extra-high",
              width = 56,
              height = 26,
              shift = util.by_pixel(10, 6.5),
              draw_as_shadow = true,
              hr_version =
              {
                filename = "__base__/graphics/entity/iron-chest/hr-iron-chest-shadow.png",
                priority = "extra-high",
                width = 110,
                height = 50,
                shift = util.by_pixel(10.5, 6),
                draw_as_shadow = true,
                scale = 0.5
              }
            }
          }
        },
        circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
        circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
        circuit_wire_max_distance = default_circuit_wire_max_distance
    },
    {
        type = "logistic-container",
        name = "iron-requester-chest",
        icon = "__RobotStart__/graphics/items/iron-requester-chest.png",
        icon_size = 64, icon_mipmaps = 4,
        flags = {"placeable-player", "player-creation"},
        minable = {mining_time = 0.1, result = "iron-requester-chest"},
        max_health = 200,
        corpse = "iron-chest-remnants",
        dying_explosion = "iron-chest-explosion",
        open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.43 },
        close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.43 },
        resistances =
        {
          {
            type = "fire",
            percent = 80
          },
          {
            type = "impact",
            percent = 30
          }
        },
        collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        damaged_trigger_effect = hit_effects.entity(),
        fast_replaceable_group = "container",
        inventory_size = 32,
        vehicle_impact_sound = sounds.generic_impact,
        logistic_mode = "requester",
        animation_sound = sounds.logistics_chest_open,
        vehicle_impact_sound = sounds.generic_impact,
        opened_duration = logistic_chest_opened_duration,
        picture =
        {
          layers =
          {
            {
              filename = "__RobotStart__/graphics/entity/iron-requester-chest.png",
              priority = "extra-high",
              width = 34,
              height = 38,
              shift = util.by_pixel(0, -0.5),
              hr_version =
              {
                filename = "__RobotStart__/graphics/entity/hr-iron-requester-chest.png",
                priority = "extra-high",
                width = 66,
                height = 76,
                shift = util.by_pixel(-0.5, -0.5),
                scale = 0.5
              }
            },
            {
              filename = "__base__/graphics/entity/iron-chest/iron-chest-shadow.png",
              priority = "extra-high",
              width = 56,
              height = 26,
              shift = util.by_pixel(10, 6.5),
              draw_as_shadow = true,
              hr_version =
              {
                filename = "__base__/graphics/entity/iron-chest/hr-iron-chest-shadow.png",
                priority = "extra-high",
                width = 110,
                height = 50,
                shift = util.by_pixel(10.5, 6),
                draw_as_shadow = true,
                scale = 0.5
              }
            }
          }
        },
        circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
        circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
        circuit_wire_max_distance = default_circuit_wire_max_distance
    },
    {
      type = "logistic-robot",
      name = "early-logistic-robot",
      icon = "__RobotStart__/graphics/items/logistic-robot.png",
      icon_size = 32,
      flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
      minable = {hardness = 0.1, mining_time = 0.1, result = "early-logistic-robot"},
      resistances = { { type = "fire", percent = 85 } },
      collision_box = {{0, 0}, {0, 0}},
      selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
      max_health = 50, --- 100
        max_payload_size = 1, --- 1
      speed = 0.04, --- 0.05
      transfer_distance = 0.5, -- 0.5
      max_energy = "0.5MJ", -- 1.5MJ
      energy_per_tick = "0.02kJ", -- 0.05
      speed_multiplier_when_out_of_energy = 0.2, -- 0.2
      energy_per_move = "2.5kJ", --5kj
      min_to_charge = 0.19,
      max_to_charge = 0.95,
      cargo_centered = {0.0, 0.4},
        idle = robot_animations.logistic_robot.idle,
        idle_with_cargo = robot_animations.logistic_robot.idle_with_cargo,
        in_motion = robot_animations.logistic_robot.in_motion,
        in_motion_with_cargo = robot_animations.logistic_robot.in_motion_with_cargo,
        shadow_idle = robot_animations.logistic_robot.shadow_idle,
        shadow_idle_with_cargo = robot_animations.logistic_robot.shadow_idle_with_cargo,
        shadow_in_motion = robot_animations.logistic_robot.shadow_in_motion,
        shadow_in_motion_with_cargo = robot_animations.logistic_robot.shadow_in_motion_with_cargo
      --working_sound = flying_robot_sounds(),
      
    },
    {
    type = "construction-robot",
    name = "early-construction-robot",
    icon = "__RobotStart__/graphics/items/construction-robot.png",
    icon_size = 64, icon_mipmaps = 4,
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {mining_time = 0.1, result = "early-construction-robot"},
    resistances =
    {
      {
        type = "fire",
        percent = 85
      }
    },
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    hit_visualization_box = {{-0.1, -1.1}, {0.1, -1.0}},
    damaged_trigger_effect = hit_effects.flying_robot(),
    dying_explosion = "construction-robot-explosion",
    max_health = 50, --- 100
    max_payload_size = 1, --- 1
    speed = 0.04, --- 0.05
    transfer_distance = 0.5, -- 0.5
    max_energy = "0.5MJ", -- 1.5MJ
    energy_per_tick = "0.02kJ", -- 0.05
    speed_multiplier_when_out_of_energy = 0.2, -- 0.2
    energy_per_move = "2.5kJ", --5kj
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    --working_light = {intensity = 0.8, size = 3, color = {r = 0.8, g = 0.8, b = 0.8}},
    smoke =
    {
      filename = "__base__/graphics/entity/smoke-construction/smoke-01.png",
      width = 39,
      height = 32,
      frame_count = 19,
      line_length = 19,
      shift = {0.078125, -0.15625},
      animation_speed = 0.3
    },
    sparks = robot_animations.sparks,
    repairing_sound =
    {
      { filename = "__base__/sound/robot-repair-1.ogg", volume = 0.6 },
      { filename = "__base__/sound/robot-repair-2.ogg", volume = 0.6 },
      { filename = "__base__/sound/robot-repair-3.ogg", volume = 0.6 },
      { filename = "__base__/sound/robot-repair-4.ogg", volume = 0.6 },
      { filename = "__base__/sound/robot-repair-5.ogg", volume = 0.6 },
      { filename = "__base__/sound/robot-repair-6.ogg", volume = 0.6 },
    },
    working_sound = sounds.construction_robot(0.47),
    cargo_centered = {0.0, 0.2},
    construction_vector = {0.30, 0.22},
    water_reflection = robot_reflection(1),
    idle = robot_animations.construction_robot.idle,
    idle_with_cargo = robot_animations.construction_robot.idle_with_cargo,
    in_motion = robot_animations.construction_robot.in_motion,
    in_motion_with_cargo = robot_animations.construction_robot.in_motion_with_cargo,
    shadow_idle = robot_animations.construction_robot.shadow_idle,
    shadow_idle_with_cargo = robot_animations.construction_robot.shadow_idle_with_cargo,
    shadow_in_motion = robot_animations.construction_robot.shadow_in_motion,
    shadow_in_motion_with_cargo = robot_animations.construction_robot.shadow_in_motion_with_cargo,
    working = robot_animations.construction_robot.working,
    shadow_working = robot_animations.construction_robot.shadow_working
    }
}