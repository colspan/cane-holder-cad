
module roundedCube(inner_width, inner_depth, inner_height, corner_radius)
{
    minkowski()
    {
        cube(
            [
                inner_width - corner_radius * 2,
                inner_depth - corner_radius * 2,
                inner_height- corner_radius * 2
            ],
            center = true);
        cylinder(r = corner_radius, h = 1);
    }
}
