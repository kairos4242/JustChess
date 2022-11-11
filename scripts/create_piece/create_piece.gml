// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_piece(pos_x, pos_y, type_piece, piece_controller, piece_facing){
	current_piece = instance_create_depth(x + coord_to_pixel_pos(pos_x), y + coord_to_pixel_pos(pos_y), 50, type_piece)
	current_square = ds_grid_get(square_grid, pos_x, pos_y)
	with current_piece {
		controller = piece_controller
		board = other
		facing = piece_facing
		square = other.current_square
	}
	//when we have more sides this will need to be more generic
	if piece_controller == "White" ds_list_add(white_piece_list, current_piece)
	if piece_controller == "Black" ds_list_add(black_piece_list, current_piece)
	with current_square {
		piece = other.current_piece
	}
}