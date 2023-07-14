local roboport_tier2 = table.deepcopy(data.raw["roboport"]["roboport"])
roboport_tier2.name = "roboport_tier2"
roboport_tier2.minable.result = "roboport_tier2"
roboport_tier2.logistics_radius = roboport_tier2.logistics_radius * 2
roboport_tier2.construction_radius = roboport_tier2.construction_radius * 2
roboport_tier2.robot_slots_count  = roboport_tier2.robot_slots_count  * 2
roboport_tier2.charge_approach_distance = 10
roboport_tier2.energy_source.input_flow_limit = "8000kW"
roboport_tier2.energy_source.buffer_capacity = "200MJ"
roboport_tier2.charging_energy = "4000kW"
roboport_tier2.fast_replaceable_group = "roboport"
roboport_tier2.next_upgrade = nil
data:extend({roboport_tier2})

local roboport_tier2_item = table.deepcopy(data.raw["item"]["roboport"])
roboport_tier2_item.name = "roboport_tier2"
roboport_tier2_item.place_result = "roboport_tier2"
roboport_tier2_item.icon = "__tiertwo__/graphics/roboport_tier2/roboport.png"
data:extend({roboport_tier2_item})

local roboport_tier2_recipe = table.deepcopy(data.raw["recipe"]["roboport"])
roboport_tier2_recipe.name = "roboport_tier2"
roboport_tier2_recipe.ingredients = {
    {"roboport", 4},
    {"advanced-circuit", 20},
    {"steel-plate", 20}
}
roboport_tier2_recipe.result = "roboport_tier2"
data:extend({roboport_tier2_recipe})

data:extend({
    {
        type = "technology",
        name = "roboport_tier2",
        icon_size = 128,
        icon = data.raw.technology.logistics.icon,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "roboport_tier2"
            }
        },
        prerequisites = {"logistics", "robotics"},
        unit = {
            count = 150,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1}
            },
            time = 30
        },
        order = "c-k-a-b"
    }
})