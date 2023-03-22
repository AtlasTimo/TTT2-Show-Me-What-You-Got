SWEP.PrintName			= "Show me what you got"
SWEP.Author				= "Atlas"
SWEP.Instructions		= "Shoot to eject the Head, wich will fly in the direction you look to.\nThe head will stop if it hits a wall or flies to far.\nAfter the head has stopped, everyone targeted by it will need to offer some weapons or items.\nTo offer a weapon, just look at the head and drop it.\nBased on the sum of the loot value offered, the head will decide to kill or not."
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Primary.ClipSize		= 1
SWEP.Primary.DefaultClip	= 1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "none"
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		= "none"

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false
SWEP.Slot				= 1
SWEP.SlotPos			= 2
SWEP.DrawAmmo			= true
SWEP.DrawCrosshair		= true

SWEP.HoldType 	= "grenade"
SWEP.ViewModelFOV = 54
SWEP.ViewModelFlip = false
SWEP.UseHands = true
SWEP.ViewModel = "models/c_show_me_what_youve_got_model/c_head.mdl"
SWEP.WorldModel = "models/w_show_me_what_youve_got_model/w_head.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true

SWEP.Icon 		= "VGUI/ttt/weapon_show_me_what_you_got.png"

SWEP.Base 			= "weapon_tttbase"
SWEP.Kind 			= WEAPON_EQUIP2
SWEP.AutoSpawnable 	= false
SWEP.AmmoEnt 		= "item_ammo_ttt"

SWEP.CanBuy = {ROLE_TRAITOR}
SWEP.InLoadoutFor 	= nil
SWEP.LimitedStock 	= true
SWEP.AllowDelete 	= false
SWEP.AllowDrop 		= true

if CLIENT then
	SWEP.EquipMenuData = {
		type = "Weapon",
		desc = "Shoot to eject the Head, wich will fly in the direction you look to.\nThe head will stop if it hits a wall or flies to far.\nAfter the head has stopped, everyone targeted by it will need to offer some weapons or items.\nTo offer a weapon, just look at the head and drop it.\nBased on the sum of the loot value offered, the head will decide to kill or not."
	};
end
