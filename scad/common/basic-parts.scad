include <essentials.scad>

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

module cubicPipeMounter(inner_width,
                        inner_depth,
                        inner_height,
                        split_width,
                        corner_radius,
                        outer_radius,
                        hole_pos_y,
                        hole_pos_z,
                        hole_inner_radius,
                        hole_outer_radius)
{
    union_width = inner_width + split_width;
    difference()
    {
        hull() minkowski()
        {
            union()
            {
                roundedCube(
                    union_width, inner_depth, inner_height, outer_radius);
                for (s_y_f = [ -1, 1 ]) {
                    // Screw mounter block
                    s_y_pos = s_y_f * inner_depth / 2;
                    translate([ 0, s_y_pos, 0 ]) cube(
                        [
                            union_width * 0.6,
                            5.2 + hole_pos_y,
                            inner_height - outer_radius * 2
                        ],
                        center = true);
                }
            }
            sphere(r = outer_radius);
        }
        // Pipe hole
        roundedCube(union_width,
                    inner_depth,
                    inner_height + outer_radius*2,
                    corner_radius);
        // Screw holes
        for (h_pos_z = [ -hole_pos_z, hole_pos_z ]) {
            for (h_pos_f = [ 1, -1 ]) {
                h_pos_y = h_pos_f * (inner_depth / 2 + hole_pos_y);
                translate([ 0, h_pos_y, h_pos_z ]) rotate([ 0, 90, 0 ])
                    cylinder(r = hole_inner_radius,
                             h = union_width * 0.6,
                             center = true);
                translate([ union_width / 2, h_pos_y, h_pos_z ])
                    rotate([ 0, 90, 0 ]) cylinder(r = hole_outer_radius,
                                                  h = union_width * 0.5,
                                                  center = true);
            }
        }
        // Splitter for print
        cube([ split_width, inner_depth * 3, inner_height * 2 ], center = true);
    }
}

module cylinderPipeMounter(inner_radius,
                           inner_height,
                           split_width,
                           outer_radius,
                           hole_pos_y,
                           hole_pos_z,
                           hole_inner_radius,
                           hole_outer_radius)
{
    union_width = inner_radius * 2 + split_width;
    difference()
    {
        minkowski()
        {
            union()
            {
                cylinder(r = inner_radius, h = inner_height, center = true);
                hull() {
                    for (s_y_f = [ -1, 1 ]) {
                        // Screw mounter block
                        s_y_pos = s_y_f * inner_radius;
                        translate([ 0, s_y_pos, 0 ]) cube(
                            [ union_width * 0.6, 5.2 + hole_pos_y, inner_height ],
                            center = true);
                    }
                    translate([ -inner_radius / 2, 0, 0 ])
                        cube([ inner_radius, inner_radius * 2, inner_height ],
                            center = true);
                }
            }
            sphere(r = outer_radius);
        }
        // Pipe hole
        cylinder(r = inner_radius,
                 h = inner_height + 2 * outer_radius,
                 center = true);

        // Screw holes
        for (h_pos_z = [ -hole_pos_z, hole_pos_z ]) {
            for (h_pos_f = [ 1, -1 ]) {
                h_pos_y = h_pos_f * (inner_radius + hole_pos_y);
                translate([ 0, h_pos_y, h_pos_z ]) rotate([ 0, 90, 0 ])
                    cylinder(r = hole_inner_radius,
                             h = union_width * 0.6,
                             center = true);
                translate([ union_width / 2, h_pos_y, h_pos_z ])
                    rotate([ 0, 90, 0 ]) cylinder(r = hole_outer_radius,
                                                  h = union_width * 0.5,
                                                  center = true);
            }
        }
        // Splitter for print
        cube([ split_width, inner_radius * 5, inner_height * 2 ],
             center = true);
    }
}

module caneGrabber(joint_width,
                   joint_depth,
                   joint_height,
                   cane_radius,
                   cane_holder_thin)
{
    // Cane joint to mounter
    translate([ joint_width / 2, 0, 0 ])
        roundedCube(joint_width, joint_depth, joint_height, 4);
    // Cane grabber
    difference()
    {
        translate([ -cane_radius, 0, 0 ]) rotate_extrude(center = true)
            translate([ cane_radius + cane_holder_thin / 2, 0, 0 ]) square(
                size = [ cane_holder_thin, joint_height ], center = true);
        translate([ -cane_radius - 10, 0, 0 ])
            cube([ 20, 20, joint_height ], center = true);
    }
}



