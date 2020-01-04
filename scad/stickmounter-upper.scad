height = 17;
radius = 13.5;

rotate_extrude(angle = 180, $fn = 150) translate([ radius, 0, 0 ])
    square(size = [ 3, height ]);

difference()
{
    translate([ -10 - radius, 0, 0 ]) cube([ 10, 4, height ]);
    translate([ -radius - 5 - 1 / 3, 0, 4 ]) rotate([ 270, 0, 0 ])
        cylinder(r = 2, h = 4, $fn = 50);
    translate([ -radius - 5 - 1 / 3, 0, 13 ]) rotate([ 270, 0, 0 ])
        cylinder(r = 2, h = 4, $fn = 50);
}

difference()
{
    translate([ radius, 0, 0 ]) cube([ 10, 4, height ]);
    translate([ radius + 5 + 1 / 3, 0, 4 ]) rotate([ 270, 0, 0 ])
        cylinder(r = 2, h = 4, $fn = 50);
    translate([ radius + 5 + 1 / 3, 0, 13 ]) rotate([ 270, 0, 0 ])
        cylinder(r = 2, h = 4, $fn = 50);
};

joint_length = 20;

translate([ 0, joint_length / 2 + radius, height / 2 ])
    cube([ radius + 4, joint_length, height ], center = true);

cane_radius = 22 / 2 + 0.5;
cane_holder_thin = 3;
translate([ 0, joint_length + cane_radius - 2 + cane_holder_thin / 2, 0 ])
    translate([ 0, radius, height / 2 ]) rotate([ 0, 0, 140 ])
        rotate_extrude(angle = 180, $fn = 150, center = true)
            translate([ cane_radius + cane_holder_thin / 2, 0, 0 ])
                square(size = [ cane_holder_thin, height ], center = true);

translate([ 0, joint_length + cane_radius - 2 + cane_holder_thin / 2, 0 ])
    translate([ 0, radius, height / 2 ]) rotate([ 0, 0, 40 ])
        rotate_extrude(angle = 180, $fn = 150, center = true)
            translate([ -cane_radius - cane_holder_thin / 2, 0, 0 ])
                square(size = [ cane_holder_thin, height ], center = true);
