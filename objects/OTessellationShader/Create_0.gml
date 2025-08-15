show_debug_overlay(true);

gpu_push_state();
gpu_set_zwriteenable(true);
gpu_set_ztestenable(true);
draw_set_lighting(true);

model = vertex_buffer_load("rubber_duck_toy_1k.bin", vertex_format_pnuc);
vertex_freeze(model);

vs = d3d11_shader_compile_vs(working_directory + "shaders/TessVS.hlsl", "main", "vs_5_0");

if (!d3d11_shader_exists(vs))
{
	assert(false, $"Vertex shader compilation failed! {d3d11_get_error_string()}");
}

ps = d3d11_shader_compile_ps(working_directory + "shaders/TessPS.hlsl", "main", "ps_5_0");

if (!d3d11_shader_exists(ps))
{
	assert(false, $"Pixel shader compilation failed! {d3d11_get_error_string()}");
}

camera = camera_create();
camera_set_proj_mat(camera, matrix_build_projection_perspective_fov(
	-70, -window_get_width() / window_get_height(), 0.1, 10000));

x = 0;
y = 8;
z = 3;
direction = 90;
directionUp = 0;
mouseLastX = window_mouse_get_x();
mouseLastY = window_mouse_get_y();

camera_set_view_mat(camera, matrix_build_lookat(
	x, y, z,
	x + dcos(direction),
	y - dsin(direction),
	z + dtan(directionUp),
	0, 0, 1));

wireframe_mode = false;
duck_rotation = 0;

tess_levels = [1, 2, 4, 8, 16, 32];
tess_level_index = 0;
tess_factor = tess_levels[tess_level_index];