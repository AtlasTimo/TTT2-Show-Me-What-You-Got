util.AddNetworkString("NetworkLootValue")

hook.Add("PlayerDroppedWeapon", "HeadGainedOffering", function(owner, wep)
    if (not owner:Alive() or owner:GetObserverMode() ~= OBS_MODE_NONE) then return end

    local headEntTable = ents.FindInCone(owner:EyePos(), owner:GetAimVector(), SHOW_ME_WHAT_YOU_GOT.CVARS.show_me_what_you_got_player_target_range * 2, math.cos(math.rad(10)))
    local lookingAtHead = false
    local headEnt = nil

    for i, e in pairs(headEntTable) do
        if (e:GetClass() == "ent_show_me_what_you_got_head") then
            lookingAtHead = true
            headEnt = e
            break
        end
    end
    if (not lookingAtHead) then return end

    if (not (IsValid(headEnt) and headEnt.allowOffering and owner:IsLineOfSightClear(headEnt:GetPos()) and owner:GetName() ~= headEnt:GetOwner():GetName() and owner:GetTeam() ~= headEnt:GetOwner():GetTeam())) then return end

    local lootValue = wep.scaledVal or 2

    net.Start("NetworkLootValue")
        net.WriteFloat(lootValue)
    net.Send(owner)

    wep:Remove()
end)