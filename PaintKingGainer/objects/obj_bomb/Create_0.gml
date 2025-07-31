// obj_bomb: Create Event
can_collide_with_player = false;
fuse_started = false;
is_kicked = false;
kick_dir_x = 0;
kick_dir_y = 0;
move_speed = 1;
kick_moving = false;
target_x = x;
target_y = y;
default_bomb_fuse =3;
can_be_kicked = false;
placed_by_player = true;
explode_on_stop = false;


// owner should already be set externally during instance creation.
// Fallback to noone if not set
if (!variable_instance_exists(id, "owner")) {
    owner = noone;
}

// Only set timer if this is not a remote bomb
if (owner != noone) {
    if (!owner.has_remote_bomb) {
        alarm[0] = game_get_speed(gamespeed_fps) * default_bomb_fuse; // Default 3-second fuse
    }
    // If owner has remote bomb, DO NOT set alarm, bomb waits indefinitely
} else {
    // No valid owner, assume normal timed bomb
    alarm[0] = game_get_speed(gamespeed_fps) * default_bomb_fuse;
}
