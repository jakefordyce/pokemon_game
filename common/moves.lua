local M = {}

--List of all of the available moves

meffects = {}
meffects[0] = {}
meffects[0].id = 1
meffects[0].target = 1
meffects[0].param1 = 100
meffects[0].param2 = 1

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


return M