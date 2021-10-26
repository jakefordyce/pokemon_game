local pbs = require "common/poke_base_stats"
local runes = require "common/runes"

local M = {}

--FLAGS--
M.starters_chosen = false

M.items_found = {}

M.trainers_defeated = {}

--TEMP STATE--
M.dialog_is_pending = false
M.pending_dialog_id = nil
M.pending_dialog_sender = nil

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

M.battle_type = 1
-- 1 - wild pokemon
-- 2 - trainer
-- 3 - boss fight

M.preview_mon = {}

--METHODS--
function M.add_pokemon(pokedex, level)
	new_mon = {
		pokedex = pokedex,
		level = level,
		exp = 0,
		name = pbs[pokedex].name,
		known_moves = pbs.known_moves_by_level(pokedex, level),
		rune1 = nil, --this is the index from M.runes.
		rune2 = nil,
		rune3 = nil,
		rune4 = nil,
		rune5 = nil,
		rune6 = nil,
		hp =  pbs.stat_by_level(pokedex, "hp", level),
		attack = pbs.stat_by_level(pokedex, "attack", level),
		defense = pbs.stat_by_level(pokedex, "defense", level),
		spattack = pbs.stat_by_level(pokedex, "spattack", level),
		spdefense = pbs.stat_by_level(pokedex, "spdefense", level),
		speed = pbs[pokedex].speed,
		accuracy = 0,
		resist = 0,
		crit_chance = pbs.base_crit_chance,
		crit_damage = pbs.base_crit_damage
	}
	equipped_moves = pbs.equipped_moves_by_level(pokedex, level)
	for i=1,4 do
		new_mon["move"..i] = equipped_moves[i]
	end
	table.insert(M.pokemon, new_mon)
	
end

function M.generate_preview_mon(pokedex, level)
	M.preview_mon.pokedex = pokedex
	M.preview_mon.level = level
	M.preview_mon.name = pbs[pokedex].name
	M.preview_mon.hp =  pbs.stat_by_level(pokedex, "hp", level)
	M.preview_mon.attack = pbs.stat_by_level(pokedex, "attack", level)
	M.preview_mon.defense = pbs.stat_by_level(pokedex, "defense", level)
	M.preview_mon.spattack = pbs.stat_by_level(pokedex, "spattack", level)
	M.preview_mon.spdefense = pbs.stat_by_level(pokedex, "spdefense", level)
	M.preview_mon.speed = pbs[pokedex].speed
	M.preview_mon.accuracy = 0
	M.preview_mon.resist = 0
	M.preview_mon.crit_chance = pbs.base_crit_chance
	M.preview_mon.crit_damage = pbs.base_crit_damage
	M.preview_mon.type1 = pbs[pokedex].type1
	M.preview_mon.type2 = pbs[pokedex].type2
end

function M.mon_leveled(mon_index, exp_gained)
	M.pokemon[mon_index].exp = M.pokemon[mon_index].exp + exp_gained
	exp_to_next_level = pbs.exp_to_next_level(M.pokemon[mon_index].level)
	leveled_up = false
	while M.pokemon[mon_index].exp >= exp_to_next_level do
		leveled_up = true
		M.pokemon[mon_index].level = M.pokemon[mon_index].level + 1
		M.pokemon[mon_index].exp = M.pokemon[mon_index].exp - exp_to_next_level
		exp_to_next_level = pbs.exp_to_next_level(M.pokemon[mon_index].level)
	end

	if leveled_up then
		M.calculate_pokemon_stats()
	end

	return leveled_up
end

function M.mon_learned_move(mon_index)
	learned_a_move = false
	mon = M.pokemon[mon_index]
	-- loop through the moves that the mon can learn while leveling
	for i, move in ipairs(pbs[mon.pokedex].moves) do
		move_known = false
		-- if we find a move that the mon is high enough level to learn...
		if move.level <= mon.level then
			-- we loop through the moves it already knows to make sure it doesn't already know the move
			for i, known in ipairs(mon.known_moves) do
				if known.id == move.id then
					move_known = true
				end
			end
			-- if it doesn't know the move then it learns it now
			if move_known == false then
				move = {id = move.id, level = 0}
				table.insert(mon.known_moves, move)
				learned_a_move = true
			end
		end
	end
	return learned_a_move
end

