SHOW_ME_WHAT_YOU_GOT = SHOW_ME_WHAT_YOU_GOT or {}
SHOW_ME_WHAT_YOU_GOT.CVARS = SHOW_ME_WHAT_YOU_GOT.CVARS or {}

local show_me_what_you_got_max_movement_distance = CreateConVar("ttt_show_me_what_you_got_max_movement_distance", "1000", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})
local show_me_what_you_got_movement_speed = CreateConVar("ttt_show_me_what_you_got_movement_speed", "1", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})
local show_me_what_you_got_player_target_range = CreateConVar("ttt_show_me_what_you_got_player_target_range", "1500", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})
local show_me_what_you_got_max_time_to_offer = CreateConVar("ttt_show_me_what_you_got_max_time_to_offer", "10", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})
local show_me_what_you_got_safe_die_loot_value = CreateConVar("ttt_show_me_what_you_got_safe_die_loot_value", "4", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})
local show_me_what_you_got_safe_survive_loot_value = CreateConVar("ttt_show_me_what_you_got_safe_survive_loot_value", "9", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})
local show_me_what_you_got_max_loot_value_to_offer = CreateConVar("ttt_show_me_what_you_got_max_loot_value_to_offer", "10", {FCVAR_NOTIFY, FCVAR_ARCHIVE, FCVAR_REPLICATED})

SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_max_movement_distance = show_me_what_you_got_max_movement_distance:GetInt()
SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_movement_speed = show_me_what_you_got_movement_speed:GetFloat()
SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_player_target_range = show_me_what_you_got_player_target_range:GetInt()
SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_max_time_to_offer = show_me_what_you_got_max_time_to_offer:GetInt()
SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_safe_die_loot_value = show_me_what_you_got_safe_die_loot_value:GetInt()
SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_safe_survive_loot_value = show_me_what_you_got_safe_survive_loot_value:GetInt()
SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_max_loot_value_to_offer = show_me_what_you_got_max_loot_value_to_offer:GetInt()

if SERVER then

  cvars.AddChangeCallback("ttt_show_me_what_you_got_max_movement_distance", function(name, old, new)
    SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_max_movement_distance = tonumber(new)
  end, nil)

  cvars.AddChangeCallback("ttt_show_me_what_you_got_movement_speed", function(name, old, new)
    SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_movement_speed = tonumber(new)
  end, nil)

  cvars.AddChangeCallback("ttt_show_me_what_you_got_player_target_range", function(name, old, new)
    SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_player_target_range = tonumber(new)
  end, nil)

  cvars.AddChangeCallback("ttt_show_me_what_you_got_max_time_to_offer", function(name, old, new)
    SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_max_time_to_offer = tonumber(new)
  end, nil)

  cvars.AddChangeCallback("ttt_show_me_what_you_got_safe_die_loot_value", function(name, old, new)
    SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_safe_die_loot_value = tonumber(new)
  end, nil)

  cvars.AddChangeCallback("ttt_show_me_what_you_got_safe_survive_loot_value", function(name, old, new)
    SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_safe_survive_loot_value = tonumber(new)
  end, nil)

  cvars.AddChangeCallback("ttt_show_me_what_you_got_max_loot_value_to_offer", function(name, old, new)
    SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_max_loot_value_to_offer = tonumber(new)
  end, nil)

end
