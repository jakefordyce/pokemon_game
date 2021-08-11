local M = {}

--List of all pokemon by pokedex ID.

moves = {}
moves[0] = {["level"] = 1, ["id"] = 1}

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

moves = {}
moves[0] = {["level"] = 1, ["id"] = 1}

M[2] = {
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