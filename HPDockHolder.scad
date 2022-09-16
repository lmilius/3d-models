thickness=3.6;
2thickness=thickness*2;

screw_d=4.2;
counter_sink=7.9;

length=100;
width=73;
height=15;

module screw_tab() {
    difference() {
        cube([height, height, thickness]);
        translate([height/2, height/2, 0])cylinder(thickness, d1=screw_d, d2=counter_sink);
    }
}
    

difference() {
    cube([length+2thickness, width+2thickness, height]);
    translate([thickness, thickness, 0])cube([length, width, height]);
}

translate([-height, 0, height])
    rotate([-90, 0, 0])
    screw_tab();

translate([length+2thickness, 0, height])
    rotate([-90, 0, 0])
    screw_tab();