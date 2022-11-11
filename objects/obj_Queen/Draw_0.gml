/// @description Insert description here
// You can write your code in this editor

switch controller {
	case "White": draw_sprite(w_queen_1x, 0, x, y)
	break;
	case "Black": draw_sprite(b_queen_1x, 0, x, y)
	break;
	default: break;
}

if (selected) draw_circle(x, y, 20, true)