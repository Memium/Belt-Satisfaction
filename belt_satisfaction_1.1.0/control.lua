script.on_event(defines.events.on_player_joined_game, function(event)
	game.get_player(event.player_index).print("Loaded", {r=255, g=30, b=35})
	frm = game.get_player(event.player_index).gui.left.add{type="frame", name="beltsatisfactionfrm", caption="Satisfaction"}
	prb = frm.add{type="progressbar", name="beltsatisfactionlbl"}
	update = false
	frm.visible = false
end)

script.on_event(defines.events.on_gui_opened, function(event)
	if event.gui_type == defines.gui_type.entity then
		if event.entity.type == "transport-belt" then
			L1 = event.entity.get_transport_line(1)
			L2 = event.entity.get_transport_line(2)
			prb.value = (#L1 + #L2)/8
			--target = prb.value
			frm.visible = true
			update = true
		end
	end
end)

script.on_event(defines.events.on_tick, function(event)
	if update then
		prb.value = (prb.value+(#L1 + #L2)/8)/2
	end
end)
--[[if event.tick % 10 == 0 then
	--err = prb.value-(#L1 + #L2)/8
	--prb.value = (#L1 + #L2)/8+err/2
	target = (#L1 + #L2)/8
end
prb.value = (target+prb.value)/2]]--

script.on_event(defines.events.on_gui_closed, function(event)
	update = false
	frm.visible = false
end)