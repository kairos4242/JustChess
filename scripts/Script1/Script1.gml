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

function is_legal_move(start_x, start_y, end_x, end_y, piece) {
	//takes in two tuples of coords and the id of a real piece on the board
	//cause we need to check facing for pawns or other directional pieces
	
	//just pawn checking for now
	if piece.object_index == obj_Pawn {
		//no horizontal movement allowed
		x_diff = start_x - end_x
		if x_diff != 0 return false
		//check for double move allowed
		if piece.moves == 0 {
			if piece.facing == "Up" {
				if end_y - start_y == -2 return true
			}
			if piece.facing == "Down" {
				if end_y - start_y == 2 return true
			}
		}
		//then check single move
		if piece.facing == "Up" {
			if end_y - start_y == -1 return true
		}
		if piece.facing == "Down" {
			if end_y - start_y == 1 return true
		}
		return false
	}
	else {
		show_debug_message("Unrecognized piece type for is_legal_move!")
		return false
	}
}