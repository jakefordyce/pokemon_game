local M = {}
local common_moves = require "common/moves"

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

function M.exp_reward_by_level(level)
	return math.ceil(math.pow(1.05, (level - 1)) * 50)
end

function M.exp_to_next_level(level)
	return math.ceil(math.pow(1.05, (level - 1)) * (20 + level) / 20 * 200) -- PROD
	--return math.ceil(math.pow(1.05, (level - 1)) * (20 + level) / 20 * 10) -- TEST
end

M.base_crit_chance = 5
M.base_crit_damage = 100

--List of all pokemon by pokedex ID.
moves = {
	{level = 1, id = 1},
	{level = 1, id = 9},
	{level = 7, id = 27},
	{level = 10, id = 4},
	{level = 12, id = 121}
}
M[1] = {
	name = "bulbasaur",
	rarity = 3,
	hp = 95,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 90,
	speed = 100,
	type1 = 11,
	type2 = 11,
	moves = moves,
	evolutions = {
		{target = 2, stone_type1 = 11, stone_cost1 = 10}
	}
}
M[2] = {
	name = "ivysaur",
	rarity = 3,
	hp = 105,
	attack = 90,
	defense = 90,
	spattack = 100,
	spdefense = 90,
	speed = 100,
	type1 = 11,
	type2 = 11,
	moves = moves,
	evolutions = {
		{target = 3, stone_type1 = 11, stone_cost1 = 10}
	}
}
M[3] = {
	name = "venusaur",
	rarity = 3,
	hp = 115,
	attack = 100,
	defense = 100,
	spattack = 110,
	spdefense = 100,
	speed = 100,
	type1 = 11,
	type2 = 11,
	moves = moves
}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 12}
moves[3] = {["level"] = 7, ["id"] = 28}
moves[4] = {["level"] = 10, ["id"] = 6}
moves[5] = {["level"] = 12, ["id"] = 106}
M[4] = {
	name = "charmander",
	rarity = 3,
	hp = 80,
	attack = 110,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 9,
	type2 = 9,
	moves = moves,
	evolutions = {
		{target = 5, stone_type1 = 9, stone_cost1 = 10}
	}
}
M[5] = {
	name = "charmeleon",
	rarity = 3,
	hp = 90,
	attack = 120,
	defense = 90,
	spattack = 100,
	spdefense = 90,
	speed = 100,
	type1 = 9,
	type2 = 9,
	moves = moves,
	evolutions = {
		{target = 6, stone_type1 = 9, stone_cost1 = 5, stone_type2 = 8, stone_cost2 = 5}
	}
}
M[6] = {
	name = "charizard",
	rarity = 3,
	hp = 100,
	attack = 130,
	defense = 100,
	spattack = 110,
	spdefense = 100,
	speed = 100,
	type1 = 9,
	type2 = 8,
	moves = moves
}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 17},
	{level = 7, id = 30},
	{level = 10, id = 42},
	{level = 12, id = 123}
}
M[7] = {
	name = "squirtle",
	rarity = 3,
	hp = 80,
	attack = 80,
	defense = 110,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 10,
	type2 = 10,
	moves = moves,
	evolutions = {
		{target = 8, stone_type1 = 10, stone_cost1 = 10}
	}
}
M[8] = {
	name = "wartortle",
	rarity = 3,
	hp = 90,
	attack = 90,
	defense = 120,
	spattack = 100,
	spdefense = 90,
	speed = 100,
	type1 = 10,
	type2 = 10,
	moves = moves,
	evolutions = {
		{target = 9, stone_type1 = 10, stone_cost1 = 10}
	}
}
M[9] = {
	name = "blastoise",
	rarity = 3,
	hp = 100,
	attack = 100,
	defense = 130,
	spattack = 110,
	spdefense = 100,
	speed = 100,
	type1 = 10,
	type2 = 10,
	moves = moves
}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
M[10] = {
	name = "caterpie",
	rarity = 1,
	hp = 80,
	attack = 70,
	defense = 80,
	spattack = 60,
	spdefense = 70,
	speed = 100,
	type1 = 6,
	type2 = 6,
	moves = moves,
	evolutions = {
		{target = 11, stone_type1 = 6, stone_cost1 = 5}
	}
}
moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 108}
M[11] = {
	name = "metapod",
	rarity = 1,
	hp = 80,
	attack = 80,
	defense = 110,
	spattack = 60,
	spdefense = 75,
	speed = 100,
	type1 = 6,
	type2 = 6,
	moves = moves,
	evolutions = {
		{target = 12, stone_type1 = 6, stone_cost1 = 5}
	}
}
moves = {
	{level = 1, id = 1},
	{level = 1, id = 108},
	{level = 4, id = 113},
	{level = 4, id = 67},
	{level = 6, id = 32},
	{level = 8, id = 63},
	{level = 9, id = 50},
	{level = 10, id = 51},
	{level = 12, id = 114}
}
M[12] = {
	name = "butterfree",
	rarity = 2,
	hp = 95,
	attack = 90,
	defense = 90,
	spattack = 120,
	spdefense = 110,
	speed = 100,
	type1 = 6,
	type2 = 3,
	moves = moves
}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
M[13] = {
	name = "weedle",
	rarity = 1,
	hp = 75,
	attack = 90,
	defense = 70,
	spattack = 60,
	spdefense = 65,
	speed = 105,
	type1 = 6,
	type2 = 4,
	moves = moves,
	evolutions = {
		{target = 14, stone_type1 = 6, stone_cost1 = 5}
	}
}
moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 108}
M[14] = {
	name = "kakuna",
	rarity = 1,
	hp = 80,
	attack = 80,
	defense = 100,
	spattack = 60,
	spdefense = 75,
	speed = 105,
	type1 = 6,
	type2 = 4,
	moves = moves,
	evolutions = {
		{target = 15, stone_type1 = 6, stone_cost1 = 5}
	}
}
moves = {
	{level = 1, id = 1},
	{level = 1, id = 108},
	{level = 4, id = 116},
	{level = 6, id = 53},
	{level = 8, id = 47},
	{level = 9, id = 44},
	{level = 10, id = 117}
}
M[15] = {
	name = "beedrill",
	rarity = 2,
	hp = 90,
	attack = 125,
	defense = 90,
	spattack = 80,
	spdefense = 105,
	speed = 110,
	type1 = 6,
	type2 = 4,
	moves = moves
}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 16},
	{level = 6, id = 51},
	{level = 9, id = 50},
	{level = 10, id = 52},
	{level = 12, id = 124}
}
M[16] = {
	name = "pidgey",
	rarity = 1,
	hp = 80,
	attack = 85,
	defense = 75,
	spattack = 65,
	spdefense = 70,
	speed = 105,
	type1 = 3,
	type2 = 3,
	moves = moves,
	evolutions = {
		{target = 17, stone_type1 = 3, stone_cost1 = 10}
	}
}
M[17] = {
	name = "pidgeotto",
	rarity = 2,
	hp = 90,
	attack = 100,
	defense = 90,
	spattack = 75,
	spdefense = 80,
	speed = 105,
	type1 = 3,
	type2 = 3,
	moves = moves,
	evolutions = {
		{target = 18, stone_type1 = 3, stone_cost1 = 10}
	}
}
M[18] = {
	name = "pidgeot",
	rarity = 3,
	hp = 100,
	attack = 110,
	defense = 100,
	spattack = 85,
	spdefense = 95,
	speed = 105,
	type1 = 3,
	type2 = 3,
	moves = moves
}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 14},
	{level = 6, id = 29},
	{level = 9, id = 52},
	{level = 10, id = 43},
	{level = 12, id = 125}
}
M[19] = {
	name = "rattata",
	rarity = 1,
	hp = 70,
	attack = 100,
	defense = 70,
	spattack = 65,
	spdefense = 75,
	speed = 110,
	type1 = 1,
	type2 = 1,
	moves = moves,
	evolutions = {
		{target = 20, stone_type1 = 1, stone_cost1 = 10}
	}
}
M[20] = {
	name = "raticate",
	rarity = 2,
	hp = 95,
	attack = 120,
	defense = 105,
	spattack = 75,
	spdefense = 90,
	speed = 110,
	type1 = 1,
	type2 = 1,
	moves = moves
}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 69}
moves[3] = {["level"] = 6, ["id"] = 71}
moves[4] = {["level"] = 9, ["id"] = 70}
moves[5] = {["level"] = 10, ["id"] = 44}
M[21] = {
	name = "spearow",
	rarity = 2,
	hp = 85,
	attack = 105,
	defense = 65,
	spattack = 65,
	spdefense = 70,
	speed = 108,
	type1 = 3,
	type2 = 3,
	moves = moves,
	evolutions = {
		{target = 22, stone_type1 = 3, stone_cost1 = 10}
	}
}
M[22] = {
	name = "fearow",
	rarity = 2,
	hp = 100,
	attack = 120,
	defense = 80,
	spattack = 80,
	spdefense = 85,
	speed = 110,
	type1 = 3,
	type2 = 3,
	moves = moves
}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 118},
	{level = 4, id = 120},
	{level = 6, id = 88},
	{level = 8, id = 119},
	{level = 9, id = 47}
}
M[23] = {
	name = "ekans",
	rarity = 2,
	hp = 65,
	attack = 105,
	defense = 75,
	spattack = 70,
	spdefense = 95,
	speed = 105,
	type1 = 4,
	type2 = 4,
	moves = moves,
	evolutions = {
		{target = 24, stone_type1 = 4, stone_cost1 = 10}
	}
}
M[24] = {
	name = "arbok",
	rarity = 2,
	hp = 85,
	attack = 125,
	defense = 95,
	spattack = 90,
	spdefense = 115,
	speed = 105,
	type1 = 4,
	type2 = 4,
	moves = moves
}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 15},
	{level = 7, id = 31},
	{level = 10, id = 55},
	{level = 12, id = 122}
}
M[25] = {
	name = "pikachu",
	rarity = 3,
	hp = 85,
	attack = 80,
	defense = 75,
	spattack = 125,
	spdefense = 105,
	speed = 115,
	type1 = 12,
	type2 = 12,
	moves = moves,
	evolutions = {
		{target = 26, stone_type1 = 12, stone_cost1 = 10}
	}
}
M[26] = {
	name = "raichu",
	rarity = 3,
	hp = 95,
	attack = 85,
	defense = 95,
	spattack = 135,
	spdefense = 110,
	speed = 115,
	type1 = 12,
	type2 = 12,
	moves = moves
}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 16},
	{level = 6, id = 45},
	{level = 8, id = 3},
	{level = 10, id = 28},
	{level = 12, id = 107},
	{level = 14, id = 123}
}
M[27] = {
	name = "sandshrew",
	rarity = 2,
	hp = 85,
	attack = 95,
	defense = 105,
	spattack = 55,
	spdefense = 60,
	speed = 98,
	type1 = 5,
	type2 = 5,
	moves = moves,
	evolutions = {
		{target = 28, stone_type1 = 5, stone_cost1 = 10}
	}
}
M[28] = {
	name = "sandslash",
	rarity = 2,
	hp = 105,
	attack = 115,
	defense = 125,
	spattack = 75,
	spdefense = 80,
	speed = 98,
	type1 = 5,
	type2 = 5,
	moves = moves
}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 45},
	{level = 6, id = 2},
	{level = 9, id = 47},
	{level = 11, id = 137},
	{level = 13, id = 138}
}
M[29] = {
	name = "nidoran_f",
	rarity = 1,
	hp = 90,
	attack = 80,
	defense = 85,
	spattack = 65,
	spdefense = 65,
	speed = 95,
	type1 = 4,
	type2 = 4,
	moves = moves
}
M[30] = {
	name = "nidorina",
	rarity = 1,
	hp = 100,
	attack = 95,
	defense = 95,
	spattack = 75,
	spdefense = 80,
	speed = 95,
	type1 = 4,
	type2 = 4,
	moves = moves
}
M[31]={
	name = "nidoqueen",
	rarity = 1,
	hp = 110,
	attack = 115,
	defense = 105,
	spattack = 85,
	spdefense = 105,
	speed = 95,
	type1 = 4,
	type2 = 5,
	moves = moves
}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 48},
	{level = 6, id = 49},
	{level = 9, id = 47},
	{level = 11, id = 137},
	{level = 13, id = 138}
}
M[32] = {
	name = "nidoran_m",
	rarity = 1,
	hp = 80,
	attack = 95,
	defense = 70,
	spattack = 65,
	spdefense = 65,
	speed = 105,
	type1 = 4,
	type2 = 4,
	moves = moves
}
M[33]={
	name = "nidorino",
	rarity = 1,
	hp = 90,
	attack = 110,
	defense = 85,
	spattack = 75,
	spdefense = 75,
	speed = 105,
	type1 = 4,
	type2 = 4,
	moves = moves
}
M[34]={
	name = "nidoking",
	rarity = 1,
	hp = 105,
	attack = 125,
	defense = 90,
	spattack = 95,
	spdefense = 90,
	speed = 105,
	type1 = 4,
	type2 = 4,
	moves = moves
}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 46},
	{level = 7, id = 38},
	{level = 10, id = 61},
	{level = 12, id = 126}
}
M[35] = {
	name = "clefairy",
	rarity = 3,
	hp = 105,
	attack = 80,
	defense = 90,
	spattack = 105,
	spdefense = 105,
	speed = 95,
	type1 = 1,
	type2 = 1,
	moves = moves,
	evolutions = {
		{target = 36, stone_type1 = 1, stone_cost1 = 10}
	}
}
M[36]={
	name = "clefable",
	rarity = 3,
	hp = 115,
	attack = 90,
	defense = 100,
	spattack = 115,
	spdefense = 115,
	speed = 95,
	type1 = 1,
	type2 = 1,
	moves = moves
}
moves = {
	{level = 1, id = 1},
	{level = 1, id = 103},
	{level = 6, id = 66},
	{level = 8, id = 6},
	{level = 10, id = 106}
}
M[37] = {
	name = "vulpix",
	rarity = 2,
	hp = 70,
	attack = 75,
	defense = 75,
	spattack = 90,
	spdefense = 105,
	speed = 105,
	type1 = 9,
	type2 = 9,
	moves = moves,
	evolutions = {
		{target = 38, stone_type1 = 9, stone_cost1 = 10}
	}
}
M[38] = {
	name = "ninetails",
	rarity = 2,
	hp = 85,
	attack = 90,
	defense = 90,
	spattack = 105,
	spdefense = 120,
	speed = 105,
	type1 = 9,
	type2 = 9,
	moves = moves
}
moves = {
	{level = 1, id = 1},
	{level = 1, id = 140},
	{level = 6, id = 135},
	{level = 8, id = 61},
	{level = 10, id = 35}
}
M[39]={
	name = "jigglypuff",
	rarity = 3,
	hp = 150,
	attack = 80,
	defense = 60,
	spattack = 85,
	spdefense = 70,
	speed = 88,
	type1 = 1,
	type2 = 1,
	moves = moves,
	evolutions = {
		{target = 40, stone_type1 = 1, stone_cost1 = 10}
	}
}
M[40]={
	name = "wigglytuff",
	rarity = 3,
	hp = 160,
	attack = 90,
	defense = 70,
	spattack = 100,
	spdefense = 80,
	speed = 88,
	type1 = 1,
	type2 = 1,
	moves = moves
}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 109}
moves[3] = {["level"] = 6, ["id"] = 111}
moves[4] = {["level"] = 8, ["id"] = 68}
moves[5] = {["level"] = 10, ["id"] = 8}
moves[6] = {["level"] = 12, ["id"] = 110}
moves[7] = {["level"] = 14, ["id"] = 112}
M[41] = {
	name = "zubat",
	rarity = 1,
	hp = 75,
	attack = 80,
	defense = 70,
	spattack = 65,
	spdefense = 75,
	speed = 110,
	type1 = 15,
	type2 = 3,
	moves = moves,
	evolutions = {
		{target = 42, stone_type1 = 15, stone_cost1 = 5, stone_type2 = 3, stone_cost2 = 5}
	}
}
M[42]={
	name = "golbat",
	rarity = 2,
	hp = 85,
	attack = 95,
	defense = 85,
	spattack = 75,
	spdefense = 90,
	speed = 110,
	type1 = 15,
	type2 = 3,
	moves = moves,
	evolutions = {
		{target = 169, stone_type1 = 15, stone_cost1 = 5, stone_type2 = 3, stone_cost2 = 5}
	}
}

