
!ColoredExpressionArgMorph methodsFor: 'as yet unclassified' stamp: 'EMP 7/17/2017 12:25'!
drawOn: aCanvas 
"if this looks familiar, it is a functional copy of BlockMorph>drawBar:on:..... needed here because of the inheritance details of this class."
	| ends right height maxLWidth maxRWidth lWidth rWidth left mWidth step radius cMap d |
	type = #string ifTrue: [^ aCanvas fillRectangle: self bounds color: color].

	right := self width.
	height := self height rounded. "can sometimes be a Float"
	radius := height //2. "minimum width to include just an end"

	type = #number ifTrue: [
		ends := self endFormsForHeight: height.
	] ifFalse: [
		ends := BooleanArgMorph endFormsForHeight: height.
	].

	d := aCanvas depth.
	cMap := Bitmap
				with: (Color transparent pixelValueForDepth: d)
				with: (color pixelValueForDepth: d)
				with: (color pixelValueForDepth: d)
				with: (color pixelValueForDepth: d).

	maxLWidth := maxRWidth := ends width - radius. "maximum width that only includes one end"
	lWidth := (right - radius max: radius)
				min: maxLWidth.
	rWidth := (right - lWidth max: radius)
				min: maxRWidth.

	left := self topLeft. 
	right := right - rWidth. "chop off the reserved part for right end"

	"paint the left end"
	aCanvas
		paintImage: ends
		at: left
		sourceRect: (0@0 extent: lWidth@height)
		colorMap: cMap.
	left := left + (lWidth@0).

	mWidth := right - lWidth. "how much left to fill"
	[mWidth > 0] whileTrue: ["middle bit needs doing"
		step := mWidth min: (ends width - radius - radius).
		aCanvas
				paintImage: ends
				at: left
				sourceRect: (radius@0 extent: step@height)
				colorMap: cMap.
		left := left + (step@0).
		mWidth := mWidth - step.
		].

	aCanvas
		paintImage: ends
		at: left
		sourceRect: ((ends width - rWidth)@0 extent: rWidth@height)
		colorMap: cMap.

! !
