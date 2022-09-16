length=103;
height=26.6;
width=29.75;
top_r=138.5;
handle_w=16.65;
handle_middle=((width-handle_w)/2)+handle_w/2;

speaker_d=29.75;
curve_diff=16.5;


module body() {
    intersection() {
        translate([0,(width-handle_w)/2,0])cube([length,handle_w,height]);
        translate([length/2,width/2,top_r])sphere(top_r);
    };
};

module speaker(x,y,z) {
    translate([x,y,z])sphere(speaker_d/2);
};

module crude_handset() {
    speaker_h=21;
    union() {
        body();
        //speaker(speaker_d/4,handle_middle,speaker_h);
        //speaker(length-speaker_d/4,handle_middle,speaker_h);
    };
};

module handle() {
    cyl_d=15.5;
    cyl_r=cyl_d/2;
    inside_len=52.5;
    inside_h=20;
    intersection() {
        //translate([])sphere(top_r);
        union() {
            translate([])cube([inside_len,width,inside_h]);
            rotate([90,0,0])translate([cyl_r,cyl_r,-height])cylinder(h=width,r=cyl_r);
            rotate([90,0,0])translate([cyl_r+31,cyl_r,-height])cylinder(h=width,r=cyl_r);
        };
    };
    
};

difference() {
    //crude_handset();
    //translate([length/2,width/2,top_r+curve_diff])sphere(top_r);
    handle();
};
