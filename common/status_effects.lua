local M = {}

-- The numbering isnt in order because it matches the move effect ids. Not all move effects are status effects.

-- Categories
-- 1 = buff - increase stats
-- 2 = debuff - decrease stats
-- 3 = torment - takes damage each round
-- 4 = loss of control - prevents actions in some way

M= {}
--1 deal damage
M[2] = {
	sprite_name = "attack_down",
	damage_text = "Attack Down",
	category = 2
}
M[3] = {
	sprite_name = "attack_up",
	damage_text = "Attack Up",
	category = 1
}
M[4] = {
	sprite_name = "defense_down",
	damage_text = "Defense Down",
	category = 2
}
M[5] = {
	sprite_name = "defense_up",
	damage_text = "Defense Up",
	category = 1
}
-- 6 - 
M[7] = {
	sprite_name = "speed_up",
	damage_text = "Speed Up",
	category = 1
}
-- 8 increase turn meter by percent
M[9] = {
	sprite_name = "accuracy_down",
	damage_text = "Accuracy Down",
	category = 2
}
M[10] = {
	sprite_name = "speed_down",
	damage_text = "Speed Down",
	category = 2
}
M[11] = {
	sprite_name = "sleep",
	damage_text = "Sleep",
	category = 4
}
-- 12 decrease turn meter by percent
M[13] = {
	sprite_name = "block_debuffs",
	damage_text = "Block Debuffs",
	category = 1
}
M[14] = {
	sprite_name = "stun",
	damage_text = "Stun",
	category = 4
}
M[15] = {
	sprite_name = "poison",
	damage_text = "Poison",
	category = 3
}
--16 heal
M[17] = {
	sprite_name = "leech_seed",
	damage_text = "Leech Seed",
	category = 3
}
M[18] = {
	sprite_name = "protect",
	damage_text = "Protect",
	category = 1
}
M[19] = {
	sprite_name = "shield",
	damage_text = "Shield",
	category = 1
}
M[20] = {
	sprite_name = "burn",
	damage_text = "Burn",
	category = 3
}
M[21] = {
	sprite_name = "bleed",
	damage_text = "Bleed",
	category = 3
}
M[22] = {
	sprite_name = "confusion",
	damage_text = "Confusion",
	category = 4
}
M[23] = {
	sprite_name = "block_cooldowns",
	damage_text = "Block Cooldowns",
	category = 4
}

return M