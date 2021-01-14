$fn = 80;

difference() {
// cylinder outer dimension
cylinder(h=34, d=10);

// center cutout
translate([0,0,23.1])
difference() {
cylinder(h=11, d=6.3);

translate([1.15,1.5,0])
    cube([4,4,11.1]);
    
translate([-5.15,1.5,0])
    cube([4,4,11.1]);
}

}