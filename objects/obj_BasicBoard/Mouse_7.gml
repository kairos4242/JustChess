/// @description Insert description here
// You can write your code in this editor

if selected != -1 {
	//find active square
	square_move_to = instance_position(mouse_x, mouse_y, obj_Square)
	square_move_from = instance_position(selected.x, selected.y, obj_Square)
	with square_move_from piece = -1
	with square_move_to piece = other.selected
	with selected {
		x = other.square_move_to.x 
		y = other.square_move_to.y
		selected = false
	}
	selected = -1
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