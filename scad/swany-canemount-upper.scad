$fn = 100;

module myowareBaseShape(inner_width, inner_depth, inner_height, corner_radius)
{
    minkowski()
    {
        cube(
            [
                inner_width - corner_radius * 2,
                inner_height - corner_radius * 2,
                inner_depth
            ],
            center = true);
        cylinder(r = corner_radius, h = 1);
    }
}

// mounter
inner_width = 17;
inner_height = 14;
inner_depth = 14;
split_width = 1;
corner_radius = 2;
outer_radius = 3;
union_width = inner_width + split_width;
difference()
{
    minkowski()
    {
        union()
        {
            myowareBaseShape(
                union_width, inner_depth, inner_height, corner_radius);
            translate([ 0, inner_depth / 2, 0 ])
                cube([ union_width * 0.6, 5, outer_radius + 1 ], center = true);
            translate([ 0, -inner_depth / 2, 0 ])
                cube([ union_width * 0.6, 5, outer_radius + 1 ], center = true);
        }
        sphere(r = outer_radius);
    }
    myowareBaseShape(union_width,
                     inner_depth + 2 * outer_radius,
                     inner_height,
                     corner_radius);
    // hole 1
    translate([ 0, inner_depth / 2 + outer_radius, 0 ]) rotate([ 0, 90, 0 ])
        cylinder(r = 0.75, h = union_width * 0.6 - 1, center = true);
    translate([ union_width / 2, inner_depth / 2 + outer_radius, 0 ])
        rotate([ 0, 90, 0 ])
            cylinder(r = 2, h = union_width * 0.6, center = true);
    // hole 2
    translate([ 0, -inner_depth / 2 - outer_radius, 0 ]) rotate([ 0, 90, 0 ])
        cylinder(r = 0.75, h = union_width * 0.6 - 1, center = true);
    translate([ union_width / 2, -inner_depth / 2 - outer_radius, 0 ])
        rotate([ 0, 90, 0 ])
            cylinder(r = 2, h = union_width * 0.6, center = true);
    cube([ split_width, inner_depth * 2, inner_height * 2 ], center = true);
}

joint_length = 28;
joint_width = 12;
joint_height = inner_depth;
cane_radius = 22 / 2 + 0.5;
cane_holder_thin = 3;

translate([ 0, 0, -outer_radius ])
{
    // cane joint
    translate([ -joint_length / 2 - union_width / 2 + outer_radius, 0, 0 ])
        cube([ joint_length - inner_width / 2, joint_width, joint_height ],
             center = true);
    // cane mounter
    difference()
    {
        translate([ -joint_length - cane_radius - cane_holder_thin / 2, 0, 0 ])
            rotate_extrude(center = true)
                translate([ cane_radius + cane_holder_thin / 2, 0, 0 ]) square(
                    size = [ cane_holder_thin, joint_height ], center = true);
        translate(
            [ -joint_length - cane_radius - cane_holder_thin / 2 - 10, 0, 0 ])
            cube([ 20, 20, joint_height ], center = true);
    }
}
