
include <OpenEng.scad>;

//Can change the splodge factor as OpenEng is inluded rather than used! 
//is set once per file!!
//OE_splodge=2.0;

offset = 10;

ysep=12;
height = 12;
fudge = .1;
textdepth = .5;
textheight = 3;
rad = 6;
nrows = 5;
width = nrows*ysep;
splodges = [.1,.15,.2,.25,.3];
difference()
{

    hull()
    {
      translate([3.5*offset,width/2-rad,0]){cylinder(r1=rad,r2=rad,h=height,center=true);}
      translate([3.5*offset,-(width/2-rad),0]){cylinder(r1=rad,r2=rad,h=height,center=true);}
      translate([-3.5*offset,width/2-rad,0]){cylinder(r1=rad,r2=rad,h=height,center=true);}
      translate([-3.5*offset,-(width/2-rad),0]){cylinder(r1=rad,r2=rad,h=height,center=true);}
    }
    for (i = [0:nrows-1])
    {
      splodge = splodges[i];
      translate([-2.5* offset,(i-(nrows-1)/2)*ysep,0])M2_tap_hole(height+fudge,center=true,splodge=splodge);
      translate([-1.5* offset,(i-(nrows-1)/2)*ysep,0])M2_5_tap_hole(height+fudge,center=true,splodge=splodge);
      translate([-.5* offset,(i-(nrows-1)/2)*ysep,0])M3_tap_hole(height+fudge,center=true,splodge=splodge);
      translate([.5* offset,(i-(nrows-1)/2)*ysep,0])M4_tap_hole(height+fudge,center=true,splodge=splodge);
      translate([1.5* offset,(i-(nrows-1)/2)*ysep,0])M5_tap_hole(height+fudge,center=true,splodge=splodge);
      translate([2.5* offset,(i-(nrows-1)/2)*ysep,0])M6_tap_hole(height+fudge,center=true,splodge=splodge);
      translate([-3.5*offset,(i-(nrows-1)/2)*ysep,height/2]){linear_extrude(textdepth*2,center=true){text(str(splodge),textheight,halign="center",valign="center");}}
    }
    
    
    
    
    translate([-2.5* offset,-width/2,0])rotate([90,0,0]){linear_extrude(textdepth*2,center=true){text("M2",textheight,halign="center",valign="center");}}
    translate([-1.5* offset,-width/2,0])rotate([90,0,0]){linear_extrude(textdepth*2,center=true){text("M2.5",textheight,halign="center",valign="center");}}
    translate([-.5* offset,-width/2,0])rotate([90,0,0]){linear_extrude(textdepth*2,center=true){text("M3",textheight,halign="center",valign="center");}}
    translate([.5* offset,-width/2,0])rotate([90,0,0]){linear_extrude(textdepth*2,center=true){text("M4",textheight,halign="center",valign="center");}}
    translate([1.5* offset,-width/2,0])rotate([90,0,0]){linear_extrude(textdepth*2,center=true){text("M5",textheight,halign="center",valign="center");}}
    translate([2.5* offset,-width/2,0])rotate([90,0,0]){linear_extrude(textdepth*2,center=true){text("M6",textheight,halign="center",valign="center");}}
    
}
