$fn = 100;
h1 = 25; //height of plug insert hole
s1 = 1; //width of slot in insert
i1 = 37; //insert portion height
sd = 6.3; //fixing bolt diameter
sh1 = 12; //fixing bolt head diameter
sh2 = 40; //fixing bolt head depth

difference() {
main_assembly();
screw_hole();
}

module main_assembly() {
shifter_mount();
difference() {
bar_insert();
bar_insert_cutout();
}
}

module shifter_mount() {
translate([0,0,i1])
cylinder(h=63, d=22.2);  
}

module screw_hole() {
cylinder(h=100, d=sd);
translate([0,0,75])
cylinder(h=sh2, d=sh1);
}

module bar_insert() {
  cylinder(h=i1, d=20.75);
}  

module bar_insert_cutout() {
translate([0,0,h1/2])
union(){
cube(size=[s1,21,h1], center=true);

cube(size=[21,s1,h1], center=true);
    
cylinder(h=h1, d1=17, d2=12,center=true);    
    }
}