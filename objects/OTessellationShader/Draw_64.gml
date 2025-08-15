draw_set_font(-1);
draw_set_color(c_white);

var vertex_count = vertex_get_number(model);
var triangle_count = vertex_count / 3;
var is_clean_triangles = (vertex_count % 3 == 0);

var info_text = "Duck Model Info:\n";
info_text += $"Vertices: {vertex_count}\n";
info_text += $"Triangles: {triangle_count}\n";
info_text += $"Clean tri mesh: {is_clean_triangles ? "YES" : "NO"}\n";
if (!is_clean_triangles) {
    info_text += $"WARNING: Mixed geometry!\n";
}
info_text += $"Wireframe: {wireframe_mode ? "ON" : "OFF"} (F2)\n\n";

info_text += "Tessellation:\n";
info_text += $"Level: x{tess_factor} (Left/Right)\n\n";

info_text += "Controls:\n";
info_text += "WASD - Move camera\n";
info_text += "Mouse - Look around\n";
info_text += "E/Q - Up/Down\n";
info_text += "Shift - Move faster\n";
info_text += "F2 - Toggle wireframe\n";
info_text += "Left/Right - Tessellation level\n";
info_text += "ESC - Exit";

draw_text(10, 120, info_text);