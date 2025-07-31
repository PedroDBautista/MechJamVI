// Target aspect ratio
aspect_ratio = global.screen_width / global.screen_height;

// Get display dimensions
display_width = display_get_width();
display_height = display_get_height();

// Calculate current window aspect ratio
current_ratio = display_width / display_height;

// Determine the largest scaled size that fits the display
if (current_ratio > aspect_ratio) {
    // Display is wider than target, scale by height
    view_wport[0] = display_height * aspect_ratio;
    view_hport[0] = display_height;
} else {
    // Display is taller than target, scale by width
    view_wport[0] = display_width;
    view_hport[0] = display_width / aspect_ratio;
}

// Set view and camera size
view_wview[0] = global.screen_width;
view_hview[0] = global.screen_height;

// Apply camera and viewport settings
camera_set_view_size(view_camera[0], view_wview[0], view_hview[0]);
camera_set_view_pos(view_camera[0], 0, 0);
view_visible[0] = true;
