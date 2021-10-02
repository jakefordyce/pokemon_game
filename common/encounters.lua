local game_state = require "common/game_state"
local pbs = require "common/poke_base_stats"
local moves = require "common/moves"

local M = {}
trainers = {}

trainers[0] = {}
trainers[0].name = "Rival"
trainers[0].mon1 = {
	pokedex = 1,
	rarity = 1,
	level = 5,
	build_style = 0
}

local function generate_stats(mon)
	mon.name = pbs[mon.pokedex].name
	mon.hp = 1--  pbs.stat_by_level(mon.pokedex, "hp", mon.level)
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
	game_state.enemy_mon1 = trainers[trainer_index].mon1
	generate_stats(game_state.enemy_mon1)
	select_moves(game_state.enemy_mon1)
end

return M