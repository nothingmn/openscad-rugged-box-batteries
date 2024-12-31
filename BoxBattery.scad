// 1 = Extra Low Poly, 2 = Low Poly, 3 = Curved 
BoxPolygonStyle = 3; // [1:ExtraLowPoly, 2:LowPoly, 3:Curved]
generateBoxBottom = true;
generateBoxTop = true;
generateLatches = true;

// Calculate numberOfHinges
numberOfHinges = 
    generate22lr && battery_count_x > 15 ? 3 :
    generate22lr && battery_count_x > 6 ? 2 :
    generate22lr && battery_count_x <= 6 ? 1 :
    generate7mm && battery_count_x > 15 ? 3 :
    generate7mm && battery_count_x > 6 ? 2 :
    generate7mm && battery_count_x <= 6 ? 1 :
    generateAAA && battery_count_x > 15 ? 3 :
    generateAAA && battery_count_x > 6 ? 2 :
    generateAAA && battery_count_x <= 6 ? 1 :
    generateCR2032 && battery_count_x > 15 ? 3 :
    generateCR2032 && battery_count_x > 6 ? 2 :
    generateCR2032 && battery_count_x <= 6 ? 1 :
    generateCR2430 && battery_count_x > 15 ? 3 :
    generateCR2430 && battery_count_x > 6 ? 2 :
    generateCR2430 && battery_count_x <= 6 ? 1 :
    generateMicroSD && battery_count_x > 15 ? 3 :
    generateMicroSD && battery_count_x > 6 ? 2 :
    generateMicroSD && battery_count_x <= 6 ? 1 :
    generateSD && battery_count_x > 15 ? 3 :
    generateSD && battery_count_x > 6 ? 2 :
    generateSD && battery_count_x <= 6 ? 1 :
    generatenumber2pencil && battery_count_x > 15 ? 3 :
    generatenumber2pencil && battery_count_x > 6 ? 2 :
    generatenumber2pencil && battery_count_x <= 6 ? 1 :
    generatesharpie && battery_count_x > 15 ? 3 :
    generatesharpie && battery_count_x > 6 ? 2 :
    generatesharpie && battery_count_x <= 6 ? 1 : 1;

// Calculate numberOfLatches
numberOfLatches = 
    generate22lr && battery_count_x >= 15 ? 2 :
    generate22lr && battery_count_x < 15 ? 1 :
    generate7mm && battery_count_x >= 15 ? 2 :
    generate7mm && battery_count_x < 15 ? 1 :
    generateAAA && battery_count_x >= 15 ? 2 :
    generateAAA && battery_count_x < 15 ? 1 :
    generateCR2032 && battery_count_x >= 15 ? 2 :
    generateCR2032 && battery_count_x < 15 ? 1 :
    generateCR2430 && battery_count_x >= 15 ? 2 :
    generateCR2430 && battery_count_x < 15 ? 1 :
    generateMicroSD && battery_count_x >= 15 ? 2 :
    generateMicroSD && battery_count_x < 15 ? 1 :
    generateSD && battery_count_x >= 15 ? 2 :
    generateSD && battery_count_x < 15 ? 1 :
    generatenumber2pencil && battery_count_x >= 15 ? 2 :
    generatenumber2pencil && battery_count_x < 15 ? 1 :
    generatesharpie && battery_count_x >= 15 ? 2 :
    generatesharpie && battery_count_x < 15 ? 1 : 1;




// The type of seal for the case. 1 = Circular Non-Gasket (less water resistant), 2 = Gasket type seal (more water resistant)
boxSealType = 2; // [1:NonGasket,2:Gasket]
// Should feet be generated and the feet connections be cutout from the containet top and bottom.  (NOTE: this will require some glue... sorry, no tome to create a snap-in connector)
isFeetAdded = false;
// The width of the feet
feetwidthMm = 4; // 1

// *************************
// **** Battery Inserts ****
// *************************

/*CYLINDER CELLS*/
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

/*COIN CELLS*/

if(generateCR2032)  {
    battery_CR2032(battery_count_x, battery_count_y);
}
if(generateCR2430)  {
    battery_CR2430(battery_count_x, battery_count_y);
}
if(generateCR2450)  {
    battery_CR2450(battery_count_x, battery_count_y);
}
if(generateA76)  {
    battery_A76(battery_count_x, battery_count_y);
}

/*BOX CELLS*/

if(generate9v)  {
    battery_9v(battery_count_x, battery_count_y);
}
if(generateMicroSD)  {
    battery_MicroSD(battery_count_x, battery_count_y);
}
if(generateSD)  {
    battery_SD(battery_count_x, battery_count_y);
}
if(generateCF)  {
    battery_CF(battery_count_x, battery_count_y);
}

// *****************************
// **** END Battery Inserts ****
// *****************************

// *************************
// **** Ammo Inserts ****
// *************************
if(generate22lr)  {
    battery_22lr(battery_count_x, battery_count_y);
}
if(generate410212)  {
    battery_410212(battery_count_x, battery_count_y);
}
if(generate4103)  {
    battery_4103(battery_count_x, battery_count_y);
}
if(generate3030)  {
    battery_3030(battery_count_x, battery_count_y);
}
if(generate3006)  {
    battery_3006(battery_count_x, battery_count_y);
}
if(generate308)  {
    battery_308(battery_count_x, battery_count_y);
}
if(generate300WinMag)  {
    battery_300WinMag(battery_count_x, battery_count_y);
}
if(generate300)  {
    battery_300(battery_count_x, battery_count_y);
}
if(generate270)  {
    battery_270(battery_count_x, battery_count_y);
}
if(generate243)  {
    battery_243(battery_count_x, battery_count_y);
}
if(generate223)  {
    battery_223(battery_count_x, battery_count_y);
}
if(generate28G234)  {
    battery_28G234(battery_count_x, battery_count_y);
}

if(generate65Creedmor)  {
    battery_65Creedmor(battery_count_x, battery_count_y);
}
if(generate16G234)  {
    battery_16G234(battery_count_x, battery_count_y);
}
if(generate20G234)  {
    battery_20G234(battery_count_x, battery_count_y);
}
if(generate20G3)  {
    battery_20G3(battery_count_x, battery_count_y);
}
if(generate12G234)  {
    battery_12G234(battery_count_x, battery_count_y);
}
if(generate12G3)  {
    battery_12G3(battery_count_x, battery_count_y);
}
if(generate7mm)  {
    battery_7mm(battery_count_x, battery_count_y);
}


if(generatenumber2pencil)  {
   battery_number2pencil(battery_count_x, battery_count_y);
}


if(generatesharpie)  {
   battery_sharpie(battery_count_x, battery_count_y);
}


// *****************************
// **** END Ammo Inserts ****
// *****************************

include <Inserts/Batteries/batteries.scad>
include <RuggedBox-Settings.scad>