--PLAYER INFO--
M.position_x = 263
M.position_y = 761
M.current_area = 1
M.money = 300

--List of all of the player's pokemon.
M.pokemon = {}

moves = {}
moves[1] = {
	id = 1,
	level = 2
}
moves[2] = {
	id = 2,
	level = 4
}
moves[3] = {
	id = 8,
	level = 0
}
moves[4] = {
	id = 4,
	level = 0
}


M.pokemon[1] = {
	pokedex = 1,
	level = 30,
	exp = 0,
	name = "bulbasaur",
	known_moves = moves,
	move1 = 1, --this is the index from the pokemon's known_moves.
	move2 = 2,
	move3 = 3,
	move4 = nil,
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
	accuracy = 0,
	resist = 0,
	crit_chance = 5,
	crit_damage = 50,
	type1 = 11,
	type2 = 11
}

--List of all of the player's runes.
M.runes = {}

M.runes[1] = {
	slot = 1,
	level = 1,
	rarity = 5,
	main_stat = 1,
	equipped_id = 1, -- this is the index from M.pokemon
	substats = {
		{
			stat = 9,
			rank = 1
		},
		{
			stat = 4,
			rank = 1
		},
		{
			stat = 10,
			rank = 1
		},
		{
			stat = 8,
			rank = 1
		}
	}
}

M.runes[2] = {
	slot = 2,
	level = 1,
	rarity = 1,
	main_stat = 2,
	equipped_id = nil, -- this is the index from M.pokemon
	substats = {}
}

M.runes[3] = {
	slot = 3,
	level = 1,
	rarity = 2,
	main_stat = 3,
	equipped_id = nil, -- this is the index from M.pokemon
	substats = {
		{
			stat = 4,
			rank = 1
		}
	}
}

M.runes[4] = {
	slot = 1,
	level = 1,
	rarity = 2,
	main_stat = 1,
	equipped_id = nil, -- this is the index from M.pokemon
	substats = {
		{
			stat = 4,
			rank = 1
		}
	}
}

function M.calculate_pokemon_stats()
	for i, mon in ipairs(M.pokemon) do
		-- start at the base stats based on species and level
		mon.hp =  pbs.stat_by_level(mon.pokedex, "hp", mon.level)
		mon.attack = pbs.stat_by_level(mon.pokedex, "attack", mon.level)
		mon.defense = pbs.stat_by_level(mon.pokedex, "defense", mon.level)
		mon.spattack = pbs.stat_by_level(mon.pokedex, "spattack", mon.level)
		mon.spdefense = pbs.stat_by_level(mon.pokedex, "spdefense", mon.level)
		mon.speed = pbs[mon.pokedex].speed
		mon.accuracy = 0
		mon.resist = 0
		mon.crit_chance = pbs.base_crit_chance
		mon.crit_damage = pbs.base_crit_damage

		-- add bonuses from runes
		local runes_bonuses = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}

		for r=1, 6 do
			rune = M.runes[mon["rune"..r]]
			if rune ~= nil then
				runes_bonuses[rune.main_stat] = runes_bonuses[rune.main_stat] + runes.mainstat_value(rune.main_stat, rune.level)
				for i, ss in ipairs(rune.substats) do
					runes_bonuses[ss.stat] = runes_bonuses[ss.stat] + runes.substat_value(ss.stat, ss.rank)
				end
			end
		end

		mon.attack = math.ceil(mon.attack + (runes_bonuses[9] * mon.attack / 100) + runes_bonuses[1])
		mon.spattack = math.ceil(mon.spattack + (runes_bonuses[9] * mon.spattack / 100) + runes_bonuses[1])
		mon.hp = math.ceil(mon.hp + (runes_bonuses[10] * mon.hp / 100) + runes_bonuses[2])
		mon.defense = math.ceil(mon.defense + (runes_bonuses[11] * mon.defense / 100) + runes_bonuses[3])
		mon.spdefense = math.ceil(mon.spdefense + (runes_bonuses[11] * mon.spdefense / 100) + runes_bonuses[3])
		mon.speed = mon.speed + runes_bonuses[4]
		mon.accuracy = mon.accuracy + runes_bonuses[5]
		mon.resist = mon.resist + runes_bonuses[6]
		mon.crit_chance = mon.crit_chance + runes_bonuses[7]
		mon.crit_damage = mon.crit_damage + runes_bonuses[8]
	end
end

return M