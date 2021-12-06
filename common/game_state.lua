local pbs = require "common/poke_base_stats"
local runes = require "common/runes"
local boss_stats = require "common/boss_stats"

local M = {}

--FLAGS--
M.flags = {
	starters_chosen = false --DEV
}
M.items_found = {}
M.trainers_defeated = {}
M.bill_bosses_defeated = {0}

--PLAYER INFO--
---[[ starting values
M.player = {
	position_x = 263, 
	position_y = 761,
	current_area = 1,
	money = 300,
	rating = 0
}
--]]
--[[ Poke League testing
M.player = {
	position_x = 352, 
	position_y = 67,
	current_area = 7,
	money = 300,
	rating = 0
}
--]]
--[[ Testing Bill bosses
M.player = {
	position_x = 416,
	position_y = 51,
	current_area = 5,
	money = 30000,
	rating = 0
}

--]]
--[[ Testing move tutor
M.player = {
	position_x = 210,
	position_y = 108,
	current_area = 6,
	money = 30000,
	rating = 0
}
--]]


M.stones = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0} -- 1 for each of the types in common/poke_types
--M.stones = {50,50,50,50,50,50,50,50,50,50,50,50,50,50,50} -- Testing values

--List of all of the player's pokemon.
M.pokemon = {}

--List of all of the player's runes.
M.runes = {}


--TEMP STATE--
M.shop_runes = {}
M.reward_runes = {}
M.dialog_is_displaying = false
M.dialog_is_pending = false
M.pending_dialog_id = nil
M.pending_dialog_sender = nil
M.victory_dialog_id = nil
M.loss_dialog_id = nil

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
M.battle_id = 1

M.preview_mon = {}

--METHODS--
function M.add_pokemon(pokedex, level)
	new_mon = {
		pokedex = pokedex,
		level = level,
		exp = 0,
		name = pbs[pokedex].name,
		nickname = pbs[pokedex].name:upper():gsub("_", " "),
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
		crit_damage = pbs.base_crit_damage,
		type1 = pbs[pokedex].type1,
		type2 = pbs[pokedex].type2
	}
	equipped_moves = pbs.equipped_moves_by_level(pokedex, level)
	for i=1,4 do
		new_mon["move"..i] = equipped_moves[i]
	end
	table.insert(M.pokemon, new_mon)
	
end

function M.generate_shop_runes()
	count = #M.shop_runes
	for i=1, count do M.shop_runes[i]=nil end

	for i=1,3 do
		M.shop_runes[i] = {
			slot = i,
			level = 1,
			rarity = 1,
			main_stat = i,
			equipped_id = nil,
			substat_points = 0,
			substats = {}
		}
	end

	for i=4,6 do
		for j=1,#runes.mainstat_options[i] do
			local new_rune = {
				slot = i,
				level = 1,
				rarity = 1,
				main_stat = runes.mainstat_options[i][j],
				equipped_id = nil,
				substat_points = 0,
				substats = {}
			}
			table.insert(M.shop_runes, new_rune)
		end
	end
	
end

function M.generate_reward_runes()
	count = #M.reward_runes
	for i=1, count do M.reward_runes[i]=nil end

	local rune_chance = 50
	local base_rune_rarity = 1
	local rarity_chance = 50
	
	if M.battle_type == 3 then
		base_rune_rarity = 2
	end
	
	local rune_count = 0
	for i=1,4 do
		if math.random(1,100) <= rune_chance then
			rune_count = rune_count + 1
		end
	end

	for i=1, rune_count do
		local rune_rarity = base_rune_rarity
		local rarity_increased = true
		rarity_chance = 50
		while rarity_increased == true and rune_rarity < 5 do
			if math.random(1,100) <= rarity_chance then
				rarity_increased = true
				rune_rarity = rune_rarity + 1
			else
				rarity_increased = false
			end
		end
		
		new_rune = runes.generate_random_rune(rune_rarity)
		table.insert(M.reward_runes, new_rune)
		table.insert(M.runes, new_rune)
	end
end

function M.generate_reward_stones()
	
	index = M.battle_id
	level = M.battle_level
	stones = boss_stats.stone_reward(index, level)
	
	if stones[2] == nil then
		M.stones[boss_stats[index].type1] = M.stones[boss_stats[index].type1] + reward
	else
		M.stones[boss_stats[index].type1] = M.stones[boss_stats[index].type1] + reward
		M.stones[boss_stats[index].type2] = M.stones[boss_stats[index].type2] + reward
	end

	return stones
end

function M.generate_preview_mon(pokedex, level)
	M.preview_mon.pokedex = pokedex
	M.preview_mon.level = level
	M.preview_mon.name = pbs[pokedex].name
	M.preview_mon.nickname = pbs[pokedex].name:upper():gsub("_", " ")
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
				-- see if there's an empty move slot so we can equip the move now.
				local move_equipped = false
				for pm=2,4 do
					if not move_equipped and mon["move"..pm] == nil then
						mon["move"..pm] = #mon.known_moves
						move_equipped = true
					end
				end
			end
		end
	end
	return learned_a_move
end

function M.evolve_pokemon(mon_index, target_pokedex)
	mon = M.pokemon[mon_index]
	mon.pokedex = target_pokedex
	mon.name = pbs[target_pokedex].name
	mon.type1 = pbs[target_pokedex].type1
	mon.type2 = pbs[target_pokedex].type2
	learned_moves = M.mon_learned_move(mon_index)
	M.calculate_pokemon_stats()
end


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

function M.fix_pokemon_rune_ids(sold_rune_index)
	for i, poke in ipairs(M.pokemon) do
		for r=1,6 do
			if poke["rune"..r] ~= nil and poke["rune"..r] > sold_rune_index then
				poke["rune"..r] = poke["rune"..r] - 1
			end
		end
	end
end

function M.save_game()
	local save_data = {}

	save_data.flags = M.flags
	save_data.player = M.player
	save_data.items_found = M.items_found
	save_data.trainers_defeated = M.trainers_defeated
	save_data.bill_bosses_defeated = M.bill_bosses_defeated
	save_data.stones = M.stones
	save_data.pokemon = M.pokemon
	save_data.runes = M.runes

	local save_file_path = sys.get_save_file("Pokemon", "save_file")
	--print("path "..save_file_path)
	if not sys.save(save_file_path, save_data) then
		print("unable to save")
		return false
	else
		return true
	end
end

function M.load_game()
	local save_file_path = sys.get_save_file("Pokemon", "save_file")
	local save_data = sys.load(save_file_path)
	if not next(save_data) then
		print("no data found")
	else
		M.flags = save_data.flags
		M.player = save_data.player
		M.items_found = save_data.items_found
		M.trainers_defeated = save_data.trainers_defeated
		M.bill_bosses_defeated = save_data.bill_bosses_defeated
		M.stones = save_data.stones
		M.pokemon = save_data.pokemon
		M.runes = save_data.runes
	end

end


return M