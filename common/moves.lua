local M = {}

--List of all of the available moves

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = 95
meffects[1].param2 = "attack"

M[1] = {
	name = "Tackle",
	effects = meffects,
	cooldown = 0,
	default = true,
	type = 1,
	targetting = 1,
	description = function(moveLevel)
		damage = 95 + (moveLevel * 5)
		return "Attacks 1 enemy for "..damage.."% of Attack."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 2
meffects[1].target = 3
meffects[1].param1 = 75
meffects[1].param2 = 2

M[2] = {
	name = "Growl",
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

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = 100
meffects[1].param2 = "attack"

M[3] = {
	name = "Scratch",
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
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = 100
meffects[1].param2 = "spattack"

M[4] = {
	name = "Vine Whip",
	effects = meffects,
	cooldown = 0,
	default = true,
	type = 11,
	targetting = 1,
	description = function(moveLevel)
		damage = 100 + (moveLevel * 5)
		return "Attacks 1 enemy for "..damage.."% of Special Attack."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = 100
meffects[1].param2 = "spattack"

M[5] = {
	name = "Bubble",
	effects = meffects,
	cooldown = 0,
	default = true,
	type = 10,
	targetting = 1,
	description = function(moveLevel)
		damage = 100 + (moveLevel * 5)
		return "Attacks 1 enemy for "..damage.."% of Special Attack."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = 100
meffects[1].param2 = "spattack"

M[6] = {
	name = "Ember",
	effects = meffects,
	cooldown = 0,
	default = true,
	type = 9,
	targetting = 1,
	description = function(moveLevel)
		damage = 100 + (moveLevel * 5)
		return "Attacks 1 enemy for "..damage.."% of Special Attack."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 3
meffects[1].target = 4
meffects[1].param1 = 75
meffects[1].param2 = 2

M[7] = {
	name = "Howl",
	effects = meffects,
	cooldown = 2,
	default = false,
	type = 1,
	targetting = 2,
	description = function(moveLevel)
		chance = 75 + (moveLevel * 5)
		return "Has a "..chance.."% chance of increasing Attack of 1 ally."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = 200
meffects[1].param2 = "attack"


meffects[2] = {}
meffects[2].id = 4
meffects[2].target = 1
meffects[2].param1 = 75
meffects[2].param2 = 2

M[8] = {
	name = "Crunch",
	effects = meffects,
	cooldown = 4,
	default = false,
	type = 15,
	targetting = 1,
	description = function(moveLevel)
		chance = 75 + (moveLevel * 5)
		damage = 200 + (moveLevel * 5)
		return "Attacks 1 enemy for "..damage.."% of Attack then has a "..chance.."% chance of reducing that enemy's defense."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = 1000
meffects[1].param2 = "spattack"

M[9] = {
	name = "Razor Leaf",
	effects = meffects,
	cooldown = 1,
	default = false,
	type = 11,
	targetting = 1,
	description = function(moveLevel)
		damage = 300 + (moveLevel * 15)
		return "Attacks all enemies for "..damage.."% of Special Attack."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = 300
meffects[1].param2 = "attack"

M[10] = {
	name = "Mega Punch",
	effects = meffects,
	cooldown = 1,
	default = true,
	type = 1,
	targetting = 1,
	description = function(moveLevel)
		damage = 300
		return "Boss Move: Attacks 1 enemy for "..damage.."% of Attack."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = 900
meffects[1].param2 = "attack"

M[11] = {
	name = "Mega Impact",
	effects = meffects,
	cooldown = 3,
	default = false,
	type = 1,
	targetting = 1,
	description = function(moveLevel)
		damage = 900
		return "Boss Move: Attacks all enemies for "..damage.."% of Attack."
	end
}


return M