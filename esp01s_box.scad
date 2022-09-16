relay_w = 38;
relay_d = 26;
relay_h = 20;

d_outlet = 9.4;
d_inlet = 10.7;

overall_w = 30;
overall_d = 75;
overall_h = 50;

thickness = 1.2;
2thickness = thickness * 2;



module box() {
    difference(){
        cube([overall_w, overall_d, overall_h]);
        translate([thickness, thickness, thickness])
            cube([overall_w-2thickness, overall_d-2thickness, overall_h-thickness]);
    }
}

//box();

//cylinder(h=thickness, r=3, $fn=6);

x = 100;
y = 100;
z = 1;

fen_x = 15;
fen_y = 15;
fen_size = 5;

fen_size_x = fen_size * x / 100;
fen_size_y = fen_size * y / 100;

strut_x = (x - fen_x * fen_size_x) / (fen_x + 1);
strut_y = (y - fen_y * fen_size_y) / (fen_y + 1);


difference() {
    cube(size=[x, y, z]); // fenestrated surface
    for (i = [0:fen_x - 1]) {
        translate([i * (fen_size_x + strut_x) + strut_x, 0, 0])
            for (i = [0:fen_y - 1]) {
            translate([0, i * (fen_size_y + strut_y) + strut_x, -1])
            cube([fen_size_x, fen_size_y, z+2]); // the fenestrations have to start a bit lower and be a bit taller, so that we don't get 0 sized objects
        }
    }
}