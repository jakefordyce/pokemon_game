local M = {}
local common_moves = require "common/moves"

M.base_crit_chance = 5
M.base_crit_damage = 100
M.STONE_REWARD_MINIMUM = 1

moves = {}
moves[1] = {["level"] = 1, ["id"] = 10}
moves[2] = {["level"] = 1, ["id"] = 11}

M[1] = {
	name = "kangaskhan",
	hp = 1000,
	attack = 160,
	defense = 120,
	spattack = 100,
	spdefense = 100,
	speed = 120,
	accuracy = 0,
	resist = 100,
	type1 = 1,
	type2 = 1,
	moves = moves,
	move_priority = {2, 1}
}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 77}
moves[2] = {["level"] = 1, ["id"] = 75}
moves[3] = {["level"] = 1, ["id"] = 76}
moves[4] = {["level"] = 1, ["id"] = 78}
M[2] = {
	name = "nidoking",
	hp = 1000,
	attack = 120,
	defense = 120,
	spattack = 100,
	spdefense = 100,
	speed = 100,
	accuracy = 0,
	resist = 100,
	type1 = 4,
	type2 = 5,
	moves = moves,
	move_priority = {3, 2, 4, 1}
}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 81}
moves[2] = {["level"] = 1, ["id"] = 79}
moves[3] = {["level"] = 1, ["id"] = 80}
moves[4] = {["level"] = 1, ["id"] = 82}
M[3] = {
	name = "houndoom",
	hp = 1000,
	attack = 100,
	defense = 100,
	spattack = 100,
	spdefense = 100,
	speed = 120,
	accuracy = 200,
	resist = 100,
	type1 = 9,
	type2 = 15,
	moves = moves,
	move_priority = {2, 3, 4, 1}
}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 85}
moves[2] = {["level"] = 1, ["id"] = 83}
moves[3] = {["level"] = 1, ["id"] = 84}
moves[4] = {["level"] = 1, ["id"] = 86}

M[4] = {
	name = "exeggutor",
	hp = 1000,
	attack = 100,
	defense = 100,
	spattack = 140,
	spdefense = 160,
	speed = 95,
	accuracy = 100,
	resist = 100,
	type1 = 11,
	type2 = 13,
	moves = moves,
	move_priority = {2, 3, 4, 1}
}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 89}
moves[2] = {["level"] = 1, ["id"] = 87}
moves[3] = {["level"] = 1, ["id"] = 90}

M[5] = {
	name = "magneton",
	hp = 1000,
	attack = 100,
	defense = 250,
	spattack = 140,
	spdefense = 100,
	speed = 95,
	accuracy = 100,
	resist = 100,
	type1 = 7,
	type2 = 12,
	moves = moves,
	move_priority = {3, 2, 1}
}

function M.exp_reward_by_level(level)
	return math.ceil(math.pow(1.05, (level - 1)) * 20) * 2
end

function M.minimum_reward(index, level)
	if M[index].type1 ~= M[index].type2 then
		return M.STONE_REWARD_MINIMUM
	else
		return M.STONE_REWARD_MINIMUM * 2
	end
end

function M.maximum_reward(index, level)
	local max_reward =  math.floor(level / 5)
	if M[index].type1 == M[index].type2 then
		max_reward = max_reward * 2
	end
	return max_reward
end

function M.reward_stone_types(index)
	types = {}
	types[1] = M[index].type1
	if M[index].type1 ~= M[index].type2 then
		types[2] = M[index].type2
	end
	return types
end

function M.stone_reward(index, level)
	stones = {}

	if M[index].type1 == M[index].type2 then
		reward = math.random(M.minimum_reward(index, level), M.maximum_reward(index, level))
		stones[1] = {
			type = M[index].type1,
			amount = reward
		}
	else
		reward = math.random(M.minimum_reward(index, level), M.maximum_reward(index, level))
		stones[1] = {
			type = M[index].type1,
			amount = reward
		}
		reward = math.random(M.minimum_reward(index, level), M.maximum_reward(index, level))
		stones[2] = {
			type = M[index].type2,
			amount = reward
		}
	end

	return stones
end

-- this should only be used for hp, attack, defense, spattack, spdefense
function M.stat_by_level(pokedex, stat, level)
	calc_stat = (5 + (M[pokedex][stat] * level * 0.01) * 2)
	if stat=="hp" then
		calc_stat = calc_stat * 20
	end

	--print("stat"..stat)
	--print(math.ceil(calc_stat))
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