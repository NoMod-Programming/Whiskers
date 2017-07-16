
!Bezier2Segment methodsFor: '*SVG-Morphic' stamp: 'gvc 7/28/2005 17:12'!
primAddToEngine: aBalloonEngine fills: fills lineWidth: lineWidth
	"Add the receiver's description to the ballooon engine."

	aBalloonEngine
		primAddBezierShape: {start. via. end}
		segments: 1
		fill: (fills at: 1)
		lineWidth: lineWidth
		lineFill: (fills at: 2)! !
