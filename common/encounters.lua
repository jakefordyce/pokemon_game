local game_state = require "common/game_state"
local pbs = require "common/poke_base_stats"
local moves = require "common/moves"

local M = {}

local UNCOMMON_CHANCE = 50
local RARE_CHANCE = 20
local MYTHIC_CHANCE = 5

local function generate_stats(mon)
	mon.name = pbs[mon.pokedex].name
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
	mon.type1 = pbs[mon.pokedex].type1
	mon.type2 = pbs[mon.pokedex].type2
end

local function simulate_runes(mon)
	--main stats on first three runes
	mon.hp = mon.hp + (mon.level * 20)
	mon.attack = mon.attack + mon.level
	mon.spattack = mon.spattack + mon.level
	mon.defense = mon.defense + mon.level
	mon.spdefense = mon.spdefense + mon.level
	
	--rest of stats
	if mon.build_style == 1 then --even build no speed.
		mon.hp = mon.hp + (mon.hp * (mon.level * (0.009)))
		mon.attack = mon.attack + (mon.attack * (mon.level * 0.009))
		mon.spattack = mon.spattack + (mon.spattack * (mon.level * 0.009))
		mon.defense = mon.defense + (mon.defense * (mon.level * 0.009))
		mon.spdefense = mon.spdefense + (mon.spdefense * (mon.level * 0.009))
		mon.accuracy = mon.accuracy + (mon.level * 0.009)
		mon.resist = mon.resist + (mon.level * 0.009)

		mon.hp = mon.hp + (mon.hp * (mon.level * (0.001) * (mon.gear_rarity - 1)))
		mon.attack = mon.attack + (mon.attack * (mon.level *  (0.001) * (mon.gear_rarity - 1)))
		mon.spattack = mon.spattack + (mon.spattack * (mon.level *  (0.001) * (mon.gear_rarity - 1)))
		mon.defense = mon.defense + (mon.defense * (mon.level *  (0.001) * (mon.gear_rarity - 1)))
		mon.spdefense = mon.spdefense + (mon.spdefense * (mon.level *  (0.001) * (mon.gear_rarity - 1)))
	end
end

--This loads the last (up to) 4 moves the pokemon has learned while leveling up.
local function select_moves(mon)
	local known_moves = {}
	for i, m in ipairs(pbs[mon.pokedex].moves) do
		if mon.level >= m.level then
			table.insert(known_moves, {id = m.id, level = m.level})
		end
	end
	mon.known_moves = known_moves
	local move_rotation = 2
	for i, m in ipairs(known_moves) do
		if moves[m.id].default == true then
			mon.move1 = i
		else
			mon["move"..move_rotation] = i
			
			move_rotation = move_rotation + 1
			if move_rotation > 4 then
				move_rotation = 2
			end
		end
	end
	
end

function M.load_trainer_data(trainer_index)
	for i=1,4 do
		game_state["enemy_mon"..i] = trainers[trainer_index]["mon"..i]
		generate_stats(game_state["enemy_mon"..i])
		simulate_runes(game_state["enemy_mon"..i])
		select_moves(game_state["enemy_mon"..i])
	end
	
end

function M.load_wild_encounter(area_index)
	rarity = 1
	for i=1,4 do
		rarity_num = math.random(1,100)
		if rarity_num < MYTHIC_CHANCE then
			rarity = 4
		elseif rarity_num < RARE_CHANCE then
			rarity = 3
		elseif rarity_num < UNCOMMON_CHANCE then
			rarity = 2
		else
			rarity = 1
		end

		pokedex_num = math.random(1,#areas[area_index][rarity])
		pokedex = areas[area_index][rarity][pokedex_num]
		mon_level = math.random(areas[area_index].min_level, areas[area_index].max_level)
		game_state["enemy_mon"..i] = {
			pokedex = pokedex,
			gear_rarity = 1,
			level = mon_level,
			build_style = 1
		}
		generate_stats(game_state["enemy_mon"..i])
		select_moves(game_state["enemy_mon"..i])
	end
end

-- Wild Encounter Data
areas = {}

areas[2] = {
	{10,19},
	{13,16},
	{1,4,7,63,66},
	{92},
	min_level = 2,
	max_level = 5
}

-- Trainer Data
trainers = {}

trainers[1] = {}
trainers[1].name = "Youngster Ben"
trainers[1].mon1 = {
	pokedex = 19,
	gear_rarity = 1,
	level = 5,
	build_style = 1
}
trainers[1].mon2 = {
	pokedex = 16,
	gear_rarity = 1,
	level = 3,
	build_style = 1
}
trainers[1].mon3 = {
	pokedex = 19,
	gear_rarity = 1,
	level = 3,
	build_style = 1
}
trainers[1].mon4 = {
	pokedex = 10,
	gear_rarity = 1,
	level = 2,
	build_style = 1
}

return M