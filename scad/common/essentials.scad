
module roundedCube(inner_width, inner_depth, inner_height, corner_radius)
{
    minkowski()
    {
        cube(
            [
                inner_width - corner_radius * 2,
                inner_depth - corner_radius * 2,
                inner_height - 0.01
            ],
            center = true);
        cylinder(r = corner_radius, h = 0.01);
    }
}
