$fn = 100;

module roundedCube(inner_width, inner_depth, inner_height, corner_radius)
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

module dishWithGroovedHole(dish_height, dish_radius)
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
    offset_angle = -30;
    for (angle = [ 0, 120, 240 ]) {
        rotate([ 0, 0, offset_angle + angle ])
            translate([ 0, dish_radius / 2, -dish_height / 2 + 1 ])
                cube([ 4, dish_radius, 2 ], center = true);
    }
}
// TODO module grabber

// TODO module mounter rectangular
// TODO module mounter cylinder

module mounter(inner_width, inner_height, inner_depth, split_width, corner_radius, outer_radius, hole_pos_y, hole_pos_z)
{
    union_width = inner_width + split_width;
    difference()
    {
        minkowski()
        {
            union()
            {
                roundedCube(
                    union_width, inner_depth, inner_height, corner_radius);
                for (s_y_f = [ -1, 1 ]) {
                    // Screw mounter block
                    s_y_pos = s_y_f * inner_depth / 2;
                    translate([ 0, s_y_pos, 0 ]) cube(
                        [
                            union_width * 0.6,
                            10,
                            inner_height - corner_radius * 2
                        ],
                        center = true);
                }
            }
            sphere(r = outer_radius);
        }
        // Pipe hole
        roundedCube(union_width,
                    inner_depth + 2 * outer_radius,
                    inner_height,
                    corner_radius);
        // Screw holes
        for (h_pos_z = [ -hole_pos_z, hole_pos_z ]) {
            for (h_pos_f = [ 1, -1 ]) {
                h_pos_y = h_pos_f * (inner_depth / 2 + hole_pos_y);
                translate([ 0, h_pos_y, h_pos_z ]) rotate([ 0, 90, 0 ])
                    cylinder(
                        r = 0.75, h = union_width * 0.6 - 1, center = true);
                translate([ union_width / 2 - 3, h_pos_y, h_pos_z ])
                    rotate([ 0, 90, 0 ])
                        cylinder(r = 2, h = union_width * 0.6, center = true);
            }
        }
        // Splitter for print
        cube([ split_width, inner_depth * 3, inner_height * 2 ], center = true);
    }
}

// Mounter
inner_width = 21.5;
inner_height = 19;
inner_depth = 14;
split_width = 1;
corner_radius = 3.5;
outer_radius = 3;
hole_pos_y = 5.2;
hole_pos_z = 4;
mounter(inner_width, inner_height, inner_depth, split_width, corner_radius,
outer_radius, hole_pos_y, hole_pos_z);


// Dish
dish_height = inner_depth;
dish_radius = 30;
dish_center = dish_radius + (inner_width + split_width) / 2 + outer_radius;
translate([ -dish_center, 0, -outer_radius ])
{
    dishWithGroovedHole(dish_height, dish_radius);
}

// test