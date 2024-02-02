include <common/basic-parts.scad>
$fn = 100;

// Mounter
inner_width = 14.8;
inner_depth = 23.9;
inner_height = 14;
split_width = 1;
corner_radius = 2;
outer_radius = 3;
hole_pos_y = 5.2;
hole_pos_z = 4;
hole_inner_radius = 0.75;
hole_outer_radius = 2.0;

module pipeMounter(hiding = 1, split_width = 1) {
    difference() {
        cubicPipeMounter(inner_width,
                        inner_depth,
                        inner_height,
                        split_width,
                        corner_radius,
                        outer_radius,
                        hole_pos_y,
                        hole_pos_z,
                        hole_inner_radius,
                        hole_outer_radius);
        if (hiding != 0) translate([hiding * 10, 0, 0]) cube([ 19.5, inner_width * 5, inner_height * 2 ],
                center = true); // hide mounter side
    }
}

pipeMounter(1);

translate([10, 0 , 0]) pipeMounter(-1);


joint_width = 10;
joint_depth = 12;
joint_height = inner_height;
// cane_radius = 22 / 2 + 0.5;
cane_radius = 19 / 2 + 0.5;
cane_holder_thin = 3;
difference() {
    rotate([0, 0, -90]) translate([ -joint_width - inner_width / 2 - split_width+0.5 - 10, 0, 0])
    {
        caneGrabber(
            joint_width, joint_depth, joint_height, cane_radius, cane_holder_thin, corner_radius);
    }
    minkowski(0.5) pipeMounter(0, 0);
}