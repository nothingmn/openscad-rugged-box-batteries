
# openscad-rugged-box-batteries


## Description:
Battery inserts for the OpenSCAD version of the rugged box



## Credits
HUGE Thank you for https://www.printables.com/@Iceman for the orignial set of files
https://www.printables.com/model/1073708-super-customizable-rugged-box-in-openscad/files



## Render your own!

## Quick Start using OpenSCAD
1. Clone or download this repo
2. Install OpenSCAD on your OS https://openscad.org/downloads.html
3. Open the File: "profiles/18650.1x1.scad
4. Edit, Render
5. Slice, Print, Love.

### Quick Start Guide - Docker - Linux
  1. Make sure you have docker installed and it works
  2. Execute:
  ```bash
	mkdir render
	docker pull robchartier/magic-box:latest
	curl https://raw.githubusercontent.com/nothingmn/openscad-rugged-box-batteries/refs/heads/main/profiles/18650.1x1.scad -o 18650.1x1.scad
  	docker run --rm -v $(pwd)/18650.1x1.scad:/incoming/18650.1x1.scad -v $(pwd)/render:/render robchartier/magic-box:latest /incoming/18650.1x1.scad
	ls render
  ```
  3. Edit your copy of "18650.1x1.scad", tweak it as you see fit
  4. Execute:
  ```bash
	docker run --rm -v $(pwd)/18650.1x1.scad:/incoming/18650.1x1.scad -v $(pwd)/render:/render robchartier/magic-box:latest /incoming/18650.1x1.scad
	ls render
  ```
  5. Goto 3.
  6. Slice, Print, Love.

### Quick Start Guide - Docker - Windows
  1. Make sure you have docker installed and it works
  2. Execute:
  ```bash
	md render
	docker pull robchartier/magic-box:latest
	curl https://raw.githubusercontent.com/nothingmn/openscad-rugged-box-batteries/refs/heads/main/profiles/18650.1x1.scad -o 18650.1x1.scad
  	docker run --rm -v %cd%/18650.1x1.scad:/incoming/18650.1x1.scad -v %cd%/render:/render robchartier/magic-box:latest /incoming/18650.1x1.scad
	dir render
  ```
  3. Edit your copy of "18650.1x1.scad", tweak it as you see fit
  4. Execute:
  ```bash
	docker run --rm -v %cd%/18650.1x1.scad:/incoming/18650.1x1.scad -v %cd%/render:/render robchartier/magic-box:latest /incoming/18650.1x1.scad
	dir render
  ```
  5. Goto 3.  
  6. Slice, Print, Love.