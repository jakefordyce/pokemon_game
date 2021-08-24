local game_state = require "common/game_state"

local M = {}
trainers = {}

trainers[0] = {}
trainers[0].name = "Rival"
trainers[0].mon1 = {
	pokedex = 1,
	rarity = 1
}

function M.load_trainer_data(trainer_index)
	print(game_state.enemy_mon1)
	print(trainers)
	print(trainer_index)
	game_state.enemy_mon1 = trainers[trainer_index].mon1
end


return M