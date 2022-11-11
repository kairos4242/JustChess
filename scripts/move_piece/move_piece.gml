// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_piece(target_piece, target_x, target_y){
	//move piece
	//varaibles prefixed with func as was interfering with other board variables
	func_square_move_from = target_piece.square
	func_square_move_to = ds_grid_get(square_grid, target_x, target_y)
	
	with func_square_move_from piece = -1
	with func_square_move_to piece = target_piece
	with target_piece {
		x = other.func_square_move_to.x
		y = other.func_square_move_to.y
		selected = false//strictly necessary?
		//also do we want to increment moves here, or have an option to?
		//a piece can move without the player having moved it e.g. rook in castling
		square = other.func_square_move_to
	}
	
}