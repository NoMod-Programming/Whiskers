
!SVGPathMorph methodsFor: 'as yet unclassified' stamp: 'gvc 10/4/2005 09:06'!
drawOn: aCanvas
	"Draw the component on the canvas."
	
	(self composedStyle at: 'visibility')
		ifFalse: [^self].
	super drawOn: aCanvas.
	self renderer
		renderPath: self
		on: aCanvas! !
