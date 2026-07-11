-- =========================================================
-- Lunox Core Feature: Copper Spring Launchpad + Copper Coil
-- File suggestion: mods/lunox/nodes/spring_block.lua
-- Requires: VoxeLibre core (mcl_core) already loaded/integrated
-- =========================================================

-- =========================================================
-- 1. Copper Coil (new intermediate craftitem)
-- =========================================================
minetest.register_craftitem("lunox:copper_coil", {
    description = "Copper Coil",
    inventory_image = "lunox_copper_coil.png",
    stack_max = 99,
    groups = {craftitem = 1},
})

-- Craft recipe: 1 copper ingot -> 1 copper coil
minetest.register_craft({
    type = "shapeless",
    output = "lunox:copper_coil",
    recipe = {"mcl_core:copper_ingot"},
})

-- =========================================================
-- 2. Spring Launchpad Node
-- =========================================================
minetest.register_node("lunox:spring_block", {
    description = "Copper Spring Launchpad",
    tiles = {
        "lunox_copper_spring.png", -- top
        "lunox_copper_spring.png", -- bottom
        "lunox_copper_spring.png", -- right
        "lunox_copper_spring.png", -- left
        "lunox_copper_spring.png", -- back
        "lunox_copper_spring.png", -- front
    },
    -- No tile size params set intentionally -- engine auto-scales the
    -- HD texture across all six cube faces.
    groups = {cracky = 3},
    bouncy = 80,
    is_ground_content = true,
    sounds = mcl_sounds and mcl_sounds.node_sound_metal_defaults() or nil,
    paramtype = "light",
    sunlight_propagates = false,
})

-- Craft recipe: 1 copper coil -> 1 spring launchpad
minetest.register_craft({
    type = "shapeless",
    output = "lunox:spring_block",
    recipe = {"lunox:copper_coil"},
})

dofile(minetest.get_modpath(minetest.get_current_modname()) .. "/dapple_forest.lua")
