include <basic-parts.scad>

$fn = 70;

// Mounter
inner_radius = 13.5;
inner_height = 15;
split_width = 0.3;
outer_radius = 3;
hole_pos_y = 4.5;
hole_pos_z = 6;
hole_inner_radius = 1.25;
hole_outer_radius = 2.25;
translate([ 0, 0, 0 ]) cylinderPipeMounter(inner_radius,
                                           inner_height,
                                           split_width,
                                           outer_radius,
                                           hole_pos_y,
                                           hole_pos_z,
                                           hole_inner_radius,
                                           hole_outer_radius);

joint_width = 20;
joint_depth = 17.5;
joint_height = inner_height;
cane_radius = 22 / 2 + 0.5;
cane_holder_thin = 3;
translate([ -joint_width - inner_radius, 0, -outer_radius ])
{
    caneGrabber(
        joint_width, joint_depth, joint_height, cane_radius, cane_holder_thin);
}




