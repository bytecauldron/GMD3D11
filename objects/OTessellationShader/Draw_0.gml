camera_apply(camera);

matrix_set(matrix_world, matrix_build(0, 0, 0, 0, 0, duck_rotation, 1, 1, 1));

d3d11_shader_override_vs(vs);
d3d11_shader_override_ps(ps);

if (wireframe_mode)
{
	vertex_submit(model, pr_linelist, sprite_get_texture(SprRubberDuck, 0));
}
else
{
	vertex_submit(model, pr_trianglelist, sprite_get_texture(SprRubberDuck, 0));
}

d3d11_shader_override_vs(-1);
d3d11_shader_override_ps(-1);

matrix_set(matrix_world, matrix_build_identity());