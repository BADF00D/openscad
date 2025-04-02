// OpenSCAD script to create a simple slide

// Parameters
slide_length = 100;  // Length of the sliding surface
slide_width = 40;    // Width of the slide
slide_height = 50;   // Height of the top platform
side_wall_height = 10;
thickness = 3;       // Thickness of the material

module slide() {
    // Sliding surface
    translate([0, 0, thickness])
    cube([slide_length, slide_width, thickness]);
    
    // Side walls
    translate([0, 0, thickness])
    cube([slide_length, thickness, side_wall_height]);
    
    translate([0, slide_width - thickness, thickness])
    cube([slide_length, thickness, side_wall_height]);
    
    // Support structure
    translate([0, 0, 0])
    rotate([0, -30, 0])
    cube([slide_length, thickness, slide_height]);
    
    translate([0, slide_width - thickness, 0])
    rotate([0, -30, 0])
    cube([slide_length, thickness, slide_height]);
    
    // Top platform
    translate([slide_length - thickness, 0, slide_height])
    cube([thickness, slide_width, thickness]);
}

slide();
