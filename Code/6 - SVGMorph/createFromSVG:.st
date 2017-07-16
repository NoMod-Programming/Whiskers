
!SVGMorph methodsFor: 'accessing' stamp: 'gvc 7/30/2005 10:21'!
createFromSVG: anElement
	"Create the receiver from the given svg element"

	self removeAllMorphs.
	self setDimensionsFromSVG: anElement.
	anElement tagsNamed: #defs do: [:defs |
		self createDefsFromSVGDefs: defs].
	super createFromSVG: anElement! !
