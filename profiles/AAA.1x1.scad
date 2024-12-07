include <../Profiles.scad>;

$fn=360;
generate18650 = false;
generateAA = false;
generateAAA = true;
generateD = false;
generateC = false;
generateCR132A = false;
generate18350 = false;
generateCR2 = false;
generateCR2032 = false;
generate9v = false;
battery_count_x = 1;
battery_count_y = 1;
// 1 = Extra Low Poly, 2 = Low Poly, 3 = Curved 
BoxPolygonStyle = 3; // [1:ExtraLowPoly, 2:LowPoly, 3:Curved]

importDefautSettings = false;

//Source: https://www.printables.com/model/1073708-super-customizable-rugged-box-in-openscad

/*[View Options]*/
// *********************************
// **** View and Layout Options **** 
// *********************************

// This option controls if you want to view the box closed or open.  False = the box will be open, and everything will be on the build plate.  True = view the box closed and latches in place (but the feet and TPU inserts will remain separate).
viewBoxClosed = false;

/*[Objects To Generate]*/
// *****************************
// **** Objects To Generate **** 
// *****************************
// These settings indicate what components of the box you want to generate.

// Should the bottom of the main box be generated
generateBoxBottom = true;
// Should the top of the main box be generated
generateBoxTop = true;
// Should the latches be generated
generateLatches = true;

// Should the gasket be generated.  NOTE: The gasket will still only be generated if the boxSealType is = 1 (Gasket)
generateGasket = false;
// Use this option to generate a test gasket and casket insert.  This is so you can do a small print to test your tolerances before printing a full box.  You will need to separate/split the in the slicer and print them one at a time.  This "sample case rim(where the gasket will be inserted)" in your filament of choice, and the gasket itself in TPU.
generateGasketTestObjects = false;
// Should the feet be generated.  This has NO effect on if the feet cutouts are added to the box top and bottom.  Those settings are below...  This just determines if the feet themselves get generated.
generateFeetIfSetInSettings = true;
// For empty box bottoms (boxes with no divider/section) should we generate a blank insert for later customization.
generateEmptyBottomBoxTPUInsert = false;
// For empty box tops (boxes with no divider/section) should we generate a blank insert for later customization.
generateEmptyTopBoxTPUInsert = false;


/*[Poly Level]*/
// ***************************
// **** Poly Level Option **** 
// ***************************

polyLvl = 
  BoxPolygonStyle == 1 
    ? 4
    : BoxPolygonStyle == 2 
        ? 8
        : 80;

/*[Main Box Settings]*/
// *********************************
// **** Main Box Settings **** 
// *********************************
// The width on the box wall and floor.  (NOTE: If you want square inside corners, the boxWallWidthMm must be > the  boxChamferRadiusMm.)
boxWallWidthMm = 3.0; // [1:0.1:10]
// TODO: Add contrraint for this
// The chamfer radius of the boxes corners.  (NOTE1: the floor/top radius is slightly differentthan the sides to eliminate the need for supports. NOTE2: If you want square inside corners, the boxWallWidthMm must be >= the boxChamferRadiusMm.)
boxChamferRadiusMm = 0; // .1  //BATTERY NOTE: set this to 0, so its squared off inside.

// The type of seal for the case. 1 = Circular Non-Gasket (less water resistant), 2 = Gasket type seal (more water resistant)
boxSealType = 1; // [1:NonGasket,2:Gasket]
// TODO: Add constraint for this
// The radius of the seal (NOTE: 2*boxCircularSealRadius MUST be < the (boxWallWidthMm+rimWidthMm))
boxCircularSealRadius = 1.1; // .1
// The with of the slot that holds the gasket for a water resistant seal.  Only used if boxSealType = 1(Gasket)
gasketSlotWidth = 2.2; // 0.1
// The depth of the slot that holds the gasket for a water resistant seal.  Only used if boxSealType = 1(Gasket)
gasketSlotDepth = 2.2; // 0.1
// The tolerance subtracted from the actual gasket size do it will fit into the slot.  Only used if boxSealType = 1(Gasket)
gasketTolerance = 0.2; // .05
// If you feel like you need to add some additional height to your gasket (so it protrudes out of the gasket slot) to make sure you get a good seal, you can add that here.  By default, I have set this to the same value as the opening tolerance
additionalGasketHeight = 0.1; //.05

// The width of the rim that goes around the case opening
rimWidthMm = 2; //.1
// The height of the top/bottom rim that goes around the case opening (This excludes the rim chamfer which is just a 45 degree angle)
rimHeightMm = 3; // .1

// Number of side ribs on the side
numSideSupportRibs = 1; // 1
// The offset from the center for the side ribs (moves the ribs away from the center)
ribCenterOffsetMm = 5; // 1
// The thickness of the side ribs, you probably want this to match the rimWidthMm.  This is the thickness of the rib from the box wall.
supportRibThickness = 1; // 1
// The width of the side rib along the wall
supportRibWidth = 2; // 1

// The tolerance/separation between the top and bottom box sections
openingTolerance = 0.1; // .05


