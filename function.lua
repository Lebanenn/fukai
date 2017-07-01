function fukai.getdam(itemstack, player, pointed_thing) -- A placer dans damage per seconds
  local player = minetest.get_player_by_name("singleplayer")
  local inv = player:get_inventory():get_stack("main",1):get_name()
  if inv=="fukai:mask" then
    --dam=0
    minetest.chat_send_all("0")
  end
  if inv ~= "fukai:mask" then
    --dam=4*2
    minetest.chat_send_all("Damage")
  end
  minetest.chat_send_all(inv)
end
