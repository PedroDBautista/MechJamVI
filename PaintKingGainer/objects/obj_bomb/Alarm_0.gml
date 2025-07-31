// Alarm[0] of obj_bomb

if (is_kicked && kick_moving) {
    // Fuse expired but bomb still moving, delay explosion until stop
    explode_on_stop = true;
} else {
    // Bomb is stationary or not kicked - explode immediately
    scr_create_explosion(x, y);
    if (owner != noone) {
        owner.bomb_active = max(0, owner.bomb_active - 1);
    }
    instance_destroy();
}
