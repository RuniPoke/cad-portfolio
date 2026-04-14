// Parametric Phone Stand
// Adjustable viewing angle with cable routing

phone_w = 80;
wall = 4;
base_depth = 60;
stand_height = 90;
angle = 70;
lip_height = 12;
cable_hole = 14;

module phone_stand() {
    difference() {
        union() {
            // Base plate
            cube([phone_w, base_depth, wall]);

            // Angled back support
            translate([0, base_depth, 0])
                rotate([angle, 0, 0])
                cube([phone_w, stand_height, wall]);

            // Left side wall
            translate([0, 0, 0])
                cube([wall, base_depth, lip_height]);

            // Right side wall
            translate([phone_w - wall, 0, 0])
                cube([wall, base_depth, lip_height]);

            // Front lip to hold phone
            cube([phone_w, wall, lip_height]);
        }

        // Cable routing hole in base
        translate([phone_w/2, base_depth/2, -1])
            cylinder(h = wall + 2, d = cable_hole, $fn = 48);

        // Cutout in front lip for cable
        translate([phone_w/2 - cable_hole/2, -1, 0])
            cube([cable_hole, wall + 2, lip_height/2]);
    }
}

phone_stand();