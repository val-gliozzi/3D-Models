$fn = 100;
shaft_diameter = 30;
shaft_length = 70;
shaft_flare_diameter = 40;
shaft_flare_length = 10;
plate_side_length = 80;
plate_thickness = 7;
screw_diameter = 3.5;
screw_head_diameter = 8.5;
screw_head_height = 3.5;
screw_edge_inset = 12;

main();

module main(){
    mount_plate_cut_out();
    spool_shaft();
    shaft_flare();
}


module spool_shaft(){
    translate([0,0,shaft_length/2+plate_thickness])
    cylinder(h=shaft_length, d=shaft_diameter, center=true);
}

module shaft_flare(){
    translate([0,0,shaft_flare_length/2+shaft_length+plate_thickness])
    cylinder(h=shaft_flare_length, d1=shaft_diameter, d2=shaft_flare_diameter,center=true);
}

module mount_plate(){
    translate([0,0,plate_thickness/2])
    cube(size = [plate_side_length,plate_side_length,plate_thickness], center = true);
}

module mount_plate_cut_out(){
    difference(){
    mount_plate();
    translate([plate_side_length/2-screw_edge_inset,plate_side_length/2-screw_edge_inset,0])
        screw_hole();
    translate([-plate_side_length/2+screw_edge_inset,plate_side_length/2-screw_edge_inset,0])
        screw_hole();
    translate([plate_side_length/2-screw_edge_inset,-plate_side_length/2+screw_edge_inset,0])
        screw_hole();
    translate([-plate_side_length/2+screw_edge_inset,-plate_side_length/2+screw_edge_inset,0])
        screw_hole();
    }
}

module screw_hole() {
    translate([0,0,plate_thickness/2])
    cylinder(h=plate_thickness, d=screw_diameter, center=true);
    translate([0,0,screw_head_height/2+plate_thickness-screw_head_height])
    cylinder(h=screw_head_height, d1=screw_diameter, d2=screw_head_diameter, center=true);

}


module spool_adt(){
    difference(){
translate([0,0,h1/2])
cylinder(h=h1, d1=17, d2=12,center=true);
translate([0,0,h1-8])
cylinder(h=8, d = 20);
        
        difference() {
insert_plug();
cutout();
}
}
}