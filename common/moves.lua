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
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 1,
	targetting = 1,
	max_level = 5,
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
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 1,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		chance = 75 + (moveLevel * 5)
		return "Has a "..chance.."% chance of reducing the Attack of all enemies for 2 turns."
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
meffects[1].extra_crit = 15

M[3] = {
	name = "Scratch",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 1,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 125 + (moveLevel * 5)
		return "Attacks 1 enemy for "..damage.."% of Attack. Has an extra 15% chance of dealing a critical hit."
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
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 11,
	targetting = 1,
	max_level = 5,
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

meffects[2] = {}
meffects[2].id = 10 --reduce speed
meffects[2].target = 1
meffects[2].param1 = function(moveLevel)
	return 15 + (2 * moveLevel)
end
meffects[2].param2 = 2

M[5] = {
	name = "Bubble",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 10,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 125 + (moveLevel * 5)
		chance = 15 + (2 * moveLevel)
		return "Attacks 1 enemy for "..damage.."% of Special Attack. Has a "..chance.."% chance of reducing the enemy's speed for 2 turns"
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

meffects[2] = {}
meffects[2].id = 20 --burn
meffects[2].target = 1
meffects[2].param1 = function(moveLevel)
	return 15 + (moveLevel * 2)
end
meffects[2].param2 = 2

M[6] = {
	name = "Ember",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 9,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 125 + (moveLevel * 5)
		chance = 15 + (moveLevel * 2)
		return "Attacks 1 enemy for "..damage.."% of Special Attack. Has a "..chance.."% chance of burning the enemy for 2 turns"
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
	cooldown = function(moveLevel)
		return 0
	end,
	default = false,
	type = 1,
	targetting = 2,
	max_level = 5,
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
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 15,
	targetting = 1,
	max_level = 5,
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
	cooldown = function(moveLevel)
		if moveLevel > 5 then
			return 5 - (moveLevel - 5)
		end
		return 5
	end,
	default = false,
	type = 11,
	targetting = 1,
	max_level = 6,
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
	return 200
end
meffects[1].param2 = "attack"

M[10] = {
	name = "Mega Punch",
	effects = meffects,
	cooldown = function(moveLevel)
		return 1
	end,
	default = true,
	type = 1,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 200
		return "Boss Move: Attacks 1 enemy for "..damage.."% of Attack."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	return 250
end
meffects[1].param2 = "attack"

M[11] = {
	name = "Mega Impact",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 1,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 250
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
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 9,
	targetting = 1,
	max_level = 5,
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
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 1,
	targetting = 2,
	max_level = 5,
	description = function(moveLevel)
		chance = 75 + (moveLevel * 5)
		return "Has a "..chance.."% chance of increasing Defense of all allies."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	return 10
end
meffects[1].param2 = "enemy_hp"
meffects[1].param3 = function(moveLevel)
	damage = 100 + (moveLevel * 5)
	return damage
end
meffects[1].param4 = "attack"

M[14] = {
	name = "Super Fang",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 1,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 10
		attk_damage = 100 + (moveLevel * 5)
		return "Attacks 1 enemy for "..damage.."% of their Max HP plus "..attk_damage.."% of Attack."
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
	return 100
end
meffects[2].param2 = 25

M[15] = {
	name = "Energize",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 12,
	targetting = 2,
	max_level = 5,
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
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 5,
	targetting = 1,
	max_level = 5,
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
	return 50 + (5 * moveLevel)
end
meffects[2].param2 = 2

M[17] = {
	name = "Bubblebeam",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 10,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		chance = 50 + (5 * moveLevel)
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
	cooldown = function(moveLevel)
		return 5
	end,
	default = false,
	type = 13,
	targetting = 1,
	max_level = 5,
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
	cooldown = function(moveLevel)
		return 5
	end,
	default = false,
	type = 2,
	targetting = 1,
	max_level = 5,
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
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 15,
	targetting = 1,
	max_level = 5,
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
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 5,
	targetting = 1,
	max_level = 5,
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
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 11,
	targetting = 1,
	max_level = 5,
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
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 1,
	targetting = 2,
	max_level = 5,
	description = function(moveLevel)
		chance = 75 + (moveLevel * 5)
		return "Has a "..chance.."% chance of placing Block Debuff on all allies for 1 turn."
	end
}


meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 250 + (moveLevel * 15)
	return damage
end
meffects[1].param2 = "attack"


meffects[2] = {}
meffects[2].id = 14
meffects[2].target = 1
meffects[2].param1 = function(moveLevel)
	chance = 25 + (moveLevel * 5)
	return chance
end
meffects[2].param2 = 1

M[24] = {
	name = "Clamp",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 10,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		chance = 25 + (moveLevel * 5)
		damage = 250 + (moveLevel * 15)
		return "Attacks 1 enemy for "..damage.."% of Attack then has a "..chance.."% chance of stunning the enemy for 1 turn."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 16
meffects[1].target = 4
meffects[1].param1 = function(moveLevel)
	heal = 100 + (moveLevel * 5)
	return heal
end
meffects[1].param2 = "spattack"

M[25] = {
	name = "Heal Pulse",
	effects = meffects,
	cooldown = function(moveLevel)
		return 1
	end,
	default = false,
	type = 13,
	targetting = 2,
	max_level = 5,
	description = function(moveLevel)
		heal = 100 + (moveLevel * 5)
		return "Heals all allies for "..heal.."% of Special Attack."
	end
}


meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 300 + (moveLevel * 15)
	return damage
end
meffects[1].param2 = "spattack"


meffects[2] = {}
meffects[2].id = 2
meffects[2].target = 1
meffects[2].param1 = function(moveLevel)
	chance = 100
	return chance
end
meffects[2].param2 = 2

M[26] = {
	name = "Aurora Beam",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 14,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 200 + (moveLevel * 10)
		return "Attacks 1 enemy for "..damage.."% of Special Attack then reduces that enemy's attack for 2 turns."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 17 --leech seed
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	return 75 + (5 * moveLevel)
end
meffects[1].param2 = 2

M[27] = {
	name = "Leech Seed",
	effects = meffects,
	cooldown = function(moveLevel)
		return 2
	end,
	default = false,
	type = 11,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		chance = 75 + (5 * moveLevel)
		return "Has a "..chance.."% chance of placing a leech seed on the target for 2 turns."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 250 + (moveLevel * 15)
	return damage
end
meffects[1].param2 = "attack"
meffects[1].extra_crit = 25

M[28] = {
	name = "Slash",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 1,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 250 + (moveLevel * 15)
		return "Attacks an enemy for "..damage.."% of Attack. Has an extra 25% chance of dealing a critical hit."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 4
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	chance = 75 + (moveLevel * 5)
	return chance
end
meffects[1].param2 = 2

M[29] = {
	name = "Tail Whip",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 1,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		chance = 75 + (moveLevel * 5)
		return "Has a "..chance.."% chance of reducing the Defense of all enemies for 2 turns."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 18
meffects[1].target = 4
meffects[1].param1 = function(moveLevel)
	chance = 75 + (moveLevel * 5)
	return chance
end
meffects[1].param2 = 1

M[30] = {
	name = "Protect",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 1,
	targetting = 2,
	max_level = 5,
	description = function(moveLevel)
		chance = 75 + (moveLevel * 5)
		return "Has a "..chance.."% chance of placing Protect on all allies for 1 turn."
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
meffects[2].id = 14 --stun
meffects[2].target = 3
meffects[2].param1 = function(moveLevel)
	return 25 + (5 * moveLevel)
end
meffects[2].param2 = 1

M[31] = {
	name = "Thunder Wave",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 12,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		chance = 25 + (5 * moveLevel)
		damage = 150 + (10 * moveLevel)
		return "Attacks all enemies for "..damage.."% of Special Attack and has a "..chance.."% chance of stunning all enemies for 1 turn."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 300 + (moveLevel * 20)
	return damage
end
meffects[1].param2 = "spattack"

M[32] = {
	name = "Psybeam",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 13,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 300 + (moveLevel * 20)
		return "Attacks an enemy for "..damage.."% of Special Attack."
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
meffects[1].param2 = "attack"
meffects[1].ignore_def = 100

M[33] = {
	name = "Seismic Toss",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 2,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 150 + (10 * moveLevel)
		return "Attacks an enemy for "..damage.."% of Attack. This attack ignores the target's defense."
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

M[34] = {
	name = "Nightshade",
	effects = meffects,
	cooldown = function(moveLevel)
		return 5
	end,
	default = false,
	type = 15,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 150 + (10 * moveLevel)
		return "Attacks all enemies for "..damage.."% of Special Attack. This attack ignores 25% of the target's defense."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 5
meffects[1].target = 0
meffects[1].param1 = function(moveLevel)
	chance = 75 + (moveLevel * 5)
	return chance
end
meffects[1].param2 = 2

meffects[2] = {}
meffects[2].id = 19
meffects[2].target = 0
meffects[2].param1 = function(moveLevel)
	chance = 100
	return chance
end
meffects[2].param2 = 2 -- duration. Currently not using
meffects[2].param3 = "hp"
meffects[2].param4 = function(moveLevel)
	shield = 20 + (moveLevel * 2)
	return shield
end


M[35] = {
	name = "Defense Curl",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 1,
	targetting = 0,
	max_level = 5,
	description = function(moveLevel)
		chance = 75 + (moveLevel * 5)
		shield = 20 + (moveLevel * 2)
		return "Has a "..chance.."% chance of increasing user's Defense for 2 turns. Also places a shield on the user for "..shield.."% of user's max HP"
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 16
meffects[1].target = 2
meffects[1].param1 = function(moveLevel)
	heal = 30 + (moveLevel * 2)
	return heal
end
meffects[1].param2 = "hp"

M[36] = {
	name = "Synthesis",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 11,
	targetting = 2,
	max_level = 5,
	description = function(moveLevel)
		heal = 30 + (moveLevel * 2)
		return "Heals an ally for "..heal.."% of User's max HP."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 250 + (moveLevel * 15)
	return damage
end
meffects[1].param2 = "spattack"

meffects[2] = {}
meffects[2].id = 7 --increase speed
meffects[2].target = 0
meffects[2].param1 = function(moveLevel)
	return 100
end
meffects[2].param2 = 2

M[37] = {
	name = "Flame Charge",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 9,
	targetting = 1,
	max_level = 5,
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
	damage = 300 + (moveLevel * 15)
	return damage
end
meffects[1].param2 = "spattack"


meffects[2] = {}
meffects[2].id = 2
meffects[2].target = 1
meffects[2].param1 = function(moveLevel)
	chance = 100
	return chance
end
meffects[2].param2 = 2

M[38] = {
	name = "Moonblast",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 15,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 200 + (moveLevel * 10)
		return "Attacks 1 enemy for "..damage.."% of Special Attack then reduces that enemy's attack for 2 turns."
	end
}


meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 250 + (moveLevel * 15)
	return damage
end
meffects[1].param2 = "defense"

meffects[2] = {}
meffects[2].id = 12 --decrease turn
meffects[2].target = 1
meffects[2].param1 = function(moveLevel)
	return 50 + (5 * moveLevel)
end
meffects[2].param2 = 25


M[39] = {
	name = "Headbutt",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 1,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		chance = 50 + (5 * moveLevel)
		damage = 250 + (moveLevel * 15)
		return "Attacks an enemy for "..damage.."% of Defense. Has a "..chance.."% chance of decreasing the enemy's turn by 25%."
	end
}


meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	damage = 200 + (moveLevel * 15)
	return damage
end
meffects[1].param2 = "spattack"

M[40] = {
	name = "Psychic",
	effects = meffects,
	cooldown = function(moveLevel)
		return 5
	end,
	default = false,
	type = 13,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 200 + (15 * moveLevel)
		return "Attacks all enemies for "..damage.."% of Special Attack."
	end
}


meffects = {}
meffects[1] = {}
meffects[1].id = 16
meffects[1].target = 0
meffects[1].param1 = function(moveLevel)
	heal = 40 + (moveLevel * 2)
	return heal
end
meffects[1].param2 = "hp"

meffects[2] = {}
meffects[2].id = 11 -- sleep
meffects[2].target = 0
meffects[2].param1 = function(moveLevel)
	return 100
end
meffects[2].param2 = 1

M[41] = {
	name = "Rest",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 1,
	targetting = 0,
	max_level = 5,
	description = function(moveLevel)
		heal = 40 + (moveLevel * 2)
		return "User heals for "..heal.."% of max HP then falls asleep."
	end
}


meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 150 + (moveLevel * 5)
	return damage
end
meffects[1].param2 = "spattack"

M[42] = {
	name = "Water Gun",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 10,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 150 + (moveLevel * 5)
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
meffects[1].param2 = "attack"

meffects[2] = {}
meffects[2].id = 12 --decrease turn
meffects[2].target = 1
meffects[2].param1 = function(moveLevel)
	return 25 + (5 * moveLevel)
end
meffects[2].param2 = 25

M[43] = {
	name = "Bite",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 15,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 125 + (5 * moveLevel)
		chance = 25 + (5 * moveLevel)
		return "Attacks an enemy for "..damage.."% of Attack and has a "..chance.."% chance of reducing the enemy's turn meter by 25%."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 50 + (moveLevel * 5)
	return damage
end
meffects[1].param2 = "attack"
meffects[1].min_hits = 2
meffects[1].max_hits = 4

M[44] = {
	name = "Fury Attack",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 1,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 50 + (moveLevel * 5)
		return "Attacks 1 enemy 2 to 4 times for "..damage.."% of Attack."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 100 + (moveLevel * 7)
	return damage
end
meffects[1].param2 = "attack"
meffects[1].min_hits = 2
meffects[1].max_hits = 5

M[45] = {
	name = "Fury Swipes",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 1,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 100 + (moveLevel * 7)
		return "Attacks 1 enemy 2 to 5 times for "..damage.."% of Attack."
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

M[46] = {
	name = "Charm",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 1,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		chance = 75 + (moveLevel * 5)
		return "Has a "..chance.."% chance of reducing the Attack of all enemies for 2 turns."
	end
}


meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 100 + (moveLevel * 5)
	return damage
end
meffects[1].param2 = "attack"

meffects[2] = {}
meffects[2].id = 15 --poison
meffects[2].target = 1
meffects[2].param1 = function(moveLevel)
	return 25 + (moveLevel * 5)
end
meffects[2].param2 = 2

M[47] = {
	name = "Poison Sting",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 4,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 100 + (moveLevel * 5)
		chance = 25 + (moveLevel * 5)
		return "Attacks 1 enemy for "..damage.."% of Attack. Has a "..chance.."% chance of poisoning the enemy for 2 turns"
	end
}


meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 250 + (moveLevel * 15)
	return damage
end
meffects[1].param2 = "attack"

meffects[2] = {}
meffects[2].id = 15 --poison
meffects[2].target = 1
meffects[2].param1 = function(moveLevel)
	return 50 + (moveLevel * 5)
end
meffects[2].param2 = 2

M[48] = {
	name = "Poison Jab",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 4,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 250 + (moveLevel * 15)
		chance = 50 + (moveLevel * 5)
		return "Attacks 1 enemy for "..damage.."% of Attack. Has a "..chance.."% chance of poisoning the enemy for 2 turns"
	end
}


meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 300 + (moveLevel * 18)
	return damage
end
meffects[1].param2 = "attack"

M[49] = {
	name = "Horn Attack",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 1,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 300 + (moveLevel * 18)
		return "Attacks an enemy for "..damage.."% of Attack."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	damage = 75 + (moveLevel * 5)
	return damage
end
meffects[1].param2 = "attack"

M[50] = {
	name = "Gust",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 3,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 75 + (moveLevel * 5)
		return "Attacks all enemies for "..damage.."% of Attack."
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

M[51] = {
	name = "Whirlwind",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 3,
	targetting = 1,
	max_level = 5,
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
	damage = 50 + (moveLevel * 5)
	return damage
end
meffects[1].param2 = "attack"
meffects[1].param3 = function(moveLevel)
	return 100
end
meffects[1].param4 = "speed"

M[52] = {
	name = "Quick Attack",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 1,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 50 + (moveLevel * 5)
		return "Attacks 1 enemy for "..damage.."% of Attack. The damage is increased by 100% of user's Speed as a percentage."
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
meffects[1].bonus_vs_psn = 2

M[53] = {
	name = "Venoshock",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 4,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 200 + (moveLevel * 10)
		return "Attacks 1 enemy for "..damage.."% of Attack. Deals double damage against poisoned targets."
	end
}


meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 100 + (moveLevel * 5)
	return damage
end
meffects[1].param2 = "attack"

meffects[2] = {}
meffects[2].id = 10 --reduce speed
meffects[2].target = 1
meffects[2].param1 = function(moveLevel)
	return 25 + (5 * moveLevel)
end
meffects[2].param2 = 2

M[54] = {
	name = "String Shot",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 6,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 100 + (moveLevel * 5)
		chance = 25 + (5 * moveLevel)
		return "Attacks 1 enemy for "..damage.."% of Attack. Has a "..chance.."% chance of reducing the enemy's speed for 2 turns"
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

meffects[2] = {}
meffects[2].id = 12 --decrease turn
meffects[2].target = 1
meffects[2].param1 = function(moveLevel)
	return 25 + (5 * moveLevel)
end
meffects[2].param2 = 25

M[55] = {
	name = "Thunder shock",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 12,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 125 + (5 * moveLevel)
		chance = 25 + (5 * moveLevel)
		return "Attacks an enemy for "..damage.."% of Attack and has a "..chance.."% chance of reducing the enemy's turn meter by 25%."
	end
}


meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 150 + (moveLevel * 7.5)
	return damage
end
meffects[1].param2 = "spattack"

M[56] = {
	name = "Telekinesis",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 13,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 150 + (moveLevel * 7.5)
		return "Attacks an enemy for "..damage.."% of Special Attack."
	end
}


meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	return 2.5
end
meffects[1].param2 = "enemy_hp"
meffects[1].param3 = function(moveLevel)
	damage = 100 + (moveLevel * 5)
	return damage
end
meffects[1].param4 = "attack"

M[57] = {
	name = "Low Kick",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 2,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 2.5
		attk_damage = 100 + (moveLevel * 5)
		return "Attacks 1 enemy for "..damage.."% of their Max HP plus "..attk_damage.."% of Attack."
	end
}

return M