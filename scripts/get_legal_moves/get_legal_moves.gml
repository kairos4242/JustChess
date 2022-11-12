// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_legal_moves(player){
	var legal_moves = []
	
	if player == "WHITE" var player_pieces = white_piece_list
	if player == "BLACK" var player_pieces = black_piece_list
	for (i = 0; i < ds_list_size(player_pieces); i++)
	{
		var piece_evaluating = ds_list_find_value(player_pieces, i)
		for (j = 0; j < BOARD_SIZE; j++) {
			for (k = 0; k < BOARD_SIZE; k++) {
				//var square_to_check = ds_grid_get(square_grid, j, k)
				if is_legal_move(piece_evaluating.square.x_pos, piece_evaluating.square.y_pos, j, k, piece_evaluating, false) {
					var start_square_repr =  chr(65 + piece_evaluating.square.x_pos) + string(piece_evaluating.square.y_pos)
					var end_square_repr =  chr(65 + j) + string(k) //magic number here is ord("A")
					array_push(legal_moves, start_square_repr + "-" + end_square_repr)
				}
			}
		}
	}
	return legal_moves
}