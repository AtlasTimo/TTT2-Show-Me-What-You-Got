AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

util.AddNetworkString("HeadRechedItsEndPos")
util.AddNetworkString("NetworkFinalLootValueOffered")

function ENT:Initialize()
    self:SetModel("models/ent_show_me_what_youve_got_model/head.mdl")
    self:PhysicsInit(SOLID_NONE)
    self:SetSolid(SOLID_NONE)
    self:SetMoveType( MOVETYPE_NONE )
    self:PhysWake()
    self:DrawShadow(false)
    self.ableToMove = true
    self.playersInRange = {}
    self.allowOffering = false

    net.Receive("NetworkFinalLootValueOffered", function(len, ply)
        if (not IsValid(self)) then return end
        if (not ply:Alive() or ply:GetObserverMode() ~= OBS_MODE_NONE) then return end

        local finalHeadLikes = net.ReadBool()
        if (not finalHeadLikes) then
            ply:TakeDamage(500, self:GetOwner(), nil)
        end
    end)
end

function ENT:Think()
    if (not self.ableToMove) then return end

    if (self.initialPos == nil) then
        self.initialPos = self:GetPos()
    end

    local distanceVector = self.initialPos - self:GetPos()

    if (distanceVector:Length() > SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_max_movement_distance) then
        self:EndMovement()
        return
    end

    self:SetPos(self:GetPos() + self:GetForward() * 10 * SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_movement_speed)

    local movementTrace = util.QuickTrace(self:GetPos(), self:GetForward() * 75, self)

    if (movementTrace.HitWorld) then
        self:EndMovement()
        return
    end

    self:NextThink(CurTime() + 1 / 30)
    return true
end

local showMeWhatYouGotSound = Sound("show_me_what_you_got.ogg")

function ENT:EndMovement()
    self.ableToMove = false
    self.allowOffering = true

    self:SelectPlayers()
    if (#self.playersInRange <= 0) then
        self:Remove()
        return
    end
    self:EmitSound(showMeWhatYouGotSound, 100, 100, 1)
    self:RotateToRandomplayer()

    timer.Simple(SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_max_time_to_offer, function()
        if (not IsValid(self)) then return end
        self.allowOffering = false
    end)

    timer.Simple(SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_max_time_to_offer + 2.5, function()
        if (not IsValid(self)) then return end
        self:Remove()
    end)

    net.Start("HeadRechedItsEndPos")
    net.Send(self.playersInRange)
end

function ENT:SelectPlayers()
    local entsInRange = ents.FindInSphere(self:GetPos(), SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_player_target_range)
    local ow = self:GetOwner()
    for i, v in pairs(entsInRange) do
        if (v:IsPlayer() and v:Alive() and v:GetObserverMode() == OBS_MODE_NONE and v:IsLineOfSightClear(self:GetPos()) and v:GetName() ~= ow:GetName() and v:GetTeam() ~= ow:GetTeam()) then
            table.insert(self.playersInRange, v)
        end
    end
end

function ENT:RotateToRandomplayer()
    local randomPlayer = self.playersInRange[math.random(#self.playersInRange)]
    local angleToPlayer = (randomPlayer:EyePos() - self:GetPos()):Angle()
    self:SetAngles(angleToPlayer)
end