AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function SWEP:PrimaryAttack()
    self:SetNextPrimaryFire(CurTime() + 1.0)

    local allHeadEntsOnMap = ents.FindByClass("ent_show_me_what_you_got_head")

    if (#allHeadEntsOnMap > 0) then return end

    local ow = self:GetOwner()

    local headEnt = ents.Create("ent_show_me_what_you_got_head")
    headEnt:SetPos(ow:EyePos())
    headEnt:SetAngles(ow:EyeAngles())
    headEnt:Spawn()
    headEnt:SetCollisionGroup(COLLISION_GROUP_NONE)
    headEnt:SetOwner(self:GetOwner())

    ow:StripWeapon("weapon_show_me_what_you_got_gun")
end