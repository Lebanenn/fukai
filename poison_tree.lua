--Register of the trunk of the primary tre type

minetest.register_node("fukai:poison_tree", {
	description = "Poisonous tree",
	tiles = {"default_tree_top.png^[colorize:#3A1355:120", "default_tree_top.png^[colorize:#3A1355:120", "default_tree.png^[colorize:#3A1355:120"},
	paramtype2 = "facedir",
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
  after_dig_node = function(pos, oldnode, oldmetadata, digger)
      minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "fukai:glue_source"})
    end
})

-- Register of the primary leaves I think I put out this

minetest.register_node("fukai:poison_leaves", {
	description = "Poisonous Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves.png^[colorize:#3A1355:120"},
	special_tiles = {"default_leaves_simple.png^[colorize:#3A1355:120"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {'fukai:sapling'},
				rarity = 20,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {'fukai:poison_leaves'},
			}
		}
	},
})


minetest.register_abm({
	nodenames = {"default:tree","default:jungletree","default:pine_tree","default:acacia_tree","default:aspen_tree"},
	neighbors = {"fukai:poison_dirt_grass","fukai:poison_dirt", "fukai:poison_tree"},
	interval = 1.0, -- Run every 10 seconds
	chance = 10, -- Select every 1 in 10 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "fukai:poison_tree"})
	end
})

minetest.register_abm({
	nodenames = {"default:leaves","default:jungleleaves","default:pine_needles","default:acacia_leaves","default:aspen_leaves"},
	neighbors = {"fukai:poison_dirt_grass","fukai:poison_dirt", "fukai:poison_tree", "fukai:poison_leaves"},
	interval = 1.0, -- Run every 10 seconds
	chance = 10, -- Select every 1 in 10 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "fukai:poison_leaves"})
	end
})

minetest.register_abm({
	nodenames = {"fukai:poison_leaves"},
	neighbors = {"fukai:poison_dirt_grass","fukai:poison_dirt", "fukai:poison_tree", "air"},
	interval = 10.0, -- Run every 10 seconds
	chance = 5, -- Select every 1 in 10 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "air"})
	end
})
