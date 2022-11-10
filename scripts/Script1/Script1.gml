// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function coord_to_pixel_pos(coord){
	//this might already be deprecated immediately after writing it bc of a change in how I'm considering doing board locations/movement
	//but keeping it around just in case
	//maybe could be useful for some kind of battleship chess
	// takes in either a letter or number representing a column or row and converts it to a board distance
	SQUARE_SIZE = 113
	BORDER_SIZE = 0 //todo take into account borders
	
	//if we have a letter, convert it
	if (string_letters(coord) == coord) {
		converted_coord = ord(row) - ord("A") + 1
	}
	else {
		converted_coord = coord
	}
	
	pos = (SQUARE_SIZE * (converted_coord + 0.5))//need an extra half square to centre the piece
	return pos
	
}

function is_legal_move(start_x, start_y, end_x, end_y, piece, actually_make_move) {
	//can we genericize this to take in a piece attack/move schema and work off that?
	//fairy chess has such a thing to describe pieces
	
	//takes in four coords, and the id of a real piece on the board
	//cause we need to check facing for pawns or other directional pieces
	//and then also takes a boolean for to actually make the move(destroy pieces and such)
	//or if we are just hypothetically considering it
	
	//ensure no friendly piece already on square
	if piece_of_colour_on_square(end_x, end_y, piece.controller) return false
	
	//handle facing more elegantly
	if piece.facing == "Up" or piece.facing == "Left"  facing_sign = -1 
	else if piece.facing == "Down" or piece.facing == "Right" facing_sign = 1
	
	x_diff = end_x - start_x
	y_diff = end_y - start_y
	
	//just pawn checking for now
	if piece.object_index == obj_Pawn {
		
		//no horizontal movement allowed except capture
		
		if abs(x_diff) > 1 return false
		
		
		if abs(x_diff) == 1 {
			
			//if we're moving one to the side and one up and onto an enemy piece, valid capture
			if end_y - start_y == (1 * facing_sign) and piece_of_other_colour_on_square(end_x, end_y,piece.controller) return true
			
			//en passant check
			if end_y - start_y == (1 * facing_sign) and piece_of_other_colour_on_square(end_x, start_y,piece.controller) {
				//handling en passant capture in here for now, not sure if good or bad
				piece_on_square = ds_grid_get(square_grid, end_x, start_y).piece
				//below works cause gml uses short circuit evaluation
				//check that the piece on the square has only made one move and it was the last one moved
				//note: should never be -1 unless something goes wrong w/ piece_of_other_colour_on_square before
				if piece_on_square != -1 and piece_on_square.moves == 1 and piece_on_square.last_moved == true {
					if (actually_make_move) {
						destroy_piece(ds_grid_get(square_grid, end_x, start_y).piece)
					}
					return true
				}
			}
			
			//these are the only two scenarios where moving sideways is valid so return false otherwise
			return false
			
		}
		
		//check for if double move allowed
		if piece.moves == 0 {
			if y_diff == (2 * facing_sign) and !piece_of_other_colour_on_square(end_x, end_y, piece.controller) return true
		}
		
		//then check single move
		if y_diff == (1 * facing_sign) and !piece_of_other_colour_on_square(end_x, end_y, piece.controller) return true
		
	} else {
		
		show_debug_message("Unrecognized piece type for is_legal_move!")
		return false
		
	}
}

function piece_of_colour_on_square(square_x, square_y, colour) {
	
	//checks grid to see if a piece of said colour is on the square
	square_piece = ds_grid_get(square_grid, square_x, square_y).piece
	if square_piece == -1 return false
	if square_piece.controller == colour return true else return false
	
}

function piece_of_other_colour_on_square(square_x, square_y, colour) {
	
	//checks grid to see if a piece of another colour is on the square
	square_piece = ds_grid_get(square_grid, square_x, square_y).piece
	if square_piece == -1 return false
	if square_piece.controller != colour return true else return false
	
}

function destroy_piece(piece_to_destroy) {
	//need to genericize piece lists, the ifs here are temp til I do that
	//will be an issue once games with 3+ sides exist
	
	with piece_to_destroy.square piece = -1
	show_debug_message("Destroying piece " + string(piece_to_destroy))
	if piece_to_destroy.controller == "White" {
		ds_list_delete(white_piece_list, ds_list_find_index(white_piece_list, piece_to_destroy))
	}
	else if piece_to_destroy.controller == "Black" {
		ds_list_delete(black_piece_list, ds_list_find_index(black_piece_list, piece_to_destroy))
	}
	instance_destroy(piece_to_destroy)
}