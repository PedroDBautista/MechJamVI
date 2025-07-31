//Input Handling
if (x == target_x && y == target_y) {
    var future_x, future_y;
    var bomb;

    if (keyboard_check(vk_right)) {
        future_x = x + tile_size;
        future_y = y;
        bomb = instance_place(future_x, future_y, obj_bomb);

        if (!place_meeting(future_x, future_y, obj_solid)&& !place_meeting(future_x, future_y, obj_destructible) && (!bomb || has_bomb_passer || !bomb.can_collide_with_player)) {
            target_x = future_x;
        }
    }
    else if (keyboard_check(vk_left)) {
        future_x = x - tile_size;
        future_y = y;
        bomb = instance_place(future_x, future_y, obj_bomb);

        if (!place_meeting(future_x, future_y, obj_solid)&& !place_meeting(future_x, future_y, obj_destructible) && (!bomb || has_bomb_passer || !bomb.can_collide_with_player)) {
            target_x = future_x;
        }
    }
    else if (keyboard_check(vk_up)) {
        future_x = x;
        future_y = y - tile_size;
        bomb = instance_place(future_x, future_y, obj_bomb);

        if (!place_meeting(future_x, future_y, obj_solid)&& !place_meeting(future_x, future_y, obj_destructible) && (!bomb || has_bomb_passer || !bomb.can_collide_with_player)) {
            target_y = future_y;
        }
    }
    else if (keyboard_check(vk_down)) {
        future_x = x;
        future_y = y + tile_size;
        bomb = instance_place(future_x, future_y, obj_bomb);

        if (!place_meeting(future_x, future_y, obj_solid)&& !place_meeting(future_x, future_y, obj_destructible) && (!bomb || has_bomb_passer || !bomb.can_collide_with_player)) {
            target_y = future_y;
        }
    }
}

if (keyboard_check_pressed(ord("Z"))) {
	tile_size = 16;
    var bomb_x = floor(x / tile_size) * tile_size;
    var bomb_y = floor(y / tile_size) * tile_size;

    // Only place bomb if under limit AND no bomb exists at that tile
    if (bomb_active < bomb_max && !instance_position(bomb_x + tile_size / 2, bomb_y + tile_size / 2, obj_bomb)) {
        var bomb = instance_create_layer(bomb_x, bomb_y, "Instances", obj_bomb);
        bomb.owner = id; // Link the bomb to the player
        bomb.placed_by_player = true; // Optional: for tracking movement blocking
        
        bomb_active += 1;
    }
}

/*
if (has_remote_bomb && keyboard_check_pressed(ord("X"))) {
    remote_detonate_pressed = true;
}
*/

if (has_kick) {
    var dir_x = 0;
    var dir_y = 0;

    if (keyboard_check(vk_right)) dir_x = 1;
    else if (keyboard_check(vk_left)) dir_x = -1;
    else if (keyboard_check(vk_down)) dir_y = 1;
    else if (keyboard_check(vk_up)) dir_y = -1;

    // Only one direction at a time
    if ((dir_x != 0) != (dir_y != 0)) { // this ensures only one axis is pressed
        // Align player position to the 16x16 grid
        var px = floor(x / 16) * 16;
        var py = floor(y / 16) * 16;

        // Get target tile in input direction
        tar_x = px + dir_x * 16;
        tar_y = py + dir_y * 16;

        // Look for a bomb at that exact tile position
        var bomb = instance_position(tar_x + 8, tar_y + 8, obj_bomb); // center of the tile

        if (bomb != noone && bomb.can_be_kicked && !bomb.is_kicked) {
            // Check next tile in the same direction for free space
            var next_x = bomb.x + dir_x * 16;
            var next_y = bomb.y + dir_y * 16;

            if (!place_meeting(next_x, next_y, obj_solid) && !position_meeting(next_x, next_y, obj_bomb)) {
                bomb.is_kicked = true;
                bomb.kick_dir_x = dir_x;
                bomb.kick_dir_y = dir_y;
            }
        }
    }
}



// Check for explosion
var hit = instance_place(x, y, obj_explosion);
if (hit != noone) {
    if (last_hit_explosion != hit) {
        // Take damage
        hp -= 1;
        last_hit_explosion = hit;

        // Optional: start invincibility or blinking here
        invincible_timer = 30; // ~0.5 seconds of blinking
    }
} else {
    // Reset if no explosion is overlapping
    last_hit_explosion = noone;
}


if (hp <= 0 && !dead) {
    dead = true;
    visible = false;
    scr_reset_powerups(id);
    alarm[0] = game_get_speed(gamespeed_fps) * 2; // 2 second delay before respawn
}


// Move smoothly to target
if (x < target_x) x = min(x + move_speed, target_x);
if (x > target_x) x = max(x - move_speed, target_x);
if (y < target_y) y = min(y + move_speed, target_y);
if (y > target_y) y = max(y - move_speed, target_y);

