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

translate([ 0, radius + 2, height / 2 ])
    cube([ radius + 7, 5, height ], center = true);

dish_radius = radius * 2 + 5;
dish_center = radius + dish_radius + 2;

translate([ 0, dish_center, height / 2 ])
    rotate_extrude(angle = 360, $fn = 150, center = true)
        translate([ dish_radius, 0, 0 ])
            square(size = [ 3, height ], center = true);

difference()
{
    translate([ 0, dish_center, 0 ])
        cylinder(r = dish_radius, h = 2, $fn = 100);
    union()
    {
        translate([ 0, dish_center, 0 ]) rotate([ 0, 0, 115 ])
            rotate_extrude(angle = 110, $fn = 150, center = true)
                translate([ dish_radius / 3 * 2, 0, 0 ])
                    square(size = [ 3, height ], center = true);

        translate([ 0, dish_center, 0 ]) rotate([ 0, 0, 115 + 120 ])
            rotate_extrude(angle = 110, $fn = 150, center = true)
                translate([ dish_radius / 3 * 2, 0, 0 ])
                    square(size = [ 3, height ], center = true);

        translate([ 0, dish_center, 0 ]) rotate([ 0, 0, 115 + 120 * 2 ])
            rotate_extrude(angle = 110, $fn = 150, center = true)
                translate([ dish_radius / 3 * 2, 0, 0 ])
                    square(size = [ 3, height ], center = true);
        translate([ 0, dish_center, 0 ]) rotate([ 0, 0, 117 ])
            rotate_extrude(angle = 105, $fn = 150, center = true)
                translate([ dish_radius / 3, 0, 0 ])
                    square(size = [ 3, height ], center = true);

        translate([ 0, dish_center, 0 ]) rotate([ 0, 0, 117 + 120 ])
            rotate_extrude(angle = 105, $fn = 150, center = true)
                translate([ dish_radius / 3, 0, 0 ])
                    square(size = [ 3, height ], center = true);

        tra,nslate([ 0, dish_center, 0 ]) rotate([ 0, 0, 117 + 120 * 2 ])
            rotate_extrude(angle = 105, $fn = 150, center = true)
                translate([ dish_radius / 3, 0, 0 ])
                    square(size = [ 3, height ], center = true);
    }
};