M[43]={}
M[44]={}
M[45]={}
M[46]={}
M[47]={}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 67}
moves[3] = {["level"] = 6, ["id"] = 66}
moves[4] = {["level"] = 9, ["id"] = 68}
M[48] = {
	name = "venonat",
	rarity = 2,
	hp = 85,
	attack = 85,
	defense = 80,
	spattack = 80,
	spdefense = 85,
	speed = 100,
	type1 = 6,
	type2 = 4,
	moves = moves
}
M[49]={}
M[50]={}
M[51]={}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 45},
	{level = 6, id = 28},
	{level = 8, id = 3},
	{level = 9, id = 43},
	{level = 11, id = 88},
	{level = 13, id = 139}
}
M[52] = {
	name = "meowth",
	rarity = 2,
	hp = 75,
	attack = 85,
	defense = 70,
	spattack = 70,
	spdefense = 75,
	speed = 120,
	type1 = 1,
	type2 = 1,
	moves = moves,
	evolutions = {
		{target = 53, stone_type1 = 1, stone_cost1 = 10}
	}
}
M[53]={
	name = "persian",
	rarity = 2,
	hp = 95,
	attack = 105,
	defense = 90,
	spattack = 90,
	spdefense = 95,
	speed = 120,
	type1 = 1,
	type2 = 1,
	moves = moves
}
M[54]={}
M[55]={}
M[56]={}
M[57]={}
M[58]={}
M[59]={}
M[60]={}
M[61]={}
M[62]={}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 18},
	{level = 7, id = 32},
	{level = 10, id = 56},
	{level = 12, id = 127},
	{level = 14, id = 40}
}
M[63] = {
	name = "abra",
	rarity = 3,
	hp = 75,
	attack = 70,
	defense = 65,
	spattack = 125,
	spdefense = 95,
	speed = 110,
	type1 = 13,
	type2 = 13,
	moves = moves,
	evolutions = {
		{target = 64, stone_type1 = 13, stone_cost1 = 10}
	}
}
M[64]={
	name = "kadabra",
	rarity = 3,
	hp = 85,
	attack = 80,
	defense = 75,
	spattack = 135,
	spdefense = 105,
	speed = 110,
	type1 = 13,
	type2 = 13,
	moves = moves,
	evolutions = {
		{target = 65, stone_type1 = 13, stone_cost1 = 10}
	}
}
M[65]={
	name = "alakazam",
	rarity = 3,
	hp = 95,
	attack = 90,
	defense = 90,
	spattack = 140,
	spdefense = 110,
	speed = 110,
	type1 = 13,
	type2 = 13,
	moves = moves
}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 19},
	{level = 7, id = 33},
	{level = 10, id = 57},
	{level = 12, id = 104},
	{level = 14, id = 125}
}
M[66] = {
	name = "machop",
	rarity = 3,
	hp = 90,
	attack = 120,
	defense = 100,
	spattack = 60,
	spdefense = 70,
	speed = 95,
	type1 = 2,
	type2 = 2,
	moves = moves,
	evolutions = {
		{target = 67, stone_type1 = 2, stone_cost1 = 10}
	}
}
M[67]={
	name = "machoke",
	rarity = 3,
	hp = 100,
	attack = 130,
	defense = 110,
	spattack = 70,
	spdefense = 80,
	speed = 95,
	type1 = 2,
	type2 = 2,
	moves = moves,
	evolutions = {
		{target = 68, stone_type1 = 2, stone_cost1 = 10}
	}
}
M[68]={
	name = "machamp",
	rarity = 3,
	hp = 110,
	attack = 140,
	defense = 120,
	spattack = 80,
	spdefense = 90,
	speed = 95,
	type1 = 2,
	type2 = 2,
	moves = moves
}
M[69]={}
M[70]={}
M[71]={}
M[72]={}
M[73]={}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 21},
	{level = 7, id = 35},
	{level = 10, id = 59},
	{level = 12, id = 107}
}
M[74] = {
	name = "geodude",
	rarity = 3,
	hp = 95,
	attack = 90,
	defense = 125,
	spattack = 60,
	spdefense = 70,
	speed = 95,
	type1 = 5,
	type2 = 5,
	moves = moves,
	evolutions = {
		{target = 75, stone_type1 = 5, stone_cost1 = 10}
	}
}
M[75]={
	name = "graveler",
	rarity = 3,
	hp = 105,
	attack = 100,
	defense = 135,
	spattack = 70,
	spdefense = 80,
	speed = 95,
	type1 = 5,
	type2 = 5,
	moves = moves,
	evolutions = {
		{target = 76, stone_type1 = 5, stone_cost1 = 10}
	}
}
M[76]={
	name = "golem",
	rarity = 3,
	hp = 115,
	attack = 110,
	defense = 145,
	spattack = 80,
	spdefense = 90,
	speed = 95,
	type1 = 5,
	type2 = 5,
	moves = moves
}
M[77]={}
M[78]={}
M[79]={}
M[80]={}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
M[81] = {
	name = "magnemite",
	rarity = 2,
	hp = 50,
	attack = 55,
	defense = 150,
	spattack = 125,
	spdefense = 90,
	speed = 100,
	type1 = 7,
	type2 = 12,
	moves = moves
}
M[82]={}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 72}
moves[3] = {["level"] = 6, ["id"] = 71}
moves[4] = {["level"] = 9, ["id"] = 73}
M[83] = {
	name = "farfetchd",
	rarity = 3,
	hp = 90,
	attack = 140,
	defense = 80,
	spattack = 85,
	spdefense = 95,
	speed = 92,
	type1 = 1,
	type2 = 3,
	moves = moves
}
M[84]={}
M[85]={}
M[86]={}
M[87]={}
M[88]={}
M[89]={}
M[90]={}
M[91]={}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 20},
	{level = 7, id = 34},
	{level = 10, id = 58},
	{level = 12, id = 128},
	{level = 14, id = 129}
}
M[92] = {
	name = "gastly",
	rarity = 3,
	hp = 65,
	attack = 60,
	defense = 110,
	spattack = 110,
	spdefense = 110,
	speed = 105,
	type1 = 15,
	type2 = 4,
	moves = moves,
	evolutions = {
		{target = 93, stone_type1 = 15, stone_cost1 = 5, stone_type2 = 4, stone_cost2 = 5}
	}
}
M[93]={
	name = "haunter",
	rarity = 3,
	hp = 75,
	attack = 70,
	defense = 120,
	spattack = 120,
	spdefense = 120,
	speed = 105,
	type1 = 15,
	type2 = 4,
	moves = moves,
	evolutions = {
		{target = 94, stone_type1 = 15, stone_cost1 = 5, stone_type2 = 4, stone_cost2 = 5}
	}
}
M[94]={
	name = "gengar",
	rarity = 3,
	hp = 85,
	attack = 80,
	defense = 130,
	spattack = 130,
	spdefense = 130,
	speed = 105,
	type1 = 15,
	type2 = 4,
	moves = moves
}

