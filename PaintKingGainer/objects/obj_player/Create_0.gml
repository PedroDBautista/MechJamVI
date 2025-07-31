// Create Event
tile_size = 16;
move_speed = 1; // pixels per step
move_speed_max = 5;
target_x = x;
target_y = y;
bomb_max = 1;        // Max number of bombs player can place (default)
bomb_active = 0;     // Current number of active bombs placed
bomb_range = 2; // Default range (matching your explosion script)
max_bomb_range = 10; // or however many tiles you want to cap it at
has_remote_bomb = false;
remote_detonate_pressed = false;
has_kick = false;
tar_x = 0;
tar_y = 0;
has_bomb_passer = false;
// Base stats
base_bomb_max = 1;
base_move_speed = 1.5;
base_fire_range = 1;

// Current stats
bomb_max = base_bomb_max;
move_speed = base_move_speed;
fire_range = base_fire_range;

// Power-up flags
has_kick = false;
has_speed_up = false;
has_fire_up = false;
has_bomb_passer = false;
has_remote_bomb = false;
has_heart = false;
hp = 1;
hp_max = 2;
dead = false;
is_dead = false;
respawn_timer = 0;
respawn_x = x;
respawn_y = y;
invincible = false;
last_hit_explosion = noone;
invincible_timer = 0;