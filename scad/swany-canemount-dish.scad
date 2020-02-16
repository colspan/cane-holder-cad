$fn = 100;

include <basic-parts.scad>
include <essentials.scad>

// Mounter
inner_width = 21.5;
inner_height = 19;
inner_depth = 14;
split_width = 1;
corner_radius = 3.5;
outer_radius = 3;
hole_pos_y = 5.2;
hole_pos_z = 4;
mounter(inner_width,
        inner_height,
        inner_depth,
        split_width,
        corner_radius,
        outer_radius,
        hole_pos_y,
        hole_pos_z);

// Dish
dish_height = inner_depth;
dish_radius = 30;
dish_center = dish_radius + (inner_width + split_width) / 2 + outer_radius;
translate([ -dish_center, 0, -outer_radius ])
{
    dishWithGroovedHole(dish_height, dish_radius);
}
