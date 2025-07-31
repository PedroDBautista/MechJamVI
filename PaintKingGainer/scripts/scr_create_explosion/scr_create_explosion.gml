function scr_create_explosion( origin_x, origin_y){
	/// @function scr_create_explosion(x, y)
	/// @param {real} x - X position of explosion origin
	/// @param {real} y - Y position of explosion origin

	// Explosion settings
	var range = owner.bomb_range; // Change to your bomb's range
	var tile_size = 16;

	// Create explosion center
	instance_create_layer(origin_x, origin_y, "Instances", obj_explosion);

	// Loop through 4 directions: right, left, down, up
	var dirs = [ [ tile_size, 0 ], [ -tile_size, 0 ], [ 0, tile_size ], [ 0, -tile_size ] ];

	for (var d = 0; d < 4; d++) {
	    var dx = dirs[d][0];
	    var dy = dirs[d][1];

	    for (var i = 1; i <= range; i++) {
	        var check_x = origin_x + (dx * i);
	        var check_y = origin_y + (dy * i);
        
	        if (instance_place(check_x, check_y, obj_solid)) {
	            break; // Stop at solid blocks
	        }

	        var destructible = instance_place(check_x, check_y, obj_destructible);
	        if (destructible != noone) {
	            with (destructible) {
	                instance_destroy(); // Destroy destructible block
	            }
	            instance_create_layer(check_x, check_y, "Instances", obj_explosion);
	            break; // Stop after destroying it
	        }

	        // Place explosion normally
	        instance_create_layer(check_x, check_y, "Instances", obj_explosion);
	    }
	}

}