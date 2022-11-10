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