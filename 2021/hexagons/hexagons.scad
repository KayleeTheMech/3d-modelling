radius=5;
distance=2;
thickness=2;

delta_x = cos(30) * ( distance ) + sin(30) * radius + radius;
delta_y = cos(30) * ( radius ) + sin(30) * distance;

vector_x = 2 * delta_x;
vector_y = (2 * sin(60) * radius) + distance;

module BienenWabeEinheitsZelle(offset_x,offset_y){ 
    translate([offset_x,offset_y]){
        cylinder(h=thickness,r=radius, $fn=6,center=true);
        translate([delta_x,delta_y,0]){
            cylinder(h=thickness,r=radius, $fn=6,center=true);
        }
    }
}


for (n_y = [0:10] ){
    for ( n_x = [0:5] ){
        BienenWabeEinheitsZelle(n_x*vector_x,n_y*vector_y);
    };
}

