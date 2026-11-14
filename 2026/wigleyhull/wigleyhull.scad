// Wigley Hull Parameters
L = 20; // Length
B = 4;  // Breadth
T = 2;  // Draft
slices = 50; // Number of cross-section profiles

// Generate the half-hull
module wigley_half() {
    for (i = [0 : slices-1]) {
        // Map i to x: from -L/2 to L/2
        x = -L/2 + (L / (slices-1)) * i; 
        x_next = -L/2 + (L / (slices-1)) * (i + 1);

        hull() {
            // Profile at x
            translate([x, 0, 0]) 
                wigley_profile(L, B, T, x);
            
            // Profile at x_next
            translate([x_next, 0, 0]) 
                wigley_profile(L, B, T, x_next);
        }
    }
}

// Generate an individual 2D cross-section
module wigley_profile(L, B, T, x_loc) {
    points = [for (z = [0 : -0.1 : -T]) 
        let( y = (B/2) * (1 - pow((2 * x_loc / L), 2)) * (1 - pow((z / -T), 2)) )
        [y, z]
    ];
    
    polygon(points);
}

// Render the full symmetric ship
union() {
    wigley_half();
    mirror([0, 1, 0]) wigley_half();
}
