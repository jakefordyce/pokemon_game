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
		return 3
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
meffects[1].min_hits = 3
meffects[1].max_hits = 3



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
		return "Has a "..chance.."% chance of putting all enemies to sleep for 1 turn."
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
meffects[2].param3 = "max_hp"
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
	heal = 15 + (moveLevel * 1)
	return heal
end
meffects[1].param2 = "max_hp"

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
		heal = 15 + (moveLevel * 1)
		return "Heals an ally for "..heal.."% of User's max HP."
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
meffects[1].param2 = "max_hp"

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

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 100 + (moveLevel * 5)
	return damage
end
meffects[1].param2 = "spattack"


meffects[2] = {}
meffects[2].id = 14
meffects[2].target = 1
meffects[2].param1 = function(moveLevel)
	chance = 15 + (moveLevel * 2)
	return chance
end
meffects[2].param2 = 1

M[58] = {
	name = "Lick",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 15,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		chance = 15 + (moveLevel * 2)
		damage = 100 + (moveLevel * 5)
		return "Attacks 1 enemy for "..damage.."% of Attack then has a "..chance.."% chance of stunning the enemy for 1 turn."
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
meffects[1].param2 = "attack"

M[59] = {
	name = "Rock Throw",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 5,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 150 + (moveLevel * 7.5)
		return "Attacks an enemy for "..damage.."% of Attack."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 50 + (moveLevel * 2.5)
	return damage
end
meffects[1].param2 = "spattack"
meffects[1].min_hits = 2
meffects[1].max_hits = 4

M[60] = {
	name = "Leafage",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 11,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 50 + (moveLevel * 2.5)
		return "Attacks 1 enemy 2 to 4 times for "..damage.."% of Special Attack."
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
meffects[1].param2 = "attack"

M[61] = {
	name = "Pound",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 1,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 150 + (moveLevel * 7.5)
		return "Attacks 1 enemy for "..damage.."% of Attack."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 125 + (moveLevel * 7.5)
	return damage
end
meffects[1].param2 = "attack"

meffects[2] = {}
meffects[2].id = 21 --bleed
meffects[2].target = 1
meffects[2].param1 = function(moveLevel)
	return 15 + (moveLevel * 2)
end
meffects[2].param2 = 2

M[62] = {
	name = "Metal Claw",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 7,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 125 + (moveLevel * 7.5)
		chance = 15 + (moveLevel * 2)
		return "Attacks 1 enemy for "..damage.."% of Attack. Has a "..chance.."% chance of making the target Bleed for 2 rounds."
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
meffects[2].id = 22
meffects[2].target = 1
meffects[2].param1 = function(moveLevel)
	chance = 15 + (moveLevel * 2)
	return chance
end
meffects[2].param2 = 1

M[63] = {
	name = "Confusion",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 13,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		chance = 15 + (moveLevel * 2)
		damage = 125 + (moveLevel * 5)
		return "Attacks 1 enemy for "..damage.."% of Special Attack then has a "..chance.."% chance of confusing the enemy for 1 turn."
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
meffects[1].param2 = "spattack"

M[64] = {
	name = "Powder Snow",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 14,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 75 + (moveLevel * 5)
		return "Attacks all enemies for "..damage.."% of Special Attack."
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
meffects[1].leech = 50
meffects[1].bonus_vs_sleep = 2

M[65] = {
	name = "Dream Eater",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 13,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 150 + (moveLevel * 10)
		leech = 50
		return "Attacks an enemy for "..damage.."% of Special Attack. The user is healed for 50% of damage done. This attack deals double damage against sleeping targets."
	end
}


meffects = {}
meffects[1] = {}
meffects[1].id = 23 -- block cooldowns
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	return 75 + (5 * moveLevel)
end
meffects[1].param2 = 1

M[66] = {
	name = "Disable",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 1,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		chance = 75 + (5 * moveLevel)
		return "Has a "..chance.."% chance of placing Block Cooldowns all enemies for 1 turns."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 15
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	chance = 75 + (moveLevel * 5)
	return chance
end
meffects[1].param2 = 2

M[67] = {
	name = "Poison Powder",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 4,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		chance = 75 + (moveLevel * 5)
		return "Has a "..chance.."% chance of Poisoning all enemies for 2 turns."
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
meffects[1].leech = 50

M[68] = {
	name = "Leech Life",
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
		return "Attacks 1 enemy for "..damage.."% of Attack. The user is healed for half of the damage dealt."
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

M[69] = {
	name = "Leer",
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
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 150 + (moveLevel * 7.5)
	return damage
end
meffects[1].param2 = "attack"

M[70] = {
	name = "Peck",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 3,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 150 + (moveLevel * 7.5)
		return "Attacks 1 enemy for "..damage.."% of Attack."
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

M[71] = {
	name = "Aerial Ace",
	effects = meffects,
	cooldown = function(moveLevel)
		return 5
	end,
	default = false,
	type = 3,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 200 + (10 * moveLevel)
		return "Attacks an enemy for "..damage.."% of Attack. This attack will always crit."
	end
}


meffects = {}
meffects[1] = {}
meffects[1].id = 3 --increase attack
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

M[72] = {
	name = "Swords Dance",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 1,
	targetting = 2,
	max_level = 5,
	description = function(moveLevel)
		chance = 75 + (5 + moveLevel)
		return "Has a "..chance.."% chance of increasing Attack of all allies for 2 turns and increasing the turn of all allies by 25%"
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

M[73] = {
	name = "Cut",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 1,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 150 + (moveLevel * 10)
		return "Attacks 1 enemy for "..damage.."% of Attack."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 16
meffects[1].target = 2
meffects[1].param1 = function(moveLevel)
	heal = 25 + (moveLevel * 2)
	return heal
end
meffects[1].param2 = "max_hp"

M[74] = {
	name = "Softboiled",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 1,
	targetting = 2,
	max_level = 5,
	description = function(moveLevel)
		heal = 25 + (moveLevel * 2)
		return "Heals an ally for "..heal.."% of User's max HP."
	end
}


meffects = {}
meffects[1] = {}
meffects[1].id = 6
meffects[1].target = 0
meffects[1].param1 = function(moveLevel)
	return 100
end
meffects[1].charges = 10
meffects[1].charges_stack = false


M[75] = {
	name = "Stone Armor",
	effects = meffects,
	cooldown = function(moveLevel)
		return 5
	end,
	default = false,
	type = 1,
	targetting = 0,
	max_level = 5,
	description = function(moveLevel)
		chance = 100
		reduction = 90
		return "Boss Move: Has a "..chance.."% chance of adding armor to the user which reduces all damage taken by "..reduction.."%. Has 10 charges. 1 charge is lost every time the user is hit."
	end
}


meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	damage = 200 + (moveLevel * 50)
	return damage
end
meffects[1].param2 = "attack"
meffects[1].extra_damage_user_status = 6
meffects[1].extra_damage_amount = 200

meffects[2] = {}
meffects[2].id = 25 -- extra turn
meffects[2].target = 0
meffects[2].param1 = function(moveLevel)
	return 100
end

M[76] = {
	name = "Seismic Slam",
	effects = meffects,
	cooldown = function(moveLevel)
		return 5
	end,
	default = false,
	type = 5,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 200 + (50 * moveLevel)
		return "Boss Move: Attacks all enemies for "..damage.."% of Attack. Damage is increased if the user has Stone Armor."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	damage = 200 + (moveLevel * 50)
	return damage
end
meffects[1].param2 = "attack"

meffects[2] = {}
meffects[2].id = 12 --decrease turn
meffects[2].target = 3
meffects[2].param1 = function(moveLevel)
	return 100
end
meffects[2].param2 = 100

M[77] = {
	name = "Land Slide",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 5,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 200 + (50 * moveLevel)
		return "Boss Move: Attacks all enemies for "..damage.."% of Attack and reduces the turn meter of all enemies by 100%."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	damage = 100 + (moveLevel * 50)
	return damage
end
meffects[1].param2 = "attack"

meffects[2] = {}
meffects[2].id = 24 --poison
meffects[2].target = 3
meffects[2].param1 = function(moveLevel)
	return 100
end
meffects[2].param2 = 4

M[78] = {
	name = "Venomous Barbs",
	effects = meffects,
	cooldown = function(moveLevel)
		return 5
	end,
	default = false,
	type = 4,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 100 + (moveLevel * 50)
		return "Boss Move: Attacks all enemies for "..damage.."% of Attack. Targets that take damage are badly poisoned for 4 turns."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 2
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	return 100
end
meffects[1].param2 = 4

meffects[2] = {}
meffects[2].id = 4
meffects[2].target = 3
meffects[2].param1 = function(moveLevel)
	return 100
end
meffects[2].param2 = 4

M[79] = {
	name = "Impending Doom",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 15,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		chance = 100
		return "Boss Move: Has a "..chance.."% chance of reducing the Attack and Defense of all enemies for 4 turns."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	damage = 100 + (moveLevel * 50)
	return damage
end
meffects[1].param2 = "spattack"

meffects[2] = {}
meffects[2].id = 20 --burn
meffects[2].target = 3
meffects[2].param1 = function(moveLevel)
	return 100
end
meffects[2].param2 = 4
meffects[2].min_hits = 2
meffects[2].max_hits = 2

meffects[3] = {}
meffects[3].id = 26 --heal reduce
meffects[3].target = 3
meffects[3].param1 = function(moveLevel)
	return 100
end
meffects[3].param2 = 4

M[80] = {
	name = "Infernal Flames",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 9,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 100 + (moveLevel * 50)
		chance = 100
		return "Boss Move: Attacks all enemies for "..damage.."% of Special Attack. Has a "..chance.."% chance of burning the enemies for 4 turns"
	end
}


meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	damage = 100 + (moveLevel * 50)
	return damage
end
meffects[1].param2 = "spattack"
meffects[1].extra_damage_target_status = 20
meffects[1].extra_damage_amount = 200


M[81] = {
	name = "Eruption",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 9,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 100 + (50 * moveLevel)
		return "Boss Move: Attacks all enemies for "..damage.."% of Special Attack. Damage is increased if the target is burned."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	damage = 50 + (moveLevel * 25)
	return damage
end
meffects[1].param2 = "spattack"
meffects[1].extra_damage_target_status_count = -1
meffects[1].extra_damage_amount = 100
meffects[1].leech = 200


M[82] = {
	name = "Feast on Misery",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 15,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 50 + (25 * moveLevel)
		return "Boss Move: Attacks all enemies for "..damage.."% of Special Attack. Damage is increased based on the number of debuffs. User heals based on damage dealt."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 28
meffects[1].target = 0
meffects[1].param1 = function(moveLevel)
	return 100
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
meffects[2].param3 = "max_hp"
meffects[2].param4 = function(moveLevel)
	shield = 10 + (moveLevel * 5)
	return shield
end

M[83] = {
	name = "Psychic Barrier",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 13,
	targetting = 0,
	max_level = 5,
	description = function(moveLevel)
		chance = 100
		return "Boss Move: Has a "..chance.."% chance of placing Reflect on user which will redirect all moves back to their user for 2 turns. Also places a shield on the user."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 17 --leech seed
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	return 100
end
meffects[1].param2 = 4
meffects[1].min_hits = 2
meffects[1].max_hits = 2

M[84] = {
	name = "Seed Cloud",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 11,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		chance = 100
		return "Boss Move: Has a "..chance.."% chance of placing 2 leech seeds on all enemies for 4 turns."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 200 + (moveLevel * 50)
	return damage
end
meffects[1].param2 = "attack"
meffects[1].leech = 100

M[85] = {
	name = "Mega Drain",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 11,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 200 + (moveLevel * 50)
		return "Boss Move: Attacks 1 enemy for "..damage.."% of Special Attack. The user is healed for the damage dealt."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	damage = 200 + (moveLevel * 50)
	return damage
end
meffects[1].param2 = "spattack"


meffects[2] = {}
meffects[2].id = 22
meffects[2].target = 3
meffects[2].param1 = function(moveLevel)
	chance = 50
	return chance
end
meffects[2].param2 = 2

M[86] = {
	name = "Mass Confusion",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 13,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		chance = 50
		damage = 200 + (moveLevel * 50)
		return "Boss Move: Attacks all enemies for "..damage.."% of Special Attack then has a "..chance.."% chance of confusing the enemies for 2 turns."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 29 --revive
meffects[1].target = 4
meffects[1].param1 = function(moveLevel) --chance
	return 100
end
meffects[1].param2 = function(moveLevel) --health
	return 100
end

M[87] = {
	name = "Attract",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 12,
	targetting = 0,
	max_level = 5,
	description = function(moveLevel)
		chance = 100
		return "Boss Move: Revives all magnemites."
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

M[88] = {
	name = "Screech",
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
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	damage = 200 + (moveLevel * 50)
	return damage
end
meffects[1].param2 = "spattack"

meffects[2] = {}
meffects[2].id = 12 --decrease turn
meffects[2].target = 3
meffects[2].param1 = function(moveLevel)
	return 50
end
meffects[2].param2 = 100

M[89] = {
	name = "Static Discharge",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 12,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 200 + (50 * moveLevel)
		return "Boss Move: Attacks all enemies for "..damage.."% of Special Attack and reduces the turn meter of all enemies by 100%."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	damage = 200 + (moveLevel * 50)
	return damage
end
meffects[1].param2 = "spattack"
meffects[1].extra_damage_ally_count = 200


M[90] = {
	name = "Thunder Storm",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 12,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 200 + (10 * moveLevel)
		return "Boss Move: Attacks all enemies for "..damage.."% of Special Attack. Damage increased based on number of healthy allies."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	damage = 200 + (moveLevel * 50)
	return damage
end
meffects[1].param2 = "spattack"
meffects[1].ignore_def = 100
meffects[1].extra_damage_target_status_count = 31
meffects[1].extra_damage_amount = 100

M[91] = {
	name = "Piercing Cold",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 14,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 200 + (moveLevel * 50)
		return "Boss Move: Attacks all enemies for "..damage.."% of Special Attack. This attack ignores defense."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	damage = 200 + (moveLevel * 50)
	return damage
end
meffects[1].param2 = "spattack"
meffects[1].extra_damage_target_status_count = 31
meffects[1].extra_damage_amount = 100

meffects[2] = {}
meffects[2].id = 30 --block buffs
meffects[2].target = 3
meffects[2].param1 = function(moveLevel)
	return 100
end
meffects[2].param2 = 4

M[92] = {
	name = "Withering Cold",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 14,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 200 + (moveLevel * 50)
		return "Boss Move: Attacks all enemies for "..damage.."% of Special Attack. Also places Block Buffs on all enemies."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 32
meffects[1].target = 0
meffects[1].param1 = function(moveLevel)
	return 100
end
meffects[1].param2 = 4
meffects[1].min_hits = 2
meffects[1].max_hits = 2

M[93] = {
	name = "Rejuvinating Rains",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 10,
	targetting = 0,
	max_level = 5,
	description = function(moveLevel)
		return "Boss Move: Places 2 Healing buffs for 4 rounds."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	damage = 200 + (moveLevel * 50)
	return damage
end
meffects[1].param2 = "spattack"

meffects[2] = {}
meffects[2].id = 31 --drenched
meffects[2].target = 3
meffects[2].param1 = function(moveLevel)
	return 100
end
meffects[2].charges = 1
meffects[2].charges_stack = true

M[94] = {
	name = "Deluge",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 10,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 200 + (moveLevel * 50)
		return "Boss Move: Attacks all enemies for "..damage.."% of Special Attack. Also places a stack of Drenched on all enemies which increases damage they take from cold moves."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 33 -- remove debuffs
meffects[1].target = 0
meffects[1].param1 = function(moveLevel)
	return 100
end
meffects[1].param2 = 0 -- all
meffects[1].param3 = -1 -- harmful

meffects[2] = {}
meffects[2].id = 25 -- extra turn
meffects[2].target = 0
meffects[2].param1 = function(moveLevel)
	return 100
end

M[95] = {
	name = "Shed Exoskeleton",
	effects = meffects,
	cooldown = function(moveLevel)
		return 2
	end,
	default = false,
	type = 6,
	targetting = 0,
	max_level = 5,
	description = function(moveLevel)
		return "Boss Move: Removes all debuffs. Grants an extra turn."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 34
meffects[1].target = 0
meffects[1].param1 = function(moveLevel)
	return 100
end
meffects[1].charges = 0
meffects[1].charges_stack = true

M[96] = {
	name = "Enrage",
	effects = meffects,
	cooldown = function(moveLevel)
		return 8
	end,
	default = false,
	type = 2,
	targetting = 0,
	max_level = 5,
	description = function(moveLevel)
		return "Boss Move: Adds Enrage status. Each time user is hit it will gain another stack of enraged."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 200 + (moveLevel * 50)
	return damage
end
meffects[1].param2 = "attack"
meffects[1].extra_damage_per_user_charge = 34
meffects[1].extra_damage_amount = 200
meffects[1].blocks_revive = true

meffects[2] = {}
meffects[2].id = 35 -- remove specific status
meffects[2].target = 0
meffects[2].param1 = function(moveLevel)
	return 100
end
meffects[2].param2 = 34


M[97] = {
	name = "Horn Toss",
	effects = meffects,
	cooldown = function(moveLevel)
		return 8
	end,
	default = false,
	type = 6,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 200 + (moveLevel * 50)
		return "Boss Move: Attacks 1 enemy for "..damage.."% of Attack. Enemies fainted by this attack cannot be revived."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 36 -- lower max hp
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	return 100
end
meffects[1].param2 = 10

meffects[2] = {}
meffects[2].id = 8 --increase turn
meffects[2].target = 0
meffects[2].param1 = function(moveLevel)
	return 100
end
meffects[2].param2 = 50

M[98] = {
	name = "Hard Jab",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 6,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		hp_amount = 10
		return "Boss Move: Lowers the target's Max HP by "..hp_amount.."% then boosts the user's turn by 50%"
	end
}


meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	damage = 400 + (moveLevel * 200)
	return damage
end
meffects[1].param2 = "attack"

meffects[2] = {}
meffects[2].id = 37 --weaken
meffects[2].target = 0
meffects[2].param1 = function(moveLevel)
	return 100
end
meffects[2].param2 = 1

M[99] = {
	name = "Hyper Wave",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 1,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 400 + (moveLevel * 200)
		return "Boss Move: Attacks all enemies for "..damage.."% of Attack. User is weakened after using the ability."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	damage = 200 + (moveLevel * 50)
	return damage
end
meffects[1].param2 = "attack"

meffects[2] = {}
meffects[2].id = 12 --decrease turn
meffects[2].target = 3
meffects[2].param1 = function(moveLevel)
	return 100
end
meffects[2].param2 = 50

M[100] = {
	name = "Dazzling Flight",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 3,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 200 + (moveLevel * 50)
		return "Boss Move: Attacks all enemies for "..damage.."% of Attack and reduces the turn meter of all enemies by 50%."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 38 -- steal buffs
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	return 100
end
meffects[1].param2 = 0 --all
meffects[1].param3 = -2 --helpful


M[101] = {
	name = "Dragon's Luck",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 8,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		return "Boss Move: Steals all buffs from targets."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 250 + (moveLevel * 50)
	return damage
end
meffects[1].param2 = "attack"


meffects[2] = {}
meffects[2].id = 14
meffects[2].target = 1
meffects[2].param1 = function(moveLevel)
	return 100
end
meffects[2].param2 = 1

M[102] = {
	name = "Tornado",
	effects = meffects,
	cooldown = function(moveLevel)
		return 0
	end,
	default = true,
	type = 3,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 250 + (moveLevel * 50)
		return "Boss Move: Attacks 1 enemy for "..damage.."% of Attack then stuns them for 1 turn."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 150 + (moveLevel * 15)
	return damage
end
meffects[1].param2 = "spattack"

meffects[2] = {}
meffects[2].id = 33 -- remove status effect
meffects[2].target = 1
meffects[2].param1 = function(moveLevel)
	return 75 + (moveLevel * 5)
end
meffects[2].param2 = 1
meffects[2].param3 = -2 -- helpful

M[103] = {
	name = "Incinerate",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 9,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 150 + (moveLevel * 15)
		chance = 75 + (moveLevel * 5)
		return "Attacks 1 enemy for "..damage.."% of Special Attack. Has a "..chance.."% chance of removing 1 helpful status effect."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 35 -- remove specific status
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	return 75 + (moveLevel * 5)
end
meffects[1].param2 = 19 -- shield

meffects[2] = {}
meffects[2].id = 35 -- remove specific status
meffects[2].target = 1
meffects[2].param1 = function(moveLevel)
	return 75 + (moveLevel * 5)
end
meffects[2].param2 = 5 -- defense up

meffects[3] = {}
meffects[3].id = 1
meffects[3].target = 1
meffects[3].param1 = function(moveLevel)
	damage = 200 + (moveLevel * 15)
	return damage
end
meffects[3].param2 = "attack"

M[104] = {
	name = "Brick Break",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 2,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 200 + (moveLevel * 15)
		chance = 75 + (moveLevel * 5)
		return "Removes an enemy's Shield and Defense up status effects then attacks them for "..damage.."% of Attack."
	end
}


meffects = {}
meffects[1] = {}
meffects[1].id = 33 -- remove debuffs
meffects[1].target = 4
meffects[1].param1 = function(moveLevel)
	return 50 + (moveLevel * 10)
end
meffects[1].param2 = 0 -- all
meffects[1].param3 = -1 -- harmful


M[105] = {
	name = "Aromatherapy",
	effects = meffects,
	cooldown = function(moveLevel)
		if moveLevel > 5 then
			return 4
		end
		return 5
	end,
	default = false,
	type = 11,
	targetting = 2,
	max_level = 6,
	description = function(moveLevel)
		return "Has a "..chance.." chance of removing all debuffs from all allies."
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
meffects[1].param2 = "spattack"

meffects[2] = {}
meffects[2].id = 20 --burn
meffects[2].target = 1
meffects[2].param1 = function(moveLevel)
	return 50 + (moveLevel * 5)
end
meffects[2].param2 = 2
meffects[2].min_hits = 2
meffects[2].max_hits = 2

M[106] = {
	name = "Flamethrower",
	effects = meffects,
	cooldown = function(moveLevel)
		if moveLevel > 5 then
			return 4
		end
		return 5
	end,
	default = false,
	type = 9,
	targetting = 1,
	max_level = 6,
	description = function(moveLevel)
		damage = 200 + (moveLevel * 10)
		chance = 50 + (moveLevel * 5)
		return "Attacks 1 enemy for "..damage.."% of Special Attack. Has a "..chance.."% chance of placing 2 Burns on the target for 2 turns."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 1
meffects[1].target = 1
meffects[1].param1 = function(moveLevel)
	damage = 150 + (moveLevel * 15)
	return damage
end
meffects[1].param2 = "attack"

meffects[2] = {}
meffects[2].id = 33 -- remove status effect
meffects[2].target = 1
meffects[2].param1 = function(moveLevel)
	return 50 + (moveLevel * 10)
end
meffects[2].param2 = 0
meffects[2].param3 = -2 -- helpful

M[107] = {
	name = "Bulldoze",
	effects = meffects,
	cooldown = function(moveLevel)
		return 4
	end,
	default = false,
	type = 5,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 150 + (moveLevel * 15)
		chance = 75 + (moveLevel * 5)
		return "Attacks 1 enemy for "..damage.."% of Attack. Has a "..chance.."% chance of removing 1 helpful status effect."
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
meffects[2].param3 = "max_hp"
meffects[2].param4 = function(moveLevel)
	shield = 15 + (moveLevel * 2)
	return shield
end


M[108] = {
	name = "Harden",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 1,
	targetting = 0,
	max_level = 5,
	description = function(moveLevel)
		chance = 75 + (moveLevel * 5)
		shield = 15 + (moveLevel * 2)
		return "Has a "..chance.."% chance of increasing user's Defense for 2 turns. Also places a shield on the user for "..shield.."% of user's max HP"
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 22 -- confuse
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	return 75 + (5 * moveLevel)
end
meffects[1].param2 = 1

M[109] = {
	name = "Supersonic",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 1,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		chance = 75 + (5 * moveLevel)
		return "Has a "..chance.."% chance of confusing all enemies for 1 turn."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 33 -- remove debuffs
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	return 50 + (moveLevel * 10)
end
meffects[1].param2 = 0 -- all
meffects[1].param3 = -2 -- helpful

meffects[2] = {}
meffects[2].id = 33 -- remove debuffs
meffects[2].target = 4
meffects[2].param1 = function(moveLevel)
	return 50 + (moveLevel * 10)
end
meffects[2].param2 = 0 -- all
meffects[2].param3 = -2 -- helpful

M[110] = {
	name = "Haze",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 14,
	targetting = 2,
	max_level = 6,
	description = function(moveLevel)
		return "Has a "..chance.." chance of removing all buffs from all allies and all enemies."
	end
}

meffects = {}
meffects[1] = {}
meffects[1].id = 10 --reduce speed
meffects[1].target = 3
meffects[1].param1 = function(moveLevel)
	return 75 + (5 * moveLevel)
end
meffects[1].param2 = 2

M[111] = {
	name = "Mean Look",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 1,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		chance = 75 + (5 * moveLevel)
		return "Has a "..chance.."% chance of reducing the speed of all enemies for 2 turns."
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

M[112] = {
	name = "Air Cutter",
	effects = meffects,
	cooldown = function(moveLevel)
		return 3
	end,
	default = false,
	type = 3,
	targetting = 1,
	max_level = 5,
	description = function(moveLevel)
		damage = 250 + (moveLevel * 15)
		return "Attacks an enemy for "..damage.."% of Attack. This attack has an extra 25% chance of critting."
	end
}

return M