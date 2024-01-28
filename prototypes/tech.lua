data.raw.technology["logistic-system"].icon = "__RobotStart__/graphics/technology/logistic-system.png"
data.raw.technology["logistic-robotics"].effects =
{
    {
        type = "unlock-recipe",
        recipe = "roboport"
    },
    {
        type = "unlock-recipe",
        recipe = "logistic-chest-passive-provider"
    },
    {
        type = "unlock-recipe",
        recipe = "logistic-chest-storage"
    },
    {
        type = "unlock-recipe",
        recipe = "logistic-robot"
    }
}

data:extend{
    {
        type = "technology",
        name = "early-logistic",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__RobotStart__/graphics/technology/logistic-system-early.png",
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "iron-active-provider-chest"
            },
            {
                type = "unlock-recipe",
                recipe = "iron-buffer-chest"
            },
            {
                type = "unlock-recipe",
                recipe = "iron-passive-provider-chest"
            },
            {
                type = "unlock-recipe",
                recipe = "iron-requester-chest"
            },
            {
                type = "unlock-recipe",
                recipe = "iron-storage-chest"
            },
            {
                type = "unlock-recipe",
                recipe = "early-logistic-robot"
            },
            {
                type = "unlock-recipe",
                recipe = "early-construction-robot"
            },
        },
        prerequisites = {"logistic-science-pack"},
        unit =
        {
            count = 100*1,
            ingredients =
            {
                {"automation-science-pack", 1},
                {"logistic-science-pack",5}
            },
            time = 30
        },
        upgrade = false,
        order = "e-l-a"
    },
}