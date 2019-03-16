/*
OpenEng
v1.0

Code by 
Julian Stirling and Richard Bowman
Bath Open INstrumentation

Licenced under MIT Licenced

As this library is very small please feel free to copy it directly into other projects
Library home is: https://gitlab.com/bath_open_instrumentation_group/openeng
*/


OE_splodge=.2;

// 75% tap diameter calculated for different screws
function tap_d(screw_d=3,pitch=.5) = screw_d - pitch*sqrt(3)*.75*.75;
// UNC numbered threads i.e. #2-56
function UNC_num_tap_d(num=2,tpi=56) = tap_d( (0.06+num*0.013)*25.4, 25.4/tpi );
// UNC fractional threads i.e. #1/4-20
function UNC_frac_tap_d(screw_d_in=.25,tpi=20) = tap_d( screw_d_in*25.4, 25.4/tpi );


module trylinder(r=1, flat=1, h=1, center=false){
    //Halfway between a cylinder and a triangle.
    //NB the largest cylinder that fits inside it has r=r+f/(2*sqrt(3))
    //One of the sides is parallel with the X axis
    hull() for(a=[0,120,240]) rotate(a)
    translate([0,flat/sqrt(3),0]){cylinder(r=r, h=h, center=center,$fn=12);}
}

module selftap_hole(nominal_d=2.5, h=10, center=false,splodge=OE_splodge){
    // Make a trylinder that you can self-tap a machine screw into.
    // The size compensates for splodgy printing
    r = (nominal_d+splodge)/2;
    flat = (r/2)*(2*sqrt(3));
    trylinder(r=r/2, flat=flat, h=h, center=center);
}

// Metric preferred threads up to from M1 to M12
module M1_tap_hole(h=10,center=false,splodge=OE_splodge)   { selftap_hole(nominal_d=tap_d(1  ,.25 ), h=h, center=center, splodge=splodge); }
module M1_2_tap_hole(h=10,center=false,splodge=OE_splodge) { selftap_hole(nominal_d=tap_d(1.2,.25 ), h=h, center=center, splodge=splodge); }
module M1_6_tap_hole(h=10,center=false,splodge=OE_splodge) { selftap_hole(nominal_d=tap_d(1.6,.35 ), h=h, center=center, splodge=splodge); }
module M2_tap_hole(h=10,center=false,splodge=OE_splodge)   { selftap_hole(nominal_d=tap_d(2  ,.40 ), h=h, center=center, splodge=splodge); }
module M2_5_tap_hole(h=10,center=false,splodge=OE_splodge) { selftap_hole(nominal_d=tap_d(2.5,.45 ), h=h, center=center, splodge=splodge); }
module M3_tap_hole(h=10,center=false,splodge=OE_splodge)   { selftap_hole(nominal_d=tap_d(3  ,.50 ), h=h, center=center, splodge=splodge); }
module M4_tap_hole(h=10,center=false,splodge=OE_splodge)   { selftap_hole(nominal_d=tap_d(4  ,.70 ), h=h, center=center, splodge=splodge); }
module M5_tap_hole(h=10,center=false,splodge=OE_splodge)   { selftap_hole(nominal_d=tap_d(5  ,.80 ), h=h, center=center, splodge=splodge); }
module M6_tap_hole(h=10,center=false,splodge=OE_splodge)   { selftap_hole(nominal_d=tap_d(6  ,1.0 ), h=h, center=center, splodge=splodge); }
module M8_tap_hole(h=10,center=false,splodge=OE_splodge)   { selftap_hole(nominal_d=tap_d(8  ,1.25), h=h, center=center, splodge=splodge); }
module M10_tap_hole(h=10,center=false,splodge=OE_splodge)  { selftap_hole(nominal_d=tap_d(10 ,1.5 ), h=h, center=center, splodge=splodge); }
module M12_tap_hole(h=10,center=false,splodge=OE_splodge)  { selftap_hole(nominal_d=tap_d(12 ,1.75), h=h, center=center, splodge=splodge); }

// Numbered UNC threads
module UNC_1_64_tap_hole(h=10,center=false,splodge=OE_splodge)   { selftap_hole(nominal_d=UNC_num_tap_d(num=1 ,tpi=64), h=h, center=center, splodge=splodge); }
module UNC_2_56_tap_hole(h=10,center=false,splodge=OE_splodge)   { selftap_hole(nominal_d=UNC_num_tap_d(num=2 ,tpi=56), h=h, center=center, splodge=splodge); }
module UNC_3_48_tap_hole(h=10,center=false,splodge=OE_splodge)   { selftap_hole(nominal_d=UNC_num_tap_d(num=3 ,tpi=48), h=h, center=center, splodge=splodge); }
module UNC_4_40_tap_hole(h=10,center=false,splodge=OE_splodge)   { selftap_hole(nominal_d=UNC_num_tap_d(num=4 ,tpi=40), h=h, center=center, splodge=splodge); }
module UNC_5_40_tap_hole(h=10,center=false,splodge=OE_splodge)   { selftap_hole(nominal_d=UNC_num_tap_d(num=5 ,tpi=40), h=h, center=center, splodge=splodge); }
module UNC_6_32_tap_hole(h=10,center=false,splodge=OE_splodge)   { selftap_hole(nominal_d=UNC_num_tap_d(num=6 ,tpi=32), h=h, center=center, splodge=splodge); }
module UNC_8_32_tap_hole(h=10,center=false,splodge=OE_splodge)   { selftap_hole(nominal_d=UNC_num_tap_d(num=8 ,tpi=32), h=h, center=center, splodge=splodge); }
module UNC_10_24_tap_hole(h=10,center=false,splodge=OE_splodge)  { selftap_hole(nominal_d=UNC_num_tap_d(num=10,tpi=24), h=h, center=center, splodge=splodge); }
module UNC_12_24_tap_hole(h=10,center=false,splodge=OE_splodge)  { selftap_hole(nominal_d=UNC_num_tap_d(num=12,tpi=24), h=h, center=center, splodge=splodge); }

// Fractional UNC up to 1/2-13
module UNC_quart_20_tap_hole(h=10,center=false,splodge=OE_splodge)   { selftap_hole(nominal_d=UNC_frac_tap_d(screw_d_in=.25 ,tpi=20), h=h, center=center, splodge=splodge); }
module UNC_5by16_18_tap_hole(h=10,center=false,splodge=OE_splodge)   { selftap_hole(nominal_d=UNC_frac_tap_d(screw_d_in=5/16 ,tpi=18), h=h, center=center, splodge=splodge); }
module UNC_3by8_16_tap_hole(h=10,center=false,splodge=OE_splodge)   { selftap_hole(nominal_d=UNC_frac_tap_d(screw_d_in=3/8 ,tpi=16), h=h, center=center, splodge=splodge); }
module UNC_7by16_14_tap_hole(h=10,center=false,splodge=OE_splodge)   { selftap_hole(nominal_d=UNC_frac_tap_d(screw_d_in=7/16 ,tpi=14), h=h, center=center, splodge=splodge); }
module UNC_half_13_tap_hole(h=10,center=false,splodge=OE_splodge)   { selftap_hole(nominal_d=UNC_frac_tap_d(screw_d_in=.5 ,tpi=13), h=h, center=center, splodge=splodge); }



