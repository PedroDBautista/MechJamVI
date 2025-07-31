function scr_reset_powerups(id)
{
	p = argument0;

	// Reset all power-ups except bomb upgrades
	p.has_kick = false;
	p.has_speed_up = false;
	p.has_fire_up = false;
	p.has_bomb_passer = false;
	p.has_remote_bomb = false;
	p.has_heart = false;
	p.hp_max = 1;

	// Reset speed or fire values to base values if you use them
	p.move_speed = p.base_move_speed;
	p.fire_range = p.base_fire_range;

	// Reset bomb max to base bomb amount
	p.bomb_max = p.base_bomb_max;

	// If player used extra bombs, keep current active bomb count in check
	p.bomb_active = min(p.bomb_active, p.bomb_max);

}