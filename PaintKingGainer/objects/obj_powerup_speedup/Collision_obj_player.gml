// Increase player's move speed up to a reasonable cap
if (other.move_speed < other.move_speed_max) {
    other.move_speed += 1;
}

instance_destroy();