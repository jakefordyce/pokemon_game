local game_state = require "common/game_state"
local pbs = require "common/poke_base_stats"
local moves = require "common/moves"
local boss_stats = require "common/boss_stats"

local M = {}

local UNCOMMON_CHANCE = 50
local RARE_CHANCE = 20
local MYTHIC_CHANCE = 5

local function generate_stats(mon)
	mon.name = pbs[mon.pokedex].name
	mon.nickname = pbs[mon.pokedex].name:upper():gsub("_", " ")
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

local function generate_boss_stats(boss)
	boss.name = boss_stats[boss.index].name
	boss.nickname = boss_stats[boss.index].name:upper():gsub("_", " ")
	boss.hp =  boss_stats.stat_by_level(boss.index, "hp", boss.level)
	boss.attack = boss_stats.stat_by_level(boss.index, "attack", boss.level)
	boss.defense = boss_stats.stat_by_level(boss.index, "defense", boss.level)
	boss.spattack = boss_stats.stat_by_level(boss.index, "spattack", boss.level)
	boss.spdefense = boss_stats.stat_by_level(boss.index, "spdefense", boss.level)
	boss.speed = boss_stats[boss.index].speed
	boss.accuracy = boss_stats.stat_by_level(boss.index, "accuracy", boss.level)
	boss.resist = boss_stats.stat_by_level(boss.index, "resist", boss.level)
	boss.crit_chance = boss_stats.base_crit_chance
	boss.crit_damage = boss_stats.base_crit_damage
	boss.type1 = boss_stats[boss.index].type1
	boss.type2 = boss_stats[boss.index].type2
	boss.move_priority = boss_stats[boss.index].move_priority
end

local function simulate_runes(mon)
	local effective_level = mon.level

	if effective_level <= 10 then
		effective_level = effective_level * 2
	else
		effective_level = effective_level + 10
	end
	--main stats on first three runes
	mon.hp = mon.hp + (effective_level * 20)
	mon.attack = mon.attack + effective_level
	mon.spattack = mon.spattack + effective_level
	mon.defense = mon.defense + effective_level
	mon.spdefense = mon.spdefense + effective_level
	
	--rest of stats
	if mon.build_style == 1 then --even build no speed.
		mon.hp = mon.hp + (mon.hp * (effective_level * (0.009)))
		mon.attack = mon.attack + (mon.attack * (effective_level * 0.009))
		mon.spattack = mon.spattack + (mon.spattack * (effective_level * 0.009))
		mon.defense = mon.defense + (mon.defense * (effective_level * 0.009))
		mon.spdefense = mon.spdefense + (mon.spdefense * (effective_level * 0.009))
		mon.accuracy = mon.accuracy + (effective_level * 0.009)
		mon.resist = mon.resist + (effective_level * 0.009)

		mon.hp = mon.hp + (mon.hp * (effective_level * (0.001) * (mon.gear_rarity - 1)))
		mon.attack = mon.attack + (mon.attack * (effective_level *  (0.001) * (mon.gear_rarity - 1)))
		mon.spattack = mon.spattack + (mon.spattack * (effective_level *  (0.001) * (mon.gear_rarity - 1)))
		mon.defense = mon.defense + (mon.defense * (effective_level *  (0.001) * (mon.gear_rarity - 1)))
		mon.spdefense = mon.spdefense + (mon.spdefense * (effective_level *  (0.001) * (mon.gear_rarity - 1)))
	end
end

--This loads the last (up to) 4 moves the pokemon has learned while leveling up.
local function select_moves(mon)
	mon.known_moves = pbs.known_moves_by_level(mon.pokedex, mon.level)
	equipped_moves = pbs.equipped_moves_by_level(mon.pokedex, mon.level)

	for i=1,4 do
		mon["move"..i] = equipped_moves[i]
	end
end

--This loads the last (up to) 4 moves the pokemon has learned while leveling up.
local function select_boss_moves(boss)
	boss.known_moves = boss_stats.known_moves_by_level(boss.index, boss.level)
	equipped_moves = boss_stats.equipped_moves_by_level(boss.index, boss.level)

	for i=1,4 do
		boss["move"..i] = equipped_moves[i]
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

function M.trainer_reward_money(trainer_index)
	total_money = 0
	for i=1,4 do
		if trainers[trainer_index]["mon"..i] ~= nil then
			reward = math.floor(math.pow(3, (trainers[trainer_index]["mon"..i].level / 10) ) * 10)
			total_money = total_money + reward
		end
	end
	return total_money
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
		simulate_runes(game_state["enemy_mon"..i])
		select_moves(game_state["enemy_mon"..i])
	end
end

function M.load_boss_encounter(boss_index, level)
	for i=1,4 do
		game_state["enemy_mon"..i] = nil
	end
	game_state["enemy_boss"] = {
		index = boss_index, --TODO: fix this
		level = level,
		gear_rarity = 5,
		build_style = 1
	}
	generate_boss_stats(game_state["enemy_boss"])
	simulate_runes(game_state["enemy_boss"])
	select_boss_moves(game_state["enemy_boss"])
end

function M.generate_league_trainers()
	for i=1,11 do
		local comp_num = math.random(1,#team_comps)
		local trainer_rating = game_state.player.rating + ((6 - i) * 10) + math.random(1,5)
		if trainer_rating < 0 then
			trainer_rating = 0
		end
		local trainer = { rating = trainer_rating }
		local mon_level = math.floor(trainer_rating / 10) + 5
		local gear_rarity = math.ceil(trainer_rating / 200)
		for p=1,4 do
			local role = team_comps[comp_num][p]
			local random_mon_from_role = mon_builds[role][math.random(1, #mon_builds[role])]
			local pokemon = {}
			pokemon.pokedex = random_mon_from_role.pokedex
			pokemon.build_style = random_mon_from_role.build_style
			pokemon.level = mon_level
			pokemon.gear_rarity = gear_rarity
			trainer["mon"..p] = pokemon
		end
		table.insert(M.league_trainers, trainer)
	end
	
end

-- Wild Encounter Data
areas = {}

areas[3] = {
	{10,19,29,32},
	{13,16,52},
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

-- League Data

M.league_trainers = {}

team_comps = {}

team_comps[1] = {1,1,1,1} -- 4 strikers

mon_builds = {}

mon_builds[1] = { -- Strikers
	{ pokedex = 4, build_style = 1, moves = {6,12,28}, move_priority = {2,3,1} },
	{ pokedex = 4, build_style = 1, moves = {6,12,28}, move_priority = {2,3,1} },
	{ pokedex = 4, build_style = 1, moves = {6,12,28}, move_priority = {2,3,1} },
	{ pokedex = 4, build_style = 1, moves = {6,12,28}, move_priority = {2,3,1} },
}



return M