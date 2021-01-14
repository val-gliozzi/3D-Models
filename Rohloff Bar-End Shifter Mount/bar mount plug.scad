$fn = 100;
h1 = 25;
sd = 6.125; //fixing bolt diameter
n1 = 5.5; //fixing nut height
n2 = 12.6; //fixing nut diamemter

difference() {
insert_plug();
cutout();
}

module insert_plug(){
    difference(){
translate([0,0,h1/2])
cylinder(h=h1, d1=17, d2=12,center=true);
translate([0,0,h1-8])
cylinder(h=8, d = 20);
}
}

module cutout(){
    union(){
        screw_hole();
        nut_socket();
    }
}

module screw_hole() {
cylinder(h=h1, d=sd);
}

module nut_socket() {
$fn = 6;
cylinder(h=n1, d=n2);
}