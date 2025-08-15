if(keyboard_check_pressed(vk_escape)) game_end();

if(keyboard_check_pressed(vk_f2))
{
	wireframe_mode = !wireframe_mode;
	show_debug_message($"Wireframe mode: {wireframe_mode}");
}

duck_rotation += 1;

// Tessellation controls
if (keyboard_check_pressed(vk_left)) {
	tess_level_index = max(0, tess_level_index - 1);
	tess_factor = tess_levels[tess_level_index];
	show_debug_message($"Tessellation: x{tess_factor}");
}
if (keyboard_check_pressed(vk_right)) {
	tess_level_index = min(array_length(tess_levels) - 1, tess_level_index + 1);
	tess_factor = tess_levels[tess_level_index];
	show_debug_message($"Tessellation: x{tess_factor}");
}

var _mouseX = window_mouse_get_x();
var _mouseY = window_mouse_get_y();

if (mouse_check_button(mb_any))
{
	direction += mouseLastX - _mouseX;
	directionUp += mouseLastY - _mouseY;
	directionUp = clamp(directionUp, -89, 89);
}

mouseLastX = _mouseX;
mouseLastY = _mouseY;

var _forward = keyboard_check(ord("W")) - keyboard_check(ord("S"));
var _right = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _up = keyboard_check(ord("E")) - keyboard_check(ord("Q"));
var _speed = keyboard_check(vk_shift) ? 3 : 1;

x += lengthdir_x(1, direction) * _forward * _speed;
y += lengthdir_y(1, direction) * _forward * _speed;

x += lengthdir_x(1, direction - 90) * _right * _speed;
y += lengthdir_y(1, direction - 90) * _right * _speed;

z += _up * _speed;

camera_set_view_mat(camera, matrix_build_lookat(
	x, y, z,
	x + dcos(direction),
	y - dsin(direction),
	z + dtan(directionUp),
	0, 0, 1));