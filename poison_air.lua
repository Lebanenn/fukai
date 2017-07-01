minetest.register_node("fukai:air", {
    description = "Poison air",
    drawtype = "airlike",

    paramtype = "light",
    -- ^ Allows light to propagate through the node with the
    --   light value falling by 1 per node.

    sunlight_propagates = true, -- Sunlight shines through
    walkable     = false, -- Would make the player collide with the air node
    pointable    = false, -- You can't select the node
    diggable     = false, -- You can't dig the node
    buildable_to = true,  -- Nodes can be replace this node.
                          -- (you can place a node and remove the air node
                          -- that used to be there)
    damage_per_second=1;
    air_equivalent = true,
    drop = ""
})

minetest.register_craftitem("fukai:test", {
	description = "Testcraftitem",
	inventory_image = "default_tool_steelpick.png",
  on_use = function(itemstack, player, pointed_thing) -- A placer dans damage per seconds
    --local player = minetest.get_player_by_name("singleplayer")
    local int hp = player:get_hp()
    minetest.chat_send_all(hp)
    player:set_hp(hp+2)
  end,
})

minetest.register_craftitem("fukai:mask", {
	description = "Mask to breath",
	inventory_image = "farming_tool_mesehoe.png",
})

local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime;
	if timer >= 1 then
		timer = 0
    mort()
	end
end)

function mort ()
  local players = minetest.get_connected_players()
  if #players == 0 then return end
  for i,player in ipairs(players) do
    local inv = player:get_inventory():get_stack("main",1):get_name()
    if inv=="fukai:mask" then
      local int hp = player:get_hp()
      player:set_hp(hp+1)
    end
  end
end

minetest.register_abm({
	nodenames = {"air"},
	neighbors = {"fukai:poison_dirt_grass","fukai:poison_dirt"},
	interval = 1, -- Run every 10 seconds
	chance = 1, -- Select every 1 in 50 nodes
	action = function(pos, node, active_object_count, active_object_count_wider)
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "fukai:air"})
	end
})
