// Parametric Cat Toy Ball
// Designed for Shadow — a rollable ball with cutout windows

$fn = 64;
ball_r = 25;
hole_r = 10;
inner_ball_r = 8;

module cat_toy() {
    difference() {
        // Outer ball
        sphere(r = ball_r);
        
        // Top and bottom holes
        for(z = [0, 90, -90])
            rotate([z, 0, 0])
            cylinder(h = ball_r + 1, r = hole_r, center = true);
        
        // Side windows around equator
        for(i = [0 : 5])
            rotate([0, 0, i * 60])
            translate([ball_r, 0, 0])
            sphere(r = hole_r);
        
        // Diagonal windows
        for(i = [0 : 3])
            rotate([45, 0, i * 90])
            translate([ball_r * 0.8, 0, 0])
            sphere(r = hole_r * 0.7);
    }
    
    // Small bell inside
    translate([0, 0, 0])
        sphere(r = inner_ball_r);
}

cat_toy();