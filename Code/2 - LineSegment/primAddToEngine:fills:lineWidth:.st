
!LineSegment methodsFor: '*SVG-Morphic' stamp: 'gvc 7/28/2005 17:11'!
primAddToEngine: aBalloonEngine fills: fills lineWidth: lineWidth
	"Add the receiver's description to the ballooon engine."

	aBalloonEngine
		primAddPolygon: {start. end}
		segments: 2
		fill: (fills at: 1)
		lineWidth: lineWidth
		lineFill: (fills at: 2)! !
