// translate([0,10,0])

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
