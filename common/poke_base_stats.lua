local M = {}

-- this should only be used for hp, attack, defense, spattack, spdefense
function M.stat_by_level(pokedex, stat, level)
	calc_stat = (5 + (M[pokedex][stat] * level * 0.01) * 2)
	if stat=="hp" then
		calc_stat = calc_stat * 20
	end
	
	return calc_stat
end

M.base_crit_chance = 5
M.base_crit_damage = 100

--List of all pokemon by pokedex ID.
moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}
moves[2] = {["level"] = 1, ["id"] = 2}

M[1] = {
	["name"] = "bulbasaur",
	["hp"] = 90,
	["attack"] = 80,
	["defense"] = 80,
	["spattack"] = 90,
	["spdefense"] = 80,
	["speed"] = 100,
	["moves"] = moves
}

M[2] = {
	["name"] = "ivysaur",
	["hp"] = 105,
	["attack"] = 90,
	["defense"] = 90,
	["spattack"] = 105,
	["spdefense"] = 90,
	["speed"] = 100,
	["moves"] = moves
}

M[3] = {
	["name"] = "venusaur",
	["hp"] = 120,
	["attack"] = 100,
	["defense"] = 100,
	["spattack"] = 120,
	["spdefense"] = 100,
	["speed"] = 100,
	["moves"] = moves
}

moves = {}
moves[1] = {["level"] = 1, ["id"] = 1}

M[4] = {
	["name"] = "charmander",
	["hp"] = 80,
	["attack"] = 90,
	["defense"] = 80,
	["spattack"] = 90,
	["spdefense"] = 80,
	["speed"] = 100,
	["moves"] = moves
}


return M