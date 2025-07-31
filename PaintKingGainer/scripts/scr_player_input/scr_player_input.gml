function scr_player_input(player_id){
	/// @function scr_player_input(player_id)
	/// @param {real} player_id - 1 for Player 1, 2 for Player 2

	var inputs = {
	    left: false,
	    right: false,
	    up: false,
	    down: false,
	    bomb: false,
	    denotate: false
	};

	// Player 1 Controls (WASD + Z kick)
	if (player_id == 1) {
	    inputs.left = keyboard_check(ord("A"));
	    inputs.right = keyboard_check(ord("D"));
	    inputs.up = keyboard_check(ord("W"));
	    inputs.down = keyboard_check(ord("S"));
	    inputs.bomb = keyboard_check_pressed(ord("K"));
		inputs.bomb = keyboard_check_pressed(ord("K"));
	}
	// Player 2 Controls (Arrow keys + M kick)
	else if (player_id == 2) {
	    inputs.left = keyboard_check(vk_left);
	    inputs.right = keyboard_check(vk_right);
	    inputs.up = keyboard_check(vk_up);
	    inputs.down = keyboard_check(vk_down);
	    inputs.bomb = keyboard_check_pressed(ord("M"));
	}

	return inputs;

}