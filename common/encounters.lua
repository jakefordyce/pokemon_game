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
	local equipped_moves
	if mon.chosen_moves == nil then
		mon.known_moves = pbs.known_moves_by_level(mon.pokedex, mon.level)
		equipped_moves = pbs.equipped_moves_by_level(mon.pokedex, mon.level)
	else
		mon.known_moves = {}
		equipped_moves = {nil, nil, nil, nil}
		for i=1,#mon.chosen_moves do
			table.insert(mon.known_moves, { id = mon.chosen_moves[i], level = 0})
			equipped_moves[i] = i
		end
	end

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
	local total_money = 0
	for i=1,4 do
		if game_state.battle_type == 2 and trainers[trainer_index]["mon"..i] ~= nil then
			reward = math.floor(math.pow(3, (trainers[trainer_index]["mon"..i].level / 10) ) * 10)
			total_money = total_money + reward
		elseif game_state.battle_type == 4 then
			reward = math.floor(math.pow(3, (M.league_trainers[trainer_index]["mon"..i].level / 10) ) * 10)
			total_money = total_money + reward
		end
	end
	return total_money
end

function M.poke_league_rating_change(trainer_index, victory)
	local enemy_rating = M.league_trainers[trainer_index].rating
	local player_rating = game_state.player.rating
	if victory then
		return math.floor((enemy_rating - player_rating) / 10 ) + 10
	else
		return math.floor((enemy_rating - player_rating) / 10 ) - 10
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
	for i=1,#M.league_trainers do
		M.league_trainers[i] = nil
	end
	local league_num = M.get_current_league_num(game_state.player.rating)
	for i=1,11 do
		local comp_num = math.random(1,#team_comps)
		local trainer_rating = game_state.player.rating + ((6 - i) * 10) + math.random(1,5)
		if trainer_rating < 0 then
			trainer_rating = 0
		elseif trainer_rating > 1000 then
			trainer_rating = 1000
		end
		local trainer = { rating = trainer_rating }
		local mon_level = math.floor(trainer_rating / 10) + 5
		local gear_rarity = math.ceil(trainer_rating / 200)
		for p=1,4 do
			local role = team_comps[comp_num][p]
			local random_mon_from_role = mon_builds[league_num][role][math.random(1, #mon_builds[league_num][role])]
			local pokemon = {}
			pokemon.pokedex = random_mon_from_role.pokedex
			pokemon.build_style = random_mon_from_role.build_style
			pokemon.level = mon_level
			pokemon.gear_rarity = gear_rarity
			pokemon.chosen_moves = random_mon_from_role.moves
			pokemon.move_priority = random_mon_from_role.move_priority
			trainer["mon"..p] = pokemon
		end
		table.insert(M.league_trainers, trainer)
	end
end

function M.load_poke_league_encounter(trainer_index)
	local league_trainer = M.league_trainers[trainer_index]
	for i=1,4 do
		game_state["enemy_mon"..i] = league_trainer["mon"..i]
		generate_stats(game_state["enemy_mon"..i])
		simulate_runes(game_state["enemy_mon"..i])
		select_moves(game_state["enemy_mon"..i])
	end
end

-- Wild Encounter Data
areas = {}
--[[
areas[3] = {
	{10,19,29,32},
	{13,16,52},
	{1,4,7},
	{92},
	min_level = 2,
	max_level = 5
}
--]]

areas[3] = {
	{48},
	{48},
	{48},
	{48},
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
mon_builds[1] = {} --Iron
mon_builds[2] = {} --Bronze
mon_builds[3] = {} --Silver
mon_builds[4] = {} --Gold
mon_builds[5] = {} --Platinum
mon_builds[6] = {} --Master

mon_builds[1][1] = { -- Strikers
	{ pokedex = 4, build_style = 1, moves = {6,12,28}, move_priority = {2,3,1} },
	{ pokedex = 32, build_style = 1, moves = {47,48,49}, move_priority = {3,2,1} },
	{ pokedex = 63, build_style = 1, moves = {56,18,32}, move_priority = {3,2,1} },
	{ pokedex = 66, build_style = 1, moves = {57,19,33}, move_priority = {2,3,1} },
}

local league_names = {
	"Iron", "Bronze", "Silver", "Gold", "Platinum", "Master"
}

function M.get_current_league_num(rating)
	return math.floor(rating / 200) + 1
end

function M.get_league_name(rating)
	return league_names[M.get_current_league_num(rating)]
end

function M.get_next_league_rating(rating)
	local current_league = M.get_current_league_num(rating)
	if current_league < 6 then
		return (current_league * 200)
	else
		return (current_league - 1) * 200
	end
end


return M