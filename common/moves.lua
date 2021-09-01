local M = {}

--List of all of the available moves

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = 100
meffects[1].param2 = "attack"

M[1] = {
	name = "tackle",
	effects = meffects,
	cooldown = 0,
	default = true,
	type = 1,
	targetting = 1,
	description = function(moveLevel)
		damage = 100 + (moveLevel * 5)
		return "Attacks 1 enemy for "..damage.."% of Attack."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 2
meffects[1].target = 1
meffects[1].param1 = 75
meffects[1].param2 = 2

M[2] = {
	name = "growl",
	effects = meffects,
	cooldown = 2,
	default = false,
	type = 1,
	targetting = 1,
	description = function(moveLevel)
		chance = 75 + (moveLevel * 5)
		return "Has a "..chance.."% chance of reducing Attack of 1 enemy."
	end
}


return M