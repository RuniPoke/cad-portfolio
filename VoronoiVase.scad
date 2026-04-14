// Voronoi-inspired Geometric Vase
// Parametric decorative vessel with lattice wall pattern

$fn = 64;
height = 120;
radius = 35;
wall = 3;
twist = 45;

module vase_body() {
    difference() {
        // Outer shell with twist
        linear_extrude(height = height, twist = twist, scale = 0.7)
            circle(r = radius);
        
        // Inner hollow
        translate([0, 0, wall])
            linear_extrude(height = height, twist = twist, scale = 0.7)
                circle(r = radius - wall);
        
        // Flatten bottom
        translate([0, 0, -1])
            cylinder(h = wall, r = radius + 1);
    }
}

module lattice_ring(z_pos, r, count) {
    translate([0, 0, z_pos])
        for(i = [0 : count - 1])
            rotate([0, 0, i * 360 / count])
                translate([r, 0, 0])
                sphere(r = 4);
}

difference() {
    vase_body();
    
    // Carve decorative holes in rings
    for(z = [15, 30, 45, 60, 75, 90])
        lattice_ring(z, radius * (1 - 0.3 * z/height), 8);
}