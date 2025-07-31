// Kick movement logic
if (is_kicked) {
    if (!kick_moving) {
        target_x = x + kick_dir_x * 16;
        target_y = y + kick_dir_y * 16;

        if (!place_meeting(target_x, target_y, obj_solid) && 
            !place_meeting(target_x, target_y, obj_destructible) && 
            !position_meeting(target_x, target_y, obj_bomb)) {
            kick_moving = true;
        } else {
            // Can't move further, stop kicking
            is_kicked = false;
            kick_dir_x = 0;
            kick_dir_y = 0;
            kick_moving = false;
        }
    }

    if (kick_moving) {
        var spd = move_speed; // use your move_speed variable

        if (abs(x - target_x) > 0) x += sign(target_x - x) * spd;
        if (abs(y - target_y) > 0) y += sign(target_y - y) * spd;

        if (x == target_x && y == target_y) {
            kick_moving = false;
			if (explode_on_stop) {
			    scr_create_explosion(x, y);
			    if (owner != noone) {
			        owner.bomb_active = max(0, owner.bomb_active - 1);
			    }
			    instance_destroy();
			}
        }
    }
}

// Player stepping off bomb logic - now bomb can be kicked
if (placed_by_player) {
    var player = instance_nearest(x, y, obj_player);
    if (player != noone) {
        if (!place_meeting(player.x, player.y, obj_bomb)) {
            can_collide_with_player = true;
            can_be_kicked = true; 
            placed_by_player = false;
        }
    }
}

// Fuse start logic (runs once)
if (!fuse_started) {
    if (owner != noone) {
        if (!owner.has_remote_bomb) {
            alarm[0] = game_get_speed(gamespeed_fps) * 2; // 2 seconds fuse
        }
        fuse_started = true;
    }
}

// Detonate early if hit by explosion
if (place_meeting(x, y, obj_explosion)) {
    if (alarm[0] > 0) {
        alarm[0] = 1; // detonate next frame
    }
}
