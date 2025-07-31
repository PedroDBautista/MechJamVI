// Increase bomb limit
if (other.bomb_max < 10) {
    other.bomb_max += 1;
}

// Optional feedback
//audio_play_sound(snd_powerup, 1, false);
instance_destroy();
