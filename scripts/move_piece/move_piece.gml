// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_piece(target_piece, target_x, target_y, moved_by_player){
	//move piece
	//moved by player is a boolean determining whether a player actually moved the piece
	//variables prefixed with func as was interfering with other board variables
	func_square_move_from = target_piece.square
	func_square_move_to = ds_grid_get(square_grid, target_x, target_y)
	
	with func_square_move_from piece = -1
	with func_square_move_to piece = target_piece
	with target_piece {
		x = other.func_square_move_to.x
		y = other.func_square_move_to.y
		selected = false//strictly necessary?
		if moved_by_player moves++
		square = other.func_square_move_to
	}
	
}