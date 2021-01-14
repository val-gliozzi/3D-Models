$fn = 50;

//contains roundedBox class
include  <mcad/boxes.scad>;

module new_peg() {
roundedBox([6,2.5,6.8], 1.25, false); 
roundedBox([2.5,6,6.8], 1.25, false);
   translate([0,0,1.7])
roundedBox([6,2.5,3.4], 1.25, true); 
    translate([0,0,1.7])
roundedBox([2.5,6,3.4], 1.25, true); 
}

module insertion_pegs() {
    translate([-14.5, 0, -12.65])
new_peg();
    translate([14.5, 0, -12.65])
new_peg();    
}

module main_body() {
roundedBox([46, 18, 18.5], 3, false); 
  translate([0,0,-5])
roundedBox([46, 18, 8.5], 3, true); 
}

//MAIN
main_body();
//new_peg();
insertion_pegs();