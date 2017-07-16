
!SVGFixupLineSegment methodsFor: 'as yet unclassified' stamp: 'gvc 10/4/2005 14:12'!
primAddToEngine: aBalloonEngine fills: fills lineWidth: lineWidth
	"Add the receiver's description to the ballooon engine."

	aBalloonEngine
		primAddPolygon: {start. end}
		segments: 2
		fill: (fills at: 1)
		lineWidth: 1
		lineFill: 0! !
