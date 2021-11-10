local M = {}
local common_moves = require "common/moves"

M.base_crit_chance = 5
M.base_crit_damage = 100

moves = {}
moves[1] = {["level"] = 1, ["id"] = 3}
moves[2] = {["level"] = 1, ["id"] = 9}

M[1] = {
	name = "kangaskhan",
	hp = 1000,
	attack = 120,
	defense = 120,
	spattack = 100,
	spdefense = 100,
	speed = 120,
	type1 = 1,
	type2 = 1,
	moves = moves
}

function M.exp_reward_by_level(level)
	return math.ceil(math.pow(1.05, (level - 1)) * 20)
end

-- this should only be used for hp, attack, defense, spattack, spdefense
function M.stat_by_level(pokedex, stat, level)
	calc_stat = (5 + (M[pokedex][stat] * level * 0.01) * 2)
	if stat=="hp" then
		calc_stat = calc_stat * 20
	end

	return math.ceil(calc_stat)
end

function M.known_moves_by_level(pokedex, level)
	known_moves = {}
	for i, m in ipairs(M[pokedex].moves) do
		if m.level <= level then
			table.insert(known_moves, { id = m.id, level = 0})
		end
	end
	return known_moves
end

-- returns a table with up to 4 numbers designating the id of the known moves which are to be equipped
function M.equipped_moves_by_level(pokedex, level)
	known_moves = M.known_moves_by_level(pokedex, level)

	equipped_moves = { nil, nil, nil, nil }

	local move_rotation = 2
	for i, m in ipairs(known_moves) do
		if common_moves[m.id].default == true then
			equipped_moves[1] = i
		else
			equipped_moves[move_rotation] = i

			move_rotation = move_rotation + 1
			if move_rotation > 4 then
				move_rotation = 2
			end
		end
	end

	return equipped_moves
end

return M