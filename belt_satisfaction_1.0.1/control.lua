script.on_event(defines.events.on_player_joined_game, function(event)
	game.get_player(event.player_index).print("Loaded", {r=255, g=30, b=35})
	frm = game.get_player(event.player_index).gui.left.add{type="frame", name="beltsatisfactionfrm", caption="Satisfaction"}
	lbl = frm.add{type="label", name="beltsatisfactionlbl", caption="[...]"}
	update = false
	frm.visible = false
end)

script.on_event(defines.events.on_gui_opened, function(event)
	if event.gui_type == defines.gui_type.entity then
		if event.entity.type == "transport-belt" then
			L1 = event.entity.get_transport_line(1)
			L2 = event.entity.get_transport_line(2)
			lbl.caption = ""
			frm.visible = true
			update = true
		end
	end
end)

script.on_event(defines.events.on_tick, function(event)
	if event.tick % 10 == 0 then
		if update then
			lbl.caption = ((#L1 + #L2)*12.5).."%" --(#L1 + #L2)/8
		end
	end
end)

script.on_event(defines.events.on_gui_closed, function(event)
	update = false
	frm.visible = false
end)