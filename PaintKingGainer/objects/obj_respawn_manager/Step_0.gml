// If no player exists, and dead_player isn't set yet
if (!instance_exists(obj_player) && dead_player != noone) {
    if (instance_exists(dead_player)) {
        var index = dead_player.spawn_index;
        var pos = spawn_points[index];

        var new_player = instance_create_layer(pos[0], pos[1], "Instances", obj_player);
        new_player.spawn_index = index;

        dead_player = noone; // clear it
    }
}
