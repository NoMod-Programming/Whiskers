
!BalloonCanvas methodsFor: '*SVG-Morphic' stamp: 'gvc 7/28/2005 17:16'!
drawGeneralSegments: segments color: c borderWidth: borderWidth borderColor: borderColor
	"Draw a general set of segments (e.g., a polygon that can contain holes)"

	| fillC borderC |
	fillC := self shadowColor ifNil:[c].
	borderC := self shadowColor ifNil:[borderColor].
	self ensuredEngine
		drawGeneralSegments: segments
		fill: fillC
		borderWidth: borderWidth
		borderColor: borderC
		transform: transform.! !
