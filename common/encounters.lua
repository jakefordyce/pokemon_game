local game_state = require "common/game_state"
local pbs = require "common/poke_base_stats"

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
	mon.hp = pbs.stat_by_level(mon.pokedex, "hp", mon.level)
	mon.attack = pbs.stat_by_level(mon.pokedex, "attack", mon.level)
	mon.defense = pbs.stat_by_level(mon.pokedex, "defense", mon.level)
	mon.spattack = pbs.stat_by_level(mon.pokedex, "spattack", mon.level)
	mon.spdefense = pbs.stat_by_level(mon.pokedex, "spdefense", mon.level)
	mon.acc = 0
	mon.res = 0
	mon.crit_chance = pbs.base_crit_chance
	mon.crit_damage = pbs.base_crit_damage
end

function M.load_trainer_data(trainer_index)
	game_state.enemy_mon1 = trainers[trainer_index].mon1
	generate_stats(game_state.enemy_mon1)
end

return M