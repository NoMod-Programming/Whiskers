
!HatBlockMorph methodsFor: 'drawing' stamp: 'EMP 7/18/2017 15:35'!
drawOn: aCanvas 

	| localCanvas height cMap d |
	localCanvas := self drawStartOn: aCanvas.
	height := self height rounded.
	d := aCanvas depth.
	cMap := Bitmap
				with: (Color transparent pixelValueForDepth: d)
				with: (color pixelValueForDepth: d)
				with: (highlightColor1 pixelValueForDepth: d)
				with: (color pixelValueForDepth: d).
	self
		drawBar: (self archHatFormForHeight: height)
		on: localCanvas
		at: self topLeft
		height: height
		leftWidth: (self hatTopForm width - 22)
		rightWidth: self basicBarEndWidth
		colorMap: cMap.

	self drawFinalOn: aCanvas fromCanvas: localCanvas.
! !
