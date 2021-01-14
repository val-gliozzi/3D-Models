$fn = 8;
include  <mcad/boxes.scad>;

// editable variables
keywidth = 14.3;
keydepth = 13.1;
basewidth = 9.2 -.5;
basedepth = 7.15 -.5;

//static variables
keyheight = 2.8;
borderinset = 1.55;
borderthickness = 0.85;
baseheight = 5.1;
basecutoutwidth = 5.25;
basecutoutdepth = basedepth;
basecutoutheight = .2;
baseclipwidth = 2.3;
baseclipdepth = 1.5;
baseclipheight = 6.41;
postdiameter = 1.25;
postheight = 6.9;
cornerdiameter = 1;

//main
base_keyclips();
difference(){
    union(){
    keytop();
    keybase();
    }
//label();
}
base_cornerposts();


module keytop() {
    difference() {
        keytopstock();
        translate([0,0,borderinset])
        border_cutout();
    }
}
module keytopstock() {
        translate([0, 0, keyheight/2])
        roundedBox([keywidth,keydepth,keyheight],cornerdiameter, true);
}

module border_cutout() {
    translate([0, 0, borderinset/2])
    roundedBox([keywidth-borderthickness*2,keydepth-borderthickness*2,borderinset], cornerdiameter, true);
}

module keybase() {
        difference() {
            base_stock();
            translate([0,0,basecutoutheight])
            base_cutout();
        }
}

module base_stock() { 
    translate([0, 0, baseheight/2])
    cube([basewidth,basedepth,baseheight],true);
}

module base_cutout() {
    translate([0,0, baseheight-(1.5*basecutoutheight)])
    cube([basecutoutwidth, basecutoutdepth, basecutoutheight], true);
}

module base_keyclip() {
    rotate([0,0,270]){
    translate([0,0,baseclipheight/2]){
    cube([baseclipwidth,baseclipdepth,baseclipheight], true);
    }
    translate([0,baseclipdepth/2,baseclipheight-.35]){
    cube([baseclipwidth,1.5,.7], true);}}
}


module base_keyclips() {
    translate([basewidth/2-baseclipdepth/2, 0, 0]){
    base_keyclip();}
    rotate([0,0,180]){translate([basewidth/2-baseclipdepth/2, 0, 0]){
    base_keyclip();}}
}

/*
module base_keyclip() {
    rotate([0,0,270]){
    translate([0,0,baseclipheight/2]){
    cube([baseclipwidth,baseclipdepth,baseclipheight], true);
    }
    translate([0,baseclipdepth/2,baseclipheight-.8]){
    rotate([90,0,90]){cylinder(h=baseclipwidth, d=1.6, center =true);}}
}
}


module base_keyclip() {
    translate([0,0,baseclipheight/2]){
    cube([baseclipwidth,baseclipdepth,baseclipheight], true);
    }
    translate([0,baseclipwidth/2,baseclipheight-.76]){
    difference() {
        rotate([90,0,90]){
        cylinder(h=baseclipwidth, d=1.52,$fn=3, true);
        }
        translate([0,0,-.76/2]){
        cube([baseclipwidth,10,.76], true);
        }
    }
    }
}*/


module base_single_cornerpost() {
    cylinder(h=postheight, d=postdiameter, center=true);
}

module base_cornerposts() {
    post_offset = postdiameter/3;
    translate([basewidth/2-post_offset, basedepth/2-post_offset, postheight/2]){
    base_single_cornerpost();
    }
    translate([basewidth/2-post_offset, -basedepth/2+post_offset, postheight/2]){
    base_single_cornerpost();
    }
    translate([-basewidth/2+post_offset, basedepth/2-post_offset, postheight/2]){
    base_single_cornerpost();
    }
    translate([-basewidth/2+post_offset, -basedepth/2+post_offset, postheight/2]){
    base_single_cornerpost();
    }
}

module label() {
    cylinder(h=.1, d=3.33,$fn=3, center = true);
}