M[95]={}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 20}
moves[3] = {["level"] = 7, ["id"] = 65}
moves[4] = {["level"] = 10, ["id"] = 63}
M[96] = {
	name = "drowzee",
	rarity = 2,
	hp = 85,
	attack = 70,
	defense = 75,
	spattack = 80,
	spdefense = 105,
	speed = 95,
	type1 = 13,
	type2 = 13,
	moves = moves
}
M[97]={}
M[98]={}
M[99]={}
M[100]={}
M[101]={}
M[102]={}
M[103]={}
M[104]={}
M[105]={}
M[106]={}
M[107]={}
M[108]={}
M[109]={}
M[110]={}
M[111]={}
M[112]={}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 74}
moves[3] = {["level"] = 7, ["id"] = 46}
moves[4] = {["level"] = 10, ["id"] = 61}
M[113] = {
	name = "chansey",
	rarity = 4,
	hp = 250,
	attack = 20,
	defense = 20,
	spattack = 65,
	spdefense = 105,
	speed = 90,
	type1 = 1,
	type2 = 1,
	moves = moves
}
M[114]={}
M[115]={}
M[116]={}
M[117]={}
M[118]={}
M[119]={}
M[120]={}
M[121]={}
M[122]={}
M[123]={}
M[124]={}
M[125]={}
M[126]={}
M[127]={}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 115},
	{level = 6, id = 29},
	{level = 8, id = 44},
	{level = 10, id = 49}
}
M[128] = {
	name = "tauros",
	rarity = 4,
	hp = 100,
	attack = 140,
	defense = 125,
	spattack = 60,
	spdefense = 95,
	speed = 110,
	type1 = 1,
	type2 = 1,
	moves = moves
}
M[129]={}
M[130]={}
M[131]={}
M[132]={}
M[133]={
	name = "eevee",
	rarity = 3,
	hp = 90,
	attack = 80,
	defense = 80,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 1,
	type2 = 1,
	moves = moves,
	evolutions = {
		{target = 134, stone_type1 = 10, stone_cost1 = 30},
		{target = 135, stone_type1 = 12, stone_cost1 = 30},
		{target = 136, stone_type1 = 9, stone_cost1 = 30}
	}
}
M[134]={
	name = "vaporeon",
	rarity = 4,
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
M[135]={
	name = "jolteon",
	rarity = 4,
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
M[136]={
	name = "flareon",
	rarity = 4,
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
M[137]={}
M[138]={}
M[139]={}
M[140]={}
M[141]={}
M[142]={}
M[143]={}
M[144]={}
M[145]={}
M[146]={}
M[147]={}
M[148]={}
M[149]={}
M[150]={}
M[151]={}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 22},
	{level = 7, id = 36},
	{level = 10, id = 60},
	{level = 12, id = 105}
}
M[152] = {
	name = "chikorita",
	rarity = 3,
	hp = 85,
	attack = 80,
	defense = 90,
	spattack = 90,
	spdefense = 90,
	speed = 100,
	type1 = 11,
	type2 = 11,
	moves = moves,
	evolutions = {
		{target = 153, stone_type1 = 11, stone_cost1 = 10}
	}
}
M[153]={
	name = "bayleef",
	rarity = 3,
	hp = 95,
	attack = 90,
	defense = 100,
	spattack = 100,
	spdefense = 100,
	speed = 100,
	type1 = 11,
	type2 = 11,
	moves = moves,
	evolutions = {
		{target = 154, stone_type1 = 11, stone_cost1 = 10}
	}
}
M[154]={
	name = "meganium",
	rarity = 3,
	hp = 105,
	attack = 100,
	defense = 110,
	spattack = 110,
	spdefense = 110,
	speed = 100,
	type1 = 11,
	type2 = 11,
	moves = moves
}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 23},
	{level = 7, id = 37},
	{level = 9, id = 6},
	{level = 10, id = 52},
	{level = 12, id = 130}
}
M[155] = {
	name = "cyndaquil",
	rarity = 3,
	hp = 80,
	attack = 85,
	defense = 80,
	spattack = 100,
	spdefense = 80,
	speed = 110,
	type1 = 9,
	type2 = 9,
	moves = moves,
	evolutions = {
		{target = 156, stone_type1 = 9, stone_cost1 = 10}
	}
}
M[156]={
	name = "quilava",
	rarity = 3,
	hp = 90,
	attack = 95,
	defense = 90,
	spattack = 110,
	spdefense = 90,
	speed = 110,
	type1 = 9,
	type2 = 9,
	moves = moves,
	evolutions = {
		{target = 157, stone_type1 = 9, stone_cost1 = 10}
	}
}
M[157]={
	name = "typhlosion",
	rarity = 3,
	hp = 100,
	attack = 105,
	defense = 100,
	spattack = 120,
	spdefense = 100,
	speed = 110,
	type1 = 9,
	type2 = 9,
	moves = moves
}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 24},
	{level = 7, id = 29},
	{level = 9, id = 42},
	{level = 10, id = 43},
	{level = 12, id = 131}
}
M[158] = {
	name = "totodile",
	rarity = 3,
	hp = 80,
	attack = 110,
	defense = 85,
	spattack = 90,
	spdefense = 80,
	speed = 100,
	type1 = 10,
	type2 = 10,
	moves = moves,
	evolutions = {
		{target = 159, stone_type1 = 10, stone_cost1 = 10}
	}
}
M[159]={
	name = "croconaw",
	rarity = 3,
	hp = 90,
	attack = 120,
	defense = 95,
	spattack = 100,
	spdefense = 90,
	speed = 100,
	type1 = 10,
	type2 = 10,
	moves = moves,
	evolutions = {
		{target = 160, stone_type1 = 10, stone_cost1 = 10}
	}
}
M[160]={
	name = "feraligatr",
	rarity = 3,
	hp = 100,
	attack = 130,
	defense = 105,
	spattack = 110,
	spdefense = 100,
	speed = 100,
	type1 = 10,
	type2 = 10,
	moves = moves
}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 2},
	{level = 6, id = 45},
	{level = 8, id = 3},
	{level = 9, id = 52},
	{level = 11, id = 35},
	{level = 13, id = 135},
	{level = 15, id = 41}
}
M[161]={
	name = "sentret",
	rarity = 1,
	hp = 75,
	attack = 90,
	defense = 75,
	spattack = 70,
	spdefense = 90,
	speed = 90,
	type1 = 1,
	type2 = 1,
	moves = moves
}
M[162]={
	name = "furret",
	rarity = 1,
	hp = 115,
	attack = 100,
	defense = 95,
	spattack = 80,
	spdefense = 90,
	speed = 105,
	type1 = 1,
	type2 = 1,
	moves = moves
}
M[163]={}
M[164]={}
M[165]={}
M[166]={}
M[167]={}
M[168]={}
moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 109}
moves[3] = {["level"] = 6, ["id"] = 111}
moves[4] = {["level"] = 8, ["id"] = 68}
moves[5] = {["level"] = 10, ["id"] = 8}
moves[6] = {["level"] = 12, ["id"] = 110}
moves[7] = {["level"] = 14, ["id"] = 112}
M[169] = {
	name = "crobat",
	rarity = 3,
	hp = 95,
	attack = 105,
	defense = 95,
	spattack = 85,
	spdefense = 100,
	speed = 115,
	type1 = 15,
	type2 = 3,
	moves = moves
}
M[170]={}
M[171]={}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 15},
	{level = 7, id = 31},
	{level = 10, id = 55},
	{level = 12, id = 122}
}
M[172] = {
	name = "pichu",
	rarity = 3,
	hp = 75,
	attack = 70,
	defense = 65,
	spattack = 110,
	spdefense = 100,
	speed = 115,
	type1 = 12,
	type2 = 12,
	moves = moves,
	evolutions = {
		{target = 25, stone_type1 = 12, stone_cost1 = 10}
	}
}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 46},
	{level = 7, id = 38},
	{level = 10, id = 61},
	{level = 12, id = 126}
}
M[173] = {
	name = "cleffa",
	rarity = 3,
	hp = 95,
	attack = 70,
	defense = 80,
	spattack = 95,
	spdefense = 95,
	speed = 95,
	type1 = 1,
	type2 = 1,
	moves = moves,
	evolutions = {
		{target = 36, stone_type1 = 1, stone_cost1 = 10}
	}
}
moves = {
	{level = 1, id = 1},
	{level = 1, id = 140},
	{level = 6, id = 135},
	{level = 8, id = 61},
	{level = 10, id = 35}
}
M[174]={
	name = "igglybuff",
	rarity = 3,
	hp = 140,
	attack = 70,
	defense = 50,
	spattack = 75,
	spdefense = 60,
	speed = 88,
	type1 = 1,
	type2 = 1,
	moves = moves,
	evolutions = {
		{target = 39, stone_type1 = 1, stone_cost1 = 10}
	}
}
M[175]={}
M[176]={}
M[177]={}
M[178]={}
M[179]={}
M[180]={}
M[181]={}
M[182]={}
M[183]={}
M[184]={}
M[185]={}
M[186]={}
M[187]={}
M[188]={}
M[189]={}
M[190]={}
M[191]={}
M[192]={}
M[193]={}
M[194]={}
M[195]={}
M[196]={}
M[197]={}
M[198]={}
M[199]={}
M[200]={}
M[201]={}
M[202]={}
M[203]={}
M[204]={}
M[205]={}
M[206]={}
M[207]={}
M[208]={}
M[209]={}
M[210]={}
M[211]={}
M[212]={}
M[213]={}
M[214]={}
M[215]={}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 45}
moves[3] = {["level"] = 6, ["id"] = 28}
moves[4] = {["level"] = 9, ["id"] = 3}
moves[5] = {["level"] = 12, ["id"] = 41}
M[216]={
	name = "teddiursa",
	rarity = 2,
	hp = 90,
	attack = 100,
	defense = 80,
	spattack = 80,
	spdefense = 80,
	speed = 95,
	type1 = 1,
	type2 = 1,
	moves = moves
}
M[217]={}
M[218]={}
M[219]={}
M[220]={}
M[221]={}
M[222]={}
M[223]={}
M[224]={}
M[225]={}
M[226]={}
M[227]={}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 8},
	{level = 7, id = 7},
	{level = 9, id = 43},
	{level = 10, id = 6},
	{level = 12, id = 130},
	{level = 14, id = 132}
}
M[228] = {
	name = "houndour",
	rarity = 3,
	hp = 80,
	attack = 90,
	defense = 80,
	spattack = 105,
	spdefense = 80,
	speed = 105,
	type1 = 9,
	type2 = 15,
	moves = moves,
	evolutions = {
		{target = 229, stone_type1 = 9, stone_cost1 = 5, stone_type2 = 15, stone_cost2 = 5}
	}
}
M[229]={
	name = "houndoom",
	rarity = 3,
	hp = 90,
	attack = 125,
	defense = 90,
	spattack = 135,
	spdefense = 100,
	speed = 105,
	type1 = 9,
	type2 = 15,
	moves = moves
}
M[230]={}
M[231]={}
M[232]={}
M[233]={}
M[234]={}
M[235]={}
M[236]={}
M[237]={}
M[238]={}
M[239]={}
M[240]={}
M[241]={}
M[242]={}
M[243]={}
M[244]={}
M[245]={}
M[246]={}
M[247]={}
M[248]={}
M[249]={}
M[250]={}
M[251]={}
M[252]={}
M[253]={}
M[254]={}
M[255]={}
M[256]={}
M[257]={}
M[258]={}
M[259]={}
M[260]={}
M[261]={}
M[262]={}
M[263]={}
M[264]={}
M[265]={}
M[266]={}
M[267]={}
M[268]={}
M[269]={}
M[270]={}
M[271]={}
M[272]={}
M[273]={}
M[274]={}
M[275]={}
M[276]={}
M[277]={}
M[278]={}
M[279]={}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 25},
	{level = 7, id = 40},
	{level = 10, id = 63},
	{level = 12, id = 133},
	{level = 14, id = 126}
}
M[280] = {
	name = "ralts",
	rarity = 3,
	hp = 80,
	attack = 60,
	defense = 70,
	spattack = 120,
	spdefense = 110,
	speed = 100,
	type1 = 13,
	type2 = 13,
	moves = moves,
	evolutions = {
		{target = 281, stone_type1 = 13, stone_cost1 = 10}
	}
}
M[281]={
	name = "kirlia",
	rarity = 3,
	hp = 90,
	attack = 70,
	defense = 80,
	spattack = 130,
	spdefense = 120,
	speed = 100,
	type1 = 13,
	type2 = 13,
	moves = moves,
	evolutions = {
		{target = 282, stone_type1 = 13, stone_cost1 = 10}
	}
}
M[282]={
	name = "gardevoir",
	rarity = 3,
	hp = 100,
	attack = 80,
	defense = 90,
	spattack = 140,
	spdefense = 130,
	speed = 100,
	type1 = 13,
	type2 = 13,
	moves = moves
}
M[283]={}
M[284]={}
M[285]={}
M[286]={}
M[287]={}
M[288]={}
M[289]={}
M[290]={}
M[291]={}
M[292]={}
M[293]={}
M[294]={}
M[295]={}
M[296]={}
M[297]={}
M[298]={}
M[299]={}
M[300]={}
M[301]={}
M[302]={}
M[303]={}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 13},
	{level = 7, id = 39},
	{level = 10, id = 62},
	{level = 12, id = 21},
	{level = 14, id = 134}
}
M[304] = {
	name = "aron",
	rarity = 3,
	hp = 80,
	attack = 95,
	defense = 160,
	spattack = 65,
	spdefense = 65,
	speed = 90,
	type1 = 7,
	type2 = 5,
	moves = moves,
	evolutions = {
		{target = 305, stone_type1 = 7, stone_cost1 = 5, stone_type2 = 5, stone_cost2 = 5}
	}
}
M[305]={
	name = "lairon",
	rarity = 3,
	hp = 90,
	attack = 105,
	defense = 170,
	spattack = 75,
	spdefense = 75,
	speed = 90,
	type1 = 7,
	type2 = 5,
	moves = moves,
	evolutions = {
		{target = 306, stone_type1 = 7, stone_cost1 = 5, stone_type2 = 5, stone_cost2 = 5}
	}
}
M[306]={
	name = "aggron",
	rarity = 3,
	hp = 100,
	attack = 115,
	defense = 180,
	spattack = 85,
	spdefense = 85,
	speed = 90,
	type1 = 7,
	type2 = 5,
	moves = moves
}
M[307]={}
M[308]={}
M[309]={}
M[310]={}
M[311]={}
M[312]={}
M[313]={}
M[314]={}
M[315]={}
M[316]={}
M[317]={}
M[318]={}
M[319]={}
M[320]={}
M[321]={}
M[322]={}
M[323]={}
M[324]={}
M[325]={}
M[326]={}
M[327]={}
M[328]={}
M[329]={}
M[330]={}
M[331]={}
M[332]={}
M[333]={}
M[334]={}
M[335]={}
M[336]={}
M[337]={}
M[338]={}
M[339]={}
M[340]={}
M[341]={}
M[342]={}
M[343]={}
M[344]={}
M[345]={}
M[346]={}
M[347]={}
M[348]={}
M[349]={}
M[350]={}
M[351]={}
M[352]={}
M[353]={}
M[354]={}
M[355]={}
M[356]={}
M[357]={}
M[358]={}
M[359]={}
M[360]={}
M[361]={}
M[362]={}

