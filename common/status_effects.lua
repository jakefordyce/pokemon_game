local M = {}

-- The numbering isnt in order because it matches the move effect ids. Not all move effects are status effects.

-- Categories
-- 1 = buff - increase stats
-- 2 = debuff - decrease stats
-- 3 = torment - takes damage each round
-- 4 = loss of control - prevents actions in some way

M= {}
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
M[7] = {
	sprite_name = "speed_up",
	damage_text = "Speed Up",
	category = 1
}
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

return M