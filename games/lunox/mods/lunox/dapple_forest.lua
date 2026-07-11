-- ===========================================================
-- Lunox: Dapple Forest Biome
-- A Lunox-exclusive biome with a dappled mixed oak/birch canopy,
-- podzol-style mossy ground, wildflowers, and ferns.
-- Villages and ruined portals already registered globally will
-- also appear here since they are terrain-based.
-- ===========================================================

local modpath   = minetest.get_modpath(minetest.get_current_modname())
local mod_core  = minetest.get_modpath("mcl_core")
local mod_vars  = minetest.get_modpath("mcl_init")  -- for mcl_vars

-- Guard: only register if the mapgen/biome API is available
if not minetest.register_biome then return end
-- Guard: skip in singlenode
if minetest.get_mapgen_setting("mg_name") == "singlenode" then return end

-- ---- Biome ------------------------------------------------
minetest.register_biome({
	name             = "DappleForest",
	node_top         = "mcl_core:podzol",           -- mossy-dark ground surface
	depth_top        = 1,
	node_filler      = "mcl_core:dirt",
	depth_filler     = 3,
	node_riverbed    = "mcl_core:sand",
	depth_riverbed   = 2,
	y_min            = 1,
	y_max            = mcl_vars.mg_overworld_max,
	-- Placed in a temperate-wet gap between BirchForest and RoofedForest
	humidity_point   = 70,
	heat_point       = 50,
	_mcl_biome_type  = "medium",
	_mcl_grass_palette_index  = 12,
	_mcl_foliage_palette_index = 10,
	_mcl_water_palette_index  = 0,
	_mcl_waterfogcolor = "#3F76E4",
	_mcl_skycolor    = "#7BA5FF",
	_mcl_fogcolor    = "#C6D4F5",
})

minetest.register_biome({
	name             = "DappleForest_ocean",
	node_top         = "mcl_core:sand",
	depth_top        = 1,
	node_filler      = "mcl_core:sand",
	depth_filler     = 3,
	node_riverbed    = "mcl_core:sand",
	depth_riverbed   = 2,
	y_min            = -31000,
	y_max            = 0,
	humidity_point   = 70,
	heat_point       = 50,
	_mcl_biome_type  = "medium",
	_mcl_grass_palette_index  = 12,
	_mcl_foliage_palette_index = 10,
	_mcl_water_palette_index  = 0,
	_mcl_waterfogcolor = "#3F76E4",
	_mcl_skycolor    = "#7BA5FF",
	_mcl_fogcolor    = "#C6D4F5",
})

-- ---- Decorations ------------------------------------------
local oak_schematics = {
	mod_core .. "/schematics/mcl_core_oak_classic.mts",
	mod_core .. "/schematics/mcl_core_oak_balloon.mts",
	mod_core .. "/schematics/mcl_core_oak_large_1.mts",
}
local birch_schematics = {
	mod_core .. "/schematics/mcl_core_birch.mts",
}

-- Dense mixed oak canopy
for _, schem in ipairs(oak_schematics) do
	minetest.register_decoration({
		name       = "lunox:dapple_forest_oak_" .. schem:match("([^/]+)%.mts$"),
		deco_type  = "schematic",
		place_on   = {"mcl_core:podzol", "group:grass_block_no_snow"},
		sidelen    = 16,
		noise_params = {
			offset  = 0.07,
			scale   = 0.004,
			spread  = {x=250, y=250, z=250},
			seed    = 33701,
			octaves = 3,
			persist = 0.60,
		},
		biomes  = {"DappleForest"},
		y_min   = 1,
		y_max   = mcl_vars.mg_overworld_max,
		schematic = schem,
		flags   = "place_center_x, place_center_z",
	})
end

-- Scattered birch trees for the "dapple" mixed look
for _, schem in ipairs(birch_schematics) do
	minetest.register_decoration({
		name       = "lunox:dapple_forest_birch_" .. schem:match("([^/]+)%.mts$"),
		deco_type  = "schematic",
		place_on   = {"mcl_core:podzol", "group:grass_block_no_snow"},
		sidelen    = 16,
		noise_params = {
			offset  = 0.04,
			scale   = 0.003,
			spread  = {x=200, y=200, z=200},
			seed    = 33702,
			octaves = 3,
			persist = 0.55,
		},
		biomes  = {"DappleForest"},
		y_min   = 1,
		y_max   = mcl_vars.mg_overworld_max,
		schematic = schem,
		flags   = "place_center_x, place_center_z",
	})
end

-- Ferns on the forest floor
minetest.register_decoration({
	name      = "lunox:dapple_forest_fern",
	deco_type = "simple",
	place_on  = {"mcl_core:podzol"},
	sidelen   = 16,
	fill_ratio = 0.08,
	biomes    = {"DappleForest"},
	y_min     = 1,
	y_max     = mcl_vars.mg_overworld_max,
	decoration = "mcl_flowers:fern",
})

-- Wildflowers (dandelion + poppy mix)
minetest.register_decoration({
	name      = "lunox:dapple_forest_dandelion",
	deco_type = "simple",
	place_on  = {"mcl_core:podzol", "group:grass_block"},
	sidelen   = 16,
	fill_ratio = 0.04,
	biomes    = {"DappleForest"},
	y_min     = 1,
	y_max     = mcl_vars.mg_overworld_max,
	decoration = "mcl_flowers:dandelion",
})

minetest.register_decoration({
	name      = "lunox:dapple_forest_poppy",
	deco_type = "simple",
	place_on  = {"mcl_core:podzol", "group:grass_block"},
	sidelen   = 16,
	fill_ratio = 0.025,
	biomes    = {"DappleForest"},
	y_min     = 1,
	y_max     = mcl_vars.mg_overworld_max,
	decoration = "mcl_flowers:poppy",
})

-- Short grass tufts
minetest.register_decoration({
	name      = "lunox:dapple_forest_grass",
	deco_type = "simple",
	place_on  = {"mcl_core:podzol", "group:grass_block"},
	sidelen   = 16,
	fill_ratio = 0.12,
	biomes    = {"DappleForest"},
	y_min     = 1,
	y_max     = mcl_vars.mg_overworld_max,
	decoration = "mcl_core:grass",
})

minetest.log("action", "[lunox] Dapple Forest biome registered.")
