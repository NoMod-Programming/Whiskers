
!SVGCompositeMorph methodsFor: 'as yet unclassified' stamp: 'gvc 7/31/2005 16:39'!
createPolylineFromSVGPolyline: anElement
	"Create a polyline from the svg polyline."

	^self create: SVGPolylineMorph fromSVG: anElement

	! !
