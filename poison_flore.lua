minetest.register_node("fukai:grass", {
	description = "Acid Grass",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.3,
	tiles = {"default_junglegrass.png^[colorize:#3A1355:120"},
	inventory_image = "default_junglegrass.png^[colorize:#3A1355:120",
	wield_image = "default_junglegrass.png^[colorize:#3A1355:120",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1, grass = 1, flammable = 1},
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 1.19, 7 / 16},
	},
})
minetest.register_abm({
	nodenames = {"default:grass_1","default:grass_2","default:grass_3","default:grass_4","default:grass_5"},
	neighbors = {"fukai:poison_dirt_grass","fukai:poison_dirt"},
	interval = 10.0, -- Run every 10 seconds
	chance = 50, -- Select every 1 in 10 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "fukai:grass"})
	end
})
