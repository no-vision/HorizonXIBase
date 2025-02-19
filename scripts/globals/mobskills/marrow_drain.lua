-----------------------------------
-- Marrow Drain
-- Steals an enemy's MP. Ineffective against undead.
-----------------------------------
require("scripts/globals/mobskills")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    if mob:isMobType(xi.mobskills.mobType.NOTORIOUS) then
        return 0
    end

    return 1
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    local mpDrain = 52 + mob:getMainLvl() * 2
    local info = xi.mobskills.mobMagicalMove(mob, target, skill, mpDrain, xi.magic.ele.DARK, 1, xi.mobskills.magicalTpBonus.MAB_BONUS, 1)
    local dmg = xi.mobskills.mobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.DARK, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    skill:setMsg(xi.mobskills.mobPhysicalDrainMove(mob, target, skill, xi.mobskills.drainType.MP, dmg))

    return dmg
end

return mobskillObject
