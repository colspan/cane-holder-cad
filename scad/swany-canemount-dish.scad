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
inner_width = 21.5;
inner_height = 19;
inner_depth = 14;
split_width = 1;
corner_radius = 3.5;
outer_radius = 3;
union_width = inner_width + split_width;
hole_pos = 5.2;
difference()
{
    minkowski()
    {
        union()
        {
            myowareBaseShape(
                union_width, inner_depth, inner_height, corner_radius);
            // screw mounter 1
            translate([ 0, inner_depth / 2, 0 ]) cube(
                [ union_width * 0.6, 10, inner_height - corner_radius * 2 ],
                center = true);
            // screw mounter 2
            translate([ 0, -inner_depth / 2, 0 ]) cube(
                [ union_width * 0.6, 10, inner_height - corner_radius * 2 ],
                center = true);
        }
        sphere(r = outer_radius);
    }
    myowareBaseShape(union_width,
                     inner_depth + 2 * outer_radius,
                     inner_height,
                     corner_radius);
    // hole 1
    translate([ 0, inner_depth / 2 + hole_pos, 4 ]) rotate([ 0, 90, 0 ])
        cylinder(r = 0.75, h = union_width * 0.6 - 1, center = true);
    translate([ union_width / 2 - 3, inner_depth / 2 + hole_pos, 4 ])
        rotate([ 0, 90, 0 ])
            cylinder(r = 2, h = union_width * 0.6, center = true);
    // hole 2
    translate([ 0, -inner_depth / 2 - hole_pos, 4 ]) rotate([ 0, 90, 0 ])
        cylinder(r = 0.75, h = union_width * 0.6 - 1, center = true);
    translate([ union_width / 2 - 3, -inner_depth / 2 - hole_pos, 4 ])
        rotate([ 0, 90, 0 ])
            cylinder(r = 2, h = union_width * 0.6, center = true);
    // hole 3
    translate([ 0, inner_depth / 2 + hole_pos, -4 ]) rotate([ 0, 90, 0 ])
        cylinder(r = 0.75, h = union_width * 0.6 - 1, center = true);
    translate([ union_width / 2 - 3, inner_depth / 2 + hole_pos, -4 ])
        rotate([ 0, 90, 0 ])
            cylinder(r = 2, h = union_width * 0.6, center = true);
    // hole 4
    translate([ 0, -inner_depth / 2 - hole_pos, -4 ]) rotate([ 0, 90, 0 ])
        cylinder(r = 0.75, h = union_width * 0.6 - 1, center = true);
    translate([ union_width / 2 - 3, -inner_depth / 2 - hole_pos, -4 ])
        rotate([ 0, 90, 0 ])
            cylinder(r = 2, h = union_width * 0.6, center = true);
    // split
    cube([ split_width, inner_depth * 3, inner_height * 2 ], center = true);
}

// dish
dish_height = inner_depth;
dish_radius = 30;
dish_center = dish_radius + union_width / 2 + outer_radius;
translate([ -dish_center, 0, -outer_radius ])
{
    rotate_extrude(angle = 360, center = true) translate([ dish_radius, 0, 0 ])
        square(size = [ 3, dish_height ], center = true);
    difference()
    {
        translate([ 0, 0, -dish_height / 2 ]) cylinder(r = dish_radius, h = 2);
        union()
        {
            rotate_extrude(center = true)
                translate([ dish_radius / 3 * 2, 0, 0 ])
                    square(size = [ 3, dish_height ], center = true);
            rotate_extrude(center = true) translate([ dish_radius / 3, 0, 0 ])
                square(size = [ 3, dish_height ], center = true);
        };
    };
    rotate([ 0, 0, -30 ])
        translate([ 0, dish_radius / 2, -dish_height / 2 + 1 ])
            cube([ 4, dish_radius, 2 ], center = true);
    rotate([ 0, 0, -30 + 120 ])
        translate([ 0, dish_radius / 2, -dish_height / 2 + 1 ])
            cube([ 4, dish_radius, 2 ], center = true);
    rotate([ 0, 0, -30 + 240 ])
        translate([ 0, dish_radius / 2, -dish_height / 2 + 1 ])
            cube([ 4, dish_radius, 2 ], center = true);
}