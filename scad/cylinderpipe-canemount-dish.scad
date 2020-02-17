include <common/basic-parts.scad>
$fn = 100;

// Mounter
inner_radius = 13.5;
inner_height = 15;
split_width = 0.3;
corner_radius = 2;
outer_radius = 3;
hole_pos_y = 4.5;
hole_pos_z = 6;
hole_inner_radius = 1.25;
hole_outer_radius = 2.25;
cylinderPipeMounter(inner_radius,
                    inner_height,
                    split_width,
                    outer_radius,
                    hole_pos_y,
                    hole_pos_z,
                    hole_inner_radius,
                    hole_outer_radius);

// Dish
dish_height = 14;
dish_radius = inner_radius * 2 + 5;
dish_center = inner_radius + dish_radius + 2;
translate([ -dish_center, 0, -outer_radius ])
    dishWithGroovedHole(dish_height, dish_radius);
