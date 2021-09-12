local M = {}

--BATTLE INFO--
M.player_mon1 = 1 --this is the index of M.pokemon
M.player_mon2 = nil
M.player_mon3 = nil
M.player_mon4 = nil


--this will hold the data generated for each battle
M.enemy_mon1 = {}
M.enemy_mon2 = nil
M.enemy_mon3 = nil
M.enemy_mon4 = nil

--PLAYER INFO--
M.position_x = 263
M.position_y = 761
M.current_area = 1

--List of all of the player's pokemon.
M.pokemon = {}

moves = {}
moves[1] = {
	id = 1,
	level = 0
}
moves[2] = {
	id = 2,
	level = 0
}

M.pokemon[1] = {
	pokedex = 1,
	level = 5,
	exp = 0,
	name = "bulbasaur",
	known_moves = moves,
	move1 = 1, --this is the index from the pokemon's learned_moves.
	move2 = 2,
	move3 = 1,
	move4 = 1,
	rune1 = 1, --this is the index from M.runes.
	rune2 = nil,
	rune3 = nil,
	rune4 = nil,
	rune5 = nil,
	rune6 = nil,
	hp = 100,
	attack = 10,
	defense = 10,
	spattack = 10,
	spdefense = 10,
	speed = 100,
	acc = 0,
	res = 0,
	crit_chance = 5,
	crit_damage = 50
}

--List of all of the player's runes.
M.runes = {}

M.runes[1] = {
	slot = 1,
	level = 1,
	rarity = 1
}

return M