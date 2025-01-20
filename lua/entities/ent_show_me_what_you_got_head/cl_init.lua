include("shared.lua")

local material = Material("vgui/white")
local safeDieColor = Color(221, 21, 21)
local randomDieColor = Color(253, 222, 21)
local safeSurviveColor = Color(51, 255, 51)
local wireColor = Color(255, 51, 51, 70)

local iLikeWhatYouGotSound = Sound("i_like_what_you_got.ogg")
local disqualifiedSound = Sound("disqualified.ogg")

function ENT:Initialize()
    self.lootValue = 0.0
    self.currentColor = safeDieColor
    self.headLikes = false
    self.headMoving = true

    net.Receive("NetworkLootValue", function()
        self.lootValue = self.lootValue + net.ReadFloat()
        if (self.lootValue >= SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_safe_survive_loot_value) then
            if (self.lootValue >= 10) then
                self.lootValue = 10
            end
            self.currentColor = safeSurviveColor
        elseif (self.lootValue >= SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_safe_die_loot_value) then
            self.currentColor = randomDieColor
        end
    end)

    net.Receive("HeadRechedItsEndPos", function()
        self:HeadRechedItsEndPos()

        timer.Simple(10, function()
            if (not IsValid(self)) then return end
            local ow = self:GetOwner()
            if (not LocalPlayer():Alive() or LocalPlayer():GetObserverMode() ~= OBS_MODE_NONE and LocalPlayer():GetName() ~= ow:GetName() and LocalPlayer():GetTeam() ~= ow:GetTeam()) then return end

            if (self.lootValue >= SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_safe_survive_loot_value) then
                self:EmitSound(iLikeWhatYouGotSound, 100, 100, 1)
                self.headLikes = true
            elseif (self.lootValue >= SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_safe_die_loot_value) then
                local randNum = math.random(100)
                print(tostring(randNum))
                if (randNum < 50) then
                    self:EmitSound(iLikeWhatYouGotSound, 100, 100, 1)
                    self.headLikes = true
                else
                    self:EmitSound(disqualifiedSound, 100, 100, 1)
                end
            else
                self:EmitSound(disqualifiedSound, 100, 100, 1)
            end
        end)

        timer.Simple(SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_max_time_to_offer + 2, function()
            if (not IsValid(self)) then return end
            net.Start("NetworkFinalLootValueOffered")
                net.WriteBool(self.headLikes)
            net.SendToServer()
        end)
    end)
end

function ENT:Draw()
    self:DrawModel()
    if (self.headMoving) then return end
    cam.Start3D()
    render.SetMaterial(material)
    render.DrawBox(self:GetPos() + self:GetUp() * 70, self:GetAngles(), Vector(-3, -20, -3), Vector(3, -20 + self.lootValue * (40 / SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_max_loot_value_to_offer), 3), self.currentColor)
    render.DrawWireframeBox(self:GetPos() + self:GetUp() * 70, self:GetAngles(), Vector(-3, -20, -3), Vector(3, 20, 3), wireColor)
    cam.End3D()
end

function ENT:HeadRechedItsEndPos()
    self.headMoving = false
    self.endPosTime = CurTime()

    hook.Add("HUDPaint", "ShowMeWhatYouGot" .. LocalPlayer():GetName(), function()
        if (self.endPosTime ~= nil and CurTime() < self.endPosTime + 5) then
            draw.SimpleTextOutlined("Look straight at the head and drop some weapons.", "ShowMeWhatYouGotFont", ScrW() / 2, ScrH() / 3, Color(216, 59, 59), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(255, 255, 255))
        end
    end)

    STATUS:RegisterStatus("playerEffectedByHead", {
        hud = Material("vgui/ttt/show_me_what_you_got_status_icon.png"),
        type = "bad"
    })

    STATUS:AddTimedStatus("playerEffectedByHead", SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_max_time_to_offer, true)
end