moves = {
	{level = 1, id = 1},
	{level = 1, id = 26},
	{level = 7, id = 41},
	{level = 10, id = 64},
	{level = 12, id = 135},
	{level = 14, id = 136}
}
M[363] = {
	name = "spheal",
	rarity = 3,
	hp = 120,
	attack = 65,
	defense = 80,
	spattack = 80,
	spdefense = 80,
	speed = 95,
	type1 = 14,
	type2 = 14,
	moves = moves,
	evolutions = {
		{target = 364, stone_type1 = 14, stone_cost1 = 10}
	}
}
M[364]={
	name = "sealeo",
	rarity = 3,
	hp = 130,
	attack = 75,
	defense = 90,
	spattack = 90,
	spdefense = 90,
	speed = 95,
	type1 = 14,
	type2 = 14,
	moves = moves,
	evolutions = {
		{target = 365, stone_type1 = 14, stone_cost1 = 10}
	}
}
M[365]={
	name = "walrein",
	rarity = 3,
	hp = 140,
	attack = 85,
	defense = 100,
	spattack = 100,
	spdefense = 100,
	speed = 95,
	type1 = 14,
	type2 = 14,
	moves = moves
}
M[366]={}
M[367]={}
M[368]={}
M[369]={}
M[370]={}
M[371]={}
M[372]={}
M[373]={}
M[374]={}
M[375]={}
M[376]={}
M[377]={}
M[378]={}
M[379]={}
M[380]={}
M[381]={}
M[382]={}
M[383]={}
M[384]={}
M[385]={}
M[386]={}

return M