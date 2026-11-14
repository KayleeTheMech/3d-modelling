radius = 85;
distance = 23;

phi_steps = 10;
theta_steps = 6;

// use 512 for print
sphere_edges_for_rendering = 512;

hex_radius = (2 * PI * radius - phi_steps * distance) / (2 * phi_steps);

thickness = 12;
module
sphere_pattern()
{
    function phi_phase(theta) = (theta % (2 * 84 / theta_steps) == 0) ? 0 : 360 / (2 * phi_steps);

    function scale_radius(theta) = cos(theta);
    for (theta = [-2 * 84 / theta_steps:84 / theta_steps:84]) {
        for (phi = [0:360 / phi_steps:360]) {
            rotate([ 0, -theta, phi + phi_phase(theta) ])
            {
                translate([ radius - thickness / 2, 0, 0 ])
                {
                    rotate([ 0, 90, 0 ])
                    {
                        cylinder(
                            h = thickness, r = hex_radius * cos(theta), $fn = 6, center = true);
                    }
                }
            }
        }
    }
}

module
lamp_shade()
{
    difference()
    {
        difference()
        {
            difference()
            {
                difference()
                {
                    sphere(r = radius, $fn = sphere_edges_for_rendering);
                    sphere(r = radius - thickness + 10, $fn = sphere_edges_for_rendering);
                }
                sphere_pattern();
            }
            translate([ 0, 0, -1.2 * radius ])
            {
                cube([ 2 * radius, 2 * radius, radius ], center = true);
            }
        }
        translate([ 0, 0, radius ]) { cylinder(h = thickness + radius, r = 20.5, center = true); }
    }
}

module ring(inner_radius, outer_radius, height)
{
    difference()
    {
        cylinder(h = height, r = outer_radius, $fn = sphere_edges_for_rendering);
        translate([ 0, 0, -0.5 ])
        {
            cylinder(h = height + 1, r = inner_radius, $fn = sphere_edges_for_rendering);
        }
    }
}

module
flansch()
{
    difference()
    {
        difference()
        {
            difference()
            {
                ring(height = 18.5, inner_radius = 19.25, outer_radius = 21.5);

               translate([ -1.5, -22.5, 5.4 ]) { cube([ 3, 45, 15 ]); }
            }
            translate([ 0, 0, 8 ]) rotate([ 90, 0, 10 ])
            {
                cylinder(h = 45, r = 1.6, center = true, $fn = sphere_edges_for_rendering);
            }
        }
        translate([ 0, 0, 7 ]) rotate([ 0, 60, 5.25 ]) { cube([ 2.8, 45, 3 ], center = true); }
    }
}


translate([ 0, 0, radius - 5 ])
{
    flansch();
}
lamp_shade();