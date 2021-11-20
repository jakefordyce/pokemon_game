local M = {}

--List of all of the available moves

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 95 + (moveLevel * 5)
	return damage
end
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
meffects[1].param1 = function(moveLevel)
	chance = 75 + (moveLevel * 5)
	return chance
end
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
meffects[1].param1 = function(moveLevel)
	damage = 125 + (moveLevel * 5)
	return damage
end
meffects[1].param2 = "attack"

M[3] = {
	name = "Scratch",
	effects = meffects,
	cooldown = 0,
	default = true,
	type = 1,
	targetting = 1,
	description = function(moveLevel)
		damage = 125 + (moveLevel * 5)
		return "Attacks 1 enemy for "..damage.."% of Attack."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 150 + (moveLevel * 10)
	return damage
end
meffects[1].param2 = "spattack"

M[4] = {
	name = "Vine Whip",
	effects = meffects,
	cooldown = 0,
	default = true,
	type = 11,
	targetting = 1,
	description = function(moveLevel)
		damage = 150 + (moveLevel * 10)
		return "Attacks 1 enemy for "..damage.."% of Special Attack."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 125 + (moveLevel * 5)
	return damage
end
meffects[1].param2 = "spattack"

M[5] = {
	name = "Bubble",
	effects = meffects,
	cooldown = 0,
	default = true,
	type = 10,
	targetting = 1,
	description = function(moveLevel)
		damage = 125 + (moveLevel * 5)
		return "Attacks 1 enemy for "..damage.."% of Special Attack."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 125 + (moveLevel * 5)
	return damage
end
meffects[1].param2 = "spattack"

M[6] = {
	name = "Ember",
	effects = meffects,
	cooldown = 0,
	default = true,
	type = 9,
	targetting = 1,
	description = function(moveLevel)
		damage = 125 + (moveLevel * 5)
		return "Attacks 1 enemy for "..damage.."% of Special Attack."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 3
meffects[1].target = 4
meffects[1].param1 = function(moveLevel)
	chance = 75 + (moveLevel * 5)
	return chance
end
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
		return "Has a "..chance.."% chance of increasing Attack of all allies."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 200 + (moveLevel * 10)
	return damage
end
meffects[1].param2 = "attack"


meffects[2] = {}
meffects[2].id = 4
meffects[2].target = 1
meffects[2].param1 = function(moveLevel)
	chance = 75 + (moveLevel * 5)
	return chance
end
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
		damage = 200 + (moveLevel * 10)
		return "Attacks 1 enemy for "..damage.."% of Attack then has a "..chance.."% chance of reducing that enemy's defense."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	damage = 150 + (moveLevel * 10)
	return damage
end
meffects[1].param2 = "spattack"
meffects[1].extra_crit = 25

M[9] = {
	name = "Razor Leaf",
	effects = meffects,
	cooldown = 5,
	default = false,
	type = 11,
	targetting = 1,
	description = function(moveLevel)
		damage = 150 + (moveLevel * 10)
		return "Attacks all enemies for "..damage.."% of Special Attack. Has an extra 25% chance of dealing a critical hit."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	return 300
end
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
meffects[1].param1 = function(moveLevel)
	return 900
end
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

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	damage = 50 + (moveLevel * 5)
	return damage
end
meffects[1].param2 = "spattack"

meffects[2] = meffects[1]
meffects[3] = meffects[1]


M[12] = {
	name = "Fire Spin",
	effects = meffects,
	cooldown = 3,
	default = false,
	type = 9,
	targetting = 1,
	description = function(moveLevel)
		damage = 50 + (moveLevel * 5)
		return "Attacks all enemies 3 times for "..damage.."% of Special Attack."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 5
meffects[1].target = 4
meffects[1].param1 = function(moveLevel)
	chance = 75 + (moveLevel * 5)
	return chance
end
meffects[1].param2 = 2

M[13] = {
	name = "Iron Defense",
	effects = meffects,
	cooldown = 3,
	default = false,
	type = 1,
	targetting = 2,
	description = function(moveLevel)
		chance = 75 + (moveLevel * 5)
		return "Has a "..chance.."% chance of increasing Defense of all allies."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 6
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	return 10
end
meffects[1].param2 = "attack"

M[14] = {
	name = "Super Fang",
	effects = meffects,
	cooldown = 3,
	default = false,
	type = 1,
	targetting = 1,
	description = function(moveLevel)
		damage = 10
		return "Attacks 1 enemy for "..damage.."% of their Max HP."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 7 --increase speed
meffects[1].target = 4
meffects[1].param1 = function(moveLevel)
	return 75 + (5 * moveLevel)
end
meffects[1].param2 = 2

meffects[2] = {}
meffects[2].id = 8 --increase turn
meffects[2].target = 4
meffects[2].param1 = function(moveLevel)
	return 75 + (5 * moveLevel)
end
meffects[2].param2 = 25

M[15] = {
	name = "Energize",
	effects = meffects,
	cooldown = 3,
	default = false,
	type = 12,
	targetting = 2,
	description = function(moveLevel)
		chance = 75 + (5 + moveLevel)
		return "Has a "..chance.."% chance of increasing speed of all allies for 2 turns and increasing the turn of all allies by 25%"
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 9 --reduce accuracy
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	return 75 + (5 * moveLevel)
end
meffects[1].param2 = 2

M[16] = {
	name = "Sand Attack",
	effects = meffects,
	cooldown = 3,
	default = false,
	type = 5,
	targetting = 1,
	description = function(moveLevel)
		chance = 75 + (5 * moveLevel)
		return "Has a "..chance.."% chance of reducing the accuracy of all enemies for 2 turns."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	damage = 150 + (moveLevel * 10)
	return damage
end
meffects[1].param2 = "spattack"

meffects[2] = {}
meffects[2].id = 10 --reduce speed
meffects[2].target = 3
meffects[2].param1 = function(moveLevel)
	return 25 + (5 * moveLevel)
end
meffects[2].param2 = 2

M[17] = {
	name = "Bubblebeam",
	effects = meffects,
	cooldown = 4,
	default = false,
	type = 10,
	targetting = 1,
	description = function(moveLevel)
		chance = 25 + (5 * moveLevel)
		damage = 150 + (10 * moveLevel)
		return "Attacks all enemies for "..damage.."% of Special Attack and has a "..chance.."% chance of reducing the speed of all enemies for 2 turns."
	end
}


meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	damage = 150 + (moveLevel * 10)
	return damage
end
meffects[1].param2 = "spattack"
meffects[1].ignore_def = 25

M[18] = {
	name = "Psywave",
	effects = meffects,
	cooldown = 5,
	default = false,
	type = 13,
	targetting = 1,
	description = function(moveLevel)
		damage = 150 + (10 * moveLevel)
		return "Attacks all enemies for "..damage.."% of Special Attack. This attack ignores 25% of the target's defense."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 200 + (moveLevel * 10)
	return damage
end
meffects[1].param2 = "attack"
meffects[1].extra_crit = 100

M[19] = {
	name = "Vital Throw",
	effects = meffects,
	cooldown = 5,
	default = false,
	type = 2,
	targetting = 1,
	description = function(moveLevel)
		damage = 200 + (10 * moveLevel)
		return "Attacks an enemy for "..damage.."% of Attack. This attack will always crit."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 11 -- sleep
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	return 75 + (5 * moveLevel)
end
meffects[1].param2 = 1

M[20] = {
	name = "Hypnosis",
	effects = meffects,
	cooldown = 3,
	default = false,
	type = 15,
	targetting = 1,
	description = function(moveLevel)
		chance = 75 + (5 * moveLevel)
		return "Has a "..chance.."% chance of putting all enemies to sleep for 1 turns."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	damage = 150 + (moveLevel * 10)
	return damage
end
meffects[1].param2 = "attack"

meffects[2] = {}
meffects[2].id = 12 --decrease turn
meffects[2].target = 3
meffects[2].param1 = function(moveLevel)
	return 50 + (5 * moveLevel)
end
meffects[2].param2 = 25

M[21] = {
	name = "Rock Slide",
	effects = meffects,
	cooldown = 4,
	default = false,
	type = 5,
	targetting = 1,
	description = function(moveLevel)
		damage = 150 + (10 * moveLevel)
		chance = 50 + (5 * moveLevel)
		return "Attacks all enemies for "..damage.."% of Attack and has a "..chance.."% chance of reducing the turn meter of all enemies by 25%."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 150 + (moveLevel * 10)
	return damage
end
meffects[1].param2 = "spattack"
meffects[1].ignore_def = 100

M[22] = {
	name = "Magic Leaf",
	effects = meffects,
	cooldown = 4,
	default = false,
	type = 11,
	targetting = 1,
	description = function(moveLevel)
		damage = 150 + (10 * moveLevel)
		return "Attacks an enemy for "..damage.."% of Special Attack. This attack ignores the target's defense."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 13
meffects[1].target = 4
meffects[1].param1 = function(moveLevel)
	chance = 75 + (moveLevel * 5)
	return chance
end
meffects[1].param2 = 1

M[23] = {
	name = "Smokescreen",
	effects = meffects,
	cooldown = 3,
	default = false,
	type = 1,
	targetting = 2,
	description = function(moveLevel)
		chance = 75 + (moveLevel * 5)
		return "Has a "..chance.."% chance of placing Block Debuff on all allies for 1 turn."
	end
}

return M