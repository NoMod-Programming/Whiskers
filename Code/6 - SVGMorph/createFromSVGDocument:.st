
!SVGMorph methodsFor: 'accessing' stamp: 'gvc 7/30/2005 10:17'!
createFromSVGDocument: aDocument
	"Create the receiver from the given xml document"

	|svg|
	svg := (aDocument firstTagNamed: #svg) ifNil: [self error: 'Missing svg element'].
	self createFromSVG: svg! !
