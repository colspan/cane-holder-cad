height = 19;
dish_radius = 38 / 2;

rotate_extrude(angle = 360, $fn = 150, center = true)
    translate([ dish_radius, 0, 0 ]) square(size = [ 1, height - 10 ]);

difference()
{
    translate([ 0, 0, 0 ]) cylinder(r = dish_radius, h = 2, $fn = 100);
    translate([ 0, 0, 0 ]) rotate_extrude($fn = 150, center = true)
        translate([ dish_radius / 4 * 3, 0, 0 ])
            square(size = [ 2, 2 ], center = true);
    translate([ 0, 0, 0 ]) rotate_extrude($fn = 150, center = true)
        translate([ dish_radius / 4 * 2, 0, 0 ])
            square(size = [ 2, 2 ], center = true);
    translate([ 0, 0, 0 ]) rotate_extrude($fn = 150, center = true)
        translate([ dish_radius / 4, 0, 0 ])
            square(size = [ 2, 2 ], center = true);
};