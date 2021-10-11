
module sideRoundedCube(inner_width, inner_depth, inner_height, corner_radius)
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

module allRoundedCube(inner_width, inner_depth, inner_height, corner_radius)
{
    minkowski()
    {
        cube(
            [
                inner_width - corner_radius * 2,
                inner_depth - corner_radius * 2,
                inner_height - corner_radius * 2
            ],
            center = true);
        sphere(r = corner_radius);
    }
}

module roundedCylinder(r, h, corner_radius)
{
    minkowski()
    {
        difference()
        {
            cylinder(r = r-corner_radius, h = h-corner_radius*2, center=true);
            translate([-r+6.5, 0, 0]) cube([10, r*4, h], center=true);
        }
        sphere(r = corner_radius);
    }
}
