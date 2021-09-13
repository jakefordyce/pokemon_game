local M = {}

--List of all of the available moves

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = 95
meffects[1].param2 = "attack"

M[1] = {
	name = "tackle",
	effects = meffects,
	cooldown = 0,
	default = true,
	type = 1,
	targetting = 1,
	description = function(moveLevel)
		damage = 95 + (moveLevel * 5)
		return "Tackle - Attacks 1 enemy for "..damage.."% of Attack."
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
		return "Growl - Has a "..chance.."% chance of reducing Attack of 1 enemy."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = 100
meffects[1].param2 = "attack"

M[3] = {
	name = "scratch",
	effects = meffects,
	cooldown = 0,
	default = true,
	type = 1,
	targetting = 1,
	description = function(moveLevel)
		damage = 100 + (moveLevel * 5)
		return "Scratch - Attacks 1 enemy for "..damage.."% of Attack."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = 100
meffects[1].param2 = "spattack"

M[4] = {
	name = "vine whip",
	effects = meffects,
	cooldown = 0,
	default = true,
	type = 1, -- change to grass.
	targetting = 1,
	description = function(moveLevel)
		damage = 100 + (moveLevel * 5)
		return "Vine Whip - Attacks 1 enemy for "..damage.."% of Special Attack."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = 100
meffects[1].param2 = "spattack"

M[5] = {
	name = "bubble",
	effects = meffects,
	cooldown = 0,
	default = true,
	type = 1, -- change to water.
	targetting = 1,
	description = function(moveLevel)
		damage = 100 + (moveLevel * 5)
		return "Bubble - Attacks 1 enemy for "..damage.."% of Special Attack."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = 100
meffects[1].param2 = "spattack"

M[6] = {
	name = "ember",
	effects = meffects,
	cooldown = 0,
	default = true,
	type = 1, -- change to fire.
	targetting = 1,
	description = function(moveLevel)
		damage = 100 + (moveLevel * 5)
		return "Ember - Attacks 1 enemy for "..damage.."% of Special Attack."
	end
}


return M