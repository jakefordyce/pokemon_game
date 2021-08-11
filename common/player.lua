local M = {}

--List of all of the player's pokemon.
M["pokemon"] = {}

moves = {}
moves[0] = {}
moves[0]["id"] = 1
moves[0]["level"] = 0

M["pokemon"][0] = {
	["pokedex"] = 1,
	["learned_moves"] = moves,
	["move1"] = 0
}

--List of all of the player's runes.
M["runes"] = {}

M["runes"][0] = {
	["slot"] = 1,
	["level"] = 1,
	["rank"] = 1,
	["rarity"] = 1
}

return M