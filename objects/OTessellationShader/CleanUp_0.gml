if (d3d11_shader_exists(ps))
{
	d3d11_shader_destroy(ps);
}

if (d3d11_shader_exists(vs))
{
	d3d11_shader_destroy(vs);
}

camera_destroy(camera);
gpu_pop_state();
draw_set_lighting(false);