if (other.bomb_range < other.max_bomb_range) {
    other.bomb_range += 1;
}
instance_destroy(); // Remove power-up after use
