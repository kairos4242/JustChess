/// @description Insert description here
// You can write your code in this editor

if selected != -1 {
	
	//find squares to move from and to
	square_move_to = instance_position(mouse_x, mouse_y, obj_Square)
	square_move_from = instance_position(selected.x, selected.y, obj_Square)
	
	//check legality of move
	if is_legal_move(square_move_from.x_pos, square_move_from.y_pos, square_move_to.x_pos, square_move_to.y_pos, selected, true) {
		
		//update last moved
		if last_moved != -1 with last_moved last_moved = false
		last_moved = square_move_from.piece
		with square_move_from.piece last_moved = true
		
		//check if there is an piece already on square, and if so destroy it
		//should this check for an opponents piece instead of just a piece? Is there a scenario where a piece could legally destroy its own allies?
		//seems unnecessary to validate it two places either way
		if square_move_to.piece != -1
		{
			destroy_piece(square_move_to.piece)
		}
		
		//move piece
		with square_move_from piece = -1
		with square_move_to piece = other.selected
		with selected {
			x = other.square_move_to.x 
			y = other.square_move_to.y
			selected = false
			moves++
			square = other.square_move_to
		}
		selected = -1
	} else {
		with selected selected = false
		selected = -1
	}
	
} else {
	
	//deselect the currently selected piece and select this piece instead
	/*if board.selected != -1 {
		with board.selected selected = false
	
	}*/
	selected = instance_position(mouse_x, mouse_y, obj_Piece)
	if selected != noone {
		with selected {
			selected = true
		}
	}
	else selected = -1
}