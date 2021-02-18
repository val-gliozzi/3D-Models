$fn = 30;
include  <mcad/roundedcube.scad>;

//static variables
board_thickness = 1;
wall_thickness = 3;
box_width = 140;
box_depth = 38;
box_height = 25;
lid_width = box_width;
lid_depth = box_depth;
lid_height = wall_thickness;
basepillar_height = 18;
basepillar_diameter = 5;
lidpillar_height = box_height-basepillar_height-wall_thickness-board_thickness;
lidpillar_diameter =6;
pillarhole_diameter = 2;
pillarhole_height = 8;
screwhole_diameter = 2.1;
screwsocket_diameter = 3.5;
screwsocket_height = 1.5;
buttonhole_diameter = 1.5;
buttonhole_guide_diameter = 0;
buttonhole_guide_height = 0;
powercut_width = 6;
powercut_height = 3;
portcut_width = 14.7;
portcut_depth = 7;
portspace_x = 5.2;
portspace_y = 6.3;
corner_radius = 1.5;
port_offset_x = 1.3;
port_offset_y = 1;
button_offset_x = 44.3;
button_offset_y = 11.16;
p1_offset_x = 18.8;
p1_offset_y = 11;
p2_offset_x = 74.5;
p2_offset_y = 13.2;
p3_offset_x = 129;
p3_offset_y = 12.8;
board_offset_x = wall_thickness+0.5;
board_offset_y = wall_thickness+0.5;

//main - choose which piece you want
//BoxBase();
//BoxLid();
BoxLid();

module BoxLid(){
    difference() {
        LidStock();
        AllLidHoles();
    }
    AllLidPillars();
}

module LidStock(){
    roundedcube([lid_width, lid_depth, lid_height], false, corner_radius, "z");
}

module LidPillar(){
    difference() {
    translate([0,0,lid_height])
    cylinder(lidpillar_height,d=lidpillar_diameter);
    cylinder(pillarhole_height,d=pillarhole_diameter); }
}

module AllLidPillars() {
    translate([board_offset_x,board_offset_y,0]){
    //Translated in relation to board edges
    translate([p1_offset_x, p1_offset_y, 0])
    LidPillar();
    translate([p2_offset_x,p2_offset_y,0])
    LidPillar();
    translate([p3_offset_x,p3_offset_y,0])
    LidPillar();
    }
}

module LidHole(){
    cylinder(lid_height,d=screwhole_diameter);
    cylinder(screwsocket_height,d1=screwsocket_diameter, d2=screwhole_diameter);
}

module AllLidHoles() {
    translate([board_offset_x,board_offset_y,0]){
    //Translated in relation to board edges
    translate([p1_offset_x, p1_offset_y, 0])
    LidHole();
    translate([p2_offset_x,p2_offset_y,0])
    LidHole();
    translate([p3_offset_x,p3_offset_y,0])
    LidHole();
    }
}
    

//All below: For box base
module BoxBase() {
    difference() {
        BoxStock();
        BoxCutout();
        PowerCutout();
        BoxSurfaceHoles();
    }
    AllBasePillars();
}

module BoxSurfaceHoles() {
    translate([board_offset_x, board_offset_y, 0])
    {
    PortCutoutGrid();
    ButtonHole();
    }
}

module BoxStock() {
    roundedcube([box_width,box_depth, box_height], false, corner_radius, "zmax");
}

module BoxCutout() {
    translate([wall_thickness,wall_thickness,0])
    roundedcube([box_width-(2*wall_thickness),box_depth-(2*wall_thickness),    box_height-wall_thickness], false, corner_radius, "zmax");
}

module PowerCutout() {
    translate([box_width-wall_thickness,box_depth-wall_thickness-powercut_width-1,0])
    roundedcube([wall_thickness,powercut_width,powercut_height], false, corner_radius/1.5, "x");
}

module PortCutout() {
    translate([0,0,box_height-wall_thickness-.1])
    cube([portcut_width,portcut_depth,wall_thickness+.1]);
}

module PortCutoutGrid() {
    //Translated in relation to board edges
    translate([port_offset_x,port_offset_y,0])
    {
    PortCutout();
    translate([portcut_width+portspace_x, 0,0])
    PortCutout();
    translate([0, portcut_depth+portspace_y,0])
    PortCutout();
    translate([portcut_width+portspace_x, portcut_depth+portspace_y,0])
    PortCutout();
    }
}

module ButtonHole(){
    //Translated in relation to board edges.
    translate([button_offset_x,button_offset_y,box_height-wall_thickness-.1])
    cylinder(wall_thickness+.1,d=buttonhole_diameter);
}

module BasePillar(){
    translate([0,0,box_height-basepillar_height-wall_thickness])
    {
    difference() {
    cylinder(basepillar_height,d=basepillar_diameter);
    cylinder(pillarhole_height,d=pillarhole_diameter); }
    }
}

module AllBasePillars(){
    translate([board_offset_x,board_offset_y,0]){
    //Translated in relation to board edges
    translate([p1_offset_x, p1_offset_y, 0])
    BasePillar();
    translate([p2_offset_x,p2_offset_y,0])
    BasePillar();
    translate([p3_offset_x,p3_offset_y,0])
    BasePillar();
    }
}