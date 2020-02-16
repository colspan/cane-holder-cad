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

module pipeMounter(inner_width,
                   inner_height,
                   inner_depth,
                   split_width,
                   corner_radius,
                   outer_radius,
                   hole_pos_y,
                   hole_pos_z)
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

module caneGrabber(joint_width,
                   joint_depth,
                   joint_height,
                   cane_radius,
                   cane_holder_thin)
{
    // Cane joint to mounter
    translate([ -joint_width / 2 - union_width / 2 + outer_radius, 0, 0 ])
        cube([ joint_width - inner_width / 2, joint_depth, joint_height ],
             center = true);
    // Cane grabber
    difference()
    {
        translate([ -joint_width - cane_radius - cane_holder_thin / 2, 0, 0 ])
            rotate_extrude(center = true)
                translate([ cane_radius + cane_holder_thin / 2, 0, 0 ]) square(
                    size = [ cane_holder_thin, joint_height ], center = true);
        translate(
            [ -joint_width - cane_radius - cane_holder_thin / 2 - 10, 0, 0 ])
            cube([ 20, 20, joint_height ], center = true);
    }
}
// TODO module mounter rectangular// TODO module mounter cylinder

