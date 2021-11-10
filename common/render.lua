local M = {}

M.original_width = 0
M.original_height = 0
M.current_width = 0
M.current_height = 0

function M.click_x(xpos)
	if(M.current_width / M.current_height > M.original_width / M.original_height)then
		ratio = (M.current_width / M.original_width)
		original_halfway = M.original_width / 2
		current_halfway = M.current_width / 2
		click_adjusted = xpos * ratio
		click_from_current_halfway = (current_halfway - click_adjusted) / ( M.current_height / M.original_height )
		return original_halfway - click_from_current_halfway
		
	else
		return xpos
	end
end

function M.click_y(ypos)
	if(M.current_width / M.current_height < M.original_width / M.original_height)then
		ratio = M.current_height / M.original_height
		original_halfway = M.original_height / 2
		current_halfway = M.current_height / 2
		click_adjusted = ypos * ratio
		click_from_current_halfway = (current_halfway - click_adjusted) / ( M.current_width / M.original_width )
		return original_halfway - click_from_current_halfway
	else
		return ypos
	end
end




return M