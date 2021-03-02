$fn = 10;
include  <mcad/roundedcube.scad>;
include  <mcad/triangles.scad>;

//static variables
wall_thickness = 1.75;
lid_depth = wall_thickness;
lip_depth = lid_depth/2;
port_x = wall_thickness + .1;
port_y = 12.05;
port_z = 4.45;
port_z_offset = 1.55;
internal_x = 57;
internal_y = 15.1;
internal_z = 9.1 + lid_depth;
enclosure_x = internal_x + (2*wall_thickness);
enclosure_y = internal_y + (2*wall_thickness);
enclosure_z = internal_z +wall_thickness;
block_x = 3;
block_y = 5;
block_z = 5;
block_offset = 44.5;
jack_diameter = 5.9;
jack_z_offset = 1.5;
groove_size = .3;
corner_radius = .75;
stop_thickness = 2;
stop_size = 2;
pryslot_width = 1 + wall_thickness;
pryslot_length = 5;


//main - choose which piece you want
BoxBase();
//BoxLid();

// Main enclosure
module BoxBase() {
    difference() {
        BoxStock();
        BoxCutout();
        JackHole();
        PortHole();
        GrooveCutout();
    }
    BoardBlock();
    LidStops();
}

module BoxStock() {
    roundedcube([enclosure_x,enclosure_y, enclosure_z], false, corner_radius);
}

module BoxCutout() {
    translate([wall_thickness,wall_thickness,0])
    cube([internal_x,internal_y, internal_z]);
}

module GrooveCutout() {
    translate([wall_thickness-groove_size,wall_thickness-groove_size,lip_depth-groove_size/2])
    roundedcube([internal_x+(2*groove_size),internal_y+(2*groove_size), groove_size], false, groove_size/2);
}

module SingleLidStop() {
    a_triangle(45, stop_size, stop_thickness);
}

module SideLidStop() {
    rotate([0,90,0])
    cylinder(h=internal_x, d = stop_size);
}

module LidStops() {
    translate([wall_thickness,wall_thickness,lid_depth+.1])
    SingleLidStop();
    translate([internal_x+wall_thickness,wall_thickness,lid_depth+.1])
    rotate([0,0,90])
    SingleLidStop();
    translate([internal_x+wall_thickness,internal_y+wall_thickness,lid_depth+.1])
    rotate([0,0,180])
    SingleLidStop();
    translate([wall_thickness,internal_y+wall_thickness,lid_depth+.1])
    rotate([0,0,270])
    SingleLidStop();
    
    /*
    translate([wall_thickness,wall_thickness,lid_depth+(stop_size/2)+.1])
    SideLidStop();
    translate([wall_thickness,internal_y+wall_thickness,lid_depth+(stop_size/2)+.1])
    SideLidStop();
    */
}

module BoardBlock() {
    translate([block_offset,wall_thickness,internal_z-block_z])
    cube([block_x,1,block_z]);
    translate([block_offset,enclosure_y-wall_thickness-block_y,internal_z-block_z])
    cube([block_x,block_y,block_z]);
}

module JackHole(){
    translate([enclosure_x - wall_thickness-.05,enclosure_y/2,internal_z-jack_diameter/2-jack_z_offset])
    rotate([0,90,0])
    cylinder(wall_thickness+.1,d=jack_diameter);
}

module PortHole() {
    translate([0,enclosure_y/2-port_y/2,internal_z-port_z-port_z_offset])
    cube([port_x,port_y,port_z]);
}


//All below for lid
module BoxLid(){
    difference(){
    LidStock();
    LidCutout();
    }
}

module LidStock(){
    translate([wall_thickness+.15,wall_thickness+.1,0])
    cube([internal_x-.3, internal_y-.2, lid_depth]);
    LidLip();
}

module LidLip() {
    translate([wall_thickness-groove_size,wall_thickness-groove_size,lip_depth-groove_size/2])
    roundedcube([internal_x+(2*groove_size),internal_y+(2*groove_size), groove_size-(groove_size/10)], false, groove_size/2);
}

module LidCutout() {
    translate([0,enclosure_y/2-pryslot_length/2,0])
    cube([pryslot_width,pryslot_length,lid_depth]);
}