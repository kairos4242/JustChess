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
		break;
		case "Fairy-Stockfish":
		//get current pos and send to stockfish
		file_text_enable_stddesc(true)
		var position_string = pos_to_fen(square_grid)
		//NOTE: this fails right now, I think it's because of missing file system permissions
		//check the example in xProcess, that one works by getting file permissions via
		//get_open_filename_ext
		var fairy_stockfish = execute_program("C:\Users\Riley Ward\Documents\GameMakerStudio2\JustChess\datafiles\fairy-stockfish-largeboard_x86-64-modern.exe", "TEST GARBAGE", 1000)
		fd = file_text_open_read_stdout(fairy_stockfish);
		output = file_text_read_string_stdout(fd);
		widget_set_caption("Standard output:"); show_message(output);
		file_text_close_stdout(fd);
		if (CompletionStatusFromExecutedProcess(fairy_stockfish) && string_length(output)) {
			//this is where the output line and the show_message line should be
		}
	}
}