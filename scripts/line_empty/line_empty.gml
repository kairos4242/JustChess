// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function line_empty(x1, y1, x2, y2){
	//checks for collisions with a piece on a line
	x_diff = x2 - x1
	y_diff = y2 - y1
	
	//three cases, row file or diagonal
	if x1 == x2 {
		//we have a column
		current_y = y1 + sign(y_diff)//because we want to ignore the square we're currently on
		while current_y != y2 {
			current_square = ds_grid_get(square_grid, x1, current_y)//x1 or x2 doesn't matter since they're same
			if current_square.piece != -1 return false
			current_y += sign(y_diff)
		}
		return true
		
	}
	else if y1 == y2 {
		//we have a row
		current_x = x1 + sign(x_diff)//because we want to ignore the square we're currently on
		while current_x != x2 {
			current_square = ds_grid_get(square_grid, current_x, y1)//y1 or y2 doesn't matter since they're same
			if current_square.piece != -1 return false
			current_x += sign(x_diff)
		}
		return true
	}
	else if (x_diff == y_diff) {
		//we have a diagonal
		current_x = x1 + sign(x_diff)//because we want to ignore the square we're currently on
		current_y = y1 + sign(y_diff)//because we want to ignore the square we're currently on
		while current_x != x2 {
			current_square = ds_grid_get(square_grid, current_x, current_y)
			if current_square.piece != -1 return false
			current_x += sign(x_diff)
			current_y += sign(y_diff)
		}
		return true
	}
	else {
		show_debug_message("Invalid arguments for line_empty")
	}
}