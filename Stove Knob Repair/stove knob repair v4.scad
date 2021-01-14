$fn = 80;
translate([0,0,1.51])
cylinder(h=14.2,d=6.3);
translate([0,0,15.7])
cylinder(h=3.3, d1=7, d2=10);
difference() {
// keyhole cutout outer dimension
translate([0,0,19])
cylinder(h=15, d=10);    

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