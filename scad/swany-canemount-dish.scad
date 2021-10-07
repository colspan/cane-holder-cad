include <common/basic-parts.scad>
$fn = 100;

// Mounter
inner_width = 21.5;
inner_depth = 14;
inner_height = 14;
split_width = 1;
corner_radius = 3.5;
outer_radius = 3;
hole_pos_y = 5.2;
hole_pos_z = 4;
hole_inner_radius = 0.75;
hole_outer_radius = 2.0;
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

// Dish
dish_height = 14;
dish_radius = 30;
dish_center = dish_radius + (inner_width + split_width) / 2 + outer_radius;
translate([ -dish_center+1.5, 0, dish_height / 2 - inner_height / 2 - outer_radius ])
{
    dishWithGroovedHole(dish_height, dish_radius);
}
