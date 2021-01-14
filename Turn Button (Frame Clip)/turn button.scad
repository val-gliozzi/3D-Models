$fn = 100;

//contains roundedBox class
include  <mcad/boxes.scad>;

module backpressure_blob() {
sphere(d=7);
}

module countersink_hole () {
union(){
cylinder(h=3, d1=3.75, d2=7.75);
cylinder(h=6, d=3.75, center=true);
 }
}

module main_body () {
roundedBox([35, 10, 3.5], 3, true); 
}

//MAIN
difference(){
main_body();
translate([-12.5,0,-1.25])
countersink_hole();
}
translate([12.5,0,-1.75])
backpressure_blob();
