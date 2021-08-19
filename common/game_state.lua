local M = {}



--List of all of the player's pokemon.
M.pokemon = {}

moves = {}
moves[0] = {}
moves[0].id = 1
moves[0].level = 0

M.pokemon[0] = {
	pokedex = 1,
	name = "bulbasaur",
	learned_moves = moves,
	move1 = 0, --this is the index from the pokemon's learned_moves.
	move2 = 0,
	move3 = 0,
	move4 = 0
}

--List of all of the player's runes.
M.runes = {}

M.runes[0] = {
	slot = 1,
	level = 1,
	rank = 1,
	rarity = 1
}

return M