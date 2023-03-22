CLGAMEMODESUBMENU.base = "base_gamemodesubmenu"
CLGAMEMODESUBMENU.title = "submenu_addons_show_me_what_you_got_title"

function CLGAMEMODESUBMENU:Populate(parent)
	local form = vgui.CreateTTT2Form(parent, "help_show_me_what_you_got_head_settings")

	form:MakeSlider({
		label = "label_show_me_what_you_got_max_movement_distance",
		serverConvar = "ttt_show_me_what_you_got_max_movement_distance",
		min = 100,
		max = 3000,
		decimal = 0
	})

	form:MakeSlider({
		label = "label_show_me_what_you_got_movement_speed",
		serverConvar = "ttt_show_me_what_you_got_movement_speed",
		min = 0.5,
		max = 3,
		decimal = 1
	})

	form:MakeSlider({
		label = "label_show_me_what_you_got_player_target_range",
		serverConvar = "ttt_show_me_what_you_got_player_target_range",
		min = 500,
		max = 7000,
		decimal = 0
	})

	local form2 = vgui.CreateTTT2Form(parent, "help_show_me_what_you_got_offering_settings")

	form2:MakeSlider({
		label = "label_show_me_what_you_got_max_time_to_offer",
		serverConvar = "ttt_show_me_what_you_got_max_time_to_offer",
		min = 5,
		max = 20,
		decimal = 0
	})

	form2:MakeSlider({
		label = "label_show_me_what_you_got_safe_die_loot_value",
		serverConvar = "ttt_show_me_what_you_got_safe_die_loot_value",
		min = 1,
		max = 20,
		decimal = 0
	})

	form2:MakeSlider({
		label = "label_show_me_what_you_got_safe_survive_loot_value",
		serverConvar = "ttt_show_me_what_you_got_safe_survive_loot_value",
		min = 1,
		max = 20,
		decimal = 0
	})

	form2:MakeSlider({
		label = "label_show_me_what_you_got_max_loot_value_to_offer",
		serverConvar = "ttt_show_me_what_you_got_max_loot_value_to_offer",
		min = 1,
		max = 20,
		decimal = 0
	})
end
