// 1 = Extra Low Poly, 2 = Low Poly, 3 = Curved 
BoxPolygonStyle = 3; // [1:ExtraLowPoly, 2:LowPoly, 3:Curved]
generateBoxBottom = true;
generateBoxTop = true;
generateLatches = true;



// *************************
// **** Battery Inserts ****
// *************************
if(generate18650)  {
   battery_18650(battery_count_x, battery_count_y);
}

if(generateAA)  {
    battery_AA(battery_count_x, battery_count_y);
}
if(generateAAA)  {
    battery_AAA(battery_count_x, battery_count_y);
}
if(generateD)  {
    battery_D(battery_count_x, battery_count_y);
}
if(generateC)  {
    battery_C(battery_count_x, battery_count_y);
}
if(generateCR132A)  {
    battery_CR123A(battery_count_x, battery_count_y);
}
if(generate18350)  {
    battery_18350(battery_count_x, battery_count_y);
}
if(generateCR2)  {
    battery_CR2(battery_count_x, battery_count_y);
}
if(generateCR2032)  {
    battery_CR2032(battery_count_x, battery_count_y, 50);

}

// *****************************
// **** END Battery Inserts ****
// *****************************

include <Inserts/Batteries/batteries.scad>

if(importDefautSettings) {
    include <RuggedBox-Settings.scad>
} else {
    include <Builder.scad>;
}

