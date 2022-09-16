thickness=4.8;
length=60;
height=40;
clip=17;
width=clip+2*thickness;
clip_h=height+thickness;

roller_d=8;
roller_len=15;


module roller() {
    difference() {
        translate([0,length/2-roller_len/2,clip_h])
            cube([width,roller_len,roller_d/2+roller_d/5]);
        translate([0,length/2,clip_h+roller_d/2])
            rotate([0,90,0])cylinder(d=roller_d, h=width);
    }
}


module clip() {
    difference() {
        cube([width,length,clip_h]);
        translate([thickness,0,0])cube([clip,length,height]);
    }
};

clip();
roller();