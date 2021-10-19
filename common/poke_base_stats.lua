local M = {}

-- this should only be used for hp, attack, defense, spattack, spdefense
function M.stat_by_level(pokedex, stat, level)
	calc_stat = (5 + (M[pokedex][stat] * level * 0.01) * 2)
	if stat=="hp" then
		calc_stat = calc_stat * 20
	end
	
	return math.ceil(calc_stat)
end

function M.moves_by_level(pokedex, level)
	moves = {}
	for i, m in ipairs(M[pokedex].moves) do
		if m.level <= level then
			table.insert(moves, { id = m.id, level = 0})
		end
	end
	return moves
end

function M.exp_reward_by_level(level)
	return math.ceil(math.pow(1.05, (level - 1)) * 20)
end

function M.exp_to_next_level(level)
	--return math.ceil(math.pow(1.05, (level - 1)) * (50 + level) / 50 * 200)
	return math.ceil(math.pow(1.05, (level - 1)) * (50 + level) / 50 * 10) -- for testing
end

M.base_crit_chance = 5
M.base_crit_damage = 100

--List of all pokemon by pokedex ID.
moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 2}
moves[3] = {["level"] = 6, ["id"] = 3}

M[1] = {
	name = "bulbasaur",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 11,
	type2 = 11,
	moves = moves
}

M[2] = {
	name = "ivysaur",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 11,
	type2 = 11,
	moves = moves
}

M[3] = {
	name = "venusaur",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 11,
	type2 = 11,
	moves = moves
}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}

M[4] = {
	name = "charmander",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 9,
	type2 = 9,
	moves = moves
}

M[5] = {
	name = "charmeleon",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 9,
	type2 = 9,
	moves = moves
}

M[6] = {
	name = "charizard",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 9,
	type2 = 8,
	moves = moves
}

M[7] = {
	name = "squirtle",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 10,
	type2 = 10,
	moves = moves
}

M[8] = {
	name = "wartortle",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 10,
	type2 = 10,
	moves = moves
}

M[9] = {
	name = "blastoise",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 10,
	type2 = 10,
	moves = moves
}

M[10] = {
	name = "caterpie",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 6,
	type2 = 6,
	moves = moves
}

M[13] = {
	name = "weedle",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 6,
	type2 = 4,
	moves = moves
}

M[16] = {
	name = "pidgey",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 3,
	type2 = 3,
	moves = moves
}

M[19] = {
	name = "rattata",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 1,
	type2 = 1,
	moves = moves
}

M[63] = {
	name = "abra",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 13,
	type2 = 13,
	moves = moves
}

M[66] = {
	name = "machop",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 2,
	type2 = 2,
	moves = moves
}

M[74] = {
	name = "geodude",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 5,
	type2 = 5,
	moves = moves
}

M[92] = {
	name = "gastly",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 15,
	type2 = 4,
	moves = moves
}

M[152] = {
	name = "chikorita",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 11,
	type2 = 11,
	moves = moves
}

M[155] = {
	name = "cyndaquil",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 9,
	type2 = 9,
	moves = moves
}

M[158] = {
	name = "totodile",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 10,
	type2 = 10,
	moves = moves
}

M[172] = {
	name = "pichu",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 12,
	type2 = 12,
	moves = moves
}

M[173] = {
	name = "cleffa",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 1,
	type2 = 1,
	moves = moves
}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 7}

M[228] = {
	name = "houndour",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 9,
	type2 = 15,
	moves = moves
}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}

M[280] = {
	name = "ralts",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 13,
	type2 = 13,
	moves = moves
}

M[304] = {
	name = "aron",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 7,
	type2 = 5,
	moves = moves
}

M[363] = {
	name = "spheal",
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 14,
	type2 = 14,
	moves = moves
}

return M