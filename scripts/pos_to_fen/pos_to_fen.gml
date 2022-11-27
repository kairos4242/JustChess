// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pos_to_fen(board, player_to_move = "b", num_moves = 0){
	//takes a gamestate we have and spits out a FEN string for use with compatible chess programs
	//e.g. fairy-stockfish
	//board should be a ds_grid of squares
	var board_string = ""
	var row_empty_count = 0
	
	//piece notation
	for (var i=0;i<ds_grid_width(board);i++) {
		row_empty_count = 0
		for (var j=0;j<ds_grid_height(board);j++) {
			var curr_square = ds_grid_get(board, j, i)
			var curr_piece = curr_square.piece
			if curr_piece == -1 row_empty_count++
			else {
				//if we have empty squares and now we have a piece, add the empty squares
				if row_empty_count != 0 {
					board_string += string(row_empty_count)
					row_empty_count = 0
				}
				if curr_piece.controller == "White" board_string += string_upper(curr_piece.fen_value)
				if curr_piece.controller == "Black" board_string += string_lower(curr_piece.fen_value)
			}
		}
		if row_empty_count != 0 {
			board_string += string(row_empty_count)
			row_empty_count = 0
		}
		if i != ds_grid_width(board) - 1 board_string += "/"
	}
	
	//add whose move it is
	board_string += " " + player_to_move
	
	//fake the rest of it for now lol
	board_string += " KQkq - 0 " + string(num_moves)
	
	return board_string
}