# OpenEng OpenSCAD library

This library is to store some useful functions for creating high performance OpenSCAD models for purposes such as 3D printing scientific hardware.


## Self-tappable holes

Traditionally when making instrumentation normal machine screws are screwed into tapped holes which are cut with a tap. Taps are essentially very sharp and very hard screws with 3-4 channels scooped out along the length, this means any excess material that is cut away while tapping cancan escape through the channels. Another option is to use special self-tapping screws which look more like woodscrews.

At the Bath Open INstrumentation Group of this we prefer to use traditional machine screws as they are widely available, we have found that by printing triangular holes normal machine screws can self-tap as the excess material is forced into the corners. We round the corners of the triangular holes to increase printability.

Nominally for a metric screw the inscribed circle inside the hole should be the nominal screw diameter minus the pitch (so for an M6 with a 1 mm pitch this is a 5 mm hole.) However, as 3D printers tend to 'splodge' a bit we oversize the holes by a factor "OE_splodge". The optimal OE_splodge will depend on a printer, we have created a test object for tapping holes which prints M2, M2.5, M3, M4, M5, and M6 holes each 5 different "splodge" values. This can be printed with your printer to test which value of OE_splodge works best for you.

### self-tappable hole functions

#### Calculation functions
* `tap_d(screw_d,pitch)` - calculates the hole that should be cut for tapping a screw from `screw_d` (the screw diameter in mm) and the `pitch` in mm
* `UNC_num_tap_d(num,tpi)` - works as `tap_d` for numbered UNC (or UNF) screws where the number and and threads per inch are set with `num` and `tpi` respectively
* `UNC_frac_tap_d(screw_d_in,tpi)` -  - works as `tap_d` for fractional UNC (or UNF) screws where the size in iches and and threads per inch are set with `screw_d_in` and `tpi` respectively

#### General shape modules
* `selftap_hole(nominal_d, h, center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable hole. Where `nominal_d` is the diameter of the hole that should be cut for tapping the screw (can be calculated with `tap_d`, `h` the height of the object, `center` is a boolean to set whether the object is centred in z and `splodge` which allows you to customise the splodge factor with a particular hole as you can only have one global OE_splodge for the hole file.

#### Specific screw shape modules
* `M1_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable M1 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `M1_2_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable M1.2 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `M1_6_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable M1.6 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `M2_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable M2 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `M2_5_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable M2.5 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `M3_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable M3 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `M4_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable M4 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `M5_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable M5 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `M6_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable M6 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `M8_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable M8 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `M10_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable M10 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `M12_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable M12 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `UNC_1_64_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable #1-64 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `UNC_2_56_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable #2-56 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `UNC_3_48_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable #3-48 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `UNC_4_40_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable #4-40 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `UNC_5_40_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable #5-40 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `UNC_6_32_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable #6-32 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `UNC_8_32_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable #8-32 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `UNC_10_24_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable #10-24 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `UNC_12_24_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable #12-24 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `UNC_quart_20_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable 1/4"-20 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `UNC_5by16_18_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable 5/16"-18 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `UNC_3by8_16_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable 3/8"-16 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `UNC_7by16_14_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable 7/16"-14 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
* `UNC_half_13_tap_hole(h,center,splodge)` - creates and object that can be subtracted from a solid to make a self tappable 1/2"-13 hole. `h`, `center`, and `splodge` are the same as for `selftap_hole`