/*[Box Divider Settings]*/
// **************************************
// **** Settings for adding dividers **** 
// **************************************

// The number of horixontal sections (the number of dividers = countainerWidthXSections - 1)
countainerWidthXSections = 1; //[1:20]
// This is the number of horixontal dividers to skip, this will effectively make a larger section followed by smaller ones
numCountainerWidthXSectionsToSkip = 0; // 1
// The number of virtical sections (the number of dividers = boxLengthYSections - 1)
boxLengthYSections = 1; // [1:20]
// This is the number of virtical dividers to skip, this will effectively make a larger section followed by smaller ones
numBoxLengthYSectionsToSkip = 0; // 1
// The width of the divider walls
boxSectionSeparatorWidth = 1.2; // .1


/*[Hinge Settings]*/
// ************************
// **** Hinge Settings **** 
// ************************

// The number of hinges
numberOfHinges = 1; // 1
// AKA: Hinge Screw Length. The full hinge width.  This is also the length of the screw you will need to assemble the case
hingeTotalWidthMm = 25; // 1
// The radius of the hinge pivot
hingeRadiusMm = 4; // .1
// The width of the outside portion of the hinge connector
hingeOutsideWidth = 6; // .5
// The number om MM you want to move each hinge away from center.  If there is a middle hinge, that one won't move. NOTE: If you make this value too big, your hinge will no longer be connected to the box :-/
hingeCenterOffsetMm = 5; // 1
// The radius of hinge screw hole that does not get threaded and allows the hinge to pivot/rotate. 3mmScrew=1.7 
hingeScrewLargeRadiusMm = 1.7; // .05
// The radius of hinge screw hole gets threaded and holds the hinge together. 3mmScrew=1.5 
hingeScrewSmallRadiusMm = 1.45; // .05
// the tolerance between all the hinge components.  The small gap that allows the hinge to move.
hingeToleranceMm = 0.2; // .05

/*[Latch Settings]*/
// ************************
// **** Latch Settings **** 
// ************************

// The number of latches to generate
numberOfLatches = 1;
// AKA: Latch Screw Length. The total width of the latch.  This is the length of the screws needed to assemble the latch.
latchSupportTotalWidth = 25;
// The number in MM you want to move each hinge away from center.  If there is a middle hinge, that one won't move. NOTE: If you make this value too big, your hinge will no longer be connected to the box :-/
latchCenterOffsetMm = 5;
// The width of the outside portions of the latch mount
latchSupportWidth = 4;
// The vertical position of the latch screw position.  The position is calculated be the percentage of the top/bottom box heights.
latchScrewPositionPct = 50;
// The radius of the latch pivot.
latchSupportRadius = 4; // .1
// The tolerance of the gaps between the latch and the latch mount so the latch can move.
latchToloerance = 0.2; // .05
// The radius of hinge screw hole does not get threaded and allows the latch to pivot/rotate. 3mmScrew=1.7 
latchScrewLargeRadiusMm = 1.7; // .05
// The radius of hinge screw hole gets threaded and holds the latch together. 3mmScrew=1.5 
latchScrewSmallRadiusMm = 1.45; // .05

// Controls the length of the tab that allows you to open the latch. 1 is pretty short, 2 is pretty long. It's easy to make this too short or too long... Somewhere between 1 and 2 seems like a good value.
latchOpenerLengthMultiplier = 1.4; //[.5:.1:3]
// This is the angle of the latch opener tab. The valid values are between 0 and 45 seem to be okay values.
latchOpenerAngle = 10; //[0:1:45]

// Min: 10, Max: 50. The shallower the angle the Harder it will be to close, at 10 you probably won't be able to bend the latch enough to close it, as you approach 50, it may not hold very well.
latchClipCutoutAngle = 35; //[10:1:50]


/*[Box Full Fill Insert Settings]*/
// ***************************************************
// **** Settings for generating full case inserts **** 
// ***************************************************
// These inserts are meant for customizing your own holders for custom parts inside the cause.  Likely printed in TPU. The isert will fill the entire top/bottom of the case, then you can use the CAD tool of your choice to cutout spaces for your stuff.

// The tolerance around the TPU insert that can be customized to hold random shapes
insertTolerance = 0.1; // .05


/*[Feet Settings]*/
// ***********************
// **** Feet Settings **** 
// ***********************

// Should feet be generated and the feet connections be cutout from the containet top and bottom.  (NOTE: this will require some glue... sorry, no tome to create a snap-in connector)
isFeetAdded = false;
// The width of the feet
feetwidthMm = 4; // 1
// the length of the feet
feetLengthMm = 10; // 1
// the depth that the feet will insert into the top and bottom cases
feetInsertDepth = 1; // .1
// The gap size between the stacked top and bottom box
boxGapMm = 1.5; // .1
// The actual distance of the feet from the exterior wall(not including the rim) wall will be the boxChamferRadiusMm + additionaldistanceFromWallAfterChamfer
additionaldistanceFromWallAfterChamferMm = 5; // .1
// The tolerance that allows the feet to be inserted into the box cutouts
footInsertToleranceMm = 0.4; // .1


// **********************
// **** END Settings ****
// **********************




