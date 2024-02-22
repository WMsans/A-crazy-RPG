/// @description 
window_set_cursor(cr_none);
window_mouse_set_locked(true);
x = -999;
y = -999;

#region player
ori_flag = true;

ori_accel = 1;
ori_decel = -1.2;
ori_max_sp = 6;
#endregion

#region cursor
depth = layers.cursor;
cursor_showing = true;
cursor_x = -999;
cursor_y = -999;

cursor_tarscale = 1;
cursor_scale = 1;

#endregion