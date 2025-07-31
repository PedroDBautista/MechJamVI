hp = hp_max;
x = respawn_x;
y = respawn_y;
dead = false;
visible = true;

// Invincibility buffer
invincible = true;
alarm[1] = game_get_speed(gamespeed_fps) * 2;
