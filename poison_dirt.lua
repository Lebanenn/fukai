minetest.register_node("fukai:poison_dirt", {
	description = "Poisonous dirt",
	tiles = {"default_dirt.png^[colorize:#3A1355:120"},
  groups = {crumbly = 3}
})
minetest.register_node("fukai:poison_dirt_grass", {
	description = "Poisonous dirt with grass",
  tiles = {"default_grass.png^[colorize:#3A1355:120", "default_dirt.png^[colorize:#3A1355:120",
		{name = "default_dirt.png^default_grass_side.png^[colorize:#3A1355:120",
			tileable_vertical = false}},
	groups = {crumbly = 3},
	drop = 'fukai:poison_dirt',
  --damage_per_second = 4*2
})

minetest.register_abm({
	nodenames = {"fukai:poison_dirt"},
	neighbors = {"fukai:poison_dirt_grass"},
	interval = 10.0, -- Run every 10 seconds
	chance = 10, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "fukai:poison_dirt_grass"})
	end
})

minetest.register_abm({
	nodenames = {"default:dirt"},
	neighbors = {"fukai:poison_dirt_grass","fukai:poison_dirt","fukai:acid_source"},
	interval = 10.0, -- Run every 10 seconds
	chance = 10, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "fukai:poison_dirt"})
	end
})
minetest.register_abm({
	nodenames = {"default:dirt_with_grass"},
	neighbors = {"fukai:poison_dirt_grass","fukai:poison_dirt"},
	interval = 3.0, -- Run every 10 seconds
	chance = 10, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "fukai:poison_dirt_grass"})
	end
})
