// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_engine_move(){
	switch engine {
		case "Builtin-Random": 
		//get random move
		var legal_moves = get_legal_moves("BLACK")//returns array
		var chosen_move = legal_moves[irandom(array_length(legal_moves) - 1)]
		
		//unpack chosen piece from this and perform move
		var chosen_start_square = string_copy(chosen_move, 1, 2)
		var chosen_end_square = string_copy(chosen_move, 4, 2)
		
		var x_start_coord = coord_to_pos(string_copy(chosen_start_square, 1, 1))
		var y_start_coord = coord_to_pos(string_copy(chosen_start_square, 2, 1))
		var x_end_coord = coord_to_pos(string_copy(chosen_end_square, 1, 1))
		var y_end_coord = coord_to_pos(string_copy(chosen_end_square, 2, 1))
		var enemy_check = get_piece(x_end_coord, y_end_coord)
		if enemy_check != -1 destroy_piece(enemy_check)
		move_piece(get_piece(x_start_coord, y_start_coord), x_end_coord, y_end_coord, true)
	}
}