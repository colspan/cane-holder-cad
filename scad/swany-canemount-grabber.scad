include <common/basic-parts.scad>
$fn = 100;

// Mounter
inner_width = 17;
inner_height = 14;
inner_depth = 14;
split_width = 1;
corner_radius = 2;
outer_radius = 3;
hole_pos_y = 5.2;
hole_pos_z = 4;
union_width = inner_width + split_width;
cubicPipeMounter(inner_width,
                 inner_depth,
                 inner_height,
                 split_width,
                 corner_radius,
                 outer_radius,
                 hole_pos_y,
                 hole_pos_z);

joint_width = 28;
joint_depth = 12;
joint_height = inner_depth;
cane_radius = 22 / 2 + 0.5;
cane_holder_thin = 3;
translate([ -joint_width - inner_width / 2 - split_width, 0, -outer_radius ])
{
    caneGrabber(
        joint_width, joint_depth, joint_height, cane_radius, cane_holder_thin);
}
