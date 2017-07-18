
!SVGCompositeMorph methodsFor: 'as yet unclassified' stamp: 'gvc 8/1/2005 13:37'!
processSVGElements: anElement
	"Process the elements of the given group type element."

	anElement elements do: [:e |
		e tag == #g
			ifTrue: [self createGroupFromSVGGroup: e].
		e tag == #rect
			ifTrue: [self createRectFromSVGRect: e].
		e tag == #circle
			ifTrue: [self createCircleFromSVGCircle: e].
		e tag == #ellipse
			ifTrue: [self createEllipseFromSVGEllipse: e].
		e tag == #line
			ifTrue: [self createLineFromSVGLine: e].
		e tag == #polyline
			ifTrue: [self createPolylineFromSVGPolyline: e].
		e tag == #polygon
			ifTrue: [self createPolygonFromSVGPolygon: e].
		e tag == #path
			ifTrue: [self createPathFromSVGPath: e].
		e tag == #text
			ifTrue: [self createTextFromSVGText: e].
		e tag == #linearGradient
			ifTrue: [self createFillFromSVGLinearGradient: e].
		e tag == #radialGradient
			ifTrue: [self createFillFromSVGRadialGradient: e]]! !
