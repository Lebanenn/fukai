minetest.register_node("fukai:acid_source", {
	description = "Acid Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "default_water_source_animated.png^[colorize:green:120",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
  damage_per_second = 4 * 2,
	liquidtype = "source",
	liquid_alternative_flowing = "fukai:acid_flowing",
	liquid_alternative_source = "fukai:acid_source",
	liquid_viscosity = 1,
	groups = {water = 3, liquid = 3, puts_out_fire = 1},
})

minetest.register_node("fukai:acid_flowing", {
	description = "Flowing Acid",
	drawtype = "flowingliquid",
	tiles = {"default_water.png^[colorize:green:120"},
	special_tiles = {
		{
			name = "default_water_flowing_animated.png^[colorize:green:120",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "default_water_flowing_animated.png^[colorize:green:120",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "fukai:acid_flowing",
	liquid_alternative_source = "fukai:acid_source",
	liquid_viscosity = 1,
  damage_per_second = 4 * 2,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1},
})

minetest.register_abm({
	nodenames = {"default:water_source"},
	neighbors = {"fukai:poison_dirt_grass", "fukai:poison_dirt", "fukai:acid_source"},
	interval = 10.0, -- Run every 10 seconds
	chance = 10, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "fukai:acid_source"})
	end
})

-- Acid glue from tree

minetest.register_node("fukai:glue_source", {
	description = "Acid glue from trees",
	drawtype = "liquid",
	tiles = {
		{
			name = "default_water_source_animated.png^[colorize:white:120",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
  walkable = false,
  pointable = false,
  diggable = false,
  buildable_to = true,
  is_ground_content = false,
  drop = "",
  drowning = 1,
  liquidtype = "source",
  liquid_alternative_flowing = "fukai:glue_flowing",
  liquid_alternative_source = "fukai:glue_source",
  liquid_viscosity = 7,
  liquid_renewable = false,
  damage_per_second = 4 * 2,
  groups = {liquid = 2}
})

minetest.register_node("fukai:glue_flowing", {
	description = "Flowing glue from tree",
	drawtype = "flowingliquid",
	tiles = {"default_water.png^[colorize:white:120"},
	special_tiles = {
		{
			name = "default_water_source_animated.png^[colorize:white:120",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
		{
			name = "default_water_flowing_animated.png^[colorize:white:120",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
	},
	paramtype = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "fukai:glue_flowing",
	liquid_alternative_source = "fukai:glue_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 4 * 2,
	groups = {liquid = 2,not_in_creative_inventory = 1},